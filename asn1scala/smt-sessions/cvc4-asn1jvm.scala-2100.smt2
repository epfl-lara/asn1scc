; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53326 () Bool)

(assert start!53326)

(declare-fun b!247494 () Bool)

(declare-fun e!171449 () Bool)

(declare-fun e!171448 () Bool)

(assert (=> b!247494 (= e!171449 e!171448)))

(declare-fun res!207121 () Bool)

(assert (=> b!247494 (=> res!207121 e!171448)))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun lt!385877 () (_ BitVec 64))

(assert (=> b!247494 (= res!207121 (not (= lt!385877 (bvadd lt!385877 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13496 0))(
  ( (array!13497 (arr!6903 (Array (_ BitVec 32) (_ BitVec 8))) (size!5916 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10754 0))(
  ( (BitStream!10755 (buf!6400 array!13496) (currentByte!11813 (_ BitVec 32)) (currentBit!11808 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10754)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247494 (= lt!385877 (bitIndex!0 (size!5916 (buf!6400 thiss!1005)) (currentByte!11813 thiss!1005) (currentBit!11808 thiss!1005)))))

(declare-fun b!247495 () Bool)

(declare-fun res!207120 () Bool)

(declare-fun e!171452 () Bool)

(assert (=> b!247495 (=> (not res!207120) (not e!171452))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247495 (= res!207120 (validate_offset_bits!1 ((_ sign_extend 32) (size!5916 (buf!6400 thiss!1005))) ((_ sign_extend 32) (currentByte!11813 thiss!1005)) ((_ sign_extend 32) (currentBit!11808 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247496 () Bool)

(assert (=> b!247496 (= e!171448 true)))

(declare-datatypes ((tuple2!21220 0))(
  ( (tuple2!21221 (_1!11532 BitStream!10754) (_2!11532 BitStream!10754)) )
))
(declare-fun lt!385878 () tuple2!21220)

(declare-fun reader!0 (BitStream!10754 BitStream!10754) tuple2!21220)

(assert (=> b!247496 (= lt!385878 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247497 () Bool)

(declare-fun e!171450 () Bool)

(declare-fun array_inv!5657 (array!13496) Bool)

(assert (=> b!247497 (= e!171450 (array_inv!5657 (buf!6400 thiss!1005)))))

(declare-fun res!207122 () Bool)

(assert (=> start!53326 (=> (not res!207122) (not e!171452))))

(assert (=> start!53326 (= res!207122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53326 e!171452))

(assert (=> start!53326 true))

(declare-fun inv!12 (BitStream!10754) Bool)

(assert (=> start!53326 (and (inv!12 thiss!1005) e!171450)))

(declare-fun b!247498 () Bool)

(assert (=> b!247498 (= e!171452 (not e!171449))))

(declare-fun res!207119 () Bool)

(assert (=> b!247498 (=> res!207119 e!171449)))

(assert (=> b!247498 (= res!207119 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10754 BitStream!10754) Bool)

(assert (=> b!247498 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17950 0))(
  ( (Unit!17951) )
))
(declare-fun lt!385876 () Unit!17950)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10754) Unit!17950)

(assert (=> b!247498 (= lt!385876 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247499 () Bool)

(declare-fun res!207123 () Bool)

(assert (=> b!247499 (=> (not res!207123) (not e!171452))))

(assert (=> b!247499 (= res!207123 (bvsge from!289 nBits!297))))

(assert (= (and start!53326 res!207122) b!247495))

(assert (= (and b!247495 res!207120) b!247499))

(assert (= (and b!247499 res!207123) b!247498))

(assert (= (and b!247498 (not res!207119)) b!247494))

(assert (= (and b!247494 (not res!207121)) b!247496))

(assert (= start!53326 b!247497))

(declare-fun m!373195 () Bool)

(assert (=> start!53326 m!373195))

(declare-fun m!373197 () Bool)

(assert (=> b!247497 m!373197))

(declare-fun m!373199 () Bool)

(assert (=> b!247496 m!373199))

(declare-fun m!373201 () Bool)

(assert (=> b!247498 m!373201))

(declare-fun m!373203 () Bool)

(assert (=> b!247498 m!373203))

(declare-fun m!373205 () Bool)

(assert (=> b!247495 m!373205))

(declare-fun m!373207 () Bool)

(assert (=> b!247494 m!373207))

(push 1)

(assert (not start!53326))

(assert (not b!247494))

(assert (not b!247497))

(assert (not b!247496))

(assert (not b!247498))

(assert (not b!247495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

