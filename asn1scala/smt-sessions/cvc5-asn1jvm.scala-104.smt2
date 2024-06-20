; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2666 () Bool)

(assert start!2666)

(declare-fun b!12643 () Bool)

(declare-fun e!7648 () Bool)

(declare-fun e!7645 () Bool)

(assert (=> b!12643 (= e!7648 (not e!7645))))

(declare-fun res!12051 () Bool)

(assert (=> b!12643 (=> res!12051 e!7645)))

(declare-datatypes ((List!171 0))(
  ( (Nil!168) (Cons!167 (h!286 Bool) (t!921 List!171)) )
))
(declare-fun lt!20526 () List!171)

(declare-datatypes ((array!681 0))(
  ( (array!682 (arr!724 (Array (_ BitVec 32) (_ BitVec 8))) (size!295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!550 0))(
  ( (BitStream!551 (buf!646 array!681) (currentByte!1730 (_ BitVec 32)) (currentBit!1725 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1073 0))(
  ( (Unit!1074) )
))
(declare-datatypes ((tuple2!1456 0))(
  ( (tuple2!1457 (_1!783 Unit!1073) (_2!783 BitStream!550)) )
))
(declare-fun lt!20525 () tuple2!1456)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((tuple2!1458 0))(
  ( (tuple2!1459 (_1!784 array!681) (_2!784 BitStream!550)) )
))
(declare-fun lt!20524 () tuple2!1458)

(declare-fun byteArrayBitContentToList!0 (BitStream!550 array!681 (_ BitVec 64) (_ BitVec 64)) List!171)

(assert (=> b!12643 (= res!12051 (not (= (byteArrayBitContentToList!0 (_2!783 lt!20525) (_1!784 lt!20524) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20526)))))

(declare-datatypes ((tuple2!1460 0))(
  ( (tuple2!1461 (_1!785 BitStream!550) (_2!785 BitStream!550)) )
))
(declare-fun lt!20527 () tuple2!1460)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!550 BitStream!550 (_ BitVec 64)) List!171)

(assert (=> b!12643 (= lt!20526 (bitStreamReadBitsIntoList!0 (_2!783 lt!20525) (_1!785 lt!20527) nBits!460))))

(declare-fun readBits!0 (BitStream!550 (_ BitVec 64)) tuple2!1458)

(assert (=> b!12643 (= lt!20524 (readBits!0 (_1!785 lt!20527) nBits!460))))

(declare-fun thiss!1486 () BitStream!550)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12643 (validate_offset_bits!1 ((_ sign_extend 32) (size!295 (buf!646 (_2!783 lt!20525)))) ((_ sign_extend 32) (currentByte!1730 thiss!1486)) ((_ sign_extend 32) (currentBit!1725 thiss!1486)) nBits!460)))

(declare-fun lt!20523 () Unit!1073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!550 array!681 (_ BitVec 64)) Unit!1073)

(assert (=> b!12643 (= lt!20523 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!646 (_2!783 lt!20525)) nBits!460))))

(declare-fun reader!0 (BitStream!550 BitStream!550) tuple2!1460)

(assert (=> b!12643 (= lt!20527 (reader!0 thiss!1486 (_2!783 lt!20525)))))

(declare-fun b!12644 () Bool)

(declare-fun res!12049 () Bool)

(assert (=> b!12644 (=> (not res!12049) (not e!7648))))

(assert (=> b!12644 (= res!12049 (= (size!295 (buf!646 thiss!1486)) (size!295 (buf!646 (_2!783 lt!20525)))))))

(declare-fun b!12645 () Bool)

(declare-fun res!12055 () Bool)

(declare-fun e!7644 () Bool)

(assert (=> b!12645 (=> (not res!12055) (not e!7644))))

(assert (=> b!12645 (= res!12055 (validate_offset_bits!1 ((_ sign_extend 32) (size!295 (buf!646 thiss!1486))) ((_ sign_extend 32) (currentByte!1730 thiss!1486)) ((_ sign_extend 32) (currentBit!1725 thiss!1486)) nBits!460))))

(declare-fun b!12646 () Bool)

(declare-fun res!12048 () Bool)

(assert (=> b!12646 (=> (not res!12048) (not e!7648))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12646 (= res!12048 (= (bitIndex!0 (size!295 (buf!646 (_2!783 lt!20525))) (currentByte!1730 (_2!783 lt!20525)) (currentBit!1725 (_2!783 lt!20525))) (bvadd (bitIndex!0 (size!295 (buf!646 thiss!1486)) (currentByte!1730 thiss!1486) (currentBit!1725 thiss!1486)) nBits!460)))))

(declare-fun b!12647 () Bool)

(assert (=> b!12647 (= e!7645 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!20528 () Unit!1073)

(declare-fun srcBuffer!6 () array!681)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!550 array!681 array!681 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1073)

(assert (=> b!12647 (= lt!20528 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!783 lt!20525) srcBuffer!6 (_1!784 lt!20524) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12648 () Bool)

(declare-fun res!12050 () Bool)

(assert (=> b!12648 (=> res!12050 e!7645)))

(assert (=> b!12648 (= res!12050 (not (= lt!20526 (byteArrayBitContentToList!0 (_2!783 lt!20525) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12649 () Bool)

(declare-fun e!7646 () Bool)

(declare-fun array_inv!284 (array!681) Bool)

(assert (=> b!12649 (= e!7646 (array_inv!284 (buf!646 thiss!1486)))))

(declare-fun b!12651 () Bool)

(assert (=> b!12651 (= e!7644 e!7648)))

(declare-fun res!12054 () Bool)

(assert (=> b!12651 (=> (not res!12054) (not e!7648))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12651 (= res!12054 (invariant!0 (currentBit!1725 (_2!783 lt!20525)) (currentByte!1730 (_2!783 lt!20525)) (size!295 (buf!646 (_2!783 lt!20525)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!550 array!681 (_ BitVec 64) (_ BitVec 64)) tuple2!1456)

(assert (=> b!12651 (= lt!20525 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!12052 () Bool)

(assert (=> start!2666 (=> (not res!12052) (not e!7644))))

(assert (=> start!2666 (= res!12052 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!295 srcBuffer!6))))))))

(assert (=> start!2666 e!7644))

(assert (=> start!2666 true))

(assert (=> start!2666 (array_inv!284 srcBuffer!6)))

(declare-fun inv!12 (BitStream!550) Bool)

(assert (=> start!2666 (and (inv!12 thiss!1486) e!7646)))

(declare-fun b!12650 () Bool)

(declare-fun res!12053 () Bool)

(assert (=> b!12650 (=> (not res!12053) (not e!7648))))

(declare-fun isPrefixOf!0 (BitStream!550 BitStream!550) Bool)

(assert (=> b!12650 (= res!12053 (isPrefixOf!0 thiss!1486 (_2!783 lt!20525)))))

(assert (= (and start!2666 res!12052) b!12645))

(assert (= (and b!12645 res!12055) b!12651))

(assert (= (and b!12651 res!12054) b!12644))

(assert (= (and b!12644 res!12049) b!12646))

(assert (= (and b!12646 res!12048) b!12650))

(assert (= (and b!12650 res!12053) b!12643))

(assert (= (and b!12643 (not res!12051)) b!12648))

(assert (= (and b!12648 (not res!12050)) b!12647))

(assert (= start!2666 b!12649))

(declare-fun m!19151 () Bool)

(assert (=> b!12649 m!19151))

(declare-fun m!19153 () Bool)

(assert (=> b!12650 m!19153))

(declare-fun m!19155 () Bool)

(assert (=> b!12648 m!19155))

(declare-fun m!19157 () Bool)

(assert (=> start!2666 m!19157))

(declare-fun m!19159 () Bool)

(assert (=> start!2666 m!19159))

(declare-fun m!19161 () Bool)

(assert (=> b!12643 m!19161))

(declare-fun m!19163 () Bool)

(assert (=> b!12643 m!19163))

(declare-fun m!19165 () Bool)

(assert (=> b!12643 m!19165))

(declare-fun m!19167 () Bool)

(assert (=> b!12643 m!19167))

(declare-fun m!19169 () Bool)

(assert (=> b!12643 m!19169))

(declare-fun m!19171 () Bool)

(assert (=> b!12643 m!19171))

(declare-fun m!19173 () Bool)

(assert (=> b!12645 m!19173))

(declare-fun m!19175 () Bool)

(assert (=> b!12647 m!19175))

(declare-fun m!19177 () Bool)

(assert (=> b!12651 m!19177))

(declare-fun m!19179 () Bool)

(assert (=> b!12651 m!19179))

(declare-fun m!19181 () Bool)

(assert (=> b!12646 m!19181))

(declare-fun m!19183 () Bool)

(assert (=> b!12646 m!19183))

(push 1)

(assert (not b!12648))

(assert (not b!12643))

(assert (not start!2666))

(assert (not b!12651))

(assert (not b!12649))

(assert (not b!12645))

(assert (not b!12646))

(assert (not b!12650))

(assert (not b!12647))

(check-sat)

