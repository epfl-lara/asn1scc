; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53328 () Bool)

(assert start!53328)

(declare-fun b!247512 () Bool)

(declare-fun e!171463 () Bool)

(declare-fun e!171466 () Bool)

(assert (=> b!247512 (= e!171463 e!171466)))

(declare-fun res!207135 () Bool)

(assert (=> b!247512 (=> res!207135 e!171466)))

(declare-fun lt!385887 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247512 (= res!207135 (not (= lt!385887 (bvadd lt!385887 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13498 0))(
  ( (array!13499 (arr!6904 (Array (_ BitVec 32) (_ BitVec 8))) (size!5917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10756 0))(
  ( (BitStream!10757 (buf!6401 array!13498) (currentByte!11814 (_ BitVec 32)) (currentBit!11809 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10756)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247512 (= lt!385887 (bitIndex!0 (size!5917 (buf!6401 thiss!1005)) (currentByte!11814 thiss!1005) (currentBit!11809 thiss!1005)))))

(declare-fun b!247513 () Bool)

(declare-fun res!207136 () Bool)

(declare-fun e!171465 () Bool)

(assert (=> b!247513 (=> (not res!207136) (not e!171465))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247513 (= res!207136 (validate_offset_bits!1 ((_ sign_extend 32) (size!5917 (buf!6401 thiss!1005))) ((_ sign_extend 32) (currentByte!11814 thiss!1005)) ((_ sign_extend 32) (currentBit!11809 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247514 () Bool)

(assert (=> b!247514 (= e!171465 (not e!171463))))

(declare-fun res!207134 () Bool)

(assert (=> b!247514 (=> res!207134 e!171463)))

(assert (=> b!247514 (= res!207134 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10756 BitStream!10756) Bool)

(assert (=> b!247514 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17952 0))(
  ( (Unit!17953) )
))
(declare-fun lt!385885 () Unit!17952)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10756) Unit!17952)

(assert (=> b!247514 (= lt!385885 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247515 () Bool)

(declare-fun res!207138 () Bool)

(assert (=> b!247515 (=> (not res!207138) (not e!171465))))

(assert (=> b!247515 (= res!207138 (bvsge from!289 nBits!297))))

(declare-fun res!207137 () Bool)

(assert (=> start!53328 (=> (not res!207137) (not e!171465))))

(assert (=> start!53328 (= res!207137 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53328 e!171465))

(assert (=> start!53328 true))

(declare-fun e!171467 () Bool)

(declare-fun inv!12 (BitStream!10756) Bool)

(assert (=> start!53328 (and (inv!12 thiss!1005) e!171467)))

(declare-fun b!247516 () Bool)

(declare-fun array_inv!5658 (array!13498) Bool)

(assert (=> b!247516 (= e!171467 (array_inv!5658 (buf!6401 thiss!1005)))))

(declare-fun b!247517 () Bool)

(assert (=> b!247517 (= e!171466 true)))

(declare-datatypes ((tuple2!21222 0))(
  ( (tuple2!21223 (_1!11533 BitStream!10756) (_2!11533 BitStream!10756)) )
))
(declare-fun lt!385886 () tuple2!21222)

(declare-fun reader!0 (BitStream!10756 BitStream!10756) tuple2!21222)

(assert (=> b!247517 (= lt!385886 (reader!0 thiss!1005 thiss!1005))))

(assert (= (and start!53328 res!207137) b!247513))

(assert (= (and b!247513 res!207136) b!247515))

(assert (= (and b!247515 res!207138) b!247514))

(assert (= (and b!247514 (not res!207134)) b!247512))

(assert (= (and b!247512 (not res!207135)) b!247517))

(assert (= start!53328 b!247516))

(declare-fun m!373209 () Bool)

(assert (=> b!247514 m!373209))

(declare-fun m!373211 () Bool)

(assert (=> b!247514 m!373211))

(declare-fun m!373213 () Bool)

(assert (=> b!247513 m!373213))

(declare-fun m!373215 () Bool)

(assert (=> b!247517 m!373215))

(declare-fun m!373217 () Bool)

(assert (=> b!247512 m!373217))

(declare-fun m!373219 () Bool)

(assert (=> start!53328 m!373219))

(declare-fun m!373221 () Bool)

(assert (=> b!247516 m!373221))

(push 1)

(assert (not b!247514))

(assert (not b!247512))

(assert (not b!247516))

(assert (not b!247513))

(assert (not b!247517))

(assert (not start!53328))

(check-sat)

(pop 1)

