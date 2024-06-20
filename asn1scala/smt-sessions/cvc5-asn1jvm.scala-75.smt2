; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1526 () Bool)

(assert start!1526)

(declare-fun b!7183 () Bool)

(declare-fun res!7981 () Bool)

(declare-fun e!4485 () Bool)

(assert (=> b!7183 (=> (not res!7981) (not e!4485))))

(declare-datatypes ((array!483 0))(
  ( (array!484 (arr!610 (Array (_ BitVec 32) (_ BitVec 8))) (size!208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!394 0))(
  ( (BitStream!395 (buf!541 array!483) (currentByte!1544 (_ BitVec 32)) (currentBit!1539 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!394)

(declare-datatypes ((Unit!562 0))(
  ( (Unit!563) )
))
(declare-datatypes ((tuple2!940 0))(
  ( (tuple2!941 (_1!498 Unit!562) (_2!498 BitStream!394)) )
))
(declare-fun lt!9593 () tuple2!940)

(declare-fun isPrefixOf!0 (BitStream!394 BitStream!394) Bool)

(assert (=> b!7183 (= res!7981 (isPrefixOf!0 thiss!1486 (_2!498 lt!9593)))))

(declare-fun b!7184 () Bool)

(declare-fun res!7978 () Bool)

(declare-fun e!4487 () Bool)

(assert (=> b!7184 (=> res!7978 e!4487)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!483)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!108 0))(
  ( (Nil!105) (Cons!104 (h!223 Bool) (t!858 List!108)) )
))
(declare-fun lt!9589 () List!108)

(declare-fun byteArrayBitContentToList!0 (BitStream!394 array!483 (_ BitVec 64) (_ BitVec 64)) List!108)

(assert (=> b!7184 (= res!7978 (not (= lt!9589 (byteArrayBitContentToList!0 (_2!498 lt!9593) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7185 () Bool)

(declare-fun res!7976 () Bool)

(assert (=> b!7185 (=> (not res!7976) (not e!4485))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7185 (= res!7976 (= (bitIndex!0 (size!208 (buf!541 (_2!498 lt!9593))) (currentByte!1544 (_2!498 lt!9593)) (currentBit!1539 (_2!498 lt!9593))) (bvadd (bitIndex!0 (size!208 (buf!541 thiss!1486)) (currentByte!1544 thiss!1486) (currentBit!1539 thiss!1486)) nBits!460)))))

(declare-fun b!7186 () Bool)

(assert (=> b!7186 (= e!4487 true)))

(declare-fun lt!9591 () Unit!562)

(declare-datatypes ((tuple2!942 0))(
  ( (tuple2!943 (_1!499 array!483) (_2!499 BitStream!394)) )
))
(declare-fun lt!9588 () tuple2!942)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!394 array!483 array!483 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!562)

(assert (=> b!7186 (= lt!9591 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!498 lt!9593) srcBuffer!6 (_1!499 lt!9588) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7187 () Bool)

(assert (=> b!7187 (= e!4485 (not e!4487))))

(declare-fun res!7980 () Bool)

(assert (=> b!7187 (=> res!7980 e!4487)))

(assert (=> b!7187 (= res!7980 (not (= (byteArrayBitContentToList!0 (_2!498 lt!9593) (_1!499 lt!9588) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9589)))))

(declare-datatypes ((tuple2!944 0))(
  ( (tuple2!945 (_1!500 BitStream!394) (_2!500 BitStream!394)) )
))
(declare-fun lt!9590 () tuple2!944)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!394 BitStream!394 (_ BitVec 64)) List!108)

(assert (=> b!7187 (= lt!9589 (bitStreamReadBitsIntoList!0 (_2!498 lt!9593) (_1!500 lt!9590) nBits!460))))

(declare-fun readBits!0 (BitStream!394 (_ BitVec 64)) tuple2!942)

(assert (=> b!7187 (= lt!9588 (readBits!0 (_1!500 lt!9590) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7187 (validate_offset_bits!1 ((_ sign_extend 32) (size!208 (buf!541 (_2!498 lt!9593)))) ((_ sign_extend 32) (currentByte!1544 thiss!1486)) ((_ sign_extend 32) (currentBit!1539 thiss!1486)) nBits!460)))

(declare-fun lt!9592 () Unit!562)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!394 array!483 (_ BitVec 64)) Unit!562)

(assert (=> b!7187 (= lt!9592 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!541 (_2!498 lt!9593)) nBits!460))))

(declare-fun reader!0 (BitStream!394 BitStream!394) tuple2!944)

(assert (=> b!7187 (= lt!9590 (reader!0 thiss!1486 (_2!498 lt!9593)))))

(declare-fun b!7188 () Bool)

(declare-fun e!4488 () Bool)

(declare-fun array_inv!203 (array!483) Bool)

(assert (=> b!7188 (= e!4488 (array_inv!203 (buf!541 thiss!1486)))))

(declare-fun b!7189 () Bool)

(declare-fun res!7979 () Bool)

(declare-fun e!4489 () Bool)

(assert (=> b!7189 (=> (not res!7979) (not e!4489))))

(assert (=> b!7189 (= res!7979 (validate_offset_bits!1 ((_ sign_extend 32) (size!208 (buf!541 thiss!1486))) ((_ sign_extend 32) (currentByte!1544 thiss!1486)) ((_ sign_extend 32) (currentBit!1539 thiss!1486)) nBits!460))))

(declare-fun res!7977 () Bool)

(assert (=> start!1526 (=> (not res!7977) (not e!4489))))

(assert (=> start!1526 (= res!7977 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!208 srcBuffer!6))))))))

(assert (=> start!1526 e!4489))

(assert (=> start!1526 true))

(assert (=> start!1526 (array_inv!203 srcBuffer!6)))

(declare-fun inv!12 (BitStream!394) Bool)

(assert (=> start!1526 (and (inv!12 thiss!1486) e!4488)))

(declare-fun b!7190 () Bool)

(declare-fun res!7974 () Bool)

(assert (=> b!7190 (=> (not res!7974) (not e!4485))))

(assert (=> b!7190 (= res!7974 (= (size!208 (buf!541 thiss!1486)) (size!208 (buf!541 (_2!498 lt!9593)))))))

(declare-fun b!7191 () Bool)

(assert (=> b!7191 (= e!4489 e!4485)))

(declare-fun res!7975 () Bool)

(assert (=> b!7191 (=> (not res!7975) (not e!4485))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7191 (= res!7975 (invariant!0 (currentBit!1539 (_2!498 lt!9593)) (currentByte!1544 (_2!498 lt!9593)) (size!208 (buf!541 (_2!498 lt!9593)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!394 array!483 (_ BitVec 64) (_ BitVec 64)) tuple2!940)

(assert (=> b!7191 (= lt!9593 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1526 res!7977) b!7189))

(assert (= (and b!7189 res!7979) b!7191))

(assert (= (and b!7191 res!7975) b!7190))

(assert (= (and b!7190 res!7974) b!7185))

(assert (= (and b!7185 res!7976) b!7183))

(assert (= (and b!7183 res!7981) b!7187))

(assert (= (and b!7187 (not res!7980)) b!7184))

(assert (= (and b!7184 (not res!7978)) b!7186))

(assert (= start!1526 b!7188))

(declare-fun m!9201 () Bool)

(assert (=> b!7183 m!9201))

(declare-fun m!9203 () Bool)

(assert (=> b!7191 m!9203))

(declare-fun m!9205 () Bool)

(assert (=> b!7191 m!9205))

(declare-fun m!9207 () Bool)

(assert (=> b!7185 m!9207))

(declare-fun m!9209 () Bool)

(assert (=> b!7185 m!9209))

(declare-fun m!9211 () Bool)

(assert (=> b!7184 m!9211))

(declare-fun m!9213 () Bool)

(assert (=> b!7187 m!9213))

(declare-fun m!9215 () Bool)

(assert (=> b!7187 m!9215))

(declare-fun m!9217 () Bool)

(assert (=> b!7187 m!9217))

(declare-fun m!9219 () Bool)

(assert (=> b!7187 m!9219))

(declare-fun m!9221 () Bool)

(assert (=> b!7187 m!9221))

(declare-fun m!9223 () Bool)

(assert (=> b!7187 m!9223))

(declare-fun m!9225 () Bool)

(assert (=> start!1526 m!9225))

(declare-fun m!9227 () Bool)

(assert (=> start!1526 m!9227))

(declare-fun m!9229 () Bool)

(assert (=> b!7189 m!9229))

(declare-fun m!9231 () Bool)

(assert (=> b!7186 m!9231))

(declare-fun m!9233 () Bool)

(assert (=> b!7188 m!9233))

(push 1)

(assert (not b!7183))

(assert (not b!7186))

(assert (not b!7191))

(assert (not b!7187))

(assert (not start!1526))

(assert (not b!7184))

(assert (not b!7189))

(assert (not b!7185))

(assert (not b!7188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

