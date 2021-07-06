#include <iostream>
#include <thread>
#include <sockpp/tcp_acceptor.h>
#include <string>

static int PACKET_SIZE = 1024;

void read_text(sockpp::tcp_socket sock) {
    puts("Start write loop");
    while (true) {
        std::string buf;
        std::cin >> buf;
        sock.write(buf);
        sock.write("\n");
    }
}

void handle_connection(sockpp::tcp_socket sock) {
    puts("connection received");
    std::thread thr(read_text, sock.clone());
    puts("Start read loop");
    while (true) {
        char buf[PACKET_SIZE];
        sock.read(&buf, PACKET_SIZE);
        if (buf[0] == 0) continue;
        std::cout << buf << std::flush;
        for (auto i=0; i<sizeof(buf); i++) {
            buf[i] = 0;
        }
    }
}

int main() {
    int16_t port = 7878;
    sockpp::socket_initializer sockInit;
    sockpp::tcp_acceptor acc(port);

    if (!acc) {
        std::cerr << acc.last_error_str() << std::endl;
        return 1;
    }

    while (true) {
        sockpp::inet_address peer;

        sockpp::tcp_socket sock = acc.accept(&peer);

        if (!sock) {
            std::cerr << acc.last_error_str() << std::endl;
        } else {
            std::thread thr(handle_connection, std::move(sock));
            thr.detach();
        }
    }
}
