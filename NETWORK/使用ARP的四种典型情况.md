使用ARP的四种典型情况

 

1.发送方是主机，把IP数据包发送到本网络上的另一个主机。这时用ARP找到目的主机的硬件MAC地址。  

2.发送方是主机，要把IP数据报发送到另一个网络上的主机。这时用ARP找到本网络上的一个[路由器](https://www.2cto.com/net/router/)（网关）的硬件MAC地址。剩下的工作由这个路由器来完成。 

3.发送方是路由器，要把IP数据报转发到本网络上的一个主机。这时用ARP找到目的主机的硬件MAC地址 

 

4.发送方是路由器，要把IP数据报转发到另一个网络的一个主机。这时用ARP找到本网络上的一个路由器（网关）的硬件地址。剩下的工作有这个路由器来完成。

主机和路由器表现的行为是一致的，区别在于，路由器可以作为网关，而PC不可以。当要把IP数据报转发另一个网络的一个主机时，ARP找到本网络上的一个网关的硬件MAC地址，这个网关可以是路由器，也可以是三层[交换机](https://www.2cto.com/net/switch/)。

纯二层交换机是没有ARP表项的。交换机是否有ARP表项取决于交换机是否作为三层设备（配置三层路由接口或SVI接口）

网络层使用的是IP地址，但在实际网络的链路上传送数据帧时，最终必须使用该网络的硬件地址。 

 

每一个主机都设有一个ARP高速缓存，里面有本局域网上的各主机和网关的IP地址到硬件地址的映射表。也就是说，一个主机可以通过ARP到本局域网的其他主机，到达其他网络主机的工作交给网关完成。

同一子网 源目mac地址都不会改变 

不同子网 源目IP地址都不会改变，改变源目MAC地址
