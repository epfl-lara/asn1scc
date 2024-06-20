; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52214 () Bool)

(assert start!52214)

(declare-fun b!240414 () Bool)

(declare-fun e!166637 () Bool)

(assert (=> b!240414 (= e!166637 (not true))))

(declare-datatypes ((array!13145 0))(
  ( (array!13146 (arr!6744 (Array (_ BitVec 32) (_ BitVec 8))) (size!5757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10436 0))(
  ( (BitStream!10437 (buf!6217 array!13145) (currentByte!11571 (_ BitVec 32)) (currentBit!11566 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20394 0))(
  ( (tuple2!20395 (_1!11119 BitStream!10436) (_2!11119 BitStream!10436)) )
))
(declare-fun lt!375494 () tuple2!20394)

(declare-fun thiss!982 () BitStream!10436)

(declare-datatypes ((Unit!17615 0))(
  ( (Unit!17616) )
))
(declare-datatypes ((tuple2!20396 0))(
  ( (tuple2!20397 (_1!11120 Unit!17615) (_2!11120 BitStream!10436)) )
))
(declare-fun lt!375492 () tuple2!20396)

(declare-fun reader!0 (BitStream!10436 BitStream!10436) tuple2!20394)

(assert (=> b!240414 (= lt!375494 (reader!0 thiss!982 (_2!11120 lt!375492)))))

(declare-fun lt!375493 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10436 BitStream!10436) Bool)

(assert (=> b!240414 (= lt!375493 (isPrefixOf!0 thiss!982 (_2!11120 lt!375492)))))

(declare-fun lt!375489 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240414 (= lt!375489 (bitIndex!0 (size!5757 (buf!6217 (_2!11120 lt!375492))) (currentByte!11571 (_2!11120 lt!375492)) (currentBit!11566 (_2!11120 lt!375492))))))

(declare-fun lt!375495 () (_ BitVec 64))

(assert (=> b!240414 (= lt!375495 (bitIndex!0 (size!5757 (buf!6217 thiss!982)) (currentByte!11571 thiss!982) (currentBit!11566 thiss!982)))))

(declare-fun e!166640 () Bool)

(assert (=> b!240414 e!166640))

(declare-fun res!200703 () Bool)

(assert (=> b!240414 (=> (not res!200703) (not e!166640))))

(assert (=> b!240414 (= res!200703 (= (size!5757 (buf!6217 thiss!982)) (size!5757 (buf!6217 (_2!11120 lt!375492)))))))

(declare-fun bit!21 () Bool)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10436 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20396)

(assert (=> b!240414 (= lt!375492 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240415 () Bool)

(declare-fun res!200702 () Bool)

(assert (=> b!240415 (=> (not res!200702) (not e!166640))))

(assert (=> b!240415 (= res!200702 (isPrefixOf!0 thiss!982 (_2!11120 lt!375492)))))

(declare-fun b!240416 () Bool)

(declare-fun res!200699 () Bool)

(assert (=> b!240416 (=> (not res!200699) (not e!166640))))

(assert (=> b!240416 (= res!200699 (= (bitIndex!0 (size!5757 (buf!6217 (_2!11120 lt!375492))) (currentByte!11571 (_2!11120 lt!375492)) (currentBit!11566 (_2!11120 lt!375492))) (bvadd (bitIndex!0 (size!5757 (buf!6217 thiss!982)) (currentByte!11571 thiss!982) (currentBit!11566 thiss!982)) nBits!288)))))

(declare-fun b!240417 () Bool)

(declare-fun res!200700 () Bool)

(assert (=> b!240417 (=> (not res!200700) (not e!166637))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240417 (= res!200700 (validate_offset_bits!1 ((_ sign_extend 32) (size!5757 (buf!6217 thiss!982))) ((_ sign_extend 32) (currentByte!11571 thiss!982)) ((_ sign_extend 32) (currentBit!11566 thiss!982)) nBits!288))))

(declare-fun b!240418 () Bool)

(declare-fun e!166639 () Bool)

(declare-fun array_inv!5498 (array!13145) Bool)

(assert (=> b!240418 (= e!166639 (array_inv!5498 (buf!6217 thiss!982)))))

(declare-fun b!240419 () Bool)

(declare-datatypes ((tuple2!20398 0))(
  ( (tuple2!20399 (_1!11121 BitStream!10436) (_2!11121 Bool)) )
))
(declare-fun lt!375488 () tuple2!20398)

(declare-fun lt!375490 () tuple2!20394)

(assert (=> b!240419 (= e!166640 (not (or (not (_2!11121 lt!375488)) (not (= (_1!11121 lt!375488) (_2!11119 lt!375490))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10436 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20398)

(assert (=> b!240419 (= lt!375488 (checkBitsLoopPure!0 (_1!11119 lt!375490) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240419 (validate_offset_bits!1 ((_ sign_extend 32) (size!5757 (buf!6217 (_2!11120 lt!375492)))) ((_ sign_extend 32) (currentByte!11571 thiss!982)) ((_ sign_extend 32) (currentBit!11566 thiss!982)) nBits!288)))

(declare-fun lt!375491 () Unit!17615)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10436 array!13145 (_ BitVec 64)) Unit!17615)

(assert (=> b!240419 (= lt!375491 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6217 (_2!11120 lt!375492)) nBits!288))))

(assert (=> b!240419 (= lt!375490 (reader!0 thiss!982 (_2!11120 lt!375492)))))

(declare-fun res!200701 () Bool)

(assert (=> start!52214 (=> (not res!200701) (not e!166637))))

(assert (=> start!52214 (= res!200701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52214 e!166637))

(assert (=> start!52214 true))

(declare-fun inv!12 (BitStream!10436) Bool)

(assert (=> start!52214 (and (inv!12 thiss!982) e!166639)))

(assert (= (and start!52214 res!200701) b!240417))

(assert (= (and b!240417 res!200700) b!240414))

(assert (= (and b!240414 res!200703) b!240416))

(assert (= (and b!240416 res!200699) b!240415))

(assert (= (and b!240415 res!200702) b!240419))

(assert (= start!52214 b!240418))

(declare-fun m!362903 () Bool)

(assert (=> b!240414 m!362903))

(declare-fun m!362905 () Bool)

(assert (=> b!240414 m!362905))

(declare-fun m!362907 () Bool)

(assert (=> b!240414 m!362907))

(declare-fun m!362909 () Bool)

(assert (=> b!240414 m!362909))

(declare-fun m!362911 () Bool)

(assert (=> b!240414 m!362911))

(declare-fun m!362913 () Bool)

(assert (=> b!240419 m!362913))

(declare-fun m!362915 () Bool)

(assert (=> b!240419 m!362915))

(declare-fun m!362917 () Bool)

(assert (=> b!240419 m!362917))

(assert (=> b!240419 m!362905))

(assert (=> b!240415 m!362911))

(declare-fun m!362919 () Bool)

(assert (=> start!52214 m!362919))

(assert (=> b!240416 m!362907))

(assert (=> b!240416 m!362903))

(declare-fun m!362921 () Bool)

(assert (=> b!240418 m!362921))

(declare-fun m!362923 () Bool)

(assert (=> b!240417 m!362923))

(push 1)

