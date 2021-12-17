# ERC-721部署教程

## 什么是ERC-721?

ERC-721是EVM上的一种代币标准，这种代币标准能够生成一种非同质化代币（NFT），并且能够提供追踪和转移NFT的操作支持。（NFT的代币标准还有ERC-1155等）  
这种代币标准可以支持个人交易及使用的需求，并且可以支持将NFT委托给第三方机构进行运营的应用场景，并且我们考虑了NFT储存资产的多样性，可以通过添加不同参数来进行细节的描述和作为搜寻索引。

### 准备工作
我们为大家制作好了基础的ERC-721模板及部署上传所需要的HTML文件，但是在进行准备之前，大家请先下载好Metamask并安装：
1. [MetaMask](https://metamask.io/)

如果你不知道如何设置Metamask环境，可以通过点击下方链接进行学习。
 [here](https://chainide.gitbook.io/chainide-chinese/huan-jing-pei-zhi)

本次使用的Ethereum网络为Rinkeby, 大家首先需要切换到该网络![Rinkeby](./rinkeby.jpg)

大家可以通过[这个网站](https://faucet.paradigm.xyz/)的流程进行测试币的获取。(Opensea testnet仅支持Rinkeby)

### ERC-721合约
ERC-721现已被广泛使用在各个Dapp当中，比如我们所熟知的Cryptokitties，数字资产交易所Opensea等。

![CryptoKitties](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/1.png)

本次部署Showcase当中使用的合约来自Openzepplin，Opensea的github。使用[原生ERC-721](https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC721/ERC721.sol)
,我们接下来在教程当中所讲介绍到的函数就是属于这个合约的。

### ERC-721当中的函数

balanceOf(): 返回由_owner 持有的NFTs的数量。

ownerOf(): 返回tokenId代币持有者的地址。

approve(): 授予地址_to具有_tokenId的控制权，方法成功后需触发Approval 事件。

setApprovalForAll(): 授予地址_operator具有所有NFTs的控制权，成功后需触发ApprovalForAll事件。

getApproved()、isApprovedForAll(): 用来查询授权。

safeTransferFrom(): 转移NFT所有权，一次成功的转移操作必须发起 Transer 事件。

transferFrom(): 用来转移NFTs, 方法成功后需触发Transfer事件。调用者自己确认_to地址能正常接收NFT，否则将丢失此NFT。此函数实现时需要检查是否符合判断条件。

### Showcase操作流程

本次Showcase支持自己制作并且上传NFT，并且在制作完成后可以在Opensea交易所上查看到我们的NFT并进行交易。

![](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/2.png)

首先，进入[ChainIDE](https://eth.chainide.com),下拉到template部分，选择ERC721 Showcase，点击即可生成能够部署NFT的智能合约。

1.编译合约

首先，我们选择ERC-721 Showcase当中的Creature.sol合约进行编译，成功了之后会出现合约的ABI，并且显示对应的compile contract success。

![](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/3.png)

注意：如果编译合约出现如下情况

![image-20210811185042415](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811185042415.png)

> **ParserError: Source "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC721/ERC721.sol" not found: File import callback not supported**

说明您电脑的DNS被污染了，不能正确解析https://raw.githubusercontent.com，请按照以下步骤将DNS更改成8.8.8.8

* 右击桌面右下的”网络“图标，选择 打开“网络和Internet”设置
![88](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/0812_88.jpg)
* 在出现的界面中间选择 更改适配器选项  
![image-20210811185818783](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811185818783.png)
* 双击您当前使用的网络（我的是无线网，如果是有线网的话可能需要选择以太网）  
![image-20210811190151610](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811190151610.png)
* 在出现的窗口中先点击左下角的 属性，再点击 Internet协议版本4（TCP/IPv4）  
![image-20210811190542944](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811190542944.png)
* 在弹出的窗口点击“使用下面的DNS服务器地址”，在 首选DNS服务器输入 8.8.8.8，点击确认  
![image-20210811190821182](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811190821182.png)
* 最后返回上一界面，点击   
![image-20210811191130679](https://chainide-forum-img.s3.ap-northeast-1.amazonaws.com/Templates+img/image-20210811191130679.png)
* 完成，现在回去刷新页面，再次编译就没有问题了  

2.部署NFT工厂合约  

然后，我们要选择一个NFT工厂合约进行部署，点击Deploy模块，选择Creature.sol.compiled:Creature这个合约。
在部署之前，我们需要设置一个参数_proxyRegistryAddress，这个是对合约的所有者进行描述，我们可以打开Metamask然后复制自己的钱包地址，黏贴到这个输入栏当中，点击Deploy进行合约的部署。

![](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/4.png)

3.将图片上传IPFS  

我们打开在目录当中的index.html，然后点击右上角的一个放大镜和页面的图标，表示开始预览网页，这是我们为大家准备的一个前端页面，我们可以在上面上传文件以及获得反馈。

如果我们的NFT想要包含一些电子信息，比如图片，流媒体等，我们可以将文件上传至去中心化的储存网络IPFS。在这里，我们为大家提供了一个现成的前端界面，可以支持向IPFS上传文件并返回url。

那么我们可以对图片进行一个名字和描述的设定，然后从本地选择一张图片，最后点击submit进行一个上传。

然后我们要将得到的这一串字符进行一个复制，后面铸造NFT时可以与这个文件关联起来。

![](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/5.png)

4.使用_mintTo进行NFT铸造

最后，我们回到Creature合约，找到我们刚刚已经部署好的部分，就可以进行NFT的铸造了。

我们从刚刚的反馈当中得到的一串字符就是nftid，然后打开_mintTo并且黏贴到这个函数的输入参数当中，在_to参数内填入自己的钱包地址，然后点击上传，就可以完成一个NFT的制作了。

5.通过Opensea查看

我们铸造的nft可以在交易所当中进行一个流通，登录[Opensea testnet](https://testnets.opensea.io/collections)
在opensea上查看我们账户内的一个NFT持有情况。

![](https://whitematrix-public-cn-north-1.s3.cn-north-1.amazonaws.com.cn/ERC721+Showcase/6.png)

