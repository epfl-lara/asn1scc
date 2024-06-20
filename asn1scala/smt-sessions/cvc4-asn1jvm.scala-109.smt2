; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2700 () Bool)

(assert start!2700)

(declare-fun b!13102 () Bool)

(declare-fun res!12456 () Bool)

(declare-fun e!7951 () Bool)

(assert (=> b!13102 (=> (not res!12456) (not e!7951))))

(declare-datatypes ((array!715 0))(
  ( (array!716 (arr!741 (Array (_ BitVec 32) (_ BitVec 8))) (size!312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!584 0))(
  ( (BitStream!585 (buf!663 array!715) (currentByte!1747 (_ BitVec 32)) (currentBit!1742 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!584)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13102 (= res!12456 (validate_offset_bits!1 ((_ sign_extend 32) (size!312 (buf!663 thiss!1486))) ((_ sign_extend 32) (currentByte!1747 thiss!1486)) ((_ sign_extend 32) (currentBit!1742 thiss!1486)) nBits!460))))

(declare-fun b!13103 () Bool)

(declare-fun res!12457 () Bool)

(declare-fun e!7954 () Bool)

(assert (=> b!13103 (=> (not res!12457) (not e!7954))))

(declare-datatypes ((Unit!1107 0))(
  ( (Unit!1108) )
))
(declare-datatypes ((tuple2!1558 0))(
  ( (tuple2!1559 (_1!834 Unit!1107) (_2!834 BitStream!584)) )
))
(declare-fun lt!20831 () tuple2!1558)

(declare-fun isPrefixOf!0 (BitStream!584 BitStream!584) Bool)

(assert (=> b!13103 (= res!12457 (isPrefixOf!0 thiss!1486 (_2!834 lt!20831)))))

(declare-fun b!13104 () Bool)

(declare-fun res!12459 () Bool)

(declare-fun e!7953 () Bool)

(assert (=> b!13104 (=> res!12459 e!7953)))

(declare-datatypes ((List!188 0))(
  ( (Nil!185) (Cons!184 (h!303 Bool) (t!938 List!188)) )
))
(declare-fun lt!20829 () List!188)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!715)

(declare-fun byteArrayBitContentToList!0 (BitStream!584 array!715 (_ BitVec 64) (_ BitVec 64)) List!188)

(assert (=> b!13104 (= res!12459 (not (= lt!20829 (byteArrayBitContentToList!0 (_2!834 lt!20831) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!13106 () Bool)

(declare-fun res!12458 () Bool)

(assert (=> b!13106 (=> (not res!12458) (not e!7954))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13106 (= res!12458 (= (bitIndex!0 (size!312 (buf!663 (_2!834 lt!20831))) (currentByte!1747 (_2!834 lt!20831)) (currentBit!1742 (_2!834 lt!20831))) (bvadd (bitIndex!0 (size!312 (buf!663 thiss!1486)) (currentByte!1747 thiss!1486) (currentBit!1742 thiss!1486)) nBits!460)))))

(declare-fun b!13107 () Bool)

(assert (=> b!13107 (= e!7954 (not e!7953))))

(declare-fun res!12460 () Bool)

(assert (=> b!13107 (=> res!12460 e!7953)))

(declare-datatypes ((tuple2!1560 0))(
  ( (tuple2!1561 (_1!835 array!715) (_2!835 BitStream!584)) )
))
(declare-fun lt!20830 () tuple2!1560)

(assert (=> b!13107 (= res!12460 (not (= (byteArrayBitContentToList!0 (_2!834 lt!20831) (_1!835 lt!20830) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20829)))))

(declare-datatypes ((tuple2!1562 0))(
  ( (tuple2!1563 (_1!836 BitStream!584) (_2!836 BitStream!584)) )
))
(declare-fun lt!20833 () tuple2!1562)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!584 BitStream!584 (_ BitVec 64)) List!188)

(assert (=> b!13107 (= lt!20829 (bitStreamReadBitsIntoList!0 (_2!834 lt!20831) (_1!836 lt!20833) nBits!460))))

(declare-fun readBits!0 (BitStream!584 (_ BitVec 64)) tuple2!1560)

(assert (=> b!13107 (= lt!20830 (readBits!0 (_1!836 lt!20833) nBits!460))))

(assert (=> b!13107 (validate_offset_bits!1 ((_ sign_extend 32) (size!312 (buf!663 (_2!834 lt!20831)))) ((_ sign_extend 32) (currentByte!1747 thiss!1486)) ((_ sign_extend 32) (currentBit!1742 thiss!1486)) nBits!460)))

(declare-fun lt!20834 () Unit!1107)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!584 array!715 (_ BitVec 64)) Unit!1107)

(assert (=> b!13107 (= lt!20834 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!663 (_2!834 lt!20831)) nBits!460))))

(declare-fun reader!0 (BitStream!584 BitStream!584) tuple2!1562)

(assert (=> b!13107 (= lt!20833 (reader!0 thiss!1486 (_2!834 lt!20831)))))

(declare-fun b!13108 () Bool)

(assert (=> b!13108 (= e!7953 true)))

(declare-fun lt!20832 () Unit!1107)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!584 array!715 array!715 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1107)

(assert (=> b!13108 (= lt!20832 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!834 lt!20831) srcBuffer!6 (_1!835 lt!20830) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!13109 () Bool)

(assert (=> b!13109 (= e!7951 e!7954)))

(declare-fun res!12462 () Bool)

(assert (=> b!13109 (=> (not res!12462) (not e!7954))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13109 (= res!12462 (invariant!0 (currentBit!1742 (_2!834 lt!20831)) (currentByte!1747 (_2!834 lt!20831)) (size!312 (buf!663 (_2!834 lt!20831)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!584 array!715 (_ BitVec 64) (_ BitVec 64)) tuple2!1558)

(assert (=> b!13109 (= lt!20831 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!13110 () Bool)

(declare-fun res!12463 () Bool)

(assert (=> b!13110 (=> (not res!12463) (not e!7954))))

(assert (=> b!13110 (= res!12463 (= (size!312 (buf!663 thiss!1486)) (size!312 (buf!663 (_2!834 lt!20831)))))))

(declare-fun b!13105 () Bool)

(declare-fun e!7955 () Bool)

(declare-fun array_inv!301 (array!715) Bool)

(assert (=> b!13105 (= e!7955 (array_inv!301 (buf!663 thiss!1486)))))

(declare-fun res!12461 () Bool)

(assert (=> start!2700 (=> (not res!12461) (not e!7951))))

(assert (=> start!2700 (= res!12461 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!312 srcBuffer!6))))))))

(assert (=> start!2700 e!7951))

(assert (=> start!2700 true))

(assert (=> start!2700 (array_inv!301 srcBuffer!6)))

(declare-fun inv!12 (BitStream!584) Bool)

(assert (=> start!2700 (and (inv!12 thiss!1486) e!7955)))

(assert (= (and start!2700 res!12461) b!13102))

(assert (= (and b!13102 res!12456) b!13109))

(assert (= (and b!13109 res!12462) b!13110))

(assert (= (and b!13110 res!12463) b!13106))

(assert (= (and b!13106 res!12458) b!13103))

(assert (= (and b!13103 res!12457) b!13107))

(assert (= (and b!13107 (not res!12460)) b!13104))

(assert (= (and b!13104 (not res!12459)) b!13108))

(assert (= start!2700 b!13105))

(declare-fun m!19729 () Bool)

(assert (=> b!13107 m!19729))

(declare-fun m!19731 () Bool)

(assert (=> b!13107 m!19731))

(declare-fun m!19733 () Bool)

(assert (=> b!13107 m!19733))

(declare-fun m!19735 () Bool)

(assert (=> b!13107 m!19735))

(declare-fun m!19737 () Bool)

(assert (=> b!13107 m!19737))

(declare-fun m!19739 () Bool)

(assert (=> b!13107 m!19739))

(declare-fun m!19741 () Bool)

(assert (=> b!13105 m!19741))

(declare-fun m!19743 () Bool)

(assert (=> b!13103 m!19743))

(declare-fun m!19745 () Bool)

(assert (=> b!13102 m!19745))

(declare-fun m!19747 () Bool)

(assert (=> b!13108 m!19747))

(declare-fun m!19749 () Bool)

(assert (=> start!2700 m!19749))

(declare-fun m!19751 () Bool)

(assert (=> start!2700 m!19751))

(declare-fun m!19753 () Bool)

(assert (=> b!13104 m!19753))

(declare-fun m!19755 () Bool)

(assert (=> b!13109 m!19755))

(declare-fun m!19757 () Bool)

(assert (=> b!13109 m!19757))

(declare-fun m!19759 () Bool)

(assert (=> b!13106 m!19759))

(declare-fun m!19761 () Bool)

(assert (=> b!13106 m!19761))

(push 1)

(assert (not b!13107))

(assert (not b!13108))

(assert (not b!13106))

(assert (not start!2700))

(assert (not b!13104))

(assert (not b!13109))

(assert (not b!13102))

(assert (not b!13103))

(assert (not b!13105))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

