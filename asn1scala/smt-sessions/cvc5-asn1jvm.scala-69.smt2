; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1406 () Bool)

(assert start!1406)

(declare-fun b!6379 () Bool)

(declare-fun res!7324 () Bool)

(declare-fun e!4011 () Bool)

(assert (=> b!6379 (=> (not res!7324) (not e!4011))))

(declare-datatypes ((array!444 0))(
  ( (array!445 (arr!589 (Array (_ BitVec 32) (_ BitVec 8))) (size!190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!358 0))(
  ( (BitStream!359 (buf!520 array!444) (currentByte!1517 (_ BitVec 32)) (currentBit!1512 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!358)

(declare-datatypes ((Unit!502 0))(
  ( (Unit!503) )
))
(declare-datatypes ((tuple2!820 0))(
  ( (tuple2!821 (_1!435 Unit!502) (_2!435 BitStream!358)) )
))
(declare-fun lt!8492 () tuple2!820)

(assert (=> b!6379 (= res!7324 (= (size!190 (buf!520 thiss!1486)) (size!190 (buf!520 (_2!435 lt!8492)))))))

(declare-fun b!6381 () Bool)

(declare-fun e!4014 () Bool)

(assert (=> b!6381 (= e!4014 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!8493 () Unit!502)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!444)

(declare-datatypes ((tuple2!822 0))(
  ( (tuple2!823 (_1!436 array!444) (_2!436 BitStream!358)) )
))
(declare-fun lt!8491 () tuple2!822)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!358 array!444 array!444 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!502)

(assert (=> b!6381 (= lt!8493 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!435 lt!8492) srcBuffer!6 (_1!436 lt!8491) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6382 () Bool)

(declare-fun res!7325 () Bool)

(assert (=> b!6382 (=> res!7325 e!4014)))

(declare-datatypes ((List!90 0))(
  ( (Nil!87) (Cons!86 (h!205 Bool) (t!840 List!90)) )
))
(declare-fun lt!8490 () List!90)

(declare-fun byteArrayBitContentToList!0 (BitStream!358 array!444 (_ BitVec 64) (_ BitVec 64)) List!90)

(assert (=> b!6382 (= res!7325 (not (= lt!8490 (byteArrayBitContentToList!0 (_2!435 lt!8492) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6383 () Bool)

(declare-fun e!4016 () Bool)

(assert (=> b!6383 (= e!4016 e!4011)))

(declare-fun res!7327 () Bool)

(assert (=> b!6383 (=> (not res!7327) (not e!4011))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6383 (= res!7327 (invariant!0 (currentBit!1512 (_2!435 lt!8492)) (currentByte!1517 (_2!435 lt!8492)) (size!190 (buf!520 (_2!435 lt!8492)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!358 array!444 (_ BitVec 64) (_ BitVec 64)) tuple2!820)

(assert (=> b!6383 (= lt!8492 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6384 () Bool)

(declare-fun res!7321 () Bool)

(assert (=> b!6384 (=> (not res!7321) (not e!4011))))

(declare-fun isPrefixOf!0 (BitStream!358 BitStream!358) Bool)

(assert (=> b!6384 (= res!7321 (isPrefixOf!0 thiss!1486 (_2!435 lt!8492)))))

(declare-fun b!6385 () Bool)

(declare-fun res!7323 () Bool)

(assert (=> b!6385 (=> (not res!7323) (not e!4016))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6385 (= res!7323 (validate_offset_bits!1 ((_ sign_extend 32) (size!190 (buf!520 thiss!1486))) ((_ sign_extend 32) (currentByte!1517 thiss!1486)) ((_ sign_extend 32) (currentBit!1512 thiss!1486)) nBits!460))))

(declare-fun res!7322 () Bool)

(assert (=> start!1406 (=> (not res!7322) (not e!4016))))

(assert (=> start!1406 (= res!7322 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!190 srcBuffer!6))))))))

(assert (=> start!1406 e!4016))

(assert (=> start!1406 true))

(declare-fun array_inv!185 (array!444) Bool)

(assert (=> start!1406 (array_inv!185 srcBuffer!6)))

(declare-fun e!4013 () Bool)

(declare-fun inv!12 (BitStream!358) Bool)

(assert (=> start!1406 (and (inv!12 thiss!1486) e!4013)))

(declare-fun b!6380 () Bool)

(assert (=> b!6380 (= e!4011 (not e!4014))))

(declare-fun res!7320 () Bool)

(assert (=> b!6380 (=> res!7320 e!4014)))

(assert (=> b!6380 (= res!7320 (not (= (byteArrayBitContentToList!0 (_2!435 lt!8492) (_1!436 lt!8491) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8490)))))

(declare-datatypes ((tuple2!824 0))(
  ( (tuple2!825 (_1!437 BitStream!358) (_2!437 BitStream!358)) )
))
(declare-fun lt!8494 () tuple2!824)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!358 BitStream!358 (_ BitVec 64)) List!90)

(assert (=> b!6380 (= lt!8490 (bitStreamReadBitsIntoList!0 (_2!435 lt!8492) (_1!437 lt!8494) nBits!460))))

(declare-fun readBits!0 (BitStream!358 (_ BitVec 64)) tuple2!822)

(assert (=> b!6380 (= lt!8491 (readBits!0 (_1!437 lt!8494) nBits!460))))

(assert (=> b!6380 (validate_offset_bits!1 ((_ sign_extend 32) (size!190 (buf!520 (_2!435 lt!8492)))) ((_ sign_extend 32) (currentByte!1517 thiss!1486)) ((_ sign_extend 32) (currentBit!1512 thiss!1486)) nBits!460)))

(declare-fun lt!8495 () Unit!502)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!358 array!444 (_ BitVec 64)) Unit!502)

(assert (=> b!6380 (= lt!8495 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!520 (_2!435 lt!8492)) nBits!460))))

(declare-fun reader!0 (BitStream!358 BitStream!358) tuple2!824)

(assert (=> b!6380 (= lt!8494 (reader!0 thiss!1486 (_2!435 lt!8492)))))

(declare-fun b!6386 () Bool)

(declare-fun res!7326 () Bool)

(assert (=> b!6386 (=> (not res!7326) (not e!4011))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6386 (= res!7326 (= (bitIndex!0 (size!190 (buf!520 (_2!435 lt!8492))) (currentByte!1517 (_2!435 lt!8492)) (currentBit!1512 (_2!435 lt!8492))) (bvadd (bitIndex!0 (size!190 (buf!520 thiss!1486)) (currentByte!1517 thiss!1486) (currentBit!1512 thiss!1486)) nBits!460)))))

(declare-fun b!6387 () Bool)

(assert (=> b!6387 (= e!4013 (array_inv!185 (buf!520 thiss!1486)))))

(assert (= (and start!1406 res!7322) b!6385))

(assert (= (and b!6385 res!7323) b!6383))

(assert (= (and b!6383 res!7327) b!6379))

(assert (= (and b!6379 res!7324) b!6386))

(assert (= (and b!6386 res!7326) b!6384))

(assert (= (and b!6384 res!7321) b!6380))

(assert (= (and b!6380 (not res!7320)) b!6382))

(assert (= (and b!6382 (not res!7325)) b!6381))

(assert (= start!1406 b!6387))

(declare-fun m!8079 () Bool)

(assert (=> b!6381 m!8079))

(declare-fun m!8081 () Bool)

(assert (=> b!6384 m!8081))

(declare-fun m!8083 () Bool)

(assert (=> b!6387 m!8083))

(declare-fun m!8085 () Bool)

(assert (=> start!1406 m!8085))

(declare-fun m!8087 () Bool)

(assert (=> start!1406 m!8087))

(declare-fun m!8089 () Bool)

(assert (=> b!6380 m!8089))

(declare-fun m!8091 () Bool)

(assert (=> b!6380 m!8091))

(declare-fun m!8093 () Bool)

(assert (=> b!6380 m!8093))

(declare-fun m!8095 () Bool)

(assert (=> b!6380 m!8095))

(declare-fun m!8097 () Bool)

(assert (=> b!6380 m!8097))

(declare-fun m!8099 () Bool)

(assert (=> b!6380 m!8099))

(declare-fun m!8101 () Bool)

(assert (=> b!6385 m!8101))

(declare-fun m!8103 () Bool)

(assert (=> b!6386 m!8103))

(declare-fun m!8105 () Bool)

(assert (=> b!6386 m!8105))

(declare-fun m!8107 () Bool)

(assert (=> b!6383 m!8107))

(declare-fun m!8109 () Bool)

(assert (=> b!6383 m!8109))

(declare-fun m!8111 () Bool)

(assert (=> b!6382 m!8111))

(push 1)

(assert (not b!6384))

(assert (not start!1406))

(assert (not b!6386))

(assert (not b!6381))

(assert (not b!6385))

(assert (not b!6380))

(assert (not b!6387))

(assert (not b!6382))

(assert (not b!6383))

(check-sat)

