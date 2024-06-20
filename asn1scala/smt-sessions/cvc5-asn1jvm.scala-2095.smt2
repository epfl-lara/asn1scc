; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53126 () Bool)

(assert start!53126)

(declare-fun b!246712 () Bool)

(declare-fun res!206417 () Bool)

(declare-fun e!170927 () Bool)

(assert (=> b!246712 (=> (not res!206417) (not e!170927))))

(declare-datatypes ((array!13454 0))(
  ( (array!13455 (arr!6886 (Array (_ BitVec 32) (_ BitVec 8))) (size!5899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10720 0))(
  ( (BitStream!10721 (buf!6380 array!13454) (currentByte!11776 (_ BitVec 32)) (currentBit!11771 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17910 0))(
  ( (Unit!17911) )
))
(declare-datatypes ((tuple2!21174 0))(
  ( (tuple2!21175 (_1!11509 Unit!17910) (_2!11509 BitStream!10720)) )
))
(declare-fun lt!384841 () tuple2!21174)

(declare-fun lt!384839 () tuple2!21174)

(declare-fun isPrefixOf!0 (BitStream!10720 BitStream!10720) Bool)

(assert (=> b!246712 (= res!206417 (isPrefixOf!0 (_2!11509 lt!384841) (_2!11509 lt!384839)))))

(declare-fun b!246713 () Bool)

(declare-fun res!206425 () Bool)

(declare-fun e!170933 () Bool)

(assert (=> b!246713 (=> (not res!206425) (not e!170933))))

(declare-fun thiss!1005 () BitStream!10720)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246713 (= res!206425 (invariant!0 (currentBit!11771 thiss!1005) (currentByte!11776 thiss!1005) (size!5899 (buf!6380 (_2!11509 lt!384841)))))))

(declare-fun b!246714 () Bool)

(declare-datatypes ((tuple2!21176 0))(
  ( (tuple2!21177 (_1!11510 BitStream!10720) (_2!11510 Bool)) )
))
(declare-fun lt!384843 () tuple2!21176)

(declare-datatypes ((tuple2!21178 0))(
  ( (tuple2!21179 (_1!11511 BitStream!10720) (_2!11511 BitStream!10720)) )
))
(declare-fun lt!384833 () tuple2!21178)

(assert (=> b!246714 (= e!170927 (not (or (not (_2!11510 lt!384843)) (not (= (_1!11510 lt!384843) (_2!11511 lt!384833))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10720 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21176)

(assert (=> b!246714 (= lt!384843 (checkBitsLoopPure!0 (_1!11511 lt!384833) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384831 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246714 (validate_offset_bits!1 ((_ sign_extend 32) (size!5899 (buf!6380 (_2!11509 lt!384839)))) ((_ sign_extend 32) (currentByte!11776 (_2!11509 lt!384841))) ((_ sign_extend 32) (currentBit!11771 (_2!11509 lt!384841))) lt!384831)))

(declare-fun lt!384845 () Unit!17910)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10720 array!13454 (_ BitVec 64)) Unit!17910)

(assert (=> b!246714 (= lt!384845 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11509 lt!384841) (buf!6380 (_2!11509 lt!384839)) lt!384831))))

(declare-fun reader!0 (BitStream!10720 BitStream!10720) tuple2!21178)

(assert (=> b!246714 (= lt!384833 (reader!0 (_2!11509 lt!384841) (_2!11509 lt!384839)))))

(declare-fun b!246715 () Bool)

(assert (=> b!246715 (= e!170933 (invariant!0 (currentBit!11771 thiss!1005) (currentByte!11776 thiss!1005) (size!5899 (buf!6380 (_2!11509 lt!384839)))))))

(declare-fun b!246716 () Bool)

(declare-fun e!170924 () Bool)

(declare-fun e!170923 () Bool)

(assert (=> b!246716 (= e!170924 e!170923)))

(declare-fun res!206414 () Bool)

(assert (=> b!246716 (=> res!206414 e!170923)))

(assert (=> b!246716 (= res!206414 (not (= (size!5899 (buf!6380 thiss!1005)) (size!5899 (buf!6380 (_2!11509 lt!384839))))))))

(declare-fun lt!384837 () tuple2!21176)

(declare-fun lt!384836 () tuple2!21176)

(declare-fun lt!384823 () tuple2!21178)

(assert (=> b!246716 (and (= (_2!11510 lt!384837) (_2!11510 lt!384836)) (= (_1!11510 lt!384837) (_2!11511 lt!384823)))))

(declare-fun b!246717 () Bool)

(declare-fun e!170930 () Bool)

(declare-fun array_inv!5640 (array!13454) Bool)

(assert (=> b!246717 (= e!170930 (array_inv!5640 (buf!6380 thiss!1005)))))

(declare-fun b!246718 () Bool)

(declare-fun e!170931 () Bool)

(declare-fun lt!384846 () tuple2!21176)

(declare-fun lt!384840 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246718 (= e!170931 (= (bitIndex!0 (size!5899 (buf!6380 (_1!11510 lt!384846))) (currentByte!11776 (_1!11510 lt!384846)) (currentBit!11771 (_1!11510 lt!384846))) lt!384840))))

(declare-fun b!246720 () Bool)

(declare-fun e!170929 () Bool)

(assert (=> b!246720 (= e!170929 e!170931)))

(declare-fun res!206426 () Bool)

(assert (=> b!246720 (=> (not res!206426) (not e!170931))))

(assert (=> b!246720 (= res!206426 (and (= (_2!11510 lt!384846) bit!26) (= (_1!11510 lt!384846) (_2!11509 lt!384841))))))

(declare-fun readBitPure!0 (BitStream!10720) tuple2!21176)

(declare-fun readerFrom!0 (BitStream!10720 (_ BitVec 32) (_ BitVec 32)) BitStream!10720)

(assert (=> b!246720 (= lt!384846 (readBitPure!0 (readerFrom!0 (_2!11509 lt!384841) (currentBit!11771 thiss!1005) (currentByte!11776 thiss!1005))))))

(declare-fun b!246721 () Bool)

(declare-fun e!170922 () Bool)

(declare-fun lt!384826 () tuple2!21176)

(declare-fun lt!384834 () tuple2!21176)

(assert (=> b!246721 (= e!170922 (= (_2!11510 lt!384826) (_2!11510 lt!384834)))))

(declare-fun b!246722 () Bool)

(declare-fun e!170925 () Bool)

(assert (=> b!246722 (= e!170925 e!170927)))

(declare-fun res!206418 () Bool)

(assert (=> b!246722 (=> (not res!206418) (not e!170927))))

(assert (=> b!246722 (= res!206418 (= (bitIndex!0 (size!5899 (buf!6380 (_2!11509 lt!384839))) (currentByte!11776 (_2!11509 lt!384839)) (currentBit!11771 (_2!11509 lt!384839))) (bvadd (bitIndex!0 (size!5899 (buf!6380 (_2!11509 lt!384841))) (currentByte!11776 (_2!11509 lt!384841)) (currentBit!11771 (_2!11509 lt!384841))) lt!384831)))))

(assert (=> b!246722 (= lt!384831 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246723 () Bool)

(declare-fun res!206423 () Bool)

(declare-fun e!170926 () Bool)

(assert (=> b!246723 (=> (not res!206423) (not e!170926))))

(assert (=> b!246723 (= res!206423 (bvslt from!289 nBits!297))))

(declare-fun b!246724 () Bool)

(assert (=> b!246724 (= e!170923 true)))

(declare-fun lt!384844 () (_ BitVec 64))

(assert (=> b!246724 (= lt!384844 (bitIndex!0 (size!5899 (buf!6380 (_2!11509 lt!384839))) (currentByte!11776 (_2!11509 lt!384839)) (currentBit!11771 (_2!11509 lt!384839))))))

(declare-fun lt!384824 () (_ BitVec 64))

(assert (=> b!246724 (= lt!384824 (bitIndex!0 (size!5899 (buf!6380 thiss!1005)) (currentByte!11776 thiss!1005) (currentBit!11771 thiss!1005)))))

(declare-fun b!246725 () Bool)

(assert (=> b!246725 (= e!170926 (not e!170924))))

(declare-fun res!206424 () Bool)

(assert (=> b!246725 (=> res!206424 e!170924)))

(declare-fun lt!384827 () tuple2!21178)

(assert (=> b!246725 (= res!206424 (not (= (_1!11510 lt!384836) (_2!11511 lt!384827))))))

(assert (=> b!246725 (= lt!384836 (checkBitsLoopPure!0 (_1!11511 lt!384827) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384825 () (_ BitVec 64))

(assert (=> b!246725 (validate_offset_bits!1 ((_ sign_extend 32) (size!5899 (buf!6380 (_2!11509 lt!384839)))) ((_ sign_extend 32) (currentByte!11776 (_2!11509 lt!384841))) ((_ sign_extend 32) (currentBit!11771 (_2!11509 lt!384841))) lt!384825)))

(declare-fun lt!384828 () Unit!17910)

(assert (=> b!246725 (= lt!384828 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11509 lt!384841) (buf!6380 (_2!11509 lt!384839)) lt!384825))))

(assert (=> b!246725 (= lt!384837 (checkBitsLoopPure!0 (_1!11511 lt!384823) nBits!297 bit!26 from!289))))

(assert (=> b!246725 (validate_offset_bits!1 ((_ sign_extend 32) (size!5899 (buf!6380 (_2!11509 lt!384839)))) ((_ sign_extend 32) (currentByte!11776 thiss!1005)) ((_ sign_extend 32) (currentBit!11771 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384838 () Unit!17910)

(assert (=> b!246725 (= lt!384838 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6380 (_2!11509 lt!384839)) (bvsub nBits!297 from!289)))))

(assert (=> b!246725 (= (_2!11510 (readBitPure!0 (_1!11511 lt!384823))) bit!26)))

(assert (=> b!246725 (= lt!384827 (reader!0 (_2!11509 lt!384841) (_2!11509 lt!384839)))))

(assert (=> b!246725 (= lt!384823 (reader!0 thiss!1005 (_2!11509 lt!384839)))))

(assert (=> b!246725 e!170922))

(declare-fun res!206412 () Bool)

(assert (=> b!246725 (=> (not res!206412) (not e!170922))))

(assert (=> b!246725 (= res!206412 (= (bitIndex!0 (size!5899 (buf!6380 (_1!11510 lt!384826))) (currentByte!11776 (_1!11510 lt!384826)) (currentBit!11771 (_1!11510 lt!384826))) (bitIndex!0 (size!5899 (buf!6380 (_1!11510 lt!384834))) (currentByte!11776 (_1!11510 lt!384834)) (currentBit!11771 (_1!11510 lt!384834)))))))

(declare-fun lt!384830 () Unit!17910)

(declare-fun lt!384842 () BitStream!10720)

(declare-fun readBitPrefixLemma!0 (BitStream!10720 BitStream!10720) Unit!17910)

(assert (=> b!246725 (= lt!384830 (readBitPrefixLemma!0 lt!384842 (_2!11509 lt!384839)))))

(assert (=> b!246725 (= lt!384834 (readBitPure!0 (BitStream!10721 (buf!6380 (_2!11509 lt!384839)) (currentByte!11776 thiss!1005) (currentBit!11771 thiss!1005))))))

(assert (=> b!246725 (= lt!384826 (readBitPure!0 lt!384842))))

(assert (=> b!246725 (= lt!384842 (BitStream!10721 (buf!6380 (_2!11509 lt!384841)) (currentByte!11776 thiss!1005) (currentBit!11771 thiss!1005)))))

(assert (=> b!246725 e!170933))

(declare-fun res!206416 () Bool)

(assert (=> b!246725 (=> (not res!206416) (not e!170933))))

(assert (=> b!246725 (= res!206416 (isPrefixOf!0 thiss!1005 (_2!11509 lt!384839)))))

(declare-fun lt!384835 () Unit!17910)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10720 BitStream!10720 BitStream!10720) Unit!17910)

(assert (=> b!246725 (= lt!384835 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11509 lt!384841) (_2!11509 lt!384839)))))

(assert (=> b!246725 e!170925))

(declare-fun res!206427 () Bool)

(assert (=> b!246725 (=> (not res!206427) (not e!170925))))

(assert (=> b!246725 (= res!206427 (= (size!5899 (buf!6380 (_2!11509 lt!384841))) (size!5899 (buf!6380 (_2!11509 lt!384839)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10720 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21174)

(assert (=> b!246725 (= lt!384839 (appendNBitsLoop!0 (_2!11509 lt!384841) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246725 (validate_offset_bits!1 ((_ sign_extend 32) (size!5899 (buf!6380 (_2!11509 lt!384841)))) ((_ sign_extend 32) (currentByte!11776 (_2!11509 lt!384841))) ((_ sign_extend 32) (currentBit!11771 (_2!11509 lt!384841))) lt!384825)))

(assert (=> b!246725 (= lt!384825 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384829 () Unit!17910)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10720 BitStream!10720 (_ BitVec 64) (_ BitVec 64)) Unit!17910)

(assert (=> b!246725 (= lt!384829 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11509 lt!384841) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170932 () Bool)

(assert (=> b!246725 e!170932))

(declare-fun res!206420 () Bool)

(assert (=> b!246725 (=> (not res!206420) (not e!170932))))

(assert (=> b!246725 (= res!206420 (= (size!5899 (buf!6380 thiss!1005)) (size!5899 (buf!6380 (_2!11509 lt!384841)))))))

(declare-fun appendBit!0 (BitStream!10720 Bool) tuple2!21174)

(assert (=> b!246725 (= lt!384841 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246726 () Bool)

(assert (=> b!246726 (= e!170932 e!170929)))

(declare-fun res!206413 () Bool)

(assert (=> b!246726 (=> (not res!206413) (not e!170929))))

(declare-fun lt!384832 () (_ BitVec 64))

(assert (=> b!246726 (= res!206413 (= lt!384840 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384832)))))

(assert (=> b!246726 (= lt!384840 (bitIndex!0 (size!5899 (buf!6380 (_2!11509 lt!384841))) (currentByte!11776 (_2!11509 lt!384841)) (currentBit!11771 (_2!11509 lt!384841))))))

(assert (=> b!246726 (= lt!384832 (bitIndex!0 (size!5899 (buf!6380 thiss!1005)) (currentByte!11776 thiss!1005) (currentBit!11771 thiss!1005)))))

(declare-fun b!246727 () Bool)

(declare-fun res!206422 () Bool)

(assert (=> b!246727 (=> res!206422 e!170924)))

(declare-fun withMovedBitIndex!0 (BitStream!10720 (_ BitVec 64)) BitStream!10720)

(assert (=> b!246727 (= res!206422 (not (= (_1!11511 lt!384827) (withMovedBitIndex!0 (_1!11511 lt!384823) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246728 () Bool)

(declare-fun res!206415 () Bool)

(assert (=> b!246728 (=> (not res!206415) (not e!170929))))

(assert (=> b!246728 (= res!206415 (isPrefixOf!0 thiss!1005 (_2!11509 lt!384841)))))

(declare-fun b!246719 () Bool)

(declare-fun res!206421 () Bool)

(assert (=> b!246719 (=> (not res!206421) (not e!170926))))

(assert (=> b!246719 (= res!206421 (validate_offset_bits!1 ((_ sign_extend 32) (size!5899 (buf!6380 thiss!1005))) ((_ sign_extend 32) (currentByte!11776 thiss!1005)) ((_ sign_extend 32) (currentBit!11771 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!206419 () Bool)

(assert (=> start!53126 (=> (not res!206419) (not e!170926))))

(assert (=> start!53126 (= res!206419 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53126 e!170926))

(assert (=> start!53126 true))

(declare-fun inv!12 (BitStream!10720) Bool)

(assert (=> start!53126 (and (inv!12 thiss!1005) e!170930)))

(assert (= (and start!53126 res!206419) b!246719))

(assert (= (and b!246719 res!206421) b!246723))

(assert (= (and b!246723 res!206423) b!246725))

(assert (= (and b!246725 res!206420) b!246726))

(assert (= (and b!246726 res!206413) b!246728))

(assert (= (and b!246728 res!206415) b!246720))

(assert (= (and b!246720 res!206426) b!246718))

(assert (= (and b!246725 res!206427) b!246722))

(assert (= (and b!246722 res!206418) b!246712))

(assert (= (and b!246712 res!206417) b!246714))

(assert (= (and b!246725 res!206416) b!246713))

(assert (= (and b!246713 res!206425) b!246715))

(assert (= (and b!246725 res!206412) b!246721))

(assert (= (and b!246725 (not res!206424)) b!246727))

(assert (= (and b!246727 (not res!206422)) b!246716))

(assert (= (and b!246716 (not res!206414)) b!246724))

(assert (= start!53126 b!246717))

(declare-fun m!372071 () Bool)

(assert (=> b!246726 m!372071))

(declare-fun m!372073 () Bool)

(assert (=> b!246726 m!372073))

(declare-fun m!372075 () Bool)

(assert (=> b!246715 m!372075))

(declare-fun m!372077 () Bool)

(assert (=> b!246728 m!372077))

(declare-fun m!372079 () Bool)

(assert (=> b!246718 m!372079))

(declare-fun m!372081 () Bool)

(assert (=> b!246725 m!372081))

(declare-fun m!372083 () Bool)

(assert (=> b!246725 m!372083))

(declare-fun m!372085 () Bool)

(assert (=> b!246725 m!372085))

(declare-fun m!372087 () Bool)

(assert (=> b!246725 m!372087))

(declare-fun m!372089 () Bool)

(assert (=> b!246725 m!372089))

(declare-fun m!372091 () Bool)

(assert (=> b!246725 m!372091))

(declare-fun m!372093 () Bool)

(assert (=> b!246725 m!372093))

(declare-fun m!372095 () Bool)

(assert (=> b!246725 m!372095))

(declare-fun m!372097 () Bool)

(assert (=> b!246725 m!372097))

(declare-fun m!372099 () Bool)

(assert (=> b!246725 m!372099))

(declare-fun m!372101 () Bool)

(assert (=> b!246725 m!372101))

(declare-fun m!372103 () Bool)

(assert (=> b!246725 m!372103))

(declare-fun m!372105 () Bool)

(assert (=> b!246725 m!372105))

(declare-fun m!372107 () Bool)

(assert (=> b!246725 m!372107))

(declare-fun m!372109 () Bool)

(assert (=> b!246725 m!372109))

(declare-fun m!372111 () Bool)

(assert (=> b!246725 m!372111))

(declare-fun m!372113 () Bool)

(assert (=> b!246725 m!372113))

(declare-fun m!372115 () Bool)

(assert (=> b!246725 m!372115))

(declare-fun m!372117 () Bool)

(assert (=> b!246725 m!372117))

(declare-fun m!372119 () Bool)

(assert (=> b!246725 m!372119))

(declare-fun m!372121 () Bool)

(assert (=> b!246714 m!372121))

(declare-fun m!372123 () Bool)

(assert (=> b!246714 m!372123))

(declare-fun m!372125 () Bool)

(assert (=> b!246714 m!372125))

(assert (=> b!246714 m!372105))

(declare-fun m!372127 () Bool)

(assert (=> start!53126 m!372127))

(declare-fun m!372129 () Bool)

(assert (=> b!246713 m!372129))

(declare-fun m!372131 () Bool)

(assert (=> b!246712 m!372131))

(declare-fun m!372133 () Bool)

(assert (=> b!246722 m!372133))

(assert (=> b!246722 m!372071))

(declare-fun m!372135 () Bool)

(assert (=> b!246719 m!372135))

(declare-fun m!372137 () Bool)

(assert (=> b!246717 m!372137))

(assert (=> b!246724 m!372133))

(assert (=> b!246724 m!372073))

(declare-fun m!372139 () Bool)

(assert (=> b!246727 m!372139))

(declare-fun m!372141 () Bool)

(assert (=> b!246720 m!372141))

(assert (=> b!246720 m!372141))

(declare-fun m!372143 () Bool)

(assert (=> b!246720 m!372143))

(push 1)

(assert (not b!246715))

(assert (not b!246714))

(assert (not b!246719))

(assert (not b!246718))

(assert (not b!246722))

(assert (not b!246728))

(assert (not b!246717))

(assert (not b!246727))

(assert (not b!246726))

