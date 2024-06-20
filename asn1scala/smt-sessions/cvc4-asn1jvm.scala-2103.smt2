; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53344 () Bool)

(assert start!53344)

(declare-fun b!247656 () Bool)

(declare-fun e!171586 () Bool)

(declare-datatypes ((array!13514 0))(
  ( (array!13515 (arr!6912 (Array (_ BitVec 32) (_ BitVec 8))) (size!5925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10772 0))(
  ( (BitStream!10773 (buf!6409 array!13514) (currentByte!11822 (_ BitVec 32)) (currentBit!11817 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10772)

(declare-fun array_inv!5666 (array!13514) Bool)

(assert (=> b!247656 (= e!171586 (array_inv!5666 (buf!6409 thiss!1005)))))

(declare-fun b!247657 () Bool)

(declare-fun e!171587 () Bool)

(declare-fun e!171584 () Bool)

(assert (=> b!247657 (= e!171587 e!171584)))

(declare-fun res!207254 () Bool)

(assert (=> b!247657 (=> res!207254 e!171584)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun lt!385966 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247657 (= res!207254 (not (= lt!385966 (bvadd lt!385966 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247657 (= lt!385966 (bitIndex!0 (size!5925 (buf!6409 thiss!1005)) (currentByte!11822 thiss!1005) (currentBit!11817 thiss!1005)))))

(declare-fun res!207258 () Bool)

(declare-fun e!171583 () Bool)

(assert (=> start!53344 (=> (not res!207258) (not e!171583))))

(assert (=> start!53344 (= res!207258 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53344 e!171583))

(assert (=> start!53344 true))

(declare-fun inv!12 (BitStream!10772) Bool)

(assert (=> start!53344 (and (inv!12 thiss!1005) e!171586)))

(declare-fun b!247658 () Bool)

(assert (=> b!247658 (= e!171583 (not e!171587))))

(declare-fun res!207256 () Bool)

(assert (=> b!247658 (=> res!207256 e!171587)))

(assert (=> b!247658 (= res!207256 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10772 BitStream!10772) Bool)

(assert (=> b!247658 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17968 0))(
  ( (Unit!17969) )
))
(declare-fun lt!385967 () Unit!17968)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10772) Unit!17968)

(assert (=> b!247658 (= lt!385967 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247659 () Bool)

(assert (=> b!247659 (= e!171584 true)))

(declare-fun lt!385965 () Unit!17968)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10772 array!13514 (_ BitVec 64)) Unit!17968)

(assert (=> b!247659 (= lt!385965 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6409 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21238 0))(
  ( (tuple2!21239 (_1!11541 BitStream!10772) (_2!11541 BitStream!10772)) )
))
(declare-fun lt!385968 () tuple2!21238)

(declare-fun reader!0 (BitStream!10772 BitStream!10772) tuple2!21238)

(assert (=> b!247659 (= lt!385968 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247660 () Bool)

(declare-fun res!207257 () Bool)

(assert (=> b!247660 (=> (not res!207257) (not e!171583))))

(assert (=> b!247660 (= res!207257 (bvsge from!289 nBits!297))))

(declare-fun b!247661 () Bool)

(declare-fun res!207255 () Bool)

(assert (=> b!247661 (=> (not res!207255) (not e!171583))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247661 (= res!207255 (validate_offset_bits!1 ((_ sign_extend 32) (size!5925 (buf!6409 thiss!1005))) ((_ sign_extend 32) (currentByte!11822 thiss!1005)) ((_ sign_extend 32) (currentBit!11817 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53344 res!207258) b!247661))

(assert (= (and b!247661 res!207255) b!247660))

(assert (= (and b!247660 res!207257) b!247658))

(assert (= (and b!247658 (not res!207256)) b!247657))

(assert (= (and b!247657 (not res!207254)) b!247659))

(assert (= start!53344 b!247656))

(declare-fun m!373325 () Bool)

(assert (=> b!247658 m!373325))

(declare-fun m!373327 () Bool)

(assert (=> b!247658 m!373327))

(declare-fun m!373329 () Bool)

(assert (=> b!247656 m!373329))

(declare-fun m!373331 () Bool)

(assert (=> b!247661 m!373331))

(declare-fun m!373333 () Bool)

(assert (=> b!247659 m!373333))

(declare-fun m!373335 () Bool)

(assert (=> b!247659 m!373335))

(declare-fun m!373337 () Bool)

(assert (=> b!247657 m!373337))

(declare-fun m!373339 () Bool)

(assert (=> start!53344 m!373339))

(push 1)

(assert (not b!247657))

(assert (not start!53344))

(assert (not b!247661))

(assert (not b!247656))

(assert (not b!247658))

(assert (not b!247659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

