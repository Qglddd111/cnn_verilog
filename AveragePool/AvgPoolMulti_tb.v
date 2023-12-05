`timescale 1 ns / 10 ps

module AvgPoolMulti_tb ();
 
reg clk,reset;
reg [6*28*28*16-1:0] inAvg;
wire [6*14*14*16-1:0] outAvg;

localparam PERIOD = 100;

integer i;
always
	#(PERIOD/2) clk = ~clk;
initial begin
	$dumpfile("AvgPoolMulti.vcd");
	$dumpvars(0,AvgPoolMulti_tb);
end
initial begin
file=$fopen("E:/yanjiusheng/study/研一上/机器学习基础/大作业_曲广龙_杨晓龙/source code/verilog/AveragePool/result_verilog.txt","w");
end
initial begin
    #0
    clk = 1'b0;
	  reset = 1;
    inAvg = 75264'h93fd94cd8fed8c3d92cd884d92ad962d906d8cfd8c4d929d95fd883d8afd8f5d8f0d8e6d94bd941d99bd882d8c3d893d97ed90bd916d83bd968d90bd903d8b2d952d8d6d8f2d93bd8a6d8c0d922d966d955d8d1d912d943d8d0d8d5d941d909d975d890d91ed8dad932d8add8eed873d8ced884d86fd88dd92bd900d90bd92cd8c2d8bcd927d917d8bfd8f5d970d8edd8c9d8c4d969d8fbd91bd8c7d969d91cd916d8ced923d90cd80cd795d703d807d841d859d93ad8e5d925d8e8d925d8e8d88dd944d929d83bd8c2d8c1d97ed900d8c1d8dcd92dd937d932d91dd8fcd8c0d7e4d6d8d5c8d5a7d70cd7ead897d8cdd906d937d922d8e1d920d95ad885d87bd8f2d904d925d8a9d8add8cdd921d901d95bd908d902d877d8abd6efd567d4d4d769d6fad733d8d3d8ced95cd8efd920d96ad8e3d8add917d921d95cd8edd8a7d8ebd8e1d948d90ed952d8e6d905d927d94ed84ad645d68cd7d6d584d774d7fad8ccd8f0d91fd94cd922d8e5d932d91ed943d950d91cd8ebd928d933d90cd97bd8c9d967d8f3d9b3d995d935d901d837d7b9d727d7f8d74ad815d8ded961d8e4d92bd929d90cd903d92cd936d90ed8e2d91bd94bd92ad937d86dd9b8d923d983d92dd97ad9d5d854d899d883d844d6d6d77bd90ed93ad876d988d8fbd92ed925d91ed8f6d8e1d909d91cd94ed8fed922d8a4d996d8c8d89fd93ed907d988d867d8d8d8e7d81fd6d7d752d8b2d924d8b2d998d8abd951d926d927d902d90cd92ed91fd8fdd8a0d93cd946d91cd86fd8c3d977d911d92ed8a8d8f6d8f6d7f0d5ddd6b9d85ed910d916d907d895d919d8ffd920d922d92bd927d92cd900d8c2d96cd94dd8b4d877d950d90dd8ddd8f1d888d8f1d867d6f1d520d764d8bcd919d8ded843d8c8d90cd8d1d8d9d8fdd92cd92dd934d906d984d93fd8fad8d5d8d7d98dd89ed866d828d836d85cd6c8d615d644d88ed902d96bd8bcd883d8fbd8d1d8aad8cfd8ddd9a5d8f5d96ed8cdd9e7d91ed8bdd938d91cd934d89bd85bd743d80dd6f5d602d61ad799d8d5d8f7d98cd8dbd961d903d89bd868d8fad948d9e0d79dd974d92fd96ad8efd8bad98ad911d8c6d895d8e8d78bd7add5f9d6eed69ad7d0d81bd98cd88bd90ed95fd8e1d8a4d874d92ed92fd890d78ed930d933d865d8a1d933d978d8a8d902d8f1d942d85bd6aed603d727d72dd745d825d912d862d8f3d8e7d8e7d898d925d95bd7c5d7d6d887d95cd837d800d8c4d96ad8dad88ad95cd964d96dd934d7b3d787d7e4d80cd757d790d8aed90dd8f3d89fd8e4d95cd97fd8dbd887d8d7d91ad8afd86ed8f6d93dd8dcd892d8ccd939d909d97ad91cd88bd8a0d8b8d862d6fed78bd874d93dd8d1d871d957d92bd909d930d967d927d8e8d90bd8f2d9b7d94dd8f1d8ead945d934d907d986d8e0d929d8d6d8c1d849d72fd77ed865d90cd8abd8b5d91fd8f4d914d912d8ffd909d911d917d8fed951d8dfd8f9d8c2d94fd91dd8ffd973d8cfd928d8e0d88ad7fcd6d3d6bfd868d8e5d8bbd8f7d8e8d919d8d1d8efd8d4d905d8ccd916d8f3d91cd897d8ddd8b7d92bd898d8efd92cd89bd8b0d8b6d918d6ccd61dd6aed860d8c2d8afd8d7d8fcd8bcd8d1d8f4d8cad8c3d89fd901d8b6d912d878d8fdd8ccd8bed8a1d81fd83cd75fd79cd7c2d857d5b2d5b6d72dd82ad862d86fd8a0d899d876d8b3d880d88bd895d888d888d8aad85dd87cd8ebd8a9d871d8ffd67ad675d456d5ead52dd517d4bdd4ead67dd7f4d786d7ecd83dd7a8d81dd7e4d811d81ed826d7f0d831d7e4d805d827d853d820d8b7d89dd799d63cd4b8d62ed566d52fd5d1d686d7b7d877d863d882d87dd80dd8c3d864d889d87bd87cd894d879d882d83cd8aad87cd898d90ed8a2d890d836d78cd80fd83ad7f2d87ed921d92ad95bd9a0d918d944d981d988d918d963d952d969d999d992d979d940d909d95dd956d88dd8ead910d924d8a1d8d6d86ad8a9d8e7d947d905d90fd933d8abd8f9d92ed89ed8a7d8e0d8cdd8fed934d936d90ad900d891d923d8c8d817d90ad8ead93dd928d8e8d89bd8f8d930d8f8d910d928d925d932d944d8e4d8cfd8c8d8e0d8c9d8e7d8fcd8e2d8cad8d1d92bd877d83dd946d8fcd8ddd943d8eed8aad887d95bd94ad8dad930d931d90cd978d95fd917d943d914d90fd910d918d904d8e5d899d8fbd916d851d8edd972d841d6c6d583d5c1d671d608d6c3d66ed6a1d63dd5c6d6bcd65dd61dd6add5e7d613d643d625d6a4d61bd6acd6c1d63dd624d620d644d644d715d5afd491d510d5dbd5a9d6a4d694d658d621d5c8d661d629d673d6d4d5f8d5bbd60dd667d6bed62ad630d682d6a3d6f8d67dd645d5d0d665d55ad38fd23dd473d51bd54fd65ed659d641d65cd609d68ed6e6d63ad645d5afd60cd6aed61ad62cd5ccd639d686d6cdd686d65bd5add5edd60ed438d10dd1f9d44dd446d5e0d670d6a4d6d6d63dd6afd67ed5d5d61dd5b5d678d6fbd5d7d610d5e6d61ad64ad65dd67ed680d667d6a1d716d44ed16cd262d1a9d361d461d593d681d64dd682d6abd69dd6bed616d617d667d6f6d690d5fbd612d5edd6e8d6d0d6b5d69cd671d6fed809d73ad594d212d208d3d6d373d498d5a4d705d6e9d659d654d643d5e3d6acd6fcd6c6d62cd5c3d64cd6ded65ed5d1d5fed68bd733d6ffd6f0d725d738d616d45ed434d3b2d3efd5d3d5eed611d602d6a2d6f3d6b2d651d617d5fbd68fd694d650d680d63dd706d692d6b1d645d5d0d6b5d78ad797d667d5d3d4c3d370d2efd502d631d6a0d66fd671d65cd65bd680d6d7d66fd619d66fd686d69ad5dcd6b7d6b2d5ead63dd5d3d6ccd5fbd67cd7d7d705d63bd296d22cd515d5a3d658d669d5f6d65ad66ed688d6a3d66fd630d65bd6bdd5ffd68ed690d732d5bbd5f1d61bd687d6b4d626d751d7b9d63bd283d124d4a1d645d612d5ebd5c7d66fd673d617d66cd688d660d654d695d680d712d62fd6a4d5f4d60dd620d5b0d620d5f2d674d704d559d1edd112d4f8d6fdd612d658d5a4d5d5d5d6d59fd643d6b6d686d654d669d6dcd72bd657d5f8d65ed630d658d5ced61cd55fd51ad5f8d446d201d287d531d711d67cd6c1d627d5c9d5abd59bd634d69ed657d628d6add696d679d6edd5fed666d641d64fd666d6c0d5c7d443d4dcd466d1ead1e6d665d6e5d650d6a8d6a1d67ad579d513d737d6c1d5fed58ad689d74bd597d691d712d631d659d652d786d707d4bbd18cd1d2d441d31dd45ad508d589d6d1d5d1d6efd5dbd5acd6b6d58ad45ed57ad73ad5ced4e8d56ed677d6c9d60dd699d6bed7b9d802d728d47bd2d6d45ed293d435d53fd6ccd686d592d5f4d722d6d2d634d6ded70ed509d58ed5dfd6c3d5d3d577d60cd5e8d624d672d794d6d5d6c6d569d507d496d3e2d4a1d49bd5dcd5fdd592d607d650d6b2d7ddd649d59ed520d6fad61ed552d71cd666d61ad637d65cd6a5d716d6dbd7a3d6dfd6d9d521d3efd1f3d568d5fed5b9d5e7d5d1d677d66fd5d5d698d6f7d628d54fd655d654d673d664d5ccd5add62ed69ed606d6abd622d6dfd72fd60cd45bd132d534d657d626d63cd652d64fd66bd677d6ced659d659d669d6aad684d694d675d673d64fd620d66ad629d698d5bbd6bed797d704d2d7d099d42ad57ad584d566d5d0d589d5b5d633d602d528d5b5d633d612d5edd5cad5d5d608d5e1d59ed5eed626d62cd621d654d665d6e4d40ed1cdd42dd5e8d62ed5f9d660d6b3d698d5edd65cd6b1d685d5f8d67cd682d5ebd67bd640d62dd650d717d5c5d419d46dd533d4efd4d8d365d155d35ad553d50cd5add601d537d4f0d5fed5c2d53cd55fd5c1d527d5a3d58dd588d5d2d642d5add4afd506d3bed452d41ad42ed151d0cad151d36cd52ad4f5d45fd487d53ed524d508d4d3d549d54dd54cd543d4ead4bad54ed486d4e2d5bcd670d5a1d487d3aad422d4afd37ad4fbd554d5dfd6e9d6cdd68ad77ed6d6d67bd712d6fed6b1d6ccd710d6b5d6e1d62bd607d781d706d612d627d659d56fd492d40ed557d4eed3cad4bdd57cd5e9d600d545d594d582d56ad563d58cd586d5bbd5efd613d5dfd62dd5b7d533d484d4d7d62dd6cbd6aad631d536d478d5d3d602d5f4d6cdd683d697d73ed666d691d651d61bd66bd67bd6a5d6b2d6f3d66ed6b6d6bdd5b8d6a3d722d5ded675d5dbd54fd56cd60fd71fd672d647d6a9d68ed692d768d703d6d1d5fad5e7d61bd64ad657d62ad5c2d5afd6cad6b0d633d62ad616d556d727d6e7d6fcd675d5d0d626d672d630d61ed64bd65bd66ad64fd65dd660d655d68dd6ded70ed6cad657d642d5e2d6abd726d5fbd56ad554d6e4d651d5c2d5c9d698d662d6b8d6ecd674d6b8d6c0d637d70ed6b4d642d63dd64ad693d6b6d68bd614d5d6d5add6a7d7b9d796d6acd5fcd9e2d97ada3bdac5dac0daabdac1da99da4ada94da81da55da56da60dab1daa3daacdac1da8bda2fda1edb11dadfda90daa9da70da54da9cd933d89ed945da63da86da7fdac9da9cda84dabeda99da4ada24da7ddad0da58da59da4bda66da92da4edb1cdaedda5bda98da85da74da6ad912d829d892d993d9a4d9ffdab7daf6daa6da9ddaa1da2eda42dacdda87da3fda51da32da91daa5da50dacbda75da2fdad3dae2da98da29d961d827d848d8cfd8e8d9e8da5adaf0dac0da97dac3da54da88dadfda0cda50dac6da85dac3da7dda3ddaadda8dda8adaf4dab1da5bd9fada38d8e7d852d87ed88fd9b8d9d9da82daddda9adac3da70da71da7eda9adae5dad3da5eda6fda8ddaaedae7dac6da92daa5dac1da9fda8ada14d982d959d9c9d948d8a7d9afda56daaada6eda48dacedab2da9ddb18da67da33da58daa7db29dabedab5daaddacdda6bda6dda68da53da1bd9e6da06d9bfd92cd971d99dda30da86daa8daa5da9eda79daccdabdda4cdaa1daacda81dad9dab4da91dabfda60da69da9adaaada0dda4dda4ada0bd930d8f2da06d929d9c5dacedac3da8ada67da83dad2da8fdaaddae5dabfda77da93dac5da97daa2da30da61da98dab9da29da75da88d9b1d8bbd949d9e1d8f7d99adadeda69da00da7dda94dae7daa3da94da84da9cdab9dae5dac9daa0da37da8cdaa2da58da7fda5cda1cda5fd975d851d8eada0ed980d98eda81da4ada83da9ad9ebda60da2dda7adadbdaf1dabcdaafda9adacada6fdac0da4eda2bdad7dabdd95ed987d8d9d799d877da07d9a9d9b9da8eda8fdb04da32d993da6eda52da7edabedac1daa4daafdaa6da8bda93daeada3cda5bdb43dad3d967d92bd86fd76cd7eed98ad9aeda52dac9da64dac2da15da5fdb0adaa6da44da4ada90daa2dabbdabdda77da6fdad4daaadab3daf3da6ed9a0d924d7bdd6fed821d98fda59da9bda55da01da64dac4dacadab9da39d9dada3fda7eda8cda8bda61daa0da11dabadb01dac4daaada67d95fd959d8bcd717d81bd93cda37da52da3ddae2da01da56da79da53da76da00da86daafd971d9b6da3edb02da16d9c1da87dac8da86dac1d927d9a0d9a4d889d929d967d9c8d9c1da73da6bda09da7cda68daa8dabbda87dad4d99cd9a5dae7daded9f9d9d9dafbdab1da38da65dab5d9a6da2fd9dbd90ad974d995d975d979da93da08da48da95da92dabdda7dda1cda74da1bdad7dabfda1fdaa3da44db19dad6da34dad1daaed9d2da4ada09d932d961d9f0d938d948da35dafbdaebda0bda92daa7da2ad9f2da89dad0dae4da4ad9e1db22db01da53da50da85dad8daa3da3eda4bda29d902d8dfd9c8d91ad94dd9bfdabedaa3d9e8da9ddaaada06da57daebda22da03dad0daddda60da0bda4cda9ada87da49da6eda6bda2bda70d8ccd853d967d9aed9a0d953da39da53da2dda81da68da51da38da28da74da77da4ada14da48da32da20da8edabdda4eda3ed955d940d9a4d83cd838d94fd9b3d951d9d5da4bda2bda68da2bda29da21da45da67da5bda13da1dda32da0cda72da66da1fda7cda0eda3cd87cd7ced81ed6e6d6ddd84bd922d8b9d9f7d9eed95ad9c5d994d9acd9fbd9bfd9a7d9c6d9afd9bed9d4d9b0d985d9d0da10d9f5d9fadaf1d845d7f2d79ad760d804d881d991d97fd9d3d9b5d999d9f5da0ad991d9d6d9c2d9c3d9fdd9f3d9c3d9cfd9c6d9d8d9c5da12da2ada14da5cd8cbd81ad882d8aed8cbd9ffda0dd9dbdabeda96da73da73da3eda38da6ada98dabadaa2da69da6cdaacda8cda86da70da24da3ada84dadbda1ed908d967d977d93eda89daf4da63daa9dab9da6eda35da0ada61da58da88da6ada68da75da6bda77daaada62da1fda8bda56d9b2da65d9a4d9a9da01da44daa1dadadb24daa8da38daa8da81da3adacadaa1d9d6da36da63da53da52da3eda37da5cda89da69da5eda0fd9b8da40da11da49da96da56da9ada8fdad8daaada54dadedabeda67dafcda8cda8cdb09daadda91da8fda7eda50da5dda2cda90da2dd943da2cdac1da56dab9dab8da57dacfdab5da96dabadaa8dabedaa4da51da83da8edaa1dae6dac3daaadaafdaadda89da85da7cda50da5ddabbda88d9f4da9adae2da7ada54daf0dad3daa1dabbdabcda9ddac1da9ada7fdaeddad4da9cdaa4da7fda83da97daa6da84dacfda55da3cdb35da63d9da50db541b51ea5232541a5413540d5403552a545a52ac5332541c53da52d6521e542154315402538854be545f554e52bc535a54c1551e54a2508653504f86500c53c85260530c54185492536c52a6548b5507534053e254665453540852ea531654b1533654b2544054115440538a51bc51df53c24d364daa53a4527252e8548c54ef538e535054b1544052d6548254d75413534452c053b454ef52f8542b53e653c2546b5477533e53c654ea4f264c4c5105512e52f053f85479536253f854755324536c550c545652b853b4546f548954d352e45473543c545c54da54fc542b546b562252f84dec4fba4c42521e52d052ee543c5474549a53b8543354cf53ec5282542854e3546053e852b6545d5447544c53de543953445545569c5497517050cb4e1e52045318527e5421547b5326538a549354ad544b52dc5362546053d454245326540853de548f5417544453ce54ca554f54ca5529527e471c50425230517c52fc5434545054d3549e544c537252ca545855315449545753b45477549d546f521c52305402554954cb541356505456489a519c5081515854095443543053ee52e254325446546854af549b5352543f54485419538a53c253c653ae556454a9540654e8567b54794ff2541451264e98546f52b4529053fc532054755433540d546a541052d2541454a354f4526e53ea54c5542e546553ac528654b2541650195024555a51684e28549e5332538c54a852a654325324534e5459546353d45424548d54bd52e8539a551753f6544b53565012536a511c4d16519c560f51a04f205444540e549f549150d25400541b54175450547154385435543e538c53fe548154a452a254aa54755181536e513150f054a8563550974f66530453ee54ba542451dc549e54a7541a53b054315420539a5423532854445537544f526854b5548e526853f250054eaa541c54cb50124cf051d45445536c5429536e550b53ca4fa051f053f053b45260526054a8534e546f54675384547e54c452fe546c530e4f22522a52de51254dc051ae557f548453e8546a550953624f4653ae54f55419537c51dc551653f252ae540d5429541a54e05411559755d5514e4f4e516a531852cc5336547353b853ce54945503546f532255fe5486500e54c355765542511a52e65500549b540a53da5332559d568d535a4f5251265136512c52e451e45390535a53aa542f532e522c550853845108544e53d6545b51c0541d54c7532654335495549655bd566352e24ffa51a04f82518453425459548d5425542d5401539a54c0554b53dc51d855565252534c535254be54275140540453765426542f556a52545268538c50ef4f2851ae544e5438519452985430537a540054345344532e54b7535052d25420547553dc51ee52de52bc5483537454c451985308547f52824e2e51645478542b517e541a543c5394541d5419541a543f544452a653e2548b538853985492545c51be52a8515051eb4dd250c9553354144b94517e54c75425530a546053a453325412543953e6536852b2537e53ea545453ea535c548552b2501651b2504d50284fc24cd452f0529ac5144d9e52a64ed450455164507c517f517f50bd511b518350d751b3523c5121505b514c528a4f6651c8529450fd518152f0544454d2550952845467556c53da54e755e554f85519550a54f35539552254f354d45509545e54a5550556065535542b545b50af526c545d559e55095388511a541454c95450543a53aa53105356542a5407542353d45434549d547653b653e0539851ec501554715543515c52a0520a51c050524e4e4d4451d651c851be50a55026517c50cc52385242523c514e525051f6532e51024f5051b653fc518654eb54ae51ea53b452e45453548954f9546b54f9555955d15524554d55cb5511553a554e54c754655481548a54b05563557154e2546f53785504542a53e455c954d3545253e653ee53b85396545d544c537e5470544152fe5458545f54175413544f548654555469553053144da4522a55c0551954c2553e52d45330541b5455544253f2544853d05394549d547e52ee541953fa5402545d546f53d6532653c454de549c52f6549853d85312546d546152b4545b54825424549154335414544c5474546b54b353dc5424539e53b4543f543d53f852ee545654a4541d550c54ed494c46544ec4c884caa2cd0ace16c9f4ce91cc38cdeacf73ca92d085d03dc678cc5dcb82cc7ecdfbc9a4d092d184cdc2c890c9f0cc98ce8e4ea6508f53a4505e4c34bda0cef2ce3ad035cd27ca66ca8cc71cce0dcce8c61ccc41cd50ccbbcc31c51ccc5ed00cd010cfcfcf93ceabcd5a45705072548754a351944eda3e20cebed062d00bcc5ecac4cd69cc6ac680cc57cb7ecd68c910c678cb38c892cd79ce4acf74cfe8ce1bc700d0a8ca9e50565454522a51185094c818cdb1cf9acd9bcdfcd0a4ccdccdd4d00dcc82ce74ca38c9d8cfb8cbb0cd2ecc9bcc96cea9cebacc4ed49cd522cfeac4a84d0a527450ee4e1ccab8cc5accdbd043d00fcdc4d104cf44ce04cfe4d044cfeacfaccca6ccaccfd9cb54ce46ce29d09ed514d7bdd69dd3bacbe648b84d5a50ba4894cc2bce5ccdfccc37cf59cfe4ce5ecef8ce8fcedfcf79cf40cf42cdd8cc54cbe6cce4cee4cd33d2ddd5c3d77ad600d25ad0c146284f0a4c20cb4ecbacc9c4cc8ed06bce39cda6ca60cb52cd00ce40cdfccc74cdffc95cce23c7e4ccbcc858cdb2d1bdd442d47bd44ad182ca264ed44a94ca52cbecccfdcbe4cbc2cc8dccbccd00ce08cd86cd38ccefccfbc9aacbcccdc238603cd0ca9ece23cc24ca2cd162d227cfc3cc464ea447c0c900cb14cd063c90bf20cc8bcd06ce9acf86ce4bcc6fccfcccc0c8a6cce2cdbbccd2c898d0d5c9eacaa6bc70c804cae6c848cc034b884a10cbbccc2ac85e2400c138cb94c390c998ce51ce9fcca6cd7cce0fcffbce8ecc4acfa0ceb0d0c2471c4cd04dac4f2c4df04778cb5aca2cc55cd003cf19ca98cd2ebcc0c9a241c0c260ccf0ce28ccebcd5ece05d0b8cea8cdcad008cfa7cd60b7804ddc4ff450dc4f2ebdc0cf2cd04acc9ad074d025d01fd150c9f8cb48cb12cc11cdabccaac984cbf8ce3dcaf8cd0bd061cf24ce0fc9cacd75c808cb9a4d0a4d22cb96d03ec928c40ccf4fbd20cecbd113d07ecf21c990c7fccc364b0448e24560cdb83e104810d097ce82ca7acd04d2b8d296d45dcdaac178cc80cddf4ab849c842f0c760cc7ccda1d0b8cf5fcfd9c5f04da24df8cba8c8644ddebe40c0e8cd52c508c4dccf6ed25bd400d589d490cef7cdebc6444e5eb8c04418d05bc830bc90ce9bd022ce7fcd6ccc67ccfdc3f0cd7bca5acf96ca94c648c66ccc1cce8bd010d3b8d4a5d690d388d22ec7ec44104960c9b6cfe0c8fcc4cccbbecf64d07fcfe4d254d1ddcf5bcfbbcfaed222cf22c764cda7ce1ecd10ccd5d096d2b3d569d430d311cce045d04d42cd4eccd0cd4ecbbace20cdaacc56cf18d316d1fbcf90d0acd003d03cd005cf2fd001cd06cc90cec0cbaad06dd08dd0b0cd7ccd514acc4ee0c844c8c0ccebcbeac5a8c95ac922c8f2cd5fc86ec98acca6cc9fbc60c48ccbe2cc54bae03ed0ca4a43d0c836c2b8cc10ca7ccc2b4cd249c8be40c9b6ccd2ca86c808c8fccb98c8cac890bee0c842c962c748c650c4f4c788c9dcc4d8c4d04dde509550f94e824ef440d0ccbb48fc40804438c668c624c280c890c690c048c0d8c984c640b8603ea0bd504048c8facbdac648c710cc3b523e53b655b152ee532451c8434042004d9a4b084a244d8c49a84db04d144b4447684b8849e849bc4c3c4afc4a444a903cb03ef0c968bc504e8e518c537050434e6c4a4cc424d021c6d0cd7fce8ec360c48ccbeecbecca7ccb98ca14cc6ecc76cd50caaacca7cb88c574c4e8ced7cdeed300d163d0a3d0f0d30ed4cbd4dfd55dd249d2c1d436d292d204d3d6d0dad1d5d277d260d295d37fd2e7d38dd282d113d166d1dacdf5cd98d5ebd74dd71ed661d71bd742d635d55bd3add3a0d45dd31cd26ed342d0ded135d287d2c7d31ad359d33fd334d3d8d1fcd0b0cf5fc51cc82cd51bd655d63ad505d3e5d3a4d3b9d0dacfd1cf65cdd3cf7dcf36cc03ce16cb20cc96cc84cc00ca2ac928c958c988cf51c91ec3f0ce6ac340d23ed26cd1f8d0fad112d131d040cb7cccbacc88cc18d016d04bcec6d0c9ce2cce2ecdb8cc55c99cc4f0c198ca00d016cdaccc41ccf34230d058d046cf04d078cdd9ce47cda9cddbcd92cc50cd8ecf22cdc0d0aad0facf84cf02cf26cf56cf06cf45cd69cebeccabd119d28dcd75cc34d040cf4ccf4dcfd0ce0fcc0bcbfecf55cda9cbf6cddacb9eca96cf5fce70cdf3ce2cced1cfb7d096d0c1d086cd41cd36d1bbd255d1bed24ebc80c92cca7ccf1ece5ad13ccde6cbe8cd38cc04d062d003cb08ce70ce44cdb6cf30cd22ccaacd82ce1ecfccd118d0dbca4ccc4ecd5ad18c50084dec4a7ccc18ce9cd12bd063ccb8ce3acc1ccd46cca8ca44cf46cfeccdfacd92cc94cbcccd42cda0d01bd0e7d14dcc96cd5ccca4d0024f92508550b44c8cc050ccf2d031cf6ccfe2cfdecba0ccc8cee2ce3acd38cb14cb04ceaecac8cdf8ce34cd3ccd40cf4ecf1acffecddac9f8c3c0486c509c527a4c36c558cc5ccf0acf4cd0eecd7ecfd4d143cb44cb2ccc9ece62d14fcbd8cc20cdb2cc8ecdd4cec4ce6ace88ce86cda6d2a9d03e4c1c50c650244a18c8c4c978cffacf00ceead024cf28cc9acfced0c6d05ed07acdb8cc0ccecace1ece56d023cce2ceb8cfb4d25ed40cd481d3dacac64ef24a84b400ca5cca0ccddacf5ccf62ce92d01dcea4cf2ccd96ce5ed04ccf3acfc0cf06ceaacda0cc96ca14d05ed0a8d189d4c7d663d2f34ae0c4c0c964c87cc96ccc94cf1accf2ce24cfccce2eceb0cd58ccb8cf20cecccf1ecf52cdf2cbd4cd26cc40d03acd38cd72d261d4add405cf1a3fc0c9acca5ccd8ecd9ecb40cda2cd00cda4cfc6d013cefecc86ccfacee6ce3cce4ac808ccaad07bc99ccc6cca78cf48cc74cdf8d30cce1ac90cc87ccd10ce92c7a8c810cf04ca18cebecef8cf2ece34cde8cdfece08cf3acc4ccca8cca6d1e6cca8c9f8ce6ccb50c9a8c198d07ecf68c5f8c9d8ca70cc10ccd8cba0cdfac800ca64cc4ccd26ce9ccfeccf9ccdbacedace8ad10eccbece1cccd2cd66d0124bd04c5048b8cdd0d025c6c8c430cc82cec8d18fcdeccac0c310c428cd46cd48cd24ce58cf08ce04cd46cfa2d1bbce10ca78cf00cf6ccf2846484c044b8cc8eacdda3e00c680cfcad030d1afce2ece1ed05ccca6ccb4cc2acb8ccda2ce26ccaccc76cfc6ce6ed015cd7ed03bce9acaccce41c33835c04bb03b80c91ccd58cda6cc04cfeecd8cd1dad249cfaac8e045f8c6d0cef0cc7accc7be80d045c964cdc8d0d9cf5ecde0cc48d344d015cf0c4c524f3a3800ceecce10ccb8cb48cfe4cc2ed065ceaecc10ce54cba4bd40483ccde8cc4cc8a8c8083a80cedece0acf1ecfdad3a7d29ad391cf7648280000ccb2d048ce863480cef2cbf8ca90cf52d13ad24ecf26c330ba00d16bcecac8d0c8c8cc88cd3ecad8cea8cfbcd2f8d22ed3ded429cc3d41e0c618d042c9a0c894cdb8cc60cc06ce9cd17fd179c9dcd162d069ced8c8f8cc66d352ce1ec88ccdccced6ce7ed0d7cfdcd200d471d271c950c190c920cf54ce02cd88cf32cd34cee8cda0cc8ad06bd1d3d0cbccaed08fcee4d0dfd0becc42cd0ccd70ce1ecec2cc72cc9ed1dcd126b180c090c608cfa0cf34ca58cdbace04c928ce22ce74cc76cc26cf02ce94cfdccf7ccaa0cc82cd0cce0ccc60cd20cc82ccc8ca98ce90cfb0cc3ac280c180cad0cc32ca24cd3acd5ccb9ccb88cc84ca5ccb10cca0c9cccbd4cc8ccac8caeccb40ce8ecbd4ca5840f83ba03080c8e8cc06cdf2c9f8bd20c9c4cc04cc3cccf0cda4cca6cc08ccfecda4ccc8cab8caacca98cd96c944cf68cde0cd4cc6f0ccc04e0650e04f72469848724de8c400ca48c4e0c720444042d0c768bdc0c5f8c7583780b400c8d4c7c84130c460b680c3f0cacccc14ce2ccd064d184f204c3aae00c9544b78c3f0cf3ecbb8cc86ccd2c9c4c8a8cc78c868ca6ccc2ecc78cbf8cd64cc74c8b4c948cc8ac488ccf6d013cc28cf26cc2ccda4cefed1bfcdf6cfd6d228d1b9d1c4d2f1d0e5cf58d0d1d0a0d20fd1b7d137d13bd1f0d115d1e0d0a9cd7ccfb4cfccce62ce92d379d48dd377d111d34ed2b2d162d3fed1d1d08cd1cfcf0cce3ad0d5cfe6d059d106d07ad03ad08bd179d0e3d1bacd74cd30ccbac6a0cc60d1c4d258d41bd306d22dd3d1d232d125d220d02dd02dd221d07ccfaacf52ce00cf7ecf52ce42cdd0cf4ed04fd130d26bcbd8c560cfe6ce90d145d0ded1bcd150d0c0d1efd081ce88cf4ecddece32d22ed037ce2ace6acd92cd78ce1accfcca64c9e8c9accfd6d0ecc8303ec0cde8cbc0d0c1d035cfd4d054cfd0d052ced6cd82ce00cd68cd3ccf78cea6cf4acf7ace78cfacd0abd09dcf10cd4acca6cddacf20d1d0d17fcc38c6d0d1a2cea4cc78cd32d007cc5cce12d035ce86ce0cce66cc7acf40cf5ccfd8cfacce98d020d06ad008cdf0cf2ec9fccf4ed40ed253cd48ce9e;
    #(PERIOD)
	  reset = 0;
    #(8*PERIOD)
    for (i = 6*14*14-1; i >=0; i = i - 1) begin
		  $displayh(outAvg[i*16+:16]);
      $fwrite(file,"%h",outAvg[i*16+:16]);
		  $fwrite(file,"\n");
	  end
    $finish;
end
AvgPoolMulti UUT
  (
    .clk(clk),
    .reset(reset),
    .apInput(inAvg),
    .apOutput(outAvg)
  );
endmodule

