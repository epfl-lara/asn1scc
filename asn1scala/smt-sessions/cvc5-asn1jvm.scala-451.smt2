; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11898 () Bool)

(assert start!11898)

(declare-fun b!60491 () Bool)

(declare-fun e!40372 () Bool)

(declare-fun e!40374 () Bool)

(assert (=> b!60491 (= e!40372 e!40374)))

(declare-fun res!50455 () Bool)

(assert (=> b!60491 (=> res!50455 e!40374)))

(declare-datatypes ((array!2755 0))(
  ( (array!2756 (arr!1817 (Array (_ BitVec 32) (_ BitVec 8))) (size!1253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2194 0))(
  ( (BitStream!2195 (buf!1634 array!2755) (currentByte!3252 (_ BitVec 32)) (currentBit!3247 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2194)

(declare-datatypes ((Unit!4129 0))(
  ( (Unit!4130) )
))
(declare-datatypes ((tuple2!5510 0))(
  ( (tuple2!5511 (_1!2866 Unit!4129) (_2!2866 BitStream!2194)) )
))
(declare-fun lt!94367 () tuple2!5510)

(declare-fun isPrefixOf!0 (BitStream!2194 BitStream!2194) Bool)

(assert (=> b!60491 (= res!50455 (not (isPrefixOf!0 thiss!1379 (_2!2866 lt!94367))))))

(declare-fun lt!94364 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60491 (validate_offset_bits!1 ((_ sign_extend 32) (size!1253 (buf!1634 (_2!2866 lt!94367)))) ((_ sign_extend 32) (currentByte!3252 (_2!2866 lt!94367))) ((_ sign_extend 32) (currentBit!3247 (_2!2866 lt!94367))) lt!94364)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!60491 (= lt!94364 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94375 () Unit!4129)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2194 BitStream!2194 (_ BitVec 64) (_ BitVec 64)) Unit!4129)

(assert (=> b!60491 (= lt!94375 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2866 lt!94367) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2755)

(declare-fun appendBitFromByte!0 (BitStream!2194 (_ BitVec 8) (_ BitVec 32)) tuple2!5510)

(assert (=> b!60491 (= lt!94367 (appendBitFromByte!0 thiss!1379 (select (arr!1817 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60492 () Bool)

(declare-fun e!40371 () Bool)

(declare-fun e!40377 () Bool)

(assert (=> b!60492 (= e!40371 e!40377)))

(declare-fun res!50457 () Bool)

(assert (=> b!60492 (=> res!50457 e!40377)))

(declare-fun lt!94369 () tuple2!5510)

(assert (=> b!60492 (= res!50457 (not (= (size!1253 (buf!1634 (_2!2866 lt!94367))) (size!1253 (buf!1634 (_2!2866 lt!94369))))))))

(declare-fun e!40370 () Bool)

(assert (=> b!60492 e!40370))

(declare-fun res!50448 () Bool)

(assert (=> b!60492 (=> (not res!50448) (not e!40370))))

(assert (=> b!60492 (= res!50448 (= (size!1253 (buf!1634 (_2!2866 lt!94369))) (size!1253 (buf!1634 thiss!1379))))))

(declare-fun b!60493 () Bool)

(declare-fun e!40373 () Bool)

(assert (=> b!60493 (= e!40373 e!40371)))

(declare-fun res!50451 () Bool)

(assert (=> b!60493 (=> res!50451 e!40371)))

(declare-fun lt!94374 () (_ BitVec 64))

(declare-fun lt!94372 () (_ BitVec 64))

(assert (=> b!60493 (= res!50451 (not (= lt!94374 (bvsub (bvadd lt!94372 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60493 (= lt!94374 (bitIndex!0 (size!1253 (buf!1634 (_2!2866 lt!94369))) (currentByte!3252 (_2!2866 lt!94369)) (currentBit!3247 (_2!2866 lt!94369))))))

(declare-fun b!60494 () Bool)

(declare-fun res!50450 () Bool)

(assert (=> b!60494 (=> res!50450 e!40377)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60494 (= res!50450 (not (invariant!0 (currentBit!3247 (_2!2866 lt!94367)) (currentByte!3252 (_2!2866 lt!94367)) (size!1253 (buf!1634 (_2!2866 lt!94367))))))))

(declare-fun b!60495 () Bool)

(declare-fun res!50445 () Bool)

(assert (=> b!60495 (=> res!50445 e!40371)))

(assert (=> b!60495 (= res!50445 (not (invariant!0 (currentBit!3247 (_2!2866 lt!94369)) (currentByte!3252 (_2!2866 lt!94369)) (size!1253 (buf!1634 (_2!2866 lt!94369))))))))

(declare-fun b!60496 () Bool)

(declare-fun e!40375 () Bool)

(assert (=> b!60496 (= e!40375 true)))

(declare-fun lt!94377 () Int)

(declare-datatypes ((List!672 0))(
  ( (Nil!669) (Cons!668 (h!787 Bool) (t!1422 List!672)) )
))
(declare-fun lt!94370 () List!672)

(declare-fun length!300 (List!672) Int)

(assert (=> b!60496 (= lt!94377 (length!300 lt!94370))))

(declare-fun b!60497 () Bool)

(declare-fun e!40378 () Bool)

(assert (=> b!60497 (= e!40378 (not e!40372))))

(declare-fun res!50452 () Bool)

(assert (=> b!60497 (=> res!50452 e!40372)))

(assert (=> b!60497 (= res!50452 (bvsge i!635 to!314))))

(assert (=> b!60497 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94371 () Unit!4129)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2194) Unit!4129)

(assert (=> b!60497 (= lt!94371 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60497 (= lt!94372 (bitIndex!0 (size!1253 (buf!1634 thiss!1379)) (currentByte!3252 thiss!1379) (currentBit!3247 thiss!1379)))))

(declare-fun b!60498 () Bool)

(declare-fun res!50447 () Bool)

(assert (=> b!60498 (=> (not res!50447) (not e!40378))))

(assert (=> b!60498 (= res!50447 (validate_offset_bits!1 ((_ sign_extend 32) (size!1253 (buf!1634 thiss!1379))) ((_ sign_extend 32) (currentByte!3252 thiss!1379)) ((_ sign_extend 32) (currentBit!3247 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!40369 () Bool)

(declare-fun b!60499 () Bool)

(declare-datatypes ((tuple2!5512 0))(
  ( (tuple2!5513 (_1!2867 BitStream!2194) (_2!2867 BitStream!2194)) )
))
(declare-fun lt!94376 () tuple2!5512)

(declare-fun head!491 (List!672) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2194 array!2755 (_ BitVec 64) (_ BitVec 64)) List!672)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2194 BitStream!2194 (_ BitVec 64)) List!672)

(assert (=> b!60499 (= e!40369 (= (head!491 (byteArrayBitContentToList!0 (_2!2866 lt!94367) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!491 (bitStreamReadBitsIntoList!0 (_2!2866 lt!94367) (_1!2867 lt!94376) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60501 () Bool)

(assert (=> b!60501 (= e!40377 e!40375)))

(declare-fun res!50456 () Bool)

(assert (=> b!60501 (=> res!50456 e!40375)))

(assert (=> b!60501 (= res!50456 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94378 () List!672)

(declare-fun lt!94363 () tuple2!5512)

(assert (=> b!60501 (= lt!94378 (bitStreamReadBitsIntoList!0 (_2!2866 lt!94369) (_1!2867 lt!94363) lt!94364))))

(declare-fun lt!94362 () tuple2!5512)

(assert (=> b!60501 (= lt!94370 (bitStreamReadBitsIntoList!0 (_2!2866 lt!94369) (_1!2867 lt!94362) (bvsub to!314 i!635)))))

(assert (=> b!60501 (validate_offset_bits!1 ((_ sign_extend 32) (size!1253 (buf!1634 (_2!2866 lt!94369)))) ((_ sign_extend 32) (currentByte!3252 (_2!2866 lt!94367))) ((_ sign_extend 32) (currentBit!3247 (_2!2866 lt!94367))) lt!94364)))

(declare-fun lt!94366 () Unit!4129)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2194 array!2755 (_ BitVec 64)) Unit!4129)

(assert (=> b!60501 (= lt!94366 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2866 lt!94367) (buf!1634 (_2!2866 lt!94369)) lt!94364))))

(declare-fun reader!0 (BitStream!2194 BitStream!2194) tuple2!5512)

(assert (=> b!60501 (= lt!94363 (reader!0 (_2!2866 lt!94367) (_2!2866 lt!94369)))))

(assert (=> b!60501 (validate_offset_bits!1 ((_ sign_extend 32) (size!1253 (buf!1634 (_2!2866 lt!94369)))) ((_ sign_extend 32) (currentByte!3252 thiss!1379)) ((_ sign_extend 32) (currentBit!3247 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94365 () Unit!4129)

(assert (=> b!60501 (= lt!94365 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1634 (_2!2866 lt!94369)) (bvsub to!314 i!635)))))

(assert (=> b!60501 (= lt!94362 (reader!0 thiss!1379 (_2!2866 lt!94369)))))

(declare-fun b!60500 () Bool)

(declare-fun res!50453 () Bool)

(assert (=> b!60500 (=> res!50453 e!40371)))

(assert (=> b!60500 (= res!50453 (not (= (size!1253 (buf!1634 thiss!1379)) (size!1253 (buf!1634 (_2!2866 lt!94369))))))))

(declare-fun res!50454 () Bool)

(assert (=> start!11898 (=> (not res!50454) (not e!40378))))

(assert (=> start!11898 (= res!50454 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1253 srcBuffer!2))))))))

(assert (=> start!11898 e!40378))

(assert (=> start!11898 true))

(declare-fun array_inv!1156 (array!2755) Bool)

(assert (=> start!11898 (array_inv!1156 srcBuffer!2)))

(declare-fun e!40379 () Bool)

(declare-fun inv!12 (BitStream!2194) Bool)

(assert (=> start!11898 (and (inv!12 thiss!1379) e!40379)))

(declare-fun b!60502 () Bool)

(assert (=> b!60502 (= e!40379 (array_inv!1156 (buf!1634 thiss!1379)))))

(declare-fun b!60503 () Bool)

(assert (=> b!60503 (= e!40374 e!40373)))

(declare-fun res!50449 () Bool)

(assert (=> b!60503 (=> res!50449 e!40373)))

(assert (=> b!60503 (= res!50449 (not (isPrefixOf!0 (_2!2866 lt!94367) (_2!2866 lt!94369))))))

(assert (=> b!60503 (isPrefixOf!0 thiss!1379 (_2!2866 lt!94369))))

(declare-fun lt!94373 () Unit!4129)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2194 BitStream!2194 BitStream!2194) Unit!4129)

(assert (=> b!60503 (= lt!94373 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2866 lt!94367) (_2!2866 lt!94369)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2194 array!2755 (_ BitVec 64) (_ BitVec 64)) tuple2!5510)

(assert (=> b!60503 (= lt!94369 (appendBitsMSBFirstLoop!0 (_2!2866 lt!94367) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60503 e!40369))

(declare-fun res!50446 () Bool)

(assert (=> b!60503 (=> (not res!50446) (not e!40369))))

(assert (=> b!60503 (= res!50446 (validate_offset_bits!1 ((_ sign_extend 32) (size!1253 (buf!1634 (_2!2866 lt!94367)))) ((_ sign_extend 32) (currentByte!3252 thiss!1379)) ((_ sign_extend 32) (currentBit!3247 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94368 () Unit!4129)

(assert (=> b!60503 (= lt!94368 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1634 (_2!2866 lt!94367)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!60503 (= lt!94376 (reader!0 thiss!1379 (_2!2866 lt!94367)))))

(declare-fun b!60504 () Bool)

(declare-fun res!50444 () Bool)

(assert (=> b!60504 (=> res!50444 e!40377)))

(assert (=> b!60504 (= res!50444 (not (invariant!0 (currentBit!3247 (_2!2866 lt!94367)) (currentByte!3252 (_2!2866 lt!94367)) (size!1253 (buf!1634 (_2!2866 lt!94369))))))))

(declare-fun b!60505 () Bool)

(assert (=> b!60505 (= e!40370 (= lt!94374 (bvsub (bvsub (bvadd (bitIndex!0 (size!1253 (buf!1634 (_2!2866 lt!94367))) (currentByte!3252 (_2!2866 lt!94367)) (currentBit!3247 (_2!2866 lt!94367))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11898 res!50454) b!60498))

(assert (= (and b!60498 res!50447) b!60497))

(assert (= (and b!60497 (not res!50452)) b!60491))

(assert (= (and b!60491 (not res!50455)) b!60503))

(assert (= (and b!60503 res!50446) b!60499))

(assert (= (and b!60503 (not res!50449)) b!60493))

(assert (= (and b!60493 (not res!50451)) b!60495))

(assert (= (and b!60495 (not res!50445)) b!60500))

(assert (= (and b!60500 (not res!50453)) b!60492))

(assert (= (and b!60492 res!50448) b!60505))

(assert (= (and b!60492 (not res!50457)) b!60494))

(assert (= (and b!60494 (not res!50450)) b!60504))

(assert (= (and b!60504 (not res!50444)) b!60501))

(assert (= (and b!60501 (not res!50456)) b!60496))

(assert (= start!11898 b!60502))

(declare-fun m!95317 () Bool)

(assert (=> b!60503 m!95317))

(declare-fun m!95319 () Bool)

(assert (=> b!60503 m!95319))

(declare-fun m!95321 () Bool)

(assert (=> b!60503 m!95321))

(declare-fun m!95323 () Bool)

(assert (=> b!60503 m!95323))

(declare-fun m!95325 () Bool)

(assert (=> b!60503 m!95325))

(declare-fun m!95327 () Bool)

(assert (=> b!60503 m!95327))

(declare-fun m!95329 () Bool)

(assert (=> b!60503 m!95329))

(declare-fun m!95331 () Bool)

(assert (=> b!60493 m!95331))

(declare-fun m!95333 () Bool)

(assert (=> b!60494 m!95333))

(declare-fun m!95335 () Bool)

(assert (=> b!60505 m!95335))

(declare-fun m!95337 () Bool)

(assert (=> b!60502 m!95337))

(declare-fun m!95339 () Bool)

(assert (=> b!60496 m!95339))

(declare-fun m!95341 () Bool)

(assert (=> start!11898 m!95341))

(declare-fun m!95343 () Bool)

(assert (=> start!11898 m!95343))

(declare-fun m!95345 () Bool)

(assert (=> b!60499 m!95345))

(assert (=> b!60499 m!95345))

(declare-fun m!95347 () Bool)

(assert (=> b!60499 m!95347))

(declare-fun m!95349 () Bool)

(assert (=> b!60499 m!95349))

(assert (=> b!60499 m!95349))

(declare-fun m!95351 () Bool)

(assert (=> b!60499 m!95351))

(declare-fun m!95353 () Bool)

(assert (=> b!60501 m!95353))

(declare-fun m!95355 () Bool)

(assert (=> b!60501 m!95355))

(declare-fun m!95357 () Bool)

(assert (=> b!60501 m!95357))

(declare-fun m!95359 () Bool)

(assert (=> b!60501 m!95359))

(declare-fun m!95361 () Bool)

(assert (=> b!60501 m!95361))

(declare-fun m!95363 () Bool)

(assert (=> b!60501 m!95363))

(declare-fun m!95365 () Bool)

(assert (=> b!60501 m!95365))

(declare-fun m!95367 () Bool)

(assert (=> b!60501 m!95367))

(declare-fun m!95369 () Bool)

(assert (=> b!60504 m!95369))

(declare-fun m!95371 () Bool)

(assert (=> b!60498 m!95371))

(declare-fun m!95373 () Bool)

(assert (=> b!60491 m!95373))

(declare-fun m!95375 () Bool)

(assert (=> b!60491 m!95375))

(declare-fun m!95377 () Bool)

(assert (=> b!60491 m!95377))

(declare-fun m!95379 () Bool)

(assert (=> b!60491 m!95379))

(assert (=> b!60491 m!95373))

(declare-fun m!95381 () Bool)

(assert (=> b!60491 m!95381))

(declare-fun m!95383 () Bool)

(assert (=> b!60497 m!95383))

(declare-fun m!95385 () Bool)

(assert (=> b!60497 m!95385))

(declare-fun m!95387 () Bool)

(assert (=> b!60497 m!95387))

(declare-fun m!95389 () Bool)

(assert (=> b!60495 m!95389))

(push 1)

(assert (not b!60503))

(assert (not b!60495))

(assert (not b!60499))

(assert (not b!60504))

(assert (not b!60491))

(assert (not b!60502))

(assert (not b!60493))

(assert (not b!60501))

(assert (not b!60497))

(assert (not b!60505))

(assert (not b!60498))

(assert (not b!60496))

(assert (not start!11898))

(assert (not b!60494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

