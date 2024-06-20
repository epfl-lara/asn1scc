; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2676 () Bool)

(assert start!2676)

(declare-fun b!12778 () Bool)

(declare-fun res!12174 () Bool)

(declare-fun e!7738 () Bool)

(assert (=> b!12778 (=> res!12174 e!7738)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!176 0))(
  ( (Nil!173) (Cons!172 (h!291 Bool) (t!926 List!176)) )
))
(declare-fun lt!20617 () List!176)

(declare-datatypes ((array!691 0))(
  ( (array!692 (arr!729 (Array (_ BitVec 32) (_ BitVec 8))) (size!300 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!691)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!560 0))(
  ( (BitStream!561 (buf!651 array!691) (currentByte!1735 (_ BitVec 32)) (currentBit!1730 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1083 0))(
  ( (Unit!1084) )
))
(declare-datatypes ((tuple2!1486 0))(
  ( (tuple2!1487 (_1!798 Unit!1083) (_2!798 BitStream!560)) )
))
(declare-fun lt!20613 () tuple2!1486)

(declare-fun byteArrayBitContentToList!0 (BitStream!560 array!691 (_ BitVec 64) (_ BitVec 64)) List!176)

(assert (=> b!12778 (= res!12174 (not (= lt!20617 (byteArrayBitContentToList!0 (_2!798 lt!20613) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12780 () Bool)

(assert (=> b!12780 (= e!7738 true)))

(declare-fun lt!20618 () Unit!1083)

(declare-datatypes ((tuple2!1488 0))(
  ( (tuple2!1489 (_1!799 array!691) (_2!799 BitStream!560)) )
))
(declare-fun lt!20616 () tuple2!1488)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!560 array!691 array!691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1083)

(assert (=> b!12780 (= lt!20618 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!798 lt!20613) srcBuffer!6 (_1!799 lt!20616) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12781 () Bool)

(declare-fun res!12175 () Bool)

(declare-fun e!7737 () Bool)

(assert (=> b!12781 (=> (not res!12175) (not e!7737))))

(declare-fun thiss!1486 () BitStream!560)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12781 (= res!12175 (validate_offset_bits!1 ((_ sign_extend 32) (size!300 (buf!651 thiss!1486))) ((_ sign_extend 32) (currentByte!1735 thiss!1486)) ((_ sign_extend 32) (currentBit!1730 thiss!1486)) nBits!460))))

(declare-fun b!12782 () Bool)

(declare-fun e!7734 () Bool)

(assert (=> b!12782 (= e!7737 e!7734)))

(declare-fun res!12173 () Bool)

(assert (=> b!12782 (=> (not res!12173) (not e!7734))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12782 (= res!12173 (invariant!0 (currentBit!1730 (_2!798 lt!20613)) (currentByte!1735 (_2!798 lt!20613)) (size!300 (buf!651 (_2!798 lt!20613)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!560 array!691 (_ BitVec 64) (_ BitVec 64)) tuple2!1486)

(assert (=> b!12782 (= lt!20613 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12783 () Bool)

(assert (=> b!12783 (= e!7734 (not e!7738))))

(declare-fun res!12171 () Bool)

(assert (=> b!12783 (=> res!12171 e!7738)))

(assert (=> b!12783 (= res!12171 (not (= (byteArrayBitContentToList!0 (_2!798 lt!20613) (_1!799 lt!20616) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20617)))))

(declare-datatypes ((tuple2!1490 0))(
  ( (tuple2!1491 (_1!800 BitStream!560) (_2!800 BitStream!560)) )
))
(declare-fun lt!20615 () tuple2!1490)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!560 BitStream!560 (_ BitVec 64)) List!176)

(assert (=> b!12783 (= lt!20617 (bitStreamReadBitsIntoList!0 (_2!798 lt!20613) (_1!800 lt!20615) nBits!460))))

(declare-fun readBits!0 (BitStream!560 (_ BitVec 64)) tuple2!1488)

(assert (=> b!12783 (= lt!20616 (readBits!0 (_1!800 lt!20615) nBits!460))))

(assert (=> b!12783 (validate_offset_bits!1 ((_ sign_extend 32) (size!300 (buf!651 (_2!798 lt!20613)))) ((_ sign_extend 32) (currentByte!1735 thiss!1486)) ((_ sign_extend 32) (currentBit!1730 thiss!1486)) nBits!460)))

(declare-fun lt!20614 () Unit!1083)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!560 array!691 (_ BitVec 64)) Unit!1083)

(assert (=> b!12783 (= lt!20614 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!651 (_2!798 lt!20613)) nBits!460))))

(declare-fun reader!0 (BitStream!560 BitStream!560) tuple2!1490)

(assert (=> b!12783 (= lt!20615 (reader!0 thiss!1486 (_2!798 lt!20613)))))

(declare-fun b!12784 () Bool)

(declare-fun res!12169 () Bool)

(assert (=> b!12784 (=> (not res!12169) (not e!7734))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12784 (= res!12169 (= (bitIndex!0 (size!300 (buf!651 (_2!798 lt!20613))) (currentByte!1735 (_2!798 lt!20613)) (currentBit!1730 (_2!798 lt!20613))) (bvadd (bitIndex!0 (size!300 (buf!651 thiss!1486)) (currentByte!1735 thiss!1486) (currentBit!1730 thiss!1486)) nBits!460)))))

(declare-fun b!12779 () Bool)

(declare-fun e!7736 () Bool)

(declare-fun array_inv!289 (array!691) Bool)

(assert (=> b!12779 (= e!7736 (array_inv!289 (buf!651 thiss!1486)))))

(declare-fun res!12170 () Bool)

(assert (=> start!2676 (=> (not res!12170) (not e!7737))))

(assert (=> start!2676 (= res!12170 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!300 srcBuffer!6))))))))

(assert (=> start!2676 e!7737))

(assert (=> start!2676 true))

(assert (=> start!2676 (array_inv!289 srcBuffer!6)))

(declare-fun inv!12 (BitStream!560) Bool)

(assert (=> start!2676 (and (inv!12 thiss!1486) e!7736)))

(declare-fun b!12785 () Bool)

(declare-fun res!12168 () Bool)

(assert (=> b!12785 (=> (not res!12168) (not e!7734))))

(assert (=> b!12785 (= res!12168 (= (size!300 (buf!651 thiss!1486)) (size!300 (buf!651 (_2!798 lt!20613)))))))

(declare-fun b!12786 () Bool)

(declare-fun res!12172 () Bool)

(assert (=> b!12786 (=> (not res!12172) (not e!7734))))

(declare-fun isPrefixOf!0 (BitStream!560 BitStream!560) Bool)

(assert (=> b!12786 (= res!12172 (isPrefixOf!0 thiss!1486 (_2!798 lt!20613)))))

(assert (= (and start!2676 res!12170) b!12781))

(assert (= (and b!12781 res!12175) b!12782))

(assert (= (and b!12782 res!12173) b!12785))

(assert (= (and b!12785 res!12168) b!12784))

(assert (= (and b!12784 res!12169) b!12786))

(assert (= (and b!12786 res!12172) b!12783))

(assert (= (and b!12783 (not res!12171)) b!12778))

(assert (= (and b!12778 (not res!12174)) b!12780))

(assert (= start!2676 b!12779))

(declare-fun m!19321 () Bool)

(assert (=> b!12782 m!19321))

(declare-fun m!19323 () Bool)

(assert (=> b!12782 m!19323))

(declare-fun m!19325 () Bool)

(assert (=> b!12778 m!19325))

(declare-fun m!19327 () Bool)

(assert (=> b!12784 m!19327))

(declare-fun m!19329 () Bool)

(assert (=> b!12784 m!19329))

(declare-fun m!19331 () Bool)

(assert (=> b!12786 m!19331))

(declare-fun m!19333 () Bool)

(assert (=> b!12781 m!19333))

(declare-fun m!19335 () Bool)

(assert (=> start!2676 m!19335))

(declare-fun m!19337 () Bool)

(assert (=> start!2676 m!19337))

(declare-fun m!19339 () Bool)

(assert (=> b!12783 m!19339))

(declare-fun m!19341 () Bool)

(assert (=> b!12783 m!19341))

(declare-fun m!19343 () Bool)

(assert (=> b!12783 m!19343))

(declare-fun m!19345 () Bool)

(assert (=> b!12783 m!19345))

(declare-fun m!19347 () Bool)

(assert (=> b!12783 m!19347))

(declare-fun m!19349 () Bool)

(assert (=> b!12783 m!19349))

(declare-fun m!19351 () Bool)

(assert (=> b!12779 m!19351))

(declare-fun m!19353 () Bool)

(assert (=> b!12780 m!19353))

(push 1)

(assert (not b!12779))

(assert (not b!12781))

(assert (not b!12783))

(assert (not b!12784))

(assert (not start!2676))

(assert (not b!12782))

(assert (not b!12778))

(assert (not b!12780))

(assert (not b!12786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

