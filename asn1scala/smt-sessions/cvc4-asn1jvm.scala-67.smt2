; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1314 () Bool)

(assert start!1314)

(declare-fun b!5971 () Bool)

(declare-fun res!7027 () Bool)

(declare-fun e!3801 () Bool)

(assert (=> b!5971 (=> (not res!7027) (not e!3801))))

(declare-datatypes ((array!433 0))(
  ( (array!434 (arr!582 (Array (_ BitVec 32) (_ BitVec 8))) (size!186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!350 0))(
  ( (BitStream!351 (buf!513 array!433) (currentByte!1504 (_ BitVec 32)) (currentBit!1499 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!350)

(declare-datatypes ((Unit!470 0))(
  ( (Unit!471) )
))
(declare-datatypes ((tuple2!784 0))(
  ( (tuple2!785 (_1!414 Unit!470) (_2!414 BitStream!350)) )
))
(declare-fun lt!7649 () tuple2!784)

(declare-fun isPrefixOf!0 (BitStream!350 BitStream!350) Bool)

(assert (=> b!5971 (= res!7027 (isPrefixOf!0 thiss!1486 (_2!414 lt!7649)))))

(declare-fun b!5972 () Bool)

(declare-fun e!3800 () Bool)

(declare-fun array_inv!181 (array!433) Bool)

(assert (=> b!5972 (= e!3800 (array_inv!181 (buf!513 thiss!1486)))))

(declare-fun b!5973 () Bool)

(declare-fun e!3798 () Bool)

(assert (=> b!5973 (= e!3801 (not e!3798))))

(declare-fun res!7020 () Bool)

(assert (=> b!5973 (=> res!7020 e!3798)))

(declare-datatypes ((tuple2!786 0))(
  ( (tuple2!787 (_1!415 array!433) (_2!415 BitStream!350)) )
))
(declare-fun lt!7646 () tuple2!786)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!86 0))(
  ( (Nil!83) (Cons!82 (h!201 Bool) (t!836 List!86)) )
))
(declare-fun lt!7644 () List!86)

(declare-fun byteArrayBitContentToList!0 (BitStream!350 array!433 (_ BitVec 64) (_ BitVec 64)) List!86)

(assert (=> b!5973 (= res!7020 (not (= (byteArrayBitContentToList!0 (_2!414 lt!7649) (_1!415 lt!7646) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7644)))))

(declare-datatypes ((tuple2!788 0))(
  ( (tuple2!789 (_1!416 BitStream!350) (_2!416 BitStream!350)) )
))
(declare-fun lt!7648 () tuple2!788)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!350 BitStream!350 (_ BitVec 64)) List!86)

(assert (=> b!5973 (= lt!7644 (bitStreamReadBitsIntoList!0 (_2!414 lt!7649) (_1!416 lt!7648) nBits!460))))

(declare-fun readBits!0 (BitStream!350 (_ BitVec 64)) tuple2!786)

(assert (=> b!5973 (= lt!7646 (readBits!0 (_1!416 lt!7648) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5973 (validate_offset_bits!1 ((_ sign_extend 32) (size!186 (buf!513 (_2!414 lt!7649)))) ((_ sign_extend 32) (currentByte!1504 thiss!1486)) ((_ sign_extend 32) (currentBit!1499 thiss!1486)) nBits!460)))

(declare-fun lt!7645 () Unit!470)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!350 array!433 (_ BitVec 64)) Unit!470)

(assert (=> b!5973 (= lt!7645 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!513 (_2!414 lt!7649)) nBits!460))))

(declare-fun reader!0 (BitStream!350 BitStream!350) tuple2!788)

(assert (=> b!5973 (= lt!7648 (reader!0 thiss!1486 (_2!414 lt!7649)))))

(declare-fun b!5974 () Bool)

(declare-fun res!7024 () Bool)

(assert (=> b!5974 (=> res!7024 e!3798)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!433)

(assert (=> b!5974 (= res!7024 (not (= lt!7644 (byteArrayBitContentToList!0 (_2!414 lt!7649) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5975 () Bool)

(declare-fun res!7022 () Bool)

(assert (=> b!5975 (=> (not res!7022) (not e!3801))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5975 (= res!7022 (= (bitIndex!0 (size!186 (buf!513 (_2!414 lt!7649))) (currentByte!1504 (_2!414 lt!7649)) (currentBit!1499 (_2!414 lt!7649))) (bvadd (bitIndex!0 (size!186 (buf!513 thiss!1486)) (currentByte!1504 thiss!1486) (currentBit!1499 thiss!1486)) nBits!460)))))

(declare-fun b!5976 () Bool)

(assert (=> b!5976 (= e!3798 true)))

(declare-fun lt!7647 () Unit!470)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!350 array!433 array!433 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!470)

(assert (=> b!5976 (= lt!7647 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!414 lt!7649) srcBuffer!6 (_1!415 lt!7646) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5977 () Bool)

(declare-fun res!7021 () Bool)

(declare-fun e!3802 () Bool)

(assert (=> b!5977 (=> (not res!7021) (not e!3802))))

(assert (=> b!5977 (= res!7021 (validate_offset_bits!1 ((_ sign_extend 32) (size!186 (buf!513 thiss!1486))) ((_ sign_extend 32) (currentByte!1504 thiss!1486)) ((_ sign_extend 32) (currentBit!1499 thiss!1486)) nBits!460))))

(declare-fun res!7025 () Bool)

(assert (=> start!1314 (=> (not res!7025) (not e!3802))))

(assert (=> start!1314 (= res!7025 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!186 srcBuffer!6))))))))

(assert (=> start!1314 e!3802))

(assert (=> start!1314 true))

(assert (=> start!1314 (array_inv!181 srcBuffer!6)))

(declare-fun inv!12 (BitStream!350) Bool)

(assert (=> start!1314 (and (inv!12 thiss!1486) e!3800)))

(declare-fun b!5978 () Bool)

(declare-fun res!7023 () Bool)

(assert (=> b!5978 (=> (not res!7023) (not e!3801))))

(assert (=> b!5978 (= res!7023 (= (size!186 (buf!513 thiss!1486)) (size!186 (buf!513 (_2!414 lt!7649)))))))

(declare-fun b!5979 () Bool)

(assert (=> b!5979 (= e!3802 e!3801)))

(declare-fun res!7026 () Bool)

(assert (=> b!5979 (=> (not res!7026) (not e!3801))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5979 (= res!7026 (invariant!0 (currentBit!1499 (_2!414 lt!7649)) (currentByte!1504 (_2!414 lt!7649)) (size!186 (buf!513 (_2!414 lt!7649)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!350 array!433 (_ BitVec 64) (_ BitVec 64)) tuple2!784)

(assert (=> b!5979 (= lt!7649 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1314 res!7025) b!5977))

(assert (= (and b!5977 res!7021) b!5979))

(assert (= (and b!5979 res!7026) b!5978))

(assert (= (and b!5978 res!7023) b!5975))

(assert (= (and b!5975 res!7022) b!5971))

(assert (= (and b!5971 res!7027) b!5973))

(assert (= (and b!5973 (not res!7020)) b!5974))

(assert (= (and b!5974 (not res!7024)) b!5976))

(assert (= start!1314 b!5972))

(declare-fun m!7451 () Bool)

(assert (=> start!1314 m!7451))

(declare-fun m!7453 () Bool)

(assert (=> start!1314 m!7453))

(declare-fun m!7455 () Bool)

(assert (=> b!5976 m!7455))

(declare-fun m!7457 () Bool)

(assert (=> b!5977 m!7457))

(declare-fun m!7459 () Bool)

(assert (=> b!5974 m!7459))

(declare-fun m!7461 () Bool)

(assert (=> b!5975 m!7461))

(declare-fun m!7463 () Bool)

(assert (=> b!5975 m!7463))

(declare-fun m!7465 () Bool)

(assert (=> b!5971 m!7465))

(declare-fun m!7467 () Bool)

(assert (=> b!5973 m!7467))

(declare-fun m!7469 () Bool)

(assert (=> b!5973 m!7469))

(declare-fun m!7471 () Bool)

(assert (=> b!5973 m!7471))

(declare-fun m!7473 () Bool)

(assert (=> b!5973 m!7473))

(declare-fun m!7475 () Bool)

(assert (=> b!5973 m!7475))

(declare-fun m!7477 () Bool)

(assert (=> b!5973 m!7477))

(declare-fun m!7479 () Bool)

(assert (=> b!5979 m!7479))

(declare-fun m!7481 () Bool)

(assert (=> b!5979 m!7481))

(declare-fun m!7483 () Bool)

(assert (=> b!5972 m!7483))

(push 1)

(assert (not b!5977))

(assert (not b!5974))

(assert (not b!5972))

(assert (not b!5971))

(assert (not b!5975))

(assert (not b!5976))

(assert (not start!1314))

(assert (not b!5979))

(assert (not b!5973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

