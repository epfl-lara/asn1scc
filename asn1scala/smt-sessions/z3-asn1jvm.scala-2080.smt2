; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52642 () Bool)

(assert start!52642)

(declare-fun b!243610 () Bool)

(declare-fun res!203548 () Bool)

(declare-fun e!168879 () Bool)

(assert (=> b!243610 (=> (not res!203548) (not e!168879))))

(declare-datatypes ((array!13354 0))(
  ( (array!13355 (arr!6842 (Array (_ BitVec 32) (_ BitVec 8))) (size!5855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10632 0))(
  ( (BitStream!10633 (buf!6324 array!13354) (currentByte!11696 (_ BitVec 32)) (currentBit!11691 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10632)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243610 (= res!203548 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243611 () Bool)

(declare-fun e!168874 () Bool)

(declare-datatypes ((tuple2!20886 0))(
  ( (tuple2!20887 (_1!11365 BitStream!10632) (_2!11365 Bool)) )
))
(declare-fun lt!379576 () tuple2!20886)

(declare-fun lt!379569 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243611 (= e!168874 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379576))) (currentByte!11696 (_1!11365 lt!379576)) (currentBit!11691 (_1!11365 lt!379576))) lt!379569))))

(declare-fun b!243612 () Bool)

(declare-fun e!168873 () Bool)

(declare-fun e!168880 () Bool)

(assert (=> b!243612 (= e!168873 e!168880)))

(declare-fun res!203543 () Bool)

(assert (=> b!243612 (=> (not res!203543) (not e!168880))))

(declare-datatypes ((Unit!17799 0))(
  ( (Unit!17800) )
))
(declare-datatypes ((tuple2!20888 0))(
  ( (tuple2!20889 (_1!11366 Unit!17799) (_2!11366 BitStream!10632)) )
))
(declare-fun lt!379573 () tuple2!20888)

(declare-fun lt!379567 () tuple2!20888)

(declare-fun lt!379581 () (_ BitVec 64))

(assert (=> b!243612 (= res!203543 (= (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573))) (bvadd (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))) lt!379581)))))

(assert (=> b!243612 (= lt!379581 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243613 () Bool)

(declare-fun e!168872 () Bool)

(declare-fun e!168877 () Bool)

(assert (=> b!243613 (= e!168872 e!168877)))

(declare-fun res!203546 () Bool)

(assert (=> b!243613 (=> (not res!203546) (not e!168877))))

(declare-fun lt!379583 () (_ BitVec 64))

(assert (=> b!243613 (= res!203546 (= lt!379569 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379583)))))

(assert (=> b!243613 (= lt!379569 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))))))

(assert (=> b!243613 (= lt!379583 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(declare-fun b!243614 () Bool)

(declare-fun res!203552 () Bool)

(assert (=> b!243614 (=> (not res!203552) (not e!168877))))

(declare-fun isPrefixOf!0 (BitStream!10632 BitStream!10632) Bool)

(assert (=> b!243614 (= res!203552 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379567)))))

(declare-fun b!243615 () Bool)

(declare-fun e!168881 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243615 (= e!168881 (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(declare-fun b!243616 () Bool)

(declare-datatypes ((tuple2!20890 0))(
  ( (tuple2!20891 (_1!11367 BitStream!10632) (_2!11367 BitStream!10632)) )
))
(declare-fun lt!379571 () tuple2!20890)

(assert (=> b!243616 (= e!168879 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11367 lt!379571)))) ((_ sign_extend 32) (currentByte!11696 (_1!11367 lt!379571))) ((_ sign_extend 32) (currentBit!11691 (_1!11367 lt!379571))) (bvsub nBits!297 from!289))))))

(assert (=> b!243616 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379572 () Unit!17799)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10632 array!13354 (_ BitVec 64)) Unit!17799)

(assert (=> b!243616 (= lt!379572 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6324 (_2!11366 lt!379573)) (bvsub nBits!297 from!289)))))

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10632) tuple2!20886)

(assert (=> b!243616 (= (_2!11365 (readBitPure!0 (_1!11367 lt!379571))) bit!26)))

(declare-fun lt!379580 () tuple2!20890)

(declare-fun reader!0 (BitStream!10632 BitStream!10632) tuple2!20890)

(assert (=> b!243616 (= lt!379580 (reader!0 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(assert (=> b!243616 (= lt!379571 (reader!0 thiss!1005 (_2!11366 lt!379573)))))

(declare-fun e!168878 () Bool)

(assert (=> b!243616 e!168878))

(declare-fun res!203550 () Bool)

(assert (=> b!243616 (=> (not res!203550) (not e!168878))))

(declare-fun lt!379579 () tuple2!20886)

(declare-fun lt!379578 () tuple2!20886)

(assert (=> b!243616 (= res!203550 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379579))) (currentByte!11696 (_1!11365 lt!379579)) (currentBit!11691 (_1!11365 lt!379579))) (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379578))) (currentByte!11696 (_1!11365 lt!379578)) (currentBit!11691 (_1!11365 lt!379578)))))))

(declare-fun lt!379577 () Unit!17799)

(declare-fun lt!379570 () BitStream!10632)

(declare-fun readBitPrefixLemma!0 (BitStream!10632 BitStream!10632) Unit!17799)

(assert (=> b!243616 (= lt!379577 (readBitPrefixLemma!0 lt!379570 (_2!11366 lt!379573)))))

(assert (=> b!243616 (= lt!379578 (readBitPure!0 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))))))

(assert (=> b!243616 (= lt!379579 (readBitPure!0 lt!379570))))

(assert (=> b!243616 (= lt!379570 (BitStream!10633 (buf!6324 (_2!11366 lt!379567)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(assert (=> b!243616 e!168881))

(declare-fun res!203553 () Bool)

(assert (=> b!243616 (=> (not res!203553) (not e!168881))))

(assert (=> b!243616 (= res!203553 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379573)))))

(declare-fun lt!379574 () Unit!17799)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10632 BitStream!10632 BitStream!10632) Unit!17799)

(assert (=> b!243616 (= lt!379574 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(assert (=> b!243616 e!168873))

(declare-fun res!203551 () Bool)

(assert (=> b!243616 (=> (not res!203551) (not e!168873))))

(assert (=> b!243616 (= res!203551 (= (size!5855 (buf!6324 (_2!11366 lt!379567))) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10632 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20888)

(assert (=> b!243616 (= lt!379573 (appendNBitsLoop!0 (_2!11366 lt!379567) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243616 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379568 () Unit!17799)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10632 BitStream!10632 (_ BitVec 64) (_ BitVec 64)) Unit!17799)

(assert (=> b!243616 (= lt!379568 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11366 lt!379567) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!243616 e!168872))

(declare-fun res!203547 () Bool)

(assert (=> b!243616 (=> (not res!203547) (not e!168872))))

(assert (=> b!243616 (= res!203547 (= (size!5855 (buf!6324 thiss!1005)) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(declare-fun appendBit!0 (BitStream!10632 Bool) tuple2!20888)

(assert (=> b!243616 (= lt!379567 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!203544 () Bool)

(assert (=> start!52642 (=> (not res!203544) (not e!168879))))

(assert (=> start!52642 (= res!203544 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52642 e!168879))

(assert (=> start!52642 true))

(declare-fun e!168875 () Bool)

(declare-fun inv!12 (BitStream!10632) Bool)

(assert (=> start!52642 (and (inv!12 thiss!1005) e!168875)))

(declare-fun b!243617 () Bool)

(declare-fun array_inv!5596 (array!13354) Bool)

(assert (=> b!243617 (= e!168875 (array_inv!5596 (buf!6324 thiss!1005)))))

(declare-fun b!243618 () Bool)

(declare-fun lt!379584 () tuple2!20886)

(declare-fun lt!379582 () tuple2!20890)

(assert (=> b!243618 (= e!168880 (not (or (not (_2!11365 lt!379584)) (not (= (_1!11365 lt!379584) (_2!11367 lt!379582))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10632 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20886)

(assert (=> b!243618 (= lt!379584 (checkBitsLoopPure!0 (_1!11367 lt!379582) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243618 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) lt!379581)))

(declare-fun lt!379575 () Unit!17799)

(assert (=> b!243618 (= lt!379575 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11366 lt!379567) (buf!6324 (_2!11366 lt!379573)) lt!379581))))

(assert (=> b!243618 (= lt!379582 (reader!0 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(declare-fun b!243619 () Bool)

(declare-fun res!203545 () Bool)

(assert (=> b!243619 (=> (not res!203545) (not e!168881))))

(assert (=> b!243619 (= res!203545 (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(declare-fun b!243620 () Bool)

(assert (=> b!243620 (= e!168878 (= (_2!11365 lt!379579) (_2!11365 lt!379578)))))

(declare-fun b!243621 () Bool)

(assert (=> b!243621 (= e!168877 e!168874)))

(declare-fun res!203549 () Bool)

(assert (=> b!243621 (=> (not res!203549) (not e!168874))))

(assert (=> b!243621 (= res!203549 (and (= (_2!11365 lt!379576) bit!26) (= (_1!11365 lt!379576) (_2!11366 lt!379567))))))

(declare-fun readerFrom!0 (BitStream!10632 (_ BitVec 32) (_ BitVec 32)) BitStream!10632)

(assert (=> b!243621 (= lt!379576 (readBitPure!0 (readerFrom!0 (_2!11366 lt!379567) (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005))))))

(declare-fun b!243622 () Bool)

(declare-fun res!203541 () Bool)

(assert (=> b!243622 (=> (not res!203541) (not e!168880))))

(assert (=> b!243622 (= res!203541 (isPrefixOf!0 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(declare-fun b!243623 () Bool)

(declare-fun res!203542 () Bool)

(assert (=> b!243623 (=> (not res!203542) (not e!168879))))

(assert (=> b!243623 (= res!203542 (bvslt from!289 nBits!297))))

(assert (= (and start!52642 res!203544) b!243610))

(assert (= (and b!243610 res!203548) b!243623))

(assert (= (and b!243623 res!203542) b!243616))

(assert (= (and b!243616 res!203547) b!243613))

(assert (= (and b!243613 res!203546) b!243614))

(assert (= (and b!243614 res!203552) b!243621))

(assert (= (and b!243621 res!203549) b!243611))

(assert (= (and b!243616 res!203551) b!243612))

(assert (= (and b!243612 res!203543) b!243622))

(assert (= (and b!243622 res!203541) b!243618))

(assert (= (and b!243616 res!203553) b!243619))

(assert (= (and b!243619 res!203545) b!243615))

(assert (= (and b!243616 res!203550) b!243620))

(assert (= start!52642 b!243617))

(declare-fun m!367043 () Bool)

(assert (=> b!243610 m!367043))

(declare-fun m!367045 () Bool)

(assert (=> b!243617 m!367045))

(declare-fun m!367047 () Bool)

(assert (=> b!243622 m!367047))

(declare-fun m!367049 () Bool)

(assert (=> b!243613 m!367049))

(declare-fun m!367051 () Bool)

(assert (=> b!243613 m!367051))

(declare-fun m!367053 () Bool)

(assert (=> b!243618 m!367053))

(declare-fun m!367055 () Bool)

(assert (=> b!243618 m!367055))

(declare-fun m!367057 () Bool)

(assert (=> b!243618 m!367057))

(declare-fun m!367059 () Bool)

(assert (=> b!243618 m!367059))

(declare-fun m!367061 () Bool)

(assert (=> b!243621 m!367061))

(assert (=> b!243621 m!367061))

(declare-fun m!367063 () Bool)

(assert (=> b!243621 m!367063))

(declare-fun m!367065 () Bool)

(assert (=> b!243612 m!367065))

(assert (=> b!243612 m!367049))

(declare-fun m!367067 () Bool)

(assert (=> b!243619 m!367067))

(declare-fun m!367069 () Bool)

(assert (=> start!52642 m!367069))

(declare-fun m!367071 () Bool)

(assert (=> b!243611 m!367071))

(declare-fun m!367073 () Bool)

(assert (=> b!243614 m!367073))

(declare-fun m!367075 () Bool)

(assert (=> b!243615 m!367075))

(declare-fun m!367077 () Bool)

(assert (=> b!243616 m!367077))

(declare-fun m!367079 () Bool)

(assert (=> b!243616 m!367079))

(declare-fun m!367081 () Bool)

(assert (=> b!243616 m!367081))

(declare-fun m!367083 () Bool)

(assert (=> b!243616 m!367083))

(declare-fun m!367085 () Bool)

(assert (=> b!243616 m!367085))

(declare-fun m!367087 () Bool)

(assert (=> b!243616 m!367087))

(declare-fun m!367089 () Bool)

(assert (=> b!243616 m!367089))

(declare-fun m!367091 () Bool)

(assert (=> b!243616 m!367091))

(declare-fun m!367093 () Bool)

(assert (=> b!243616 m!367093))

(declare-fun m!367095 () Bool)

(assert (=> b!243616 m!367095))

(declare-fun m!367097 () Bool)

(assert (=> b!243616 m!367097))

(declare-fun m!367099 () Bool)

(assert (=> b!243616 m!367099))

(declare-fun m!367101 () Bool)

(assert (=> b!243616 m!367101))

(declare-fun m!367103 () Bool)

(assert (=> b!243616 m!367103))

(declare-fun m!367105 () Bool)

(assert (=> b!243616 m!367105))

(assert (=> b!243616 m!367059))

(declare-fun m!367107 () Bool)

(assert (=> b!243616 m!367107))

(check-sat (not b!243613) (not b!243621) (not b!243622) (not b!243616) (not b!243618) (not b!243619) (not start!52642) (not b!243610) (not b!243612) (not b!243611) (not b!243615) (not b!243617) (not b!243614))
(check-sat)
(get-model)

(declare-fun d!81714 () Bool)

(declare-fun e!168914 () Bool)

(assert (=> d!81714 e!168914))

(declare-fun res!203597 () Bool)

(assert (=> d!81714 (=> (not res!203597) (not e!168914))))

(declare-fun lt!379655 () (_ BitVec 64))

(declare-fun lt!379656 () (_ BitVec 64))

(declare-fun lt!379652 () (_ BitVec 64))

(assert (=> d!81714 (= res!203597 (= lt!379655 (bvsub lt!379652 lt!379656)))))

(assert (=> d!81714 (or (= (bvand lt!379652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379652 lt!379656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81714 (= lt!379656 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379579)))) ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379579))) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379579)))))))

(declare-fun lt!379651 () (_ BitVec 64))

(declare-fun lt!379654 () (_ BitVec 64))

(assert (=> d!81714 (= lt!379652 (bvmul lt!379651 lt!379654))))

(assert (=> d!81714 (or (= lt!379651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379654 (bvsdiv (bvmul lt!379651 lt!379654) lt!379651)))))

(assert (=> d!81714 (= lt!379654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81714 (= lt!379651 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379579)))))))

(assert (=> d!81714 (= lt!379655 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379579))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379579)))))))

(assert (=> d!81714 (invariant!0 (currentBit!11691 (_1!11365 lt!379579)) (currentByte!11696 (_1!11365 lt!379579)) (size!5855 (buf!6324 (_1!11365 lt!379579))))))

(assert (=> d!81714 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379579))) (currentByte!11696 (_1!11365 lt!379579)) (currentBit!11691 (_1!11365 lt!379579))) lt!379655)))

(declare-fun b!243670 () Bool)

(declare-fun res!203598 () Bool)

(assert (=> b!243670 (=> (not res!203598) (not e!168914))))

(assert (=> b!243670 (= res!203598 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379655))))

(declare-fun b!243671 () Bool)

(declare-fun lt!379653 () (_ BitVec 64))

(assert (=> b!243671 (= e!168914 (bvsle lt!379655 (bvmul lt!379653 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243671 (or (= lt!379653 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379653 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379653)))))

(assert (=> b!243671 (= lt!379653 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379579)))))))

(assert (= (and d!81714 res!203597) b!243670))

(assert (= (and b!243670 res!203598) b!243671))

(declare-fun m!367175 () Bool)

(assert (=> d!81714 m!367175))

(declare-fun m!367177 () Bool)

(assert (=> d!81714 m!367177))

(assert (=> b!243616 d!81714))

(declare-fun b!243681 () Bool)

(declare-fun res!203608 () Bool)

(declare-fun e!168920 () Bool)

(assert (=> b!243681 (=> (not res!203608) (not e!168920))))

(declare-fun lt!379668 () tuple2!20888)

(declare-fun lt!379666 () (_ BitVec 64))

(declare-fun lt!379665 () (_ BitVec 64))

(assert (=> b!243681 (= res!203608 (= (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379668))) (currentByte!11696 (_2!11366 lt!379668)) (currentBit!11691 (_2!11366 lt!379668))) (bvadd lt!379665 lt!379666)))))

(assert (=> b!243681 (or (not (= (bvand lt!379665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379666 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!379665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!379665 lt!379666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243681 (= lt!379666 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!243681 (= lt!379665 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(declare-fun d!81716 () Bool)

(assert (=> d!81716 e!168920))

(declare-fun res!203610 () Bool)

(assert (=> d!81716 (=> (not res!203610) (not e!168920))))

(assert (=> d!81716 (= res!203610 (= (size!5855 (buf!6324 thiss!1005)) (size!5855 (buf!6324 (_2!11366 lt!379668)))))))

(declare-fun choose!16 (BitStream!10632 Bool) tuple2!20888)

(assert (=> d!81716 (= lt!379668 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!81716 (validate_offset_bit!0 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)))))

(assert (=> d!81716 (= (appendBit!0 thiss!1005 bit!26) lt!379668)))

(declare-fun b!243683 () Bool)

(declare-fun e!168919 () Bool)

(assert (=> b!243683 (= e!168920 e!168919)))

(declare-fun res!203609 () Bool)

(assert (=> b!243683 (=> (not res!203609) (not e!168919))))

(declare-fun lt!379667 () tuple2!20886)

(assert (=> b!243683 (= res!203609 (and (= (_2!11365 lt!379667) bit!26) (= (_1!11365 lt!379667) (_2!11366 lt!379668))))))

(assert (=> b!243683 (= lt!379667 (readBitPure!0 (readerFrom!0 (_2!11366 lt!379668) (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005))))))

(declare-fun b!243682 () Bool)

(declare-fun res!203607 () Bool)

(assert (=> b!243682 (=> (not res!203607) (not e!168920))))

(assert (=> b!243682 (= res!203607 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379668)))))

(declare-fun b!243684 () Bool)

(assert (=> b!243684 (= e!168919 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379667))) (currentByte!11696 (_1!11365 lt!379667)) (currentBit!11691 (_1!11365 lt!379667))) (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379668))) (currentByte!11696 (_2!11366 lt!379668)) (currentBit!11691 (_2!11366 lt!379668)))))))

(assert (= (and d!81716 res!203610) b!243681))

(assert (= (and b!243681 res!203608) b!243682))

(assert (= (and b!243682 res!203607) b!243683))

(assert (= (and b!243683 res!203609) b!243684))

(declare-fun m!367179 () Bool)

(assert (=> b!243681 m!367179))

(assert (=> b!243681 m!367051))

(declare-fun m!367181 () Bool)

(assert (=> b!243683 m!367181))

(assert (=> b!243683 m!367181))

(declare-fun m!367183 () Bool)

(assert (=> b!243683 m!367183))

(declare-fun m!367185 () Bool)

(assert (=> b!243684 m!367185))

(assert (=> b!243684 m!367179))

(declare-fun m!367187 () Bool)

(assert (=> b!243682 m!367187))

(declare-fun m!367189 () Bool)

(assert (=> d!81716 m!367189))

(declare-fun m!367191 () Bool)

(assert (=> d!81716 m!367191))

(assert (=> b!243616 d!81716))

(declare-fun b!243695 () Bool)

(declare-fun e!168926 () Unit!17799)

(declare-fun lt!379711 () Unit!17799)

(assert (=> b!243695 (= e!168926 lt!379711)))

(declare-fun lt!379714 () (_ BitVec 64))

(assert (=> b!243695 (= lt!379714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!379717 () (_ BitVec 64))

(assert (=> b!243695 (= lt!379717 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13354 array!13354 (_ BitVec 64) (_ BitVec 64)) Unit!17799)

(assert (=> b!243695 (= lt!379711 (arrayBitRangesEqSymmetric!0 (buf!6324 (_2!11366 lt!379567)) (buf!6324 (_2!11366 lt!379573)) lt!379714 lt!379717))))

(declare-fun arrayBitRangesEq!0 (array!13354 array!13354 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243695 (arrayBitRangesEq!0 (buf!6324 (_2!11366 lt!379573)) (buf!6324 (_2!11366 lt!379567)) lt!379714 lt!379717)))

(declare-fun b!243696 () Bool)

(declare-fun Unit!17803 () Unit!17799)

(assert (=> b!243696 (= e!168926 Unit!17803)))

(declare-fun d!81718 () Bool)

(declare-fun e!168925 () Bool)

(assert (=> d!81718 e!168925))

(declare-fun res!203617 () Bool)

(assert (=> d!81718 (=> (not res!203617) (not e!168925))))

(declare-fun lt!379727 () tuple2!20890)

(assert (=> d!81718 (= res!203617 (isPrefixOf!0 (_1!11367 lt!379727) (_2!11367 lt!379727)))))

(declare-fun lt!379724 () BitStream!10632)

(assert (=> d!81718 (= lt!379727 (tuple2!20891 lt!379724 (_2!11366 lt!379573)))))

(declare-fun lt!379710 () Unit!17799)

(declare-fun lt!379718 () Unit!17799)

(assert (=> d!81718 (= lt!379710 lt!379718)))

(assert (=> d!81718 (isPrefixOf!0 lt!379724 (_2!11366 lt!379573))))

(assert (=> d!81718 (= lt!379718 (lemmaIsPrefixTransitive!0 lt!379724 (_2!11366 lt!379573) (_2!11366 lt!379573)))))

(declare-fun lt!379726 () Unit!17799)

(declare-fun lt!379719 () Unit!17799)

(assert (=> d!81718 (= lt!379726 lt!379719)))

(assert (=> d!81718 (isPrefixOf!0 lt!379724 (_2!11366 lt!379573))))

(assert (=> d!81718 (= lt!379719 (lemmaIsPrefixTransitive!0 lt!379724 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(declare-fun lt!379721 () Unit!17799)

(assert (=> d!81718 (= lt!379721 e!168926)))

(declare-fun c!11455 () Bool)

(assert (=> d!81718 (= c!11455 (not (= (size!5855 (buf!6324 (_2!11366 lt!379567))) #b00000000000000000000000000000000)))))

(declare-fun lt!379712 () Unit!17799)

(declare-fun lt!379713 () Unit!17799)

(assert (=> d!81718 (= lt!379712 lt!379713)))

(assert (=> d!81718 (isPrefixOf!0 (_2!11366 lt!379573) (_2!11366 lt!379573))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10632) Unit!17799)

(assert (=> d!81718 (= lt!379713 (lemmaIsPrefixRefl!0 (_2!11366 lt!379573)))))

(declare-fun lt!379722 () Unit!17799)

(declare-fun lt!379716 () Unit!17799)

(assert (=> d!81718 (= lt!379722 lt!379716)))

(assert (=> d!81718 (= lt!379716 (lemmaIsPrefixRefl!0 (_2!11366 lt!379573)))))

(declare-fun lt!379720 () Unit!17799)

(declare-fun lt!379709 () Unit!17799)

(assert (=> d!81718 (= lt!379720 lt!379709)))

(assert (=> d!81718 (isPrefixOf!0 lt!379724 lt!379724)))

(assert (=> d!81718 (= lt!379709 (lemmaIsPrefixRefl!0 lt!379724))))

(declare-fun lt!379725 () Unit!17799)

(declare-fun lt!379728 () Unit!17799)

(assert (=> d!81718 (= lt!379725 lt!379728)))

(assert (=> d!81718 (isPrefixOf!0 (_2!11366 lt!379567) (_2!11366 lt!379567))))

(assert (=> d!81718 (= lt!379728 (lemmaIsPrefixRefl!0 (_2!11366 lt!379567)))))

(assert (=> d!81718 (= lt!379724 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))))))

(assert (=> d!81718 (isPrefixOf!0 (_2!11366 lt!379567) (_2!11366 lt!379573))))

(assert (=> d!81718 (= (reader!0 (_2!11366 lt!379567) (_2!11366 lt!379573)) lt!379727)))

(declare-fun lt!379723 () (_ BitVec 64))

(declare-fun b!243697 () Bool)

(declare-fun lt!379715 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10632 (_ BitVec 64)) BitStream!10632)

(assert (=> b!243697 (= e!168925 (= (_1!11367 lt!379727) (withMovedBitIndex!0 (_2!11367 lt!379727) (bvsub lt!379715 lt!379723))))))

(assert (=> b!243697 (or (= (bvand lt!379715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379715 lt!379723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243697 (= lt!379723 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573))))))

(assert (=> b!243697 (= lt!379715 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))))))

(declare-fun b!243698 () Bool)

(declare-fun res!203619 () Bool)

(assert (=> b!243698 (=> (not res!203619) (not e!168925))))

(assert (=> b!243698 (= res!203619 (isPrefixOf!0 (_1!11367 lt!379727) (_2!11366 lt!379567)))))

(declare-fun b!243699 () Bool)

(declare-fun res!203618 () Bool)

(assert (=> b!243699 (=> (not res!203618) (not e!168925))))

(assert (=> b!243699 (= res!203618 (isPrefixOf!0 (_2!11367 lt!379727) (_2!11366 lt!379573)))))

(assert (= (and d!81718 c!11455) b!243695))

(assert (= (and d!81718 (not c!11455)) b!243696))

(assert (= (and d!81718 res!203617) b!243698))

(assert (= (and b!243698 res!203619) b!243699))

(assert (= (and b!243699 res!203618) b!243697))

(declare-fun m!367193 () Bool)

(assert (=> d!81718 m!367193))

(declare-fun m!367195 () Bool)

(assert (=> d!81718 m!367195))

(declare-fun m!367197 () Bool)

(assert (=> d!81718 m!367197))

(declare-fun m!367199 () Bool)

(assert (=> d!81718 m!367199))

(declare-fun m!367201 () Bool)

(assert (=> d!81718 m!367201))

(declare-fun m!367203 () Bool)

(assert (=> d!81718 m!367203))

(declare-fun m!367205 () Bool)

(assert (=> d!81718 m!367205))

(declare-fun m!367207 () Bool)

(assert (=> d!81718 m!367207))

(declare-fun m!367209 () Bool)

(assert (=> d!81718 m!367209))

(declare-fun m!367211 () Bool)

(assert (=> d!81718 m!367211))

(assert (=> d!81718 m!367047))

(assert (=> b!243695 m!367049))

(declare-fun m!367213 () Bool)

(assert (=> b!243695 m!367213))

(declare-fun m!367215 () Bool)

(assert (=> b!243695 m!367215))

(declare-fun m!367217 () Bool)

(assert (=> b!243699 m!367217))

(declare-fun m!367219 () Bool)

(assert (=> b!243698 m!367219))

(declare-fun m!367221 () Bool)

(assert (=> b!243697 m!367221))

(assert (=> b!243697 m!367065))

(assert (=> b!243697 m!367049))

(assert (=> b!243616 d!81718))

(declare-fun d!81720 () Bool)

(declare-datatypes ((tuple2!20898 0))(
  ( (tuple2!20899 (_1!11371 Bool) (_2!11371 BitStream!10632)) )
))
(declare-fun lt!379731 () tuple2!20898)

(declare-fun readBit!0 (BitStream!10632) tuple2!20898)

(assert (=> d!81720 (= lt!379731 (readBit!0 lt!379570))))

(assert (=> d!81720 (= (readBitPure!0 lt!379570) (tuple2!20887 (_2!11371 lt!379731) (_1!11371 lt!379731)))))

(declare-fun bs!20673 () Bool)

(assert (= bs!20673 d!81720))

(declare-fun m!367223 () Bool)

(assert (=> bs!20673 m!367223))

(assert (=> b!243616 d!81720))

(declare-fun d!81722 () Bool)

(declare-fun lt!379732 () tuple2!20898)

(assert (=> d!81722 (= lt!379732 (readBit!0 (_1!11367 lt!379571)))))

(assert (=> d!81722 (= (readBitPure!0 (_1!11367 lt!379571)) (tuple2!20887 (_2!11371 lt!379732) (_1!11371 lt!379732)))))

(declare-fun bs!20674 () Bool)

(assert (= bs!20674 d!81722))

(declare-fun m!367225 () Bool)

(assert (=> bs!20674 m!367225))

(assert (=> b!243616 d!81722))

(declare-fun d!81724 () Bool)

(declare-fun res!203628 () Bool)

(declare-fun e!168931 () Bool)

(assert (=> d!81724 (=> (not res!203628) (not e!168931))))

(assert (=> d!81724 (= res!203628 (= (size!5855 (buf!6324 thiss!1005)) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(assert (=> d!81724 (= (isPrefixOf!0 thiss!1005 (_2!11366 lt!379573)) e!168931)))

(declare-fun b!243706 () Bool)

(declare-fun res!203627 () Bool)

(assert (=> b!243706 (=> (not res!203627) (not e!168931))))

(assert (=> b!243706 (= res!203627 (bvsle (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)) (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573)))))))

(declare-fun b!243707 () Bool)

(declare-fun e!168932 () Bool)

(assert (=> b!243707 (= e!168931 e!168932)))

(declare-fun res!203626 () Bool)

(assert (=> b!243707 (=> res!203626 e!168932)))

(assert (=> b!243707 (= res!203626 (= (size!5855 (buf!6324 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243708 () Bool)

(assert (=> b!243708 (= e!168932 (arrayBitRangesEq!0 (buf!6324 thiss!1005) (buf!6324 (_2!11366 lt!379573)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))))))

(assert (= (and d!81724 res!203628) b!243706))

(assert (= (and b!243706 res!203627) b!243707))

(assert (= (and b!243707 (not res!203626)) b!243708))

(assert (=> b!243706 m!367051))

(assert (=> b!243706 m!367065))

(assert (=> b!243708 m!367051))

(assert (=> b!243708 m!367051))

(declare-fun m!367227 () Bool)

(assert (=> b!243708 m!367227))

(assert (=> b!243616 d!81724))

(declare-fun b!243709 () Bool)

(declare-fun e!168934 () Unit!17799)

(declare-fun lt!379735 () Unit!17799)

(assert (=> b!243709 (= e!168934 lt!379735)))

(declare-fun lt!379738 () (_ BitVec 64))

(assert (=> b!243709 (= lt!379738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!379741 () (_ BitVec 64))

(assert (=> b!243709 (= lt!379741 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(assert (=> b!243709 (= lt!379735 (arrayBitRangesEqSymmetric!0 (buf!6324 thiss!1005) (buf!6324 (_2!11366 lt!379573)) lt!379738 lt!379741))))

(assert (=> b!243709 (arrayBitRangesEq!0 (buf!6324 (_2!11366 lt!379573)) (buf!6324 thiss!1005) lt!379738 lt!379741)))

(declare-fun b!243710 () Bool)

(declare-fun Unit!17804 () Unit!17799)

(assert (=> b!243710 (= e!168934 Unit!17804)))

(declare-fun d!81726 () Bool)

(declare-fun e!168933 () Bool)

(assert (=> d!81726 e!168933))

(declare-fun res!203629 () Bool)

(assert (=> d!81726 (=> (not res!203629) (not e!168933))))

(declare-fun lt!379751 () tuple2!20890)

(assert (=> d!81726 (= res!203629 (isPrefixOf!0 (_1!11367 lt!379751) (_2!11367 lt!379751)))))

(declare-fun lt!379748 () BitStream!10632)

(assert (=> d!81726 (= lt!379751 (tuple2!20891 lt!379748 (_2!11366 lt!379573)))))

(declare-fun lt!379734 () Unit!17799)

(declare-fun lt!379742 () Unit!17799)

(assert (=> d!81726 (= lt!379734 lt!379742)))

(assert (=> d!81726 (isPrefixOf!0 lt!379748 (_2!11366 lt!379573))))

(assert (=> d!81726 (= lt!379742 (lemmaIsPrefixTransitive!0 lt!379748 (_2!11366 lt!379573) (_2!11366 lt!379573)))))

(declare-fun lt!379750 () Unit!17799)

(declare-fun lt!379743 () Unit!17799)

(assert (=> d!81726 (= lt!379750 lt!379743)))

(assert (=> d!81726 (isPrefixOf!0 lt!379748 (_2!11366 lt!379573))))

(assert (=> d!81726 (= lt!379743 (lemmaIsPrefixTransitive!0 lt!379748 thiss!1005 (_2!11366 lt!379573)))))

(declare-fun lt!379745 () Unit!17799)

(assert (=> d!81726 (= lt!379745 e!168934)))

(declare-fun c!11456 () Bool)

(assert (=> d!81726 (= c!11456 (not (= (size!5855 (buf!6324 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!379736 () Unit!17799)

(declare-fun lt!379737 () Unit!17799)

(assert (=> d!81726 (= lt!379736 lt!379737)))

(assert (=> d!81726 (isPrefixOf!0 (_2!11366 lt!379573) (_2!11366 lt!379573))))

(assert (=> d!81726 (= lt!379737 (lemmaIsPrefixRefl!0 (_2!11366 lt!379573)))))

(declare-fun lt!379746 () Unit!17799)

(declare-fun lt!379740 () Unit!17799)

(assert (=> d!81726 (= lt!379746 lt!379740)))

(assert (=> d!81726 (= lt!379740 (lemmaIsPrefixRefl!0 (_2!11366 lt!379573)))))

(declare-fun lt!379744 () Unit!17799)

(declare-fun lt!379733 () Unit!17799)

(assert (=> d!81726 (= lt!379744 lt!379733)))

(assert (=> d!81726 (isPrefixOf!0 lt!379748 lt!379748)))

(assert (=> d!81726 (= lt!379733 (lemmaIsPrefixRefl!0 lt!379748))))

(declare-fun lt!379749 () Unit!17799)

(declare-fun lt!379752 () Unit!17799)

(assert (=> d!81726 (= lt!379749 lt!379752)))

(assert (=> d!81726 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81726 (= lt!379752 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81726 (= lt!379748 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(assert (=> d!81726 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379573))))

(assert (=> d!81726 (= (reader!0 thiss!1005 (_2!11366 lt!379573)) lt!379751)))

(declare-fun lt!379747 () (_ BitVec 64))

(declare-fun b!243711 () Bool)

(declare-fun lt!379739 () (_ BitVec 64))

(assert (=> b!243711 (= e!168933 (= (_1!11367 lt!379751) (withMovedBitIndex!0 (_2!11367 lt!379751) (bvsub lt!379739 lt!379747))))))

(assert (=> b!243711 (or (= (bvand lt!379739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379739 lt!379747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243711 (= lt!379747 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573))))))

(assert (=> b!243711 (= lt!379739 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(declare-fun b!243712 () Bool)

(declare-fun res!203631 () Bool)

(assert (=> b!243712 (=> (not res!203631) (not e!168933))))

(assert (=> b!243712 (= res!203631 (isPrefixOf!0 (_1!11367 lt!379751) thiss!1005))))

(declare-fun b!243713 () Bool)

(declare-fun res!203630 () Bool)

(assert (=> b!243713 (=> (not res!203630) (not e!168933))))

(assert (=> b!243713 (= res!203630 (isPrefixOf!0 (_2!11367 lt!379751) (_2!11366 lt!379573)))))

(assert (= (and d!81726 c!11456) b!243709))

(assert (= (and d!81726 (not c!11456)) b!243710))

(assert (= (and d!81726 res!203629) b!243712))

(assert (= (and b!243712 res!203631) b!243713))

(assert (= (and b!243713 res!203630) b!243711))

(declare-fun m!367229 () Bool)

(assert (=> d!81726 m!367229))

(declare-fun m!367231 () Bool)

(assert (=> d!81726 m!367231))

(declare-fun m!367233 () Bool)

(assert (=> d!81726 m!367233))

(assert (=> d!81726 m!367199))

(declare-fun m!367235 () Bool)

(assert (=> d!81726 m!367235))

(assert (=> d!81726 m!367203))

(declare-fun m!367237 () Bool)

(assert (=> d!81726 m!367237))

(declare-fun m!367239 () Bool)

(assert (=> d!81726 m!367239))

(declare-fun m!367241 () Bool)

(assert (=> d!81726 m!367241))

(declare-fun m!367243 () Bool)

(assert (=> d!81726 m!367243))

(assert (=> d!81726 m!367095))

(assert (=> b!243709 m!367051))

(declare-fun m!367245 () Bool)

(assert (=> b!243709 m!367245))

(declare-fun m!367247 () Bool)

(assert (=> b!243709 m!367247))

(declare-fun m!367249 () Bool)

(assert (=> b!243713 m!367249))

(declare-fun m!367251 () Bool)

(assert (=> b!243712 m!367251))

(declare-fun m!367253 () Bool)

(assert (=> b!243711 m!367253))

(assert (=> b!243711 m!367065))

(assert (=> b!243711 m!367051))

(assert (=> b!243616 d!81726))

(declare-fun d!81728 () Bool)

(assert (=> d!81728 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379573))))

(declare-fun lt!379755 () Unit!17799)

(declare-fun choose!30 (BitStream!10632 BitStream!10632 BitStream!10632) Unit!17799)

(assert (=> d!81728 (= lt!379755 (choose!30 thiss!1005 (_2!11366 lt!379567) (_2!11366 lt!379573)))))

(assert (=> d!81728 (isPrefixOf!0 thiss!1005 (_2!11366 lt!379567))))

(assert (=> d!81728 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11366 lt!379567) (_2!11366 lt!379573)) lt!379755)))

(declare-fun bs!20675 () Bool)

(assert (= bs!20675 d!81728))

(assert (=> bs!20675 m!367095))

(declare-fun m!367255 () Bool)

(assert (=> bs!20675 m!367255))

(assert (=> bs!20675 m!367073))

(assert (=> b!243616 d!81728))

(declare-fun d!81730 () Bool)

(declare-fun e!168937 () Bool)

(assert (=> d!81730 e!168937))

(declare-fun res!203634 () Bool)

(assert (=> d!81730 (=> (not res!203634) (not e!168937))))

(assert (=> d!81730 (= res!203634 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!379758 () Unit!17799)

(declare-fun choose!27 (BitStream!10632 BitStream!10632 (_ BitVec 64) (_ BitVec 64)) Unit!17799)

(assert (=> d!81730 (= lt!379758 (choose!27 thiss!1005 (_2!11366 lt!379567) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81730 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11366 lt!379567) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!379758)))

(declare-fun b!243716 () Bool)

(assert (=> b!243716 (= e!168937 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81730 res!203634) b!243716))

(declare-fun m!367257 () Bool)

(assert (=> d!81730 m!367257))

(assert (=> b!243716 m!367099))

(assert (=> b!243616 d!81730))

(declare-fun d!81732 () Bool)

(assert (=> d!81732 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379761 () Unit!17799)

(declare-fun choose!9 (BitStream!10632 array!13354 (_ BitVec 64) BitStream!10632) Unit!17799)

(assert (=> d!81732 (= lt!379761 (choose!9 thiss!1005 (buf!6324 (_2!11366 lt!379573)) (bvsub nBits!297 from!289) (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))))))

(assert (=> d!81732 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6324 (_2!11366 lt!379573)) (bvsub nBits!297 from!289)) lt!379761)))

(declare-fun bs!20676 () Bool)

(assert (= bs!20676 d!81732))

(assert (=> bs!20676 m!367077))

(declare-fun m!367259 () Bool)

(assert (=> bs!20676 m!367259))

(assert (=> b!243616 d!81732))

(declare-fun d!81734 () Bool)

(declare-fun e!168938 () Bool)

(assert (=> d!81734 e!168938))

(declare-fun res!203635 () Bool)

(assert (=> d!81734 (=> (not res!203635) (not e!168938))))

(declare-fun lt!379766 () (_ BitVec 64))

(declare-fun lt!379767 () (_ BitVec 64))

(declare-fun lt!379763 () (_ BitVec 64))

(assert (=> d!81734 (= res!203635 (= lt!379766 (bvsub lt!379763 lt!379767)))))

(assert (=> d!81734 (or (= (bvand lt!379763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379763 lt!379767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81734 (= lt!379767 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379578)))) ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379578))) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379578)))))))

(declare-fun lt!379762 () (_ BitVec 64))

(declare-fun lt!379765 () (_ BitVec 64))

(assert (=> d!81734 (= lt!379763 (bvmul lt!379762 lt!379765))))

(assert (=> d!81734 (or (= lt!379762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379765 (bvsdiv (bvmul lt!379762 lt!379765) lt!379762)))))

(assert (=> d!81734 (= lt!379765 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81734 (= lt!379762 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379578)))))))

(assert (=> d!81734 (= lt!379766 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379578))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379578)))))))

(assert (=> d!81734 (invariant!0 (currentBit!11691 (_1!11365 lt!379578)) (currentByte!11696 (_1!11365 lt!379578)) (size!5855 (buf!6324 (_1!11365 lt!379578))))))

(assert (=> d!81734 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379578))) (currentByte!11696 (_1!11365 lt!379578)) (currentBit!11691 (_1!11365 lt!379578))) lt!379766)))

(declare-fun b!243717 () Bool)

(declare-fun res!203636 () Bool)

(assert (=> b!243717 (=> (not res!203636) (not e!168938))))

(assert (=> b!243717 (= res!203636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379766))))

(declare-fun b!243718 () Bool)

(declare-fun lt!379764 () (_ BitVec 64))

(assert (=> b!243718 (= e!168938 (bvsle lt!379766 (bvmul lt!379764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243718 (or (= lt!379764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379764)))))

(assert (=> b!243718 (= lt!379764 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379578)))))))

(assert (= (and d!81734 res!203635) b!243717))

(assert (= (and b!243717 res!203636) b!243718))

(declare-fun m!367261 () Bool)

(assert (=> d!81734 m!367261))

(declare-fun m!367263 () Bool)

(assert (=> d!81734 m!367263))

(assert (=> b!243616 d!81734))

(declare-fun d!81736 () Bool)

(declare-fun e!168941 () Bool)

(assert (=> d!81736 e!168941))

(declare-fun res!203639 () Bool)

(assert (=> d!81736 (=> (not res!203639) (not e!168941))))

(declare-fun lt!379779 () tuple2!20886)

(declare-fun lt!379776 () tuple2!20886)

(assert (=> d!81736 (= res!203639 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379779))) (currentByte!11696 (_1!11365 lt!379779)) (currentBit!11691 (_1!11365 lt!379779))) (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379776))) (currentByte!11696 (_1!11365 lt!379776)) (currentBit!11691 (_1!11365 lt!379776)))))))

(declare-fun lt!379777 () Unit!17799)

(declare-fun lt!379778 () BitStream!10632)

(declare-fun choose!50 (BitStream!10632 BitStream!10632 BitStream!10632 tuple2!20886 tuple2!20886 BitStream!10632 Bool tuple2!20886 tuple2!20886 BitStream!10632 Bool) Unit!17799)

(assert (=> d!81736 (= lt!379777 (choose!50 lt!379570 (_2!11366 lt!379573) lt!379778 lt!379779 (tuple2!20887 (_1!11365 lt!379779) (_2!11365 lt!379779)) (_1!11365 lt!379779) (_2!11365 lt!379779) lt!379776 (tuple2!20887 (_1!11365 lt!379776) (_2!11365 lt!379776)) (_1!11365 lt!379776) (_2!11365 lt!379776)))))

(assert (=> d!81736 (= lt!379776 (readBitPure!0 lt!379778))))

(assert (=> d!81736 (= lt!379779 (readBitPure!0 lt!379570))))

(assert (=> d!81736 (= lt!379778 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 lt!379570) (currentBit!11691 lt!379570)))))

(assert (=> d!81736 (invariant!0 (currentBit!11691 lt!379570) (currentByte!11696 lt!379570) (size!5855 (buf!6324 (_2!11366 lt!379573))))))

(assert (=> d!81736 (= (readBitPrefixLemma!0 lt!379570 (_2!11366 lt!379573)) lt!379777)))

(declare-fun b!243721 () Bool)

(assert (=> b!243721 (= e!168941 (= (_2!11365 lt!379779) (_2!11365 lt!379776)))))

(assert (= (and d!81736 res!203639) b!243721))

(declare-fun m!367265 () Bool)

(assert (=> d!81736 m!367265))

(declare-fun m!367267 () Bool)

(assert (=> d!81736 m!367267))

(declare-fun m!367269 () Bool)

(assert (=> d!81736 m!367269))

(declare-fun m!367271 () Bool)

(assert (=> d!81736 m!367271))

(declare-fun m!367273 () Bool)

(assert (=> d!81736 m!367273))

(assert (=> d!81736 m!367081))

(assert (=> b!243616 d!81736))

(declare-fun d!81738 () Bool)

(declare-fun e!168947 () Bool)

(assert (=> d!81738 e!168947))

(declare-fun res!203649 () Bool)

(assert (=> d!81738 (=> (not res!203649) (not e!168947))))

(declare-fun lt!379797 () tuple2!20888)

(assert (=> d!81738 (= res!203649 (= (size!5855 (buf!6324 (_2!11366 lt!379567))) (size!5855 (buf!6324 (_2!11366 lt!379797)))))))

(declare-fun choose!51 (BitStream!10632 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20888)

(assert (=> d!81738 (= lt!379797 (choose!51 (_2!11366 lt!379567) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81738 (= (appendNBitsLoop!0 (_2!11366 lt!379567) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!379797)))

(declare-fun b!243730 () Bool)

(declare-fun res!203651 () Bool)

(assert (=> b!243730 (=> (not res!203651) (not e!168947))))

(declare-fun lt!379801 () (_ BitVec 64))

(declare-fun lt!379803 () (_ BitVec 64))

(assert (=> b!243730 (= res!203651 (= (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379797))) (currentByte!11696 (_2!11366 lt!379797)) (currentBit!11691 (_2!11366 lt!379797))) (bvadd lt!379803 lt!379801)))))

(assert (=> b!243730 (or (not (= (bvand lt!379803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379801 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!379803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!379803 lt!379801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243730 (= lt!379801 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243730 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243730 (= lt!379803 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))))))

(declare-fun b!243732 () Bool)

(declare-fun lt!379796 () tuple2!20886)

(declare-fun lt!379798 () tuple2!20890)

(assert (=> b!243732 (= e!168947 (and (_2!11365 lt!379796) (= (_1!11365 lt!379796) (_2!11367 lt!379798))))))

(assert (=> b!243732 (= lt!379796 (checkBitsLoopPure!0 (_1!11367 lt!379798) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379799 () Unit!17799)

(declare-fun lt!379802 () Unit!17799)

(assert (=> b!243732 (= lt!379799 lt!379802)))

(declare-fun lt!379800 () (_ BitVec 64))

(assert (=> b!243732 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379797)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) lt!379800)))

(assert (=> b!243732 (= lt!379802 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11366 lt!379567) (buf!6324 (_2!11366 lt!379797)) lt!379800))))

(declare-fun e!168946 () Bool)

(assert (=> b!243732 e!168946))

(declare-fun res!203650 () Bool)

(assert (=> b!243732 (=> (not res!203650) (not e!168946))))

(assert (=> b!243732 (= res!203650 (and (= (size!5855 (buf!6324 (_2!11366 lt!379567))) (size!5855 (buf!6324 (_2!11366 lt!379797)))) (bvsge lt!379800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243732 (= lt!379800 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243732 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243732 (= lt!379798 (reader!0 (_2!11366 lt!379567) (_2!11366 lt!379797)))))

(declare-fun b!243733 () Bool)

(assert (=> b!243733 (= e!168946 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) lt!379800))))

(declare-fun b!243731 () Bool)

(declare-fun res!203648 () Bool)

(assert (=> b!243731 (=> (not res!203648) (not e!168947))))

(assert (=> b!243731 (= res!203648 (isPrefixOf!0 (_2!11366 lt!379567) (_2!11366 lt!379797)))))

(assert (= (and d!81738 res!203649) b!243730))

(assert (= (and b!243730 res!203651) b!243731))

(assert (= (and b!243731 res!203648) b!243732))

(assert (= (and b!243732 res!203650) b!243733))

(declare-fun m!367275 () Bool)

(assert (=> b!243730 m!367275))

(assert (=> b!243730 m!367049))

(declare-fun m!367277 () Bool)

(assert (=> b!243731 m!367277))

(declare-fun m!367279 () Bool)

(assert (=> b!243733 m!367279))

(declare-fun m!367281 () Bool)

(assert (=> b!243732 m!367281))

(declare-fun m!367283 () Bool)

(assert (=> b!243732 m!367283))

(declare-fun m!367285 () Bool)

(assert (=> b!243732 m!367285))

(declare-fun m!367287 () Bool)

(assert (=> b!243732 m!367287))

(declare-fun m!367289 () Bool)

(assert (=> d!81738 m!367289))

(assert (=> b!243616 d!81738))

(declare-fun d!81740 () Bool)

(assert (=> d!81740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20677 () Bool)

(assert (= bs!20677 d!81740))

(declare-fun m!367291 () Bool)

(assert (=> bs!20677 m!367291))

(assert (=> b!243616 d!81740))

(declare-fun d!81742 () Bool)

(declare-fun lt!379804 () tuple2!20898)

(assert (=> d!81742 (= lt!379804 (readBit!0 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))))))

(assert (=> d!81742 (= (readBitPure!0 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))) (tuple2!20887 (_2!11371 lt!379804) (_1!11371 lt!379804)))))

(declare-fun bs!20678 () Bool)

(assert (= bs!20678 d!81742))

(declare-fun m!367293 () Bool)

(assert (=> bs!20678 m!367293))

(assert (=> b!243616 d!81742))

(declare-fun d!81744 () Bool)

(assert (=> d!81744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20679 () Bool)

(assert (= bs!20679 d!81744))

(declare-fun m!367295 () Bool)

(assert (=> bs!20679 m!367295))

(assert (=> b!243616 d!81744))

(declare-fun d!81746 () Bool)

(assert (=> d!81746 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11367 lt!379571)))) ((_ sign_extend 32) (currentByte!11696 (_1!11367 lt!379571))) ((_ sign_extend 32) (currentBit!11691 (_1!11367 lt!379571))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11367 lt!379571)))) ((_ sign_extend 32) (currentByte!11696 (_1!11367 lt!379571))) ((_ sign_extend 32) (currentBit!11691 (_1!11367 lt!379571)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20680 () Bool)

(assert (= bs!20680 d!81746))

(declare-fun m!367297 () Bool)

(assert (=> bs!20680 m!367297))

(assert (=> b!243616 d!81746))

(declare-fun d!81748 () Bool)

(assert (=> d!81748 (= (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379573)))) (and (bvsge (currentBit!11691 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11691 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11696 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379573)))) (and (= (currentBit!11691 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379573))))))))))

(assert (=> b!243615 d!81748))

(declare-fun d!81750 () Bool)

(declare-fun res!203654 () Bool)

(declare-fun e!168948 () Bool)

(assert (=> d!81750 (=> (not res!203654) (not e!168948))))

(assert (=> d!81750 (= res!203654 (= (size!5855 (buf!6324 thiss!1005)) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(assert (=> d!81750 (= (isPrefixOf!0 thiss!1005 (_2!11366 lt!379567)) e!168948)))

(declare-fun b!243734 () Bool)

(declare-fun res!203653 () Bool)

(assert (=> b!243734 (=> (not res!203653) (not e!168948))))

(assert (=> b!243734 (= res!203653 (bvsle (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)) (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567)))))))

(declare-fun b!243735 () Bool)

(declare-fun e!168949 () Bool)

(assert (=> b!243735 (= e!168948 e!168949)))

(declare-fun res!203652 () Bool)

(assert (=> b!243735 (=> res!203652 e!168949)))

(assert (=> b!243735 (= res!203652 (= (size!5855 (buf!6324 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243736 () Bool)

(assert (=> b!243736 (= e!168949 (arrayBitRangesEq!0 (buf!6324 thiss!1005) (buf!6324 (_2!11366 lt!379567)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005))))))

(assert (= (and d!81750 res!203654) b!243734))

(assert (= (and b!243734 res!203653) b!243735))

(assert (= (and b!243735 (not res!203652)) b!243736))

(assert (=> b!243734 m!367051))

(assert (=> b!243734 m!367049))

(assert (=> b!243736 m!367051))

(assert (=> b!243736 m!367051))

(declare-fun m!367299 () Bool)

(assert (=> b!243736 m!367299))

(assert (=> b!243614 d!81750))

(declare-fun d!81752 () Bool)

(declare-fun lt!379807 () tuple2!20898)

(declare-fun checkBitsLoop!0 (BitStream!10632 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20898)

(assert (=> d!81752 (= lt!379807 (checkBitsLoop!0 (_1!11367 lt!379582) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81752 (= (checkBitsLoopPure!0 (_1!11367 lt!379582) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20887 (_2!11371 lt!379807) (_1!11371 lt!379807)))))

(declare-fun bs!20681 () Bool)

(assert (= bs!20681 d!81752))

(declare-fun m!367301 () Bool)

(assert (=> bs!20681 m!367301))

(assert (=> b!243618 d!81752))

(declare-fun d!81754 () Bool)

(assert (=> d!81754 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) lt!379581) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567)))) lt!379581))))

(declare-fun bs!20682 () Bool)

(assert (= bs!20682 d!81754))

(declare-fun m!367303 () Bool)

(assert (=> bs!20682 m!367303))

(assert (=> b!243618 d!81754))

(declare-fun d!81756 () Bool)

(assert (=> d!81756 (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567))) lt!379581)))

(declare-fun lt!379808 () Unit!17799)

(assert (=> d!81756 (= lt!379808 (choose!9 (_2!11366 lt!379567) (buf!6324 (_2!11366 lt!379573)) lt!379581 (BitStream!10633 (buf!6324 (_2!11366 lt!379573)) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567)))))))

(assert (=> d!81756 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11366 lt!379567) (buf!6324 (_2!11366 lt!379573)) lt!379581) lt!379808)))

(declare-fun bs!20683 () Bool)

(assert (= bs!20683 d!81756))

(assert (=> bs!20683 m!367055))

(declare-fun m!367305 () Bool)

(assert (=> bs!20683 m!367305))

(assert (=> b!243618 d!81756))

(assert (=> b!243618 d!81718))

(declare-fun d!81758 () Bool)

(assert (=> d!81758 (= (array_inv!5596 (buf!6324 thiss!1005)) (bvsge (size!5855 (buf!6324 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!243617 d!81758))

(declare-fun d!81760 () Bool)

(assert (=> d!81760 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 thiss!1005))))))

(declare-fun bs!20684 () Bool)

(assert (= bs!20684 d!81760))

(declare-fun m!367307 () Bool)

(assert (=> bs!20684 m!367307))

(assert (=> start!52642 d!81760))

(declare-fun d!81762 () Bool)

(declare-fun lt!379809 () tuple2!20898)

(assert (=> d!81762 (= lt!379809 (readBit!0 (readerFrom!0 (_2!11366 lt!379567) (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005))))))

(assert (=> d!81762 (= (readBitPure!0 (readerFrom!0 (_2!11366 lt!379567) (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005))) (tuple2!20887 (_2!11371 lt!379809) (_1!11371 lt!379809)))))

(declare-fun bs!20685 () Bool)

(assert (= bs!20685 d!81762))

(assert (=> bs!20685 m!367061))

(declare-fun m!367309 () Bool)

(assert (=> bs!20685 m!367309))

(assert (=> b!243621 d!81762))

(declare-fun d!81764 () Bool)

(declare-fun e!168952 () Bool)

(assert (=> d!81764 e!168952))

(declare-fun res!203658 () Bool)

(assert (=> d!81764 (=> (not res!203658) (not e!168952))))

(assert (=> d!81764 (= res!203658 (invariant!0 (currentBit!11691 (_2!11366 lt!379567)) (currentByte!11696 (_2!11366 lt!379567)) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(assert (=> d!81764 (= (readerFrom!0 (_2!11366 lt!379567) (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005)) (BitStream!10633 (buf!6324 (_2!11366 lt!379567)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)))))

(declare-fun b!243739 () Bool)

(assert (=> b!243739 (= e!168952 (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(assert (= (and d!81764 res!203658) b!243739))

(declare-fun m!367311 () Bool)

(assert (=> d!81764 m!367311))

(assert (=> b!243739 m!367067))

(assert (=> b!243621 d!81764))

(declare-fun d!81766 () Bool)

(assert (=> d!81766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20686 () Bool)

(assert (= bs!20686 d!81766))

(declare-fun m!367313 () Bool)

(assert (=> bs!20686 m!367313))

(assert (=> b!243610 d!81766))

(declare-fun d!81768 () Bool)

(assert (=> d!81768 (= (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379567)))) (and (bvsge (currentBit!11691 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11691 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11696 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379567)))) (and (= (currentBit!11691 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11696 thiss!1005) (size!5855 (buf!6324 (_2!11366 lt!379567))))))))))

(assert (=> b!243619 d!81768))

(declare-fun d!81770 () Bool)

(declare-fun e!168953 () Bool)

(assert (=> d!81770 e!168953))

(declare-fun res!203659 () Bool)

(assert (=> d!81770 (=> (not res!203659) (not e!168953))))

(declare-fun lt!379815 () (_ BitVec 64))

(declare-fun lt!379811 () (_ BitVec 64))

(declare-fun lt!379814 () (_ BitVec 64))

(assert (=> d!81770 (= res!203659 (= lt!379814 (bvsub lt!379811 lt!379815)))))

(assert (=> d!81770 (or (= (bvand lt!379811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379811 lt!379815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81770 (= lt!379815 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567)))))))

(declare-fun lt!379810 () (_ BitVec 64))

(declare-fun lt!379813 () (_ BitVec 64))

(assert (=> d!81770 (= lt!379811 (bvmul lt!379810 lt!379813))))

(assert (=> d!81770 (or (= lt!379810 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379813 (bvsdiv (bvmul lt!379810 lt!379813) lt!379810)))))

(assert (=> d!81770 (= lt!379813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81770 (= lt!379810 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(assert (=> d!81770 (= lt!379814 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379567))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379567)))))))

(assert (=> d!81770 (invariant!0 (currentBit!11691 (_2!11366 lt!379567)) (currentByte!11696 (_2!11366 lt!379567)) (size!5855 (buf!6324 (_2!11366 lt!379567))))))

(assert (=> d!81770 (= (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))) lt!379814)))

(declare-fun b!243740 () Bool)

(declare-fun res!203660 () Bool)

(assert (=> b!243740 (=> (not res!203660) (not e!168953))))

(assert (=> b!243740 (= res!203660 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379814))))

(declare-fun b!243741 () Bool)

(declare-fun lt!379812 () (_ BitVec 64))

(assert (=> b!243741 (= e!168953 (bvsle lt!379814 (bvmul lt!379812 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243741 (or (= lt!379812 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379812 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379812)))))

(assert (=> b!243741 (= lt!379812 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379567)))))))

(assert (= (and d!81770 res!203659) b!243740))

(assert (= (and b!243740 res!203660) b!243741))

(assert (=> d!81770 m!367295))

(assert (=> d!81770 m!367311))

(assert (=> b!243613 d!81770))

(declare-fun d!81772 () Bool)

(declare-fun e!168954 () Bool)

(assert (=> d!81772 e!168954))

(declare-fun res!203661 () Bool)

(assert (=> d!81772 (=> (not res!203661) (not e!168954))))

(declare-fun lt!379821 () (_ BitVec 64))

(declare-fun lt!379817 () (_ BitVec 64))

(declare-fun lt!379820 () (_ BitVec 64))

(assert (=> d!81772 (= res!203661 (= lt!379820 (bvsub lt!379817 lt!379821)))))

(assert (=> d!81772 (or (= (bvand lt!379817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379817 lt!379821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81772 (= lt!379821 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))) ((_ sign_extend 32) (currentByte!11696 thiss!1005)) ((_ sign_extend 32) (currentBit!11691 thiss!1005))))))

(declare-fun lt!379816 () (_ BitVec 64))

(declare-fun lt!379819 () (_ BitVec 64))

(assert (=> d!81772 (= lt!379817 (bvmul lt!379816 lt!379819))))

(assert (=> d!81772 (or (= lt!379816 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379819 (bvsdiv (bvmul lt!379816 lt!379819) lt!379816)))))

(assert (=> d!81772 (= lt!379819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81772 (= lt!379816 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))))))

(assert (=> d!81772 (= lt!379820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 thiss!1005))))))

(assert (=> d!81772 (invariant!0 (currentBit!11691 thiss!1005) (currentByte!11696 thiss!1005) (size!5855 (buf!6324 thiss!1005)))))

(assert (=> d!81772 (= (bitIndex!0 (size!5855 (buf!6324 thiss!1005)) (currentByte!11696 thiss!1005) (currentBit!11691 thiss!1005)) lt!379820)))

(declare-fun b!243742 () Bool)

(declare-fun res!203662 () Bool)

(assert (=> b!243742 (=> (not res!203662) (not e!168954))))

(assert (=> b!243742 (= res!203662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379820))))

(declare-fun b!243743 () Bool)

(declare-fun lt!379818 () (_ BitVec 64))

(assert (=> b!243743 (= e!168954 (bvsle lt!379820 (bvmul lt!379818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243743 (or (= lt!379818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379818)))))

(assert (=> b!243743 (= lt!379818 ((_ sign_extend 32) (size!5855 (buf!6324 thiss!1005))))))

(assert (= (and d!81772 res!203661) b!243742))

(assert (= (and b!243742 res!203662) b!243743))

(assert (=> d!81772 m!367313))

(assert (=> d!81772 m!367307))

(assert (=> b!243613 d!81772))

(declare-fun d!81774 () Bool)

(declare-fun e!168955 () Bool)

(assert (=> d!81774 e!168955))

(declare-fun res!203663 () Bool)

(assert (=> d!81774 (=> (not res!203663) (not e!168955))))

(declare-fun lt!379826 () (_ BitVec 64))

(declare-fun lt!379827 () (_ BitVec 64))

(declare-fun lt!379823 () (_ BitVec 64))

(assert (=> d!81774 (= res!203663 (= lt!379826 (bvsub lt!379823 lt!379827)))))

(assert (=> d!81774 (or (= (bvand lt!379823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379823 lt!379827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81774 (= lt!379827 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))) ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379573))) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379573)))))))

(declare-fun lt!379822 () (_ BitVec 64))

(declare-fun lt!379825 () (_ BitVec 64))

(assert (=> d!81774 (= lt!379823 (bvmul lt!379822 lt!379825))))

(assert (=> d!81774 (or (= lt!379822 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379825 (bvsdiv (bvmul lt!379822 lt!379825) lt!379822)))))

(assert (=> d!81774 (= lt!379825 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81774 (= lt!379822 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(assert (=> d!81774 (= lt!379826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 (_2!11366 lt!379573))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 (_2!11366 lt!379573)))))))

(assert (=> d!81774 (invariant!0 (currentBit!11691 (_2!11366 lt!379573)) (currentByte!11696 (_2!11366 lt!379573)) (size!5855 (buf!6324 (_2!11366 lt!379573))))))

(assert (=> d!81774 (= (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573))) lt!379826)))

(declare-fun b!243744 () Bool)

(declare-fun res!203664 () Bool)

(assert (=> b!243744 (=> (not res!203664) (not e!168955))))

(assert (=> b!243744 (= res!203664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379826))))

(declare-fun b!243745 () Bool)

(declare-fun lt!379824 () (_ BitVec 64))

(assert (=> b!243745 (= e!168955 (bvsle lt!379826 (bvmul lt!379824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243745 (or (= lt!379824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379824)))))

(assert (=> b!243745 (= lt!379824 ((_ sign_extend 32) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(assert (= (and d!81774 res!203663) b!243744))

(assert (= (and b!243744 res!203664) b!243745))

(declare-fun m!367315 () Bool)

(assert (=> d!81774 m!367315))

(declare-fun m!367317 () Bool)

(assert (=> d!81774 m!367317))

(assert (=> b!243612 d!81774))

(assert (=> b!243612 d!81770))

(declare-fun d!81776 () Bool)

(declare-fun res!203667 () Bool)

(declare-fun e!168956 () Bool)

(assert (=> d!81776 (=> (not res!203667) (not e!168956))))

(assert (=> d!81776 (= res!203667 (= (size!5855 (buf!6324 (_2!11366 lt!379567))) (size!5855 (buf!6324 (_2!11366 lt!379573)))))))

(assert (=> d!81776 (= (isPrefixOf!0 (_2!11366 lt!379567) (_2!11366 lt!379573)) e!168956)))

(declare-fun b!243746 () Bool)

(declare-fun res!203666 () Bool)

(assert (=> b!243746 (=> (not res!203666) (not e!168956))))

(assert (=> b!243746 (= res!203666 (bvsle (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567))) (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379573))) (currentByte!11696 (_2!11366 lt!379573)) (currentBit!11691 (_2!11366 lt!379573)))))))

(declare-fun b!243747 () Bool)

(declare-fun e!168957 () Bool)

(assert (=> b!243747 (= e!168956 e!168957)))

(declare-fun res!203665 () Bool)

(assert (=> b!243747 (=> res!203665 e!168957)))

(assert (=> b!243747 (= res!203665 (= (size!5855 (buf!6324 (_2!11366 lt!379567))) #b00000000000000000000000000000000))))

(declare-fun b!243748 () Bool)

(assert (=> b!243748 (= e!168957 (arrayBitRangesEq!0 (buf!6324 (_2!11366 lt!379567)) (buf!6324 (_2!11366 lt!379573)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5855 (buf!6324 (_2!11366 lt!379567))) (currentByte!11696 (_2!11366 lt!379567)) (currentBit!11691 (_2!11366 lt!379567)))))))

(assert (= (and d!81776 res!203667) b!243746))

(assert (= (and b!243746 res!203666) b!243747))

(assert (= (and b!243747 (not res!203665)) b!243748))

(assert (=> b!243746 m!367049))

(assert (=> b!243746 m!367065))

(assert (=> b!243748 m!367049))

(assert (=> b!243748 m!367049))

(declare-fun m!367319 () Bool)

(assert (=> b!243748 m!367319))

(assert (=> b!243622 d!81776))

(declare-fun d!81778 () Bool)

(declare-fun e!168958 () Bool)

(assert (=> d!81778 e!168958))

(declare-fun res!203668 () Bool)

(assert (=> d!81778 (=> (not res!203668) (not e!168958))))

(declare-fun lt!379832 () (_ BitVec 64))

(declare-fun lt!379833 () (_ BitVec 64))

(declare-fun lt!379829 () (_ BitVec 64))

(assert (=> d!81778 (= res!203668 (= lt!379832 (bvsub lt!379829 lt!379833)))))

(assert (=> d!81778 (or (= (bvand lt!379829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379829 lt!379833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81778 (= lt!379833 (remainingBits!0 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379576)))) ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379576))) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379576)))))))

(declare-fun lt!379828 () (_ BitVec 64))

(declare-fun lt!379831 () (_ BitVec 64))

(assert (=> d!81778 (= lt!379829 (bvmul lt!379828 lt!379831))))

(assert (=> d!81778 (or (= lt!379828 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379831 (bvsdiv (bvmul lt!379828 lt!379831) lt!379828)))))

(assert (=> d!81778 (= lt!379831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81778 (= lt!379828 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379576)))))))

(assert (=> d!81778 (= lt!379832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11696 (_1!11365 lt!379576))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11691 (_1!11365 lt!379576)))))))

(assert (=> d!81778 (invariant!0 (currentBit!11691 (_1!11365 lt!379576)) (currentByte!11696 (_1!11365 lt!379576)) (size!5855 (buf!6324 (_1!11365 lt!379576))))))

(assert (=> d!81778 (= (bitIndex!0 (size!5855 (buf!6324 (_1!11365 lt!379576))) (currentByte!11696 (_1!11365 lt!379576)) (currentBit!11691 (_1!11365 lt!379576))) lt!379832)))

(declare-fun b!243749 () Bool)

(declare-fun res!203669 () Bool)

(assert (=> b!243749 (=> (not res!203669) (not e!168958))))

(assert (=> b!243749 (= res!203669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379832))))

(declare-fun b!243750 () Bool)

(declare-fun lt!379830 () (_ BitVec 64))

(assert (=> b!243750 (= e!168958 (bvsle lt!379832 (bvmul lt!379830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243750 (or (= lt!379830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379830)))))

(assert (=> b!243750 (= lt!379830 ((_ sign_extend 32) (size!5855 (buf!6324 (_1!11365 lt!379576)))))))

(assert (= (and d!81778 res!203668) b!243749))

(assert (= (and b!243749 res!203669) b!243750))

(declare-fun m!367321 () Bool)

(assert (=> d!81778 m!367321))

(declare-fun m!367323 () Bool)

(assert (=> d!81778 m!367323))

(assert (=> b!243611 d!81778))

(check-sat (not b!243748) (not b!243746) (not b!243684) (not d!81772) (not b!243682) (not d!81770) (not d!81740) (not d!81728) (not d!81714) (not b!243699) (not d!81760) (not d!81738) (not d!81716) (not b!243709) (not d!81752) (not d!81734) (not b!243697) (not d!81732) (not b!243739) (not d!81742) (not b!243732) (not b!243730) (not b!243731) (not d!81730) (not d!81764) (not d!81722) (not d!81726) (not b!243681) (not b!243713) (not d!81762) (not d!81778) (not d!81744) (not b!243698) (not d!81756) (not b!243712) (not d!81766) (not d!81718) (not b!243716) (not d!81720) (not b!243736) (not d!81746) (not b!243733) (not b!243734) (not b!243711) (not d!81774) (not b!243695) (not d!81736) (not b!243706) (not b!243683) (not b!243708) (not d!81754))
(check-sat)
