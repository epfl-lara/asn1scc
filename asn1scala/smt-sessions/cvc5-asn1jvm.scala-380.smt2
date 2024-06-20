; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9164 () Bool)

(assert start!9164)

(declare-fun b!45494 () Bool)

(declare-fun e!30293 () Bool)

(declare-datatypes ((array!2269 0))(
  ( (array!2270 (arr!1538 (Array (_ BitVec 32) (_ BitVec 8))) (size!1021 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1786 0))(
  ( (BitStream!1787 (buf!1370 array!2269) (currentByte!2863 (_ BitVec 32)) (currentBit!2858 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1786)

(declare-fun array_inv!946 (array!2269) Bool)

(assert (=> b!45494 (= e!30293 (array_inv!946 (buf!1370 thiss!1379)))))

(declare-fun b!45495 () Bool)

(declare-fun e!30301 () Bool)

(declare-fun e!30297 () Bool)

(assert (=> b!45495 (= e!30301 (not e!30297))))

(declare-fun res!38482 () Bool)

(assert (=> b!45495 (=> res!38482 e!30297)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!45495 (= res!38482 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1786 BitStream!1786) Bool)

(assert (=> b!45495 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3232 0))(
  ( (Unit!3233) )
))
(declare-fun lt!69811 () Unit!3232)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1786) Unit!3232)

(assert (=> b!45495 (= lt!69811 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69823 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45495 (= lt!69823 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(declare-fun b!45496 () Bool)

(declare-fun e!30296 () Bool)

(assert (=> b!45496 (= e!30297 e!30296)))

(declare-fun res!38488 () Bool)

(assert (=> b!45496 (=> res!38488 e!30296)))

(declare-datatypes ((tuple2!4440 0))(
  ( (tuple2!4441 (_1!2313 Unit!3232) (_2!2313 BitStream!1786)) )
))
(declare-fun lt!69817 () tuple2!4440)

(assert (=> b!45496 (= res!38488 (not (isPrefixOf!0 thiss!1379 (_2!2313 lt!69817))))))

(declare-fun lt!69826 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45496 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!69826)))

(assert (=> b!45496 (= lt!69826 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69825 () Unit!3232)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1786 BitStream!1786 (_ BitVec 64) (_ BitVec 64)) Unit!3232)

(assert (=> b!45496 (= lt!69825 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2313 lt!69817) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2269)

(declare-fun appendBitFromByte!0 (BitStream!1786 (_ BitVec 8) (_ BitVec 32)) tuple2!4440)

(assert (=> b!45496 (= lt!69817 (appendBitFromByte!0 thiss!1379 (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45497 () Bool)

(declare-fun res!38493 () Bool)

(assert (=> b!45497 (=> (not res!38493) (not e!30301))))

(assert (=> b!45497 (= res!38493 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45498 () Bool)

(declare-fun res!38491 () Bool)

(declare-fun e!30295 () Bool)

(assert (=> b!45498 (=> res!38491 e!30295)))

(declare-fun lt!69812 () tuple2!4440)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45498 (= res!38491 (not (invariant!0 (currentBit!2858 (_2!2313 lt!69817)) (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))

(declare-fun b!45499 () Bool)

(declare-fun e!30298 () Bool)

(declare-datatypes ((List!534 0))(
  ( (Nil!531) (Cons!530 (h!649 Bool) (t!1284 List!534)) )
))
(declare-fun lt!69814 () List!534)

(declare-fun length!229 (List!534) Int)

(assert (=> b!45499 (= e!30298 (> (length!229 lt!69814) 0))))

(declare-fun res!38480 () Bool)

(assert (=> start!9164 (=> (not res!38480) (not e!30301))))

(assert (=> start!9164 (= res!38480 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1021 srcBuffer!2))))))))

(assert (=> start!9164 e!30301))

(assert (=> start!9164 true))

(assert (=> start!9164 (array_inv!946 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1786) Bool)

(assert (=> start!9164 (and (inv!12 thiss!1379) e!30293)))

(declare-fun b!45500 () Bool)

(declare-fun res!38484 () Bool)

(assert (=> b!45500 (=> res!38484 e!30295)))

(assert (=> b!45500 (= res!38484 (not (invariant!0 (currentBit!2858 (_2!2313 lt!69817)) (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69817))))))))

(declare-fun b!45501 () Bool)

(declare-fun res!38486 () Bool)

(declare-fun e!30294 () Bool)

(assert (=> b!45501 (=> res!38486 e!30294)))

(assert (=> b!45501 (= res!38486 (not (= (size!1021 (buf!1370 thiss!1379)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))

(declare-fun e!30292 () Bool)

(declare-datatypes ((tuple2!4442 0))(
  ( (tuple2!4443 (_1!2314 BitStream!1786) (_2!2314 BitStream!1786)) )
))
(declare-fun lt!69819 () tuple2!4442)

(declare-fun b!45502 () Bool)

(declare-fun head!353 (List!534) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1786 array!2269 (_ BitVec 64) (_ BitVec 64)) List!534)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1786 BitStream!1786 (_ BitVec 64)) List!534)

(assert (=> b!45502 (= e!30292 (= (head!353 (byteArrayBitContentToList!0 (_2!2313 lt!69817) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!353 (bitStreamReadBitsIntoList!0 (_2!2313 lt!69817) (_1!2314 lt!69819) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45503 () Bool)

(assert (=> b!45503 (= e!30294 e!30295)))

(declare-fun res!38490 () Bool)

(assert (=> b!45503 (=> res!38490 e!30295)))

(assert (=> b!45503 (= res!38490 (not (= (size!1021 (buf!1370 (_2!2313 lt!69817))) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))

(declare-fun e!30299 () Bool)

(assert (=> b!45503 e!30299))

(declare-fun res!38487 () Bool)

(assert (=> b!45503 (=> (not res!38487) (not e!30299))))

(assert (=> b!45503 (= res!38487 (= (size!1021 (buf!1370 (_2!2313 lt!69812))) (size!1021 (buf!1370 thiss!1379))))))

(declare-fun b!45504 () Bool)

(declare-fun e!30302 () Bool)

(assert (=> b!45504 (= e!30296 e!30302)))

(declare-fun res!38483 () Bool)

(assert (=> b!45504 (=> res!38483 e!30302)))

(assert (=> b!45504 (= res!38483 (not (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69812))))))

(assert (=> b!45504 (isPrefixOf!0 thiss!1379 (_2!2313 lt!69812))))

(declare-fun lt!69813 () Unit!3232)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1786 BitStream!1786 BitStream!1786) Unit!3232)

(assert (=> b!45504 (= lt!69813 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2313 lt!69817) (_2!2313 lt!69812)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1786 array!2269 (_ BitVec 64) (_ BitVec 64)) tuple2!4440)

(assert (=> b!45504 (= lt!69812 (appendBitsMSBFirstLoop!0 (_2!2313 lt!69817) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!45504 e!30292))

(declare-fun res!38485 () Bool)

(assert (=> b!45504 (=> (not res!38485) (not e!30292))))

(assert (=> b!45504 (= res!38485 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69821 () Unit!3232)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1786 array!2269 (_ BitVec 64)) Unit!3232)

(assert (=> b!45504 (= lt!69821 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1370 (_2!2313 lt!69817)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1786 BitStream!1786) tuple2!4442)

(assert (=> b!45504 (= lt!69819 (reader!0 thiss!1379 (_2!2313 lt!69817)))))

(declare-fun lt!69818 () (_ BitVec 64))

(declare-fun b!45505 () Bool)

(assert (=> b!45505 (= e!30299 (= lt!69818 (bvsub (bvsub (bvadd (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45506 () Bool)

(declare-fun res!38492 () Bool)

(assert (=> b!45506 (=> res!38492 e!30294)))

(assert (=> b!45506 (= res!38492 (not (invariant!0 (currentBit!2858 (_2!2313 lt!69812)) (currentByte!2863 (_2!2313 lt!69812)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))

(declare-fun b!45507 () Bool)

(assert (=> b!45507 (= e!30302 e!30294)))

(declare-fun res!38481 () Bool)

(assert (=> b!45507 (=> res!38481 e!30294)))

(assert (=> b!45507 (= res!38481 (not (= lt!69818 (bvsub (bvadd lt!69823 to!314) i!635))))))

(assert (=> b!45507 (= lt!69818 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812))))))

(declare-fun b!45508 () Bool)

(assert (=> b!45508 (= e!30295 e!30298)))

(declare-fun res!38489 () Bool)

(assert (=> b!45508 (=> res!38489 e!30298)))

(assert (=> b!45508 (= res!38489 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!69816 () tuple2!4442)

(declare-fun lt!69822 () List!534)

(assert (=> b!45508 (= lt!69822 (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_1!2314 lt!69816) lt!69826))))

(declare-fun lt!69820 () tuple2!4442)

(assert (=> b!45508 (= lt!69814 (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_1!2314 lt!69820) (bvsub to!314 i!635)))))

(assert (=> b!45508 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!69826)))

(declare-fun lt!69824 () Unit!3232)

(assert (=> b!45508 (= lt!69824 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!69812)) lt!69826))))

(assert (=> b!45508 (= lt!69816 (reader!0 (_2!2313 lt!69817) (_2!2313 lt!69812)))))

(assert (=> b!45508 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69815 () Unit!3232)

(assert (=> b!45508 (= lt!69815 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1370 (_2!2313 lt!69812)) (bvsub to!314 i!635)))))

(assert (=> b!45508 (= lt!69820 (reader!0 thiss!1379 (_2!2313 lt!69812)))))

(assert (= (and start!9164 res!38480) b!45497))

(assert (= (and b!45497 res!38493) b!45495))

(assert (= (and b!45495 (not res!38482)) b!45496))

(assert (= (and b!45496 (not res!38488)) b!45504))

(assert (= (and b!45504 res!38485) b!45502))

(assert (= (and b!45504 (not res!38483)) b!45507))

(assert (= (and b!45507 (not res!38481)) b!45506))

(assert (= (and b!45506 (not res!38492)) b!45501))

(assert (= (and b!45501 (not res!38486)) b!45503))

(assert (= (and b!45503 res!38487) b!45505))

(assert (= (and b!45503 (not res!38490)) b!45500))

(assert (= (and b!45500 (not res!38484)) b!45498))

(assert (= (and b!45498 (not res!38491)) b!45508))

(assert (= (and b!45508 (not res!38489)) b!45499))

(assert (= start!9164 b!45494))

(declare-fun m!69415 () Bool)

(assert (=> b!45497 m!69415))

(declare-fun m!69417 () Bool)

(assert (=> b!45496 m!69417))

(declare-fun m!69419 () Bool)

(assert (=> b!45496 m!69419))

(declare-fun m!69421 () Bool)

(assert (=> b!45496 m!69421))

(assert (=> b!45496 m!69419))

(declare-fun m!69423 () Bool)

(assert (=> b!45496 m!69423))

(declare-fun m!69425 () Bool)

(assert (=> b!45496 m!69425))

(declare-fun m!69427 () Bool)

(assert (=> b!45504 m!69427))

(declare-fun m!69429 () Bool)

(assert (=> b!45504 m!69429))

(declare-fun m!69431 () Bool)

(assert (=> b!45504 m!69431))

(declare-fun m!69433 () Bool)

(assert (=> b!45504 m!69433))

(declare-fun m!69435 () Bool)

(assert (=> b!45504 m!69435))

(declare-fun m!69437 () Bool)

(assert (=> b!45504 m!69437))

(declare-fun m!69439 () Bool)

(assert (=> b!45504 m!69439))

(declare-fun m!69441 () Bool)

(assert (=> b!45498 m!69441))

(declare-fun m!69443 () Bool)

(assert (=> b!45505 m!69443))

(declare-fun m!69445 () Bool)

(assert (=> b!45500 m!69445))

(declare-fun m!69447 () Bool)

(assert (=> b!45495 m!69447))

(declare-fun m!69449 () Bool)

(assert (=> b!45495 m!69449))

(declare-fun m!69451 () Bool)

(assert (=> b!45495 m!69451))

(declare-fun m!69453 () Bool)

(assert (=> b!45508 m!69453))

(declare-fun m!69455 () Bool)

(assert (=> b!45508 m!69455))

(declare-fun m!69457 () Bool)

(assert (=> b!45508 m!69457))

(declare-fun m!69459 () Bool)

(assert (=> b!45508 m!69459))

(declare-fun m!69461 () Bool)

(assert (=> b!45508 m!69461))

(declare-fun m!69463 () Bool)

(assert (=> b!45508 m!69463))

(declare-fun m!69465 () Bool)

(assert (=> b!45508 m!69465))

(declare-fun m!69467 () Bool)

(assert (=> b!45508 m!69467))

(declare-fun m!69469 () Bool)

(assert (=> start!9164 m!69469))

(declare-fun m!69471 () Bool)

(assert (=> start!9164 m!69471))

(declare-fun m!69473 () Bool)

(assert (=> b!45502 m!69473))

(assert (=> b!45502 m!69473))

(declare-fun m!69475 () Bool)

(assert (=> b!45502 m!69475))

(declare-fun m!69477 () Bool)

(assert (=> b!45502 m!69477))

(assert (=> b!45502 m!69477))

(declare-fun m!69479 () Bool)

(assert (=> b!45502 m!69479))

(declare-fun m!69481 () Bool)

(assert (=> b!45506 m!69481))

(declare-fun m!69483 () Bool)

(assert (=> b!45507 m!69483))

(declare-fun m!69485 () Bool)

(assert (=> b!45499 m!69485))

(declare-fun m!69487 () Bool)

(assert (=> b!45494 m!69487))

(push 1)

(assert (not b!45508))

(assert (not b!45502))

(assert (not b!45494))

(assert (not b!45507))

(assert (not start!9164))

(assert (not b!45495))

(assert (not b!45500))

(assert (not b!45504))

(assert (not b!45497))

(assert (not b!45505))

(assert (not b!45499))

(assert (not b!45506))

(assert (not b!45496))

(assert (not b!45498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13240 () Bool)

(assert (=> d!13240 (= (invariant!0 (currentBit!2858 (_2!2313 lt!69817)) (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69817)))) (and (bvsge (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (bvslt (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000001000) (bvsge (currentByte!2863 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69817)))) (and (= (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (= (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69817))))))))))

(assert (=> b!45500 d!13240))

(declare-fun d!13242 () Bool)

(declare-fun size!1024 (List!534) Int)

(assert (=> d!13242 (= (length!229 lt!69814) (size!1024 lt!69814))))

(declare-fun bs!3511 () Bool)

(assert (= bs!3511 d!13242))

(declare-fun m!69687 () Bool)

(assert (=> bs!3511 m!69687))

(assert (=> b!45499 d!13242))

(declare-fun d!13244 () Bool)

(assert (=> d!13244 (= (invariant!0 (currentBit!2858 (_2!2313 lt!69817)) (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69812)))) (and (bvsge (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (bvslt (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000001000) (bvsge (currentByte!2863 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69812)))) (and (= (currentBit!2858 (_2!2313 lt!69817)) #b00000000000000000000000000000000) (= (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))))

(assert (=> b!45498 d!13244))

(declare-fun d!13246 () Bool)

(assert (=> d!13246 (= (head!353 (byteArrayBitContentToList!0 (_2!2313 lt!69817) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!649 (byteArrayBitContentToList!0 (_2!2313 lt!69817) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45502 d!13246))

(declare-fun d!13248 () Bool)

(declare-fun c!3051 () Bool)

(assert (=> d!13248 (= c!3051 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30404 () List!534)

(assert (=> d!13248 (= (byteArrayBitContentToList!0 (_2!2313 lt!69817) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30404)))

(declare-fun b!45651 () Bool)

(assert (=> b!45651 (= e!30404 Nil!531)))

(declare-fun b!45652 () Bool)

(assert (=> b!45652 (= e!30404 (Cons!530 (not (= (bvand ((_ sign_extend 24) (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2313 lt!69817) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13248 c!3051) b!45651))

(assert (= (and d!13248 (not c!3051)) b!45652))

(assert (=> b!45652 m!69419))

(declare-fun m!69689 () Bool)

(assert (=> b!45652 m!69689))

(declare-fun m!69691 () Bool)

(assert (=> b!45652 m!69691))

(assert (=> b!45502 d!13248))

(declare-fun d!13250 () Bool)

(assert (=> d!13250 (= (head!353 (bitStreamReadBitsIntoList!0 (_2!2313 lt!69817) (_1!2314 lt!69819) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!649 (bitStreamReadBitsIntoList!0 (_2!2313 lt!69817) (_1!2314 lt!69819) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45502 d!13250))

(declare-fun b!45661 () Bool)

(declare-datatypes ((tuple2!4460 0))(
  ( (tuple2!4461 (_1!2323 List!534) (_2!2323 BitStream!1786)) )
))
(declare-fun e!30410 () tuple2!4460)

(assert (=> b!45661 (= e!30410 (tuple2!4461 Nil!531 (_1!2314 lt!69819)))))

(declare-datatypes ((tuple2!4462 0))(
  ( (tuple2!4463 (_1!2324 Bool) (_2!2324 BitStream!1786)) )
))
(declare-fun lt!69998 () tuple2!4462)

(declare-fun lt!70000 () (_ BitVec 64))

(declare-fun b!45662 () Bool)

(assert (=> b!45662 (= e!30410 (tuple2!4461 (Cons!530 (_1!2324 lt!69998) (bitStreamReadBitsIntoList!0 (_2!2313 lt!69817) (_2!2324 lt!69998) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!70000))) (_2!2324 lt!69998)))))

(declare-fun readBit!0 (BitStream!1786) tuple2!4462)

(assert (=> b!45662 (= lt!69998 (readBit!0 (_1!2314 lt!69819)))))

(assert (=> b!45662 (= lt!70000 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13252 () Bool)

(declare-fun e!30409 () Bool)

(assert (=> d!13252 e!30409))

(declare-fun c!3056 () Bool)

(assert (=> d!13252 (= c!3056 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!69999 () List!534)

(assert (=> d!13252 (= lt!69999 (_1!2323 e!30410))))

(declare-fun c!3057 () Bool)

(assert (=> d!13252 (= c!3057 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13252 (= (bitStreamReadBitsIntoList!0 (_2!2313 lt!69817) (_1!2314 lt!69819) #b0000000000000000000000000000000000000000000000000000000000000001) lt!69999)))

(declare-fun b!45663 () Bool)

(declare-fun isEmpty!132 (List!534) Bool)

(assert (=> b!45663 (= e!30409 (isEmpty!132 lt!69999))))

(declare-fun b!45664 () Bool)

(assert (=> b!45664 (= e!30409 (> (length!229 lt!69999) 0))))

(assert (= (and d!13252 c!3057) b!45661))

(assert (= (and d!13252 (not c!3057)) b!45662))

(assert (= (and d!13252 c!3056) b!45663))

(assert (= (and d!13252 (not c!3056)) b!45664))

(declare-fun m!69693 () Bool)

(assert (=> b!45662 m!69693))

(declare-fun m!69695 () Bool)

(assert (=> b!45662 m!69695))

(declare-fun m!69697 () Bool)

(assert (=> b!45663 m!69697))

(declare-fun m!69699 () Bool)

(assert (=> b!45664 m!69699))

(assert (=> b!45502 d!13252))

(declare-fun d!13254 () Bool)

(declare-fun e!30419 () Bool)

(assert (=> d!13254 e!30419))

(declare-fun res!38639 () Bool)

(assert (=> d!13254 (=> (not res!38639) (not e!30419))))

(declare-fun lt!70077 () (_ BitVec 64))

(declare-fun lt!70075 () (_ BitVec 64))

(declare-fun lt!70074 () (_ BitVec 64))

(assert (=> d!13254 (= res!38639 (= lt!70075 (bvsub lt!70077 lt!70074)))))

(assert (=> d!13254 (or (= (bvand lt!70077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70077 lt!70074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13254 (= lt!70074 (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817)))))))

(declare-fun lt!70078 () (_ BitVec 64))

(declare-fun lt!70076 () (_ BitVec 64))

(assert (=> d!13254 (= lt!70077 (bvmul lt!70078 lt!70076))))

(assert (=> d!13254 (or (= lt!70078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70076 (bvsdiv (bvmul lt!70078 lt!70076) lt!70078)))))

(assert (=> d!13254 (= lt!70076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13254 (= lt!70078 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))))))

(assert (=> d!13254 (= lt!70075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817)))))))

(assert (=> d!13254 (invariant!0 (currentBit!2858 (_2!2313 lt!69817)) (currentByte!2863 (_2!2313 lt!69817)) (size!1021 (buf!1370 (_2!2313 lt!69817))))))

(assert (=> d!13254 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))) lt!70075)))

(declare-fun b!45684 () Bool)

(declare-fun res!38638 () Bool)

(assert (=> b!45684 (=> (not res!38638) (not e!30419))))

(assert (=> b!45684 (= res!38638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70075))))

(declare-fun b!45685 () Bool)

(declare-fun lt!70073 () (_ BitVec 64))

(assert (=> b!45685 (= e!30419 (bvsle lt!70075 (bvmul lt!70073 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45685 (or (= lt!70073 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70073 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70073)))))

(assert (=> b!45685 (= lt!70073 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))))))

(assert (= (and d!13254 res!38639) b!45684))

(assert (= (and b!45684 res!38638) b!45685))

(declare-fun m!69727 () Bool)

(assert (=> d!13254 m!69727))

(assert (=> d!13254 m!69445))

(assert (=> b!45505 d!13254))

(declare-fun d!13258 () Bool)

(assert (=> d!13258 (= (array_inv!946 (buf!1370 thiss!1379)) (bvsge (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!45494 d!13258))

(declare-fun b!45720 () Bool)

(declare-fun e!30439 () Unit!3232)

(declare-fun lt!70162 () Unit!3232)

(assert (=> b!45720 (= e!30439 lt!70162)))

(declare-fun lt!70164 () (_ BitVec 64))

(assert (=> b!45720 (= lt!70164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70170 () (_ BitVec 64))

(assert (=> b!45720 (= lt!70170 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2269 array!2269 (_ BitVec 64) (_ BitVec 64)) Unit!3232)

(assert (=> b!45720 (= lt!70162 (arrayBitRangesEqSymmetric!0 (buf!1370 thiss!1379) (buf!1370 (_2!2313 lt!69817)) lt!70164 lt!70170))))

(declare-fun arrayBitRangesEq!0 (array!2269 array!2269 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45720 (arrayBitRangesEq!0 (buf!1370 (_2!2313 lt!69817)) (buf!1370 thiss!1379) lt!70164 lt!70170)))

(declare-fun d!13260 () Bool)

(declare-fun e!30438 () Bool)

(assert (=> d!13260 e!30438))

(declare-fun res!38655 () Bool)

(assert (=> d!13260 (=> (not res!38655) (not e!30438))))

(declare-fun lt!70154 () tuple2!4442)

(assert (=> d!13260 (= res!38655 (isPrefixOf!0 (_1!2314 lt!70154) (_2!2314 lt!70154)))))

(declare-fun lt!70157 () BitStream!1786)

(assert (=> d!13260 (= lt!70154 (tuple2!4443 lt!70157 (_2!2313 lt!69817)))))

(declare-fun lt!70168 () Unit!3232)

(declare-fun lt!70176 () Unit!3232)

(assert (=> d!13260 (= lt!70168 lt!70176)))

(assert (=> d!13260 (isPrefixOf!0 lt!70157 (_2!2313 lt!69817))))

(assert (=> d!13260 (= lt!70176 (lemmaIsPrefixTransitive!0 lt!70157 (_2!2313 lt!69817) (_2!2313 lt!69817)))))

(declare-fun lt!70177 () Unit!3232)

(declare-fun lt!70155 () Unit!3232)

(assert (=> d!13260 (= lt!70177 lt!70155)))

(assert (=> d!13260 (isPrefixOf!0 lt!70157 (_2!2313 lt!69817))))

(assert (=> d!13260 (= lt!70155 (lemmaIsPrefixTransitive!0 lt!70157 thiss!1379 (_2!2313 lt!69817)))))

(declare-fun lt!70175 () Unit!3232)

(assert (=> d!13260 (= lt!70175 e!30439)))

(declare-fun c!3072 () Bool)

(assert (=> d!13260 (= c!3072 (not (= (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!70160 () Unit!3232)

(declare-fun lt!70166 () Unit!3232)

(assert (=> d!13260 (= lt!70160 lt!70166)))

(assert (=> d!13260 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69817))))

(assert (=> d!13260 (= lt!70166 (lemmaIsPrefixRefl!0 (_2!2313 lt!69817)))))

(declare-fun lt!70161 () Unit!3232)

(declare-fun lt!70165 () Unit!3232)

(assert (=> d!13260 (= lt!70161 lt!70165)))

(assert (=> d!13260 (= lt!70165 (lemmaIsPrefixRefl!0 (_2!2313 lt!69817)))))

(declare-fun lt!70156 () Unit!3232)

(declare-fun lt!70172 () Unit!3232)

(assert (=> d!13260 (= lt!70156 lt!70172)))

(assert (=> d!13260 (isPrefixOf!0 lt!70157 lt!70157)))

(assert (=> d!13260 (= lt!70172 (lemmaIsPrefixRefl!0 lt!70157))))

(declare-fun lt!70159 () Unit!3232)

(declare-fun lt!70163 () Unit!3232)

(assert (=> d!13260 (= lt!70159 lt!70163)))

(assert (=> d!13260 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13260 (= lt!70163 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13260 (= lt!70157 (BitStream!1787 (buf!1370 (_2!2313 lt!69817)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(assert (=> d!13260 (isPrefixOf!0 thiss!1379 (_2!2313 lt!69817))))

(assert (=> d!13260 (= (reader!0 thiss!1379 (_2!2313 lt!69817)) lt!70154)))

(declare-fun lt!70174 () (_ BitVec 64))

(declare-fun lt!70158 () (_ BitVec 64))

(declare-fun b!45721 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1786 (_ BitVec 64)) BitStream!1786)

(assert (=> b!45721 (= e!30438 (= (_1!2314 lt!70154) (withMovedBitIndex!0 (_2!2314 lt!70154) (bvsub lt!70158 lt!70174))))))

(assert (=> b!45721 (or (= (bvand lt!70158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70158 lt!70174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45721 (= lt!70174 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(assert (=> b!45721 (= lt!70158 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(declare-fun b!45722 () Bool)

(declare-fun res!38654 () Bool)

(assert (=> b!45722 (=> (not res!38654) (not e!30438))))

(assert (=> b!45722 (= res!38654 (isPrefixOf!0 (_2!2314 lt!70154) (_2!2313 lt!69817)))))

(declare-fun b!45723 () Bool)

(declare-fun Unit!3247 () Unit!3232)

(assert (=> b!45723 (= e!30439 Unit!3247)))

(declare-fun b!45724 () Bool)

(declare-fun res!38656 () Bool)

(assert (=> b!45724 (=> (not res!38656) (not e!30438))))

(assert (=> b!45724 (= res!38656 (isPrefixOf!0 (_1!2314 lt!70154) thiss!1379))))

(assert (= (and d!13260 c!3072) b!45720))

(assert (= (and d!13260 (not c!3072)) b!45723))

(assert (= (and d!13260 res!38655) b!45724))

(assert (= (and b!45724 res!38656) b!45722))

(assert (= (and b!45722 res!38654) b!45721))

(declare-fun m!69777 () Bool)

(assert (=> b!45721 m!69777))

(assert (=> b!45721 m!69443))

(assert (=> b!45721 m!69451))

(assert (=> b!45720 m!69451))

(declare-fun m!69779 () Bool)

(assert (=> b!45720 m!69779))

(declare-fun m!69781 () Bool)

(assert (=> b!45720 m!69781))

(declare-fun m!69783 () Bool)

(assert (=> b!45722 m!69783))

(declare-fun m!69785 () Bool)

(assert (=> b!45724 m!69785))

(declare-fun m!69787 () Bool)

(assert (=> d!13260 m!69787))

(declare-fun m!69789 () Bool)

(assert (=> d!13260 m!69789))

(declare-fun m!69791 () Bool)

(assert (=> d!13260 m!69791))

(assert (=> d!13260 m!69449))

(assert (=> d!13260 m!69447))

(declare-fun m!69793 () Bool)

(assert (=> d!13260 m!69793))

(assert (=> d!13260 m!69425))

(declare-fun m!69795 () Bool)

(assert (=> d!13260 m!69795))

(declare-fun m!69797 () Bool)

(assert (=> d!13260 m!69797))

(declare-fun m!69799 () Bool)

(assert (=> d!13260 m!69799))

(declare-fun m!69801 () Bool)

(assert (=> d!13260 m!69801))

(assert (=> b!45504 d!13260))

(declare-fun d!13276 () Bool)

(declare-fun res!38674 () Bool)

(declare-fun e!30449 () Bool)

(assert (=> d!13276 (=> (not res!38674) (not e!30449))))

(assert (=> d!13276 (= res!38674 (= (size!1021 (buf!1370 (_2!2313 lt!69817))) (size!1021 (buf!1370 (_2!2313 lt!69812)))))))

(assert (=> d!13276 (= (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69812)) e!30449)))

(declare-fun b!45743 () Bool)

(declare-fun res!38673 () Bool)

(assert (=> b!45743 (=> (not res!38673) (not e!30449))))

(assert (=> b!45743 (= res!38673 (bvsle (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))) (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812)))))))

(declare-fun b!45744 () Bool)

(declare-fun e!30450 () Bool)

(assert (=> b!45744 (= e!30449 e!30450)))

(declare-fun res!38675 () Bool)

(assert (=> b!45744 (=> res!38675 e!30450)))

(assert (=> b!45744 (= res!38675 (= (size!1021 (buf!1370 (_2!2313 lt!69817))) #b00000000000000000000000000000000))))

(declare-fun b!45745 () Bool)

(assert (=> b!45745 (= e!30450 (arrayBitRangesEq!0 (buf!1370 (_2!2313 lt!69817)) (buf!1370 (_2!2313 lt!69812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817)))))))

(assert (= (and d!13276 res!38674) b!45743))

(assert (= (and b!45743 res!38673) b!45744))

(assert (= (and b!45744 (not res!38675)) b!45745))

(assert (=> b!45743 m!69443))

(assert (=> b!45743 m!69483))

(assert (=> b!45745 m!69443))

(assert (=> b!45745 m!69443))

(declare-fun m!69805 () Bool)

(assert (=> b!45745 m!69805))

(assert (=> b!45504 d!13276))

(declare-fun d!13280 () Bool)

(assert (=> d!13280 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3514 () Bool)

(assert (= bs!3514 d!13280))

(declare-fun m!69809 () Bool)

(assert (=> bs!3514 m!69809))

(assert (=> b!45504 d!13280))

(declare-fun d!13284 () Bool)

(assert (=> d!13284 (isPrefixOf!0 thiss!1379 (_2!2313 lt!69812))))

(declare-fun lt!70201 () Unit!3232)

(declare-fun choose!30 (BitStream!1786 BitStream!1786 BitStream!1786) Unit!3232)

(assert (=> d!13284 (= lt!70201 (choose!30 thiss!1379 (_2!2313 lt!69817) (_2!2313 lt!69812)))))

(assert (=> d!13284 (isPrefixOf!0 thiss!1379 (_2!2313 lt!69817))))

(assert (=> d!13284 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2313 lt!69817) (_2!2313 lt!69812)) lt!70201)))

(declare-fun bs!3517 () Bool)

(assert (= bs!3517 d!13284))

(assert (=> bs!3517 m!69431))

(declare-fun m!69817 () Bool)

(assert (=> bs!3517 m!69817))

(assert (=> bs!3517 m!69425))

(assert (=> b!45504 d!13284))

(declare-fun d!13290 () Bool)

(declare-fun res!38682 () Bool)

(declare-fun e!30454 () Bool)

(assert (=> d!13290 (=> (not res!38682) (not e!30454))))

(assert (=> d!13290 (= res!38682 (= (size!1021 (buf!1370 thiss!1379)) (size!1021 (buf!1370 (_2!2313 lt!69812)))))))

(assert (=> d!13290 (= (isPrefixOf!0 thiss!1379 (_2!2313 lt!69812)) e!30454)))

(declare-fun b!45751 () Bool)

(declare-fun res!38681 () Bool)

(assert (=> b!45751 (=> (not res!38681) (not e!30454))))

(assert (=> b!45751 (= res!38681 (bvsle (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)) (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812)))))))

(declare-fun b!45752 () Bool)

(declare-fun e!30455 () Bool)

(assert (=> b!45752 (= e!30454 e!30455)))

(declare-fun res!38683 () Bool)

(assert (=> b!45752 (=> res!38683 e!30455)))

(assert (=> b!45752 (= res!38683 (= (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45753 () Bool)

(assert (=> b!45753 (= e!30455 (arrayBitRangesEq!0 (buf!1370 thiss!1379) (buf!1370 (_2!2313 lt!69812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(assert (= (and d!13290 res!38682) b!45751))

(assert (= (and b!45751 res!38681) b!45752))

(assert (= (and b!45752 (not res!38683)) b!45753))

(assert (=> b!45751 m!69451))

(assert (=> b!45751 m!69483))

(assert (=> b!45753 m!69451))

(assert (=> b!45753 m!69451))

(declare-fun m!69819 () Bool)

(assert (=> b!45753 m!69819))

(assert (=> b!45504 d!13290))

(declare-fun d!13292 () Bool)

(assert (=> d!13292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70207 () Unit!3232)

(declare-fun choose!9 (BitStream!1786 array!2269 (_ BitVec 64) BitStream!1786) Unit!3232)

(assert (=> d!13292 (= lt!70207 (choose!9 thiss!1379 (buf!1370 (_2!2313 lt!69817)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1787 (buf!1370 (_2!2313 lt!69817)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(assert (=> d!13292 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1370 (_2!2313 lt!69817)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70207)))

(declare-fun bs!3519 () Bool)

(assert (= bs!3519 d!13292))

(assert (=> bs!3519 m!69427))

(declare-fun m!69823 () Bool)

(assert (=> bs!3519 m!69823))

(assert (=> b!45504 d!13292))

(declare-fun b!45865 () Bool)

(declare-fun e!30509 () Bool)

(declare-fun lt!70531 () tuple2!4442)

(declare-fun lt!70538 () tuple2!4440)

(assert (=> b!45865 (= e!30509 (= (bitStreamReadBitsIntoList!0 (_2!2313 lt!70538) (_1!2314 lt!70531) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2313 lt!70538) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45865 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45865 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70561 () Unit!3232)

(declare-fun lt!70545 () Unit!3232)

(assert (=> b!45865 (= lt!70561 lt!70545)))

(declare-fun lt!70553 () (_ BitVec 64))

(assert (=> b!45865 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!70538)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!70553)))

(assert (=> b!45865 (= lt!70545 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!70538)) lt!70553))))

(declare-fun e!30508 () Bool)

(assert (=> b!45865 e!30508))

(declare-fun res!38756 () Bool)

(assert (=> b!45865 (=> (not res!38756) (not e!30508))))

(assert (=> b!45865 (= res!38756 (and (= (size!1021 (buf!1370 (_2!2313 lt!69817))) (size!1021 (buf!1370 (_2!2313 lt!70538)))) (bvsge lt!70553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45865 (= lt!70553 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45865 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45865 (= lt!70531 (reader!0 (_2!2313 lt!69817) (_2!2313 lt!70538)))))

(declare-fun b!45866 () Bool)

(assert (=> b!45866 (= e!30508 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!70553))))

(declare-fun b!45867 () Bool)

(declare-fun res!38753 () Bool)

(assert (=> b!45867 (=> (not res!38753) (not e!30509))))

(assert (=> b!45867 (= res!38753 (= (size!1021 (buf!1370 (_2!2313 lt!70538))) (size!1021 (buf!1370 (_2!2313 lt!69817)))))))

(declare-fun b!45868 () Bool)

(declare-fun res!38752 () Bool)

(assert (=> b!45868 (=> (not res!38752) (not e!30509))))

(assert (=> b!45868 (= res!38752 (invariant!0 (currentBit!2858 (_2!2313 lt!70538)) (currentByte!2863 (_2!2313 lt!70538)) (size!1021 (buf!1370 (_2!2313 lt!70538)))))))

(declare-fun c!3094 () Bool)

(declare-fun call!549 () tuple2!4442)

(declare-fun lt!70530 () tuple2!4440)

(declare-fun bm!546 () Bool)

(declare-fun lt!70565 () tuple2!4440)

(assert (=> bm!546 (= call!549 (reader!0 (ite c!3094 (_2!2313 lt!70565) (_2!2313 lt!69817)) (ite c!3094 (_2!2313 lt!70530) (_2!2313 lt!69817))))))

(declare-fun b!45870 () Bool)

(declare-fun e!30507 () tuple2!4440)

(declare-fun Unit!3249 () Unit!3232)

(assert (=> b!45870 (= e!30507 (tuple2!4441 Unit!3249 (_2!2313 lt!70530)))))

(assert (=> b!45870 (= lt!70565 (appendBitFromByte!0 (_2!2313 lt!69817) (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!70536 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70536 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70535 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70535 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70543 () Unit!3232)

(assert (=> b!45870 (= lt!70543 (validateOffsetBitsIneqLemma!0 (_2!2313 lt!69817) (_2!2313 lt!70565) lt!70536 lt!70535))))

(assert (=> b!45870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!70565)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!70565))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!70565))) (bvsub lt!70536 lt!70535))))

(declare-fun lt!70537 () Unit!3232)

(assert (=> b!45870 (= lt!70537 lt!70543)))

(declare-fun lt!70556 () tuple2!4442)

(assert (=> b!45870 (= lt!70556 (reader!0 (_2!2313 lt!69817) (_2!2313 lt!70565)))))

(declare-fun lt!70527 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70527 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70541 () Unit!3232)

(assert (=> b!45870 (= lt!70541 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!70565)) lt!70527))))

(assert (=> b!45870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!70565)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!70527)))

(declare-fun lt!70559 () Unit!3232)

(assert (=> b!45870 (= lt!70559 lt!70541)))

(assert (=> b!45870 (= (head!353 (byteArrayBitContentToList!0 (_2!2313 lt!70565) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!353 (bitStreamReadBitsIntoList!0 (_2!2313 lt!70565) (_1!2314 lt!70556) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70564 () Unit!3232)

(declare-fun Unit!3250 () Unit!3232)

(assert (=> b!45870 (= lt!70564 Unit!3250)))

(assert (=> b!45870 (= lt!70530 (appendBitsMSBFirstLoop!0 (_2!2313 lt!70565) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!70558 () Unit!3232)

(assert (=> b!45870 (= lt!70558 (lemmaIsPrefixTransitive!0 (_2!2313 lt!69817) (_2!2313 lt!70565) (_2!2313 lt!70530)))))

(assert (=> b!45870 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!70530))))

(declare-fun lt!70563 () Unit!3232)

(assert (=> b!45870 (= lt!70563 lt!70558)))

(assert (=> b!45870 (= (size!1021 (buf!1370 (_2!2313 lt!70530))) (size!1021 (buf!1370 (_2!2313 lt!69817))))))

(declare-fun lt!70548 () Unit!3232)

(declare-fun Unit!3251 () Unit!3232)

(assert (=> b!45870 (= lt!70548 Unit!3251)))

(assert (=> b!45870 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70530))) (currentByte!2863 (_2!2313 lt!70530)) (currentBit!2858 (_2!2313 lt!70530))) (bvsub (bvadd (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70534 () Unit!3232)

(declare-fun Unit!3252 () Unit!3232)

(assert (=> b!45870 (= lt!70534 Unit!3252)))

(assert (=> b!45870 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70530))) (currentByte!2863 (_2!2313 lt!70530)) (currentBit!2858 (_2!2313 lt!70530))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70565))) (currentByte!2863 (_2!2313 lt!70565)) (currentBit!2858 (_2!2313 lt!70565))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70566 () Unit!3232)

(declare-fun Unit!3253 () Unit!3232)

(assert (=> b!45870 (= lt!70566 Unit!3253)))

(declare-fun lt!70547 () tuple2!4442)

(assert (=> b!45870 (= lt!70547 (reader!0 (_2!2313 lt!69817) (_2!2313 lt!70530)))))

(declare-fun lt!70550 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70550 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70526 () Unit!3232)

(assert (=> b!45870 (= lt!70526 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!70530)) lt!70550))))

(assert (=> b!45870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!70530)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!70550)))

(declare-fun lt!70549 () Unit!3232)

(assert (=> b!45870 (= lt!70549 lt!70526)))

(declare-fun lt!70551 () tuple2!4442)

(assert (=> b!45870 (= lt!70551 call!549)))

(declare-fun lt!70525 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70525 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70544 () Unit!3232)

(assert (=> b!45870 (= lt!70544 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!70565) (buf!1370 (_2!2313 lt!70530)) lt!70525))))

(assert (=> b!45870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!70530)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!70565))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!70565))) lt!70525)))

(declare-fun lt!70552 () Unit!3232)

(assert (=> b!45870 (= lt!70552 lt!70544)))

(declare-fun lt!70533 () List!534)

(assert (=> b!45870 (= lt!70533 (byteArrayBitContentToList!0 (_2!2313 lt!70530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70529 () List!534)

(assert (=> b!45870 (= lt!70529 (byteArrayBitContentToList!0 (_2!2313 lt!70530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70567 () List!534)

(assert (=> b!45870 (= lt!70567 (bitStreamReadBitsIntoList!0 (_2!2313 lt!70530) (_1!2314 lt!70547) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70532 () List!534)

(assert (=> b!45870 (= lt!70532 (bitStreamReadBitsIntoList!0 (_2!2313 lt!70530) (_1!2314 lt!70551) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70528 () (_ BitVec 64))

(assert (=> b!45870 (= lt!70528 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70557 () Unit!3232)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1786 BitStream!1786 BitStream!1786 BitStream!1786 (_ BitVec 64) List!534) Unit!3232)

(assert (=> b!45870 (= lt!70557 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2313 lt!70530) (_2!2313 lt!70530) (_1!2314 lt!70547) (_1!2314 lt!70551) lt!70528 lt!70567))))

(declare-fun tail!221 (List!534) List!534)

(assert (=> b!45870 (= (bitStreamReadBitsIntoList!0 (_2!2313 lt!70530) (_1!2314 lt!70551) (bvsub lt!70528 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!221 lt!70567))))

(declare-fun lt!70542 () Unit!3232)

(assert (=> b!45870 (= lt!70542 lt!70557)))

(declare-fun lt!70546 () (_ BitVec 64))

(declare-fun lt!70540 () Unit!3232)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2269 array!2269 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3232)

(assert (=> b!45870 (= lt!70540 (arrayBitRangesEqImpliesEq!0 (buf!1370 (_2!2313 lt!70565)) (buf!1370 (_2!2313 lt!70530)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!70546 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70565))) (currentByte!2863 (_2!2313 lt!70565)) (currentBit!2858 (_2!2313 lt!70565)))))))

(declare-fun bitAt!0 (array!2269 (_ BitVec 64)) Bool)

(assert (=> b!45870 (= (bitAt!0 (buf!1370 (_2!2313 lt!70565)) lt!70546) (bitAt!0 (buf!1370 (_2!2313 lt!70530)) lt!70546))))

(declare-fun lt!70560 () Unit!3232)

(assert (=> b!45870 (= lt!70560 lt!70540)))

(declare-fun d!13296 () Bool)

(assert (=> d!13296 e!30509))

(declare-fun res!38757 () Bool)

(assert (=> d!13296 (=> (not res!38757) (not e!30509))))

(declare-fun lt!70562 () (_ BitVec 64))

(assert (=> d!13296 (= res!38757 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70538))) (currentByte!2863 (_2!2313 lt!70538)) (currentBit!2858 (_2!2313 lt!70538))) (bvsub lt!70562 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13296 (or (= (bvand lt!70562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70562 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70568 () (_ BitVec 64))

(assert (=> d!13296 (= lt!70562 (bvadd lt!70568 to!314))))

(assert (=> d!13296 (or (not (= (bvand lt!70568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!70568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!70568 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13296 (= lt!70568 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(assert (=> d!13296 (= lt!70538 e!30507)))

(assert (=> d!13296 (= c!3094 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!70555 () Unit!3232)

(declare-fun lt!70539 () Unit!3232)

(assert (=> d!13296 (= lt!70555 lt!70539)))

(assert (=> d!13296 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69817))))

(assert (=> d!13296 (= lt!70539 (lemmaIsPrefixRefl!0 (_2!2313 lt!69817)))))

(assert (=> d!13296 (= lt!70546 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(assert (=> d!13296 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13296 (= (appendBitsMSBFirstLoop!0 (_2!2313 lt!69817) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!70538)))

(declare-fun b!45869 () Bool)

(declare-fun res!38754 () Bool)

(assert (=> b!45869 (=> (not res!38754) (not e!30509))))

(assert (=> b!45869 (= res!38754 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!70538)))))

(declare-fun b!45871 () Bool)

(declare-fun Unit!3254 () Unit!3232)

(assert (=> b!45871 (= e!30507 (tuple2!4441 Unit!3254 (_2!2313 lt!69817)))))

(assert (=> b!45871 (= (size!1021 (buf!1370 (_2!2313 lt!69817))) (size!1021 (buf!1370 (_2!2313 lt!69817))))))

(declare-fun lt!70554 () Unit!3232)

(declare-fun Unit!3255 () Unit!3232)

(assert (=> b!45871 (= lt!70554 Unit!3255)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1786 array!2269 array!2269 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4464 0))(
  ( (tuple2!4465 (_1!2325 array!2269) (_2!2325 BitStream!1786)) )
))
(declare-fun readBits!0 (BitStream!1786 (_ BitVec 64)) tuple2!4464)

(assert (=> b!45871 (checkByteArrayBitContent!0 (_2!2313 lt!69817) srcBuffer!2 (_1!2325 (readBits!0 (_1!2314 call!549) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!45872 () Bool)

(declare-fun res!38755 () Bool)

(assert (=> b!45872 (=> (not res!38755) (not e!30509))))

(assert (=> b!45872 (= res!38755 (= (size!1021 (buf!1370 (_2!2313 lt!69817))) (size!1021 (buf!1370 (_2!2313 lt!70538)))))))

(assert (= (and d!13296 c!3094) b!45870))

(assert (= (and d!13296 (not c!3094)) b!45871))

(assert (= (or b!45870 b!45871) bm!546))

(assert (= (and d!13296 res!38757) b!45868))

(assert (= (and b!45868 res!38752) b!45872))

(assert (= (and b!45872 res!38755) b!45869))

(assert (= (and b!45869 res!38754) b!45867))

(assert (= (and b!45867 res!38753) b!45865))

(assert (= (and b!45865 res!38756) b!45866))

(declare-fun m!69949 () Bool)

(assert (=> b!45871 m!69949))

(declare-fun m!69951 () Bool)

(assert (=> b!45871 m!69951))

(declare-fun m!69953 () Bool)

(assert (=> b!45865 m!69953))

(declare-fun m!69955 () Bool)

(assert (=> b!45865 m!69955))

(declare-fun m!69957 () Bool)

(assert (=> b!45865 m!69957))

(declare-fun m!69959 () Bool)

(assert (=> b!45865 m!69959))

(declare-fun m!69961 () Bool)

(assert (=> b!45865 m!69961))

(declare-fun m!69963 () Bool)

(assert (=> bm!546 m!69963))

(declare-fun m!69965 () Bool)

(assert (=> d!13296 m!69965))

(assert (=> d!13296 m!69443))

(assert (=> d!13296 m!69799))

(assert (=> d!13296 m!69797))

(declare-fun m!69967 () Bool)

(assert (=> b!45866 m!69967))

(declare-fun m!69969 () Bool)

(assert (=> b!45870 m!69969))

(declare-fun m!69971 () Bool)

(assert (=> b!45870 m!69971))

(declare-fun m!69973 () Bool)

(assert (=> b!45870 m!69973))

(declare-fun m!69975 () Bool)

(assert (=> b!45870 m!69975))

(declare-fun m!69977 () Bool)

(assert (=> b!45870 m!69977))

(declare-fun m!69979 () Bool)

(assert (=> b!45870 m!69979))

(declare-fun m!69981 () Bool)

(assert (=> b!45870 m!69981))

(declare-fun m!69983 () Bool)

(assert (=> b!45870 m!69983))

(declare-fun m!69987 () Bool)

(assert (=> b!45870 m!69987))

(declare-fun m!69989 () Bool)

(assert (=> b!45870 m!69989))

(declare-fun m!69997 () Bool)

(assert (=> b!45870 m!69997))

(declare-fun m!69999 () Bool)

(assert (=> b!45870 m!69999))

(assert (=> b!45870 m!69973))

(declare-fun m!70003 () Bool)

(assert (=> b!45870 m!70003))

(declare-fun m!70005 () Bool)

(assert (=> b!45870 m!70005))

(declare-fun m!70009 () Bool)

(assert (=> b!45870 m!70009))

(assert (=> b!45870 m!69443))

(declare-fun m!70015 () Bool)

(assert (=> b!45870 m!70015))

(assert (=> b!45870 m!69997))

(declare-fun m!70023 () Bool)

(assert (=> b!45870 m!70023))

(declare-fun m!70025 () Bool)

(assert (=> b!45870 m!70025))

(declare-fun m!70029 () Bool)

(assert (=> b!45870 m!70029))

(declare-fun m!70031 () Bool)

(assert (=> b!45870 m!70031))

(declare-fun m!70035 () Bool)

(assert (=> b!45870 m!70035))

(declare-fun m!70039 () Bool)

(assert (=> b!45870 m!70039))

(declare-fun m!70041 () Bool)

(assert (=> b!45870 m!70041))

(assert (=> b!45870 m!70005))

(declare-fun m!70047 () Bool)

(assert (=> b!45870 m!70047))

(declare-fun m!70051 () Bool)

(assert (=> b!45870 m!70051))

(assert (=> b!45870 m!69983))

(declare-fun m!70055 () Bool)

(assert (=> b!45870 m!70055))

(declare-fun m!70059 () Bool)

(assert (=> b!45870 m!70059))

(declare-fun m!70063 () Bool)

(assert (=> b!45870 m!70063))

(declare-fun m!70067 () Bool)

(assert (=> b!45870 m!70067))

(declare-fun m!70069 () Bool)

(assert (=> b!45870 m!70069))

(declare-fun m!70073 () Bool)

(assert (=> b!45870 m!70073))

(declare-fun m!70075 () Bool)

(assert (=> b!45869 m!70075))

(declare-fun m!70079 () Bool)

(assert (=> b!45868 m!70079))

(assert (=> b!45504 d!13296))

(declare-fun d!13348 () Bool)

(assert (=> d!13348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3528 () Bool)

(assert (= bs!3528 d!13348))

(declare-fun m!70097 () Bool)

(assert (=> bs!3528 m!70097))

(assert (=> b!45497 d!13348))

(declare-fun d!13350 () Bool)

(assert (=> d!13350 (= (array_inv!946 srcBuffer!2) (bvsge (size!1021 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9164 d!13350))

(declare-fun d!13352 () Bool)

(assert (=> d!13352 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2858 thiss!1379) (currentByte!2863 thiss!1379) (size!1021 (buf!1370 thiss!1379))))))

(declare-fun bs!3529 () Bool)

(assert (= bs!3529 d!13352))

(declare-fun m!70123 () Bool)

(assert (=> bs!3529 m!70123))

(assert (=> start!9164 d!13352))

(declare-fun d!13356 () Bool)

(assert (=> d!13356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!70613 () Unit!3232)

(assert (=> d!13356 (= lt!70613 (choose!9 thiss!1379 (buf!1370 (_2!2313 lt!69812)) (bvsub to!314 i!635) (BitStream!1787 (buf!1370 (_2!2313 lt!69812)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(assert (=> d!13356 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1370 (_2!2313 lt!69812)) (bvsub to!314 i!635)) lt!70613)))

(declare-fun bs!3530 () Bool)

(assert (= bs!3530 d!13356))

(assert (=> bs!3530 m!69455))

(declare-fun m!70127 () Bool)

(assert (=> bs!3530 m!70127))

(assert (=> b!45508 d!13356))

(declare-fun d!13360 () Bool)

(assert (=> d!13360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!69826) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817)))) lt!69826))))

(declare-fun bs!3531 () Bool)

(assert (= bs!3531 d!13360))

(declare-fun m!70129 () Bool)

(assert (=> bs!3531 m!70129))

(assert (=> b!45508 d!13360))

(declare-fun b!45884 () Bool)

(declare-fun e!30516 () tuple2!4460)

(assert (=> b!45884 (= e!30516 (tuple2!4461 Nil!531 (_1!2314 lt!69816)))))

(declare-fun lt!70614 () tuple2!4462)

(declare-fun lt!70616 () (_ BitVec 64))

(declare-fun b!45885 () Bool)

(assert (=> b!45885 (= e!30516 (tuple2!4461 (Cons!530 (_1!2324 lt!70614) (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_2!2324 lt!70614) (bvsub lt!69826 lt!70616))) (_2!2324 lt!70614)))))

(assert (=> b!45885 (= lt!70614 (readBit!0 (_1!2314 lt!69816)))))

(assert (=> b!45885 (= lt!70616 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13362 () Bool)

(declare-fun e!30515 () Bool)

(assert (=> d!13362 e!30515))

(declare-fun c!3096 () Bool)

(assert (=> d!13362 (= c!3096 (= lt!69826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70615 () List!534)

(assert (=> d!13362 (= lt!70615 (_1!2323 e!30516))))

(declare-fun c!3097 () Bool)

(assert (=> d!13362 (= c!3097 (= lt!69826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13362 (bvsge lt!69826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13362 (= (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_1!2314 lt!69816) lt!69826) lt!70615)))

(declare-fun b!45886 () Bool)

(assert (=> b!45886 (= e!30515 (isEmpty!132 lt!70615))))

(declare-fun b!45887 () Bool)

(assert (=> b!45887 (= e!30515 (> (length!229 lt!70615) 0))))

(assert (= (and d!13362 c!3097) b!45884))

(assert (= (and d!13362 (not c!3097)) b!45885))

(assert (= (and d!13362 c!3096) b!45886))

(assert (= (and d!13362 (not c!3096)) b!45887))

(declare-fun m!70131 () Bool)

(assert (=> b!45885 m!70131))

(declare-fun m!70133 () Bool)

(assert (=> b!45885 m!70133))

(declare-fun m!70135 () Bool)

(assert (=> b!45886 m!70135))

(declare-fun m!70137 () Bool)

(assert (=> b!45887 m!70137))

(assert (=> b!45508 d!13362))

(declare-fun b!45888 () Bool)

(declare-fun e!30518 () Unit!3232)

(declare-fun lt!70625 () Unit!3232)

(assert (=> b!45888 (= e!30518 lt!70625)))

(declare-fun lt!70627 () (_ BitVec 64))

(assert (=> b!45888 (= lt!70627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70631 () (_ BitVec 64))

(assert (=> b!45888 (= lt!70631 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(assert (=> b!45888 (= lt!70625 (arrayBitRangesEqSymmetric!0 (buf!1370 (_2!2313 lt!69817)) (buf!1370 (_2!2313 lt!69812)) lt!70627 lt!70631))))

(assert (=> b!45888 (arrayBitRangesEq!0 (buf!1370 (_2!2313 lt!69812)) (buf!1370 (_2!2313 lt!69817)) lt!70627 lt!70631)))

(declare-fun d!13364 () Bool)

(declare-fun e!30517 () Bool)

(assert (=> d!13364 e!30517))

(declare-fun res!38768 () Bool)

(assert (=> d!13364 (=> (not res!38768) (not e!30517))))

(declare-fun lt!70617 () tuple2!4442)

(assert (=> d!13364 (= res!38768 (isPrefixOf!0 (_1!2314 lt!70617) (_2!2314 lt!70617)))))

(declare-fun lt!70620 () BitStream!1786)

(assert (=> d!13364 (= lt!70617 (tuple2!4443 lt!70620 (_2!2313 lt!69812)))))

(declare-fun lt!70630 () Unit!3232)

(declare-fun lt!70635 () Unit!3232)

(assert (=> d!13364 (= lt!70630 lt!70635)))

(assert (=> d!13364 (isPrefixOf!0 lt!70620 (_2!2313 lt!69812))))

(assert (=> d!13364 (= lt!70635 (lemmaIsPrefixTransitive!0 lt!70620 (_2!2313 lt!69812) (_2!2313 lt!69812)))))

(declare-fun lt!70636 () Unit!3232)

(declare-fun lt!70618 () Unit!3232)

(assert (=> d!13364 (= lt!70636 lt!70618)))

(assert (=> d!13364 (isPrefixOf!0 lt!70620 (_2!2313 lt!69812))))

(assert (=> d!13364 (= lt!70618 (lemmaIsPrefixTransitive!0 lt!70620 (_2!2313 lt!69817) (_2!2313 lt!69812)))))

(declare-fun lt!70634 () Unit!3232)

(assert (=> d!13364 (= lt!70634 e!30518)))

(declare-fun c!3098 () Bool)

(assert (=> d!13364 (= c!3098 (not (= (size!1021 (buf!1370 (_2!2313 lt!69817))) #b00000000000000000000000000000000)))))

(declare-fun lt!70623 () Unit!3232)

(declare-fun lt!70629 () Unit!3232)

(assert (=> d!13364 (= lt!70623 lt!70629)))

(assert (=> d!13364 (isPrefixOf!0 (_2!2313 lt!69812) (_2!2313 lt!69812))))

(assert (=> d!13364 (= lt!70629 (lemmaIsPrefixRefl!0 (_2!2313 lt!69812)))))

(declare-fun lt!70624 () Unit!3232)

(declare-fun lt!70628 () Unit!3232)

(assert (=> d!13364 (= lt!70624 lt!70628)))

(assert (=> d!13364 (= lt!70628 (lemmaIsPrefixRefl!0 (_2!2313 lt!69812)))))

(declare-fun lt!70619 () Unit!3232)

(declare-fun lt!70632 () Unit!3232)

(assert (=> d!13364 (= lt!70619 lt!70632)))

(assert (=> d!13364 (isPrefixOf!0 lt!70620 lt!70620)))

(assert (=> d!13364 (= lt!70632 (lemmaIsPrefixRefl!0 lt!70620))))

(declare-fun lt!70622 () Unit!3232)

(declare-fun lt!70626 () Unit!3232)

(assert (=> d!13364 (= lt!70622 lt!70626)))

(assert (=> d!13364 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69817))))

(assert (=> d!13364 (= lt!70626 (lemmaIsPrefixRefl!0 (_2!2313 lt!69817)))))

(assert (=> d!13364 (= lt!70620 (BitStream!1787 (buf!1370 (_2!2313 lt!69812)) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(assert (=> d!13364 (isPrefixOf!0 (_2!2313 lt!69817) (_2!2313 lt!69812))))

(assert (=> d!13364 (= (reader!0 (_2!2313 lt!69817) (_2!2313 lt!69812)) lt!70617)))

(declare-fun b!45889 () Bool)

(declare-fun lt!70621 () (_ BitVec 64))

(declare-fun lt!70633 () (_ BitVec 64))

(assert (=> b!45889 (= e!30517 (= (_1!2314 lt!70617) (withMovedBitIndex!0 (_2!2314 lt!70617) (bvsub lt!70621 lt!70633))))))

(assert (=> b!45889 (or (= (bvand lt!70621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70621 lt!70633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45889 (= lt!70633 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812))))))

(assert (=> b!45889 (= lt!70621 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817))))))

(declare-fun b!45890 () Bool)

(declare-fun res!38767 () Bool)

(assert (=> b!45890 (=> (not res!38767) (not e!30517))))

(assert (=> b!45890 (= res!38767 (isPrefixOf!0 (_2!2314 lt!70617) (_2!2313 lt!69812)))))

(declare-fun b!45891 () Bool)

(declare-fun Unit!3257 () Unit!3232)

(assert (=> b!45891 (= e!30518 Unit!3257)))

(declare-fun b!45892 () Bool)

(declare-fun res!38769 () Bool)

(assert (=> b!45892 (=> (not res!38769) (not e!30517))))

(assert (=> b!45892 (= res!38769 (isPrefixOf!0 (_1!2314 lt!70617) (_2!2313 lt!69817)))))

(assert (= (and d!13364 c!3098) b!45888))

(assert (= (and d!13364 (not c!3098)) b!45891))

(assert (= (and d!13364 res!38768) b!45892))

(assert (= (and b!45892 res!38769) b!45890))

(assert (= (and b!45890 res!38767) b!45889))

(declare-fun m!70139 () Bool)

(assert (=> b!45889 m!70139))

(assert (=> b!45889 m!69483))

(assert (=> b!45889 m!69443))

(assert (=> b!45888 m!69443))

(declare-fun m!70141 () Bool)

(assert (=> b!45888 m!70141))

(declare-fun m!70143 () Bool)

(assert (=> b!45888 m!70143))

(declare-fun m!70145 () Bool)

(assert (=> b!45890 m!70145))

(declare-fun m!70147 () Bool)

(assert (=> b!45892 m!70147))

(declare-fun m!70149 () Bool)

(assert (=> d!13364 m!70149))

(declare-fun m!70151 () Bool)

(assert (=> d!13364 m!70151))

(declare-fun m!70153 () Bool)

(assert (=> d!13364 m!70153))

(assert (=> d!13364 m!69797))

(assert (=> d!13364 m!69799))

(declare-fun m!70155 () Bool)

(assert (=> d!13364 m!70155))

(assert (=> d!13364 m!69439))

(declare-fun m!70157 () Bool)

(assert (=> d!13364 m!70157))

(declare-fun m!70159 () Bool)

(assert (=> d!13364 m!70159))

(declare-fun m!70161 () Bool)

(assert (=> d!13364 m!70161))

(declare-fun m!70163 () Bool)

(assert (=> d!13364 m!70163))

(assert (=> b!45508 d!13364))

(declare-fun d!13366 () Bool)

(assert (=> d!13366 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!69826)))

(declare-fun lt!70639 () Unit!3232)

(assert (=> d!13366 (= lt!70639 (choose!9 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!69812)) lt!69826 (BitStream!1787 (buf!1370 (_2!2313 lt!69812)) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817)))))))

(assert (=> d!13366 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2313 lt!69817) (buf!1370 (_2!2313 lt!69812)) lt!69826) lt!70639)))

(declare-fun bs!3533 () Bool)

(assert (= bs!3533 d!13366))

(assert (=> bs!3533 m!69453))

(declare-fun m!70167 () Bool)

(assert (=> bs!3533 m!70167))

(assert (=> b!45508 d!13366))

(declare-fun b!45893 () Bool)

(declare-fun e!30520 () Unit!3232)

(declare-fun lt!70649 () Unit!3232)

(assert (=> b!45893 (= e!30520 lt!70649)))

(declare-fun lt!70651 () (_ BitVec 64))

(assert (=> b!45893 (= lt!70651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70655 () (_ BitVec 64))

(assert (=> b!45893 (= lt!70655 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(assert (=> b!45893 (= lt!70649 (arrayBitRangesEqSymmetric!0 (buf!1370 thiss!1379) (buf!1370 (_2!2313 lt!69812)) lt!70651 lt!70655))))

(assert (=> b!45893 (arrayBitRangesEq!0 (buf!1370 (_2!2313 lt!69812)) (buf!1370 thiss!1379) lt!70651 lt!70655)))

(declare-fun d!13370 () Bool)

(declare-fun e!30519 () Bool)

(assert (=> d!13370 e!30519))

(declare-fun res!38771 () Bool)

(assert (=> d!13370 (=> (not res!38771) (not e!30519))))

(declare-fun lt!70641 () tuple2!4442)

(assert (=> d!13370 (= res!38771 (isPrefixOf!0 (_1!2314 lt!70641) (_2!2314 lt!70641)))))

(declare-fun lt!70644 () BitStream!1786)

(assert (=> d!13370 (= lt!70641 (tuple2!4443 lt!70644 (_2!2313 lt!69812)))))

(declare-fun lt!70654 () Unit!3232)

(declare-fun lt!70659 () Unit!3232)

(assert (=> d!13370 (= lt!70654 lt!70659)))

(assert (=> d!13370 (isPrefixOf!0 lt!70644 (_2!2313 lt!69812))))

(assert (=> d!13370 (= lt!70659 (lemmaIsPrefixTransitive!0 lt!70644 (_2!2313 lt!69812) (_2!2313 lt!69812)))))

(declare-fun lt!70660 () Unit!3232)

(declare-fun lt!70642 () Unit!3232)

(assert (=> d!13370 (= lt!70660 lt!70642)))

(assert (=> d!13370 (isPrefixOf!0 lt!70644 (_2!2313 lt!69812))))

(assert (=> d!13370 (= lt!70642 (lemmaIsPrefixTransitive!0 lt!70644 thiss!1379 (_2!2313 lt!69812)))))

(declare-fun lt!70658 () Unit!3232)

(assert (=> d!13370 (= lt!70658 e!30520)))

(declare-fun c!3099 () Bool)

(assert (=> d!13370 (= c!3099 (not (= (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!70647 () Unit!3232)

(declare-fun lt!70653 () Unit!3232)

(assert (=> d!13370 (= lt!70647 lt!70653)))

(assert (=> d!13370 (isPrefixOf!0 (_2!2313 lt!69812) (_2!2313 lt!69812))))

(assert (=> d!13370 (= lt!70653 (lemmaIsPrefixRefl!0 (_2!2313 lt!69812)))))

(declare-fun lt!70648 () Unit!3232)

(declare-fun lt!70652 () Unit!3232)

(assert (=> d!13370 (= lt!70648 lt!70652)))

(assert (=> d!13370 (= lt!70652 (lemmaIsPrefixRefl!0 (_2!2313 lt!69812)))))

(declare-fun lt!70643 () Unit!3232)

(declare-fun lt!70656 () Unit!3232)

(assert (=> d!13370 (= lt!70643 lt!70656)))

(assert (=> d!13370 (isPrefixOf!0 lt!70644 lt!70644)))

(assert (=> d!13370 (= lt!70656 (lemmaIsPrefixRefl!0 lt!70644))))

(declare-fun lt!70646 () Unit!3232)

(declare-fun lt!70650 () Unit!3232)

(assert (=> d!13370 (= lt!70646 lt!70650)))

(assert (=> d!13370 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13370 (= lt!70650 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13370 (= lt!70644 (BitStream!1787 (buf!1370 (_2!2313 lt!69812)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(assert (=> d!13370 (isPrefixOf!0 thiss!1379 (_2!2313 lt!69812))))

(assert (=> d!13370 (= (reader!0 thiss!1379 (_2!2313 lt!69812)) lt!70641)))

(declare-fun lt!70645 () (_ BitVec 64))

(declare-fun b!45894 () Bool)

(declare-fun lt!70657 () (_ BitVec 64))

(assert (=> b!45894 (= e!30519 (= (_1!2314 lt!70641) (withMovedBitIndex!0 (_2!2314 lt!70641) (bvsub lt!70645 lt!70657))))))

(assert (=> b!45894 (or (= (bvand lt!70645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70657 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70645 lt!70657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45894 (= lt!70657 (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812))))))

(assert (=> b!45894 (= lt!70645 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(declare-fun b!45895 () Bool)

(declare-fun res!38770 () Bool)

(assert (=> b!45895 (=> (not res!38770) (not e!30519))))

(assert (=> b!45895 (= res!38770 (isPrefixOf!0 (_2!2314 lt!70641) (_2!2313 lt!69812)))))

(declare-fun b!45896 () Bool)

(declare-fun Unit!3259 () Unit!3232)

(assert (=> b!45896 (= e!30520 Unit!3259)))

(declare-fun b!45897 () Bool)

(declare-fun res!38772 () Bool)

(assert (=> b!45897 (=> (not res!38772) (not e!30519))))

(assert (=> b!45897 (= res!38772 (isPrefixOf!0 (_1!2314 lt!70641) thiss!1379))))

(assert (= (and d!13370 c!3099) b!45893))

(assert (= (and d!13370 (not c!3099)) b!45896))

(assert (= (and d!13370 res!38771) b!45897))

(assert (= (and b!45897 res!38772) b!45895))

(assert (= (and b!45895 res!38770) b!45894))

(declare-fun m!70171 () Bool)

(assert (=> b!45894 m!70171))

(assert (=> b!45894 m!69483))

(assert (=> b!45894 m!69451))

(assert (=> b!45893 m!69451))

(declare-fun m!70173 () Bool)

(assert (=> b!45893 m!70173))

(declare-fun m!70175 () Bool)

(assert (=> b!45893 m!70175))

(declare-fun m!70177 () Bool)

(assert (=> b!45895 m!70177))

(declare-fun m!70179 () Bool)

(assert (=> b!45897 m!70179))

(declare-fun m!70181 () Bool)

(assert (=> d!13370 m!70181))

(declare-fun m!70183 () Bool)

(assert (=> d!13370 m!70183))

(declare-fun m!70185 () Bool)

(assert (=> d!13370 m!70185))

(assert (=> d!13370 m!69449))

(assert (=> d!13370 m!69447))

(declare-fun m!70187 () Bool)

(assert (=> d!13370 m!70187))

(assert (=> d!13370 m!69431))

(declare-fun m!70189 () Bool)

(assert (=> d!13370 m!70189))

(assert (=> d!13370 m!70159))

(assert (=> d!13370 m!70161))

(declare-fun m!70193 () Bool)

(assert (=> d!13370 m!70193))

(assert (=> b!45508 d!13370))

(declare-fun d!13374 () Bool)

(assert (=> d!13374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3535 () Bool)

(assert (= bs!3535 d!13374))

(declare-fun m!70203 () Bool)

(assert (=> bs!3535 m!70203))

(assert (=> b!45508 d!13374))

(declare-fun b!45903 () Bool)

(declare-fun e!30524 () tuple2!4460)

(assert (=> b!45903 (= e!30524 (tuple2!4461 Nil!531 (_1!2314 lt!69820)))))

(declare-fun lt!70682 () tuple2!4462)

(declare-fun b!45904 () Bool)

(declare-fun lt!70684 () (_ BitVec 64))

(assert (=> b!45904 (= e!30524 (tuple2!4461 (Cons!530 (_1!2324 lt!70682) (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_2!2324 lt!70682) (bvsub (bvsub to!314 i!635) lt!70684))) (_2!2324 lt!70682)))))

(assert (=> b!45904 (= lt!70682 (readBit!0 (_1!2314 lt!69820)))))

(assert (=> b!45904 (= lt!70684 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13376 () Bool)

(declare-fun e!30523 () Bool)

(assert (=> d!13376 e!30523))

(declare-fun c!3101 () Bool)

(assert (=> d!13376 (= c!3101 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70683 () List!534)

(assert (=> d!13376 (= lt!70683 (_1!2323 e!30524))))

(declare-fun c!3102 () Bool)

(assert (=> d!13376 (= c!3102 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13376 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13376 (= (bitStreamReadBitsIntoList!0 (_2!2313 lt!69812) (_1!2314 lt!69820) (bvsub to!314 i!635)) lt!70683)))

(declare-fun b!45905 () Bool)

(assert (=> b!45905 (= e!30523 (isEmpty!132 lt!70683))))

(declare-fun b!45906 () Bool)

(assert (=> b!45906 (= e!30523 (> (length!229 lt!70683) 0))))

(assert (= (and d!13376 c!3102) b!45903))

(assert (= (and d!13376 (not c!3102)) b!45904))

(assert (= (and d!13376 c!3101) b!45905))

(assert (= (and d!13376 (not c!3101)) b!45906))

(declare-fun m!70217 () Bool)

(assert (=> b!45904 m!70217))

(declare-fun m!70219 () Bool)

(assert (=> b!45904 m!70219))

(declare-fun m!70221 () Bool)

(assert (=> b!45905 m!70221))

(declare-fun m!70225 () Bool)

(assert (=> b!45906 m!70225))

(assert (=> b!45508 d!13376))

(declare-fun d!13380 () Bool)

(declare-fun e!30525 () Bool)

(assert (=> d!13380 e!30525))

(declare-fun res!38777 () Bool)

(assert (=> d!13380 (=> (not res!38777) (not e!30525))))

(declare-fun lt!70687 () (_ BitVec 64))

(declare-fun lt!70689 () (_ BitVec 64))

(declare-fun lt!70686 () (_ BitVec 64))

(assert (=> d!13380 (= res!38777 (= lt!70687 (bvsub lt!70689 lt!70686)))))

(assert (=> d!13380 (or (= (bvand lt!70689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70689 lt!70686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13380 (= lt!70686 (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69812))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69812)))))))

(declare-fun lt!70690 () (_ BitVec 64))

(declare-fun lt!70688 () (_ BitVec 64))

(assert (=> d!13380 (= lt!70689 (bvmul lt!70690 lt!70688))))

(assert (=> d!13380 (or (= lt!70690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70688 (bvsdiv (bvmul lt!70690 lt!70688) lt!70690)))))

(assert (=> d!13380 (= lt!70688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13380 (= lt!70690 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))))))

(assert (=> d!13380 (= lt!70687 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69812))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69812)))))))

(assert (=> d!13380 (invariant!0 (currentBit!2858 (_2!2313 lt!69812)) (currentByte!2863 (_2!2313 lt!69812)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))

(assert (=> d!13380 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69812))) (currentByte!2863 (_2!2313 lt!69812)) (currentBit!2858 (_2!2313 lt!69812))) lt!70687)))

(declare-fun b!45907 () Bool)

(declare-fun res!38776 () Bool)

(assert (=> b!45907 (=> (not res!38776) (not e!30525))))

(assert (=> b!45907 (= res!38776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70687))))

(declare-fun b!45908 () Bool)

(declare-fun lt!70685 () (_ BitVec 64))

(assert (=> b!45908 (= e!30525 (bvsle lt!70687 (bvmul lt!70685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45908 (or (= lt!70685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70685)))))

(assert (=> b!45908 (= lt!70685 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69812)))))))

(assert (= (and d!13380 res!38777) b!45907))

(assert (= (and b!45907 res!38776) b!45908))

(declare-fun m!70227 () Bool)

(assert (=> d!13380 m!70227))

(assert (=> d!13380 m!69481))

(assert (=> b!45507 d!13380))

(declare-fun d!13386 () Bool)

(declare-fun res!38779 () Bool)

(declare-fun e!30526 () Bool)

(assert (=> d!13386 (=> (not res!38779) (not e!30526))))

(assert (=> d!13386 (= res!38779 (= (size!1021 (buf!1370 thiss!1379)) (size!1021 (buf!1370 (_2!2313 lt!69817)))))))

(assert (=> d!13386 (= (isPrefixOf!0 thiss!1379 (_2!2313 lt!69817)) e!30526)))

(declare-fun b!45909 () Bool)

(declare-fun res!38778 () Bool)

(assert (=> b!45909 (=> (not res!38778) (not e!30526))))

(assert (=> b!45909 (= res!38778 (bvsle (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)) (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!69817))) (currentByte!2863 (_2!2313 lt!69817)) (currentBit!2858 (_2!2313 lt!69817)))))))

(declare-fun b!45910 () Bool)

(declare-fun e!30527 () Bool)

(assert (=> b!45910 (= e!30526 e!30527)))

(declare-fun res!38780 () Bool)

(assert (=> b!45910 (=> res!38780 e!30527)))

(assert (=> b!45910 (= res!38780 (= (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45911 () Bool)

(assert (=> b!45911 (= e!30527 (arrayBitRangesEq!0 (buf!1370 thiss!1379) (buf!1370 (_2!2313 lt!69817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(assert (= (and d!13386 res!38779) b!45909))

(assert (= (and b!45909 res!38778) b!45910))

(assert (= (and b!45910 (not res!38780)) b!45911))

(assert (=> b!45909 m!69451))

(assert (=> b!45909 m!69443))

(assert (=> b!45911 m!69451))

(assert (=> b!45911 m!69451))

(declare-fun m!70229 () Bool)

(assert (=> b!45911 m!70229))

(assert (=> b!45496 d!13386))

(declare-fun d!13390 () Bool)

(assert (=> d!13390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) lt!69826) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817)))) lt!69826))))

(declare-fun bs!3538 () Bool)

(assert (= bs!3538 d!13390))

(assert (=> bs!3538 m!69727))

(assert (=> b!45496 d!13390))

(declare-fun d!13392 () Bool)

(declare-fun e!30532 () Bool)

(assert (=> d!13392 e!30532))

(declare-fun res!38783 () Bool)

(assert (=> d!13392 (=> (not res!38783) (not e!30532))))

(assert (=> d!13392 (= res!38783 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!70693 () Unit!3232)

(declare-fun choose!27 (BitStream!1786 BitStream!1786 (_ BitVec 64) (_ BitVec 64)) Unit!3232)

(assert (=> d!13392 (= lt!70693 (choose!27 thiss!1379 (_2!2313 lt!69817) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13392 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2313 lt!69817) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70693)))

(declare-fun b!45918 () Bool)

(assert (=> b!45918 (= e!30532 (validate_offset_bits!1 ((_ sign_extend 32) (size!1021 (buf!1370 (_2!2313 lt!69817)))) ((_ sign_extend 32) (currentByte!2863 (_2!2313 lt!69817))) ((_ sign_extend 32) (currentBit!2858 (_2!2313 lt!69817))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13392 res!38783) b!45918))

(declare-fun m!70231 () Bool)

(assert (=> d!13392 m!70231))

(declare-fun m!70233 () Bool)

(assert (=> b!45918 m!70233))

(assert (=> b!45496 d!13392))

(declare-fun b!45944 () Bool)

(declare-fun e!30545 () Bool)

(declare-fun e!30548 () Bool)

(assert (=> b!45944 (= e!30545 e!30548)))

(declare-fun res!38803 () Bool)

(assert (=> b!45944 (=> (not res!38803) (not e!30548))))

(declare-datatypes ((tuple2!4470 0))(
  ( (tuple2!4471 (_1!2328 BitStream!1786) (_2!2328 Bool)) )
))
(declare-fun lt!70737 () tuple2!4470)

(declare-fun lt!70735 () Bool)

(declare-fun lt!70729 () tuple2!4440)

(assert (=> b!45944 (= res!38803 (and (= (_2!2328 lt!70737) lt!70735) (= (_1!2328 lt!70737) (_2!2313 lt!70729))))))

(declare-fun readBitPure!0 (BitStream!1786) tuple2!4470)

(declare-fun readerFrom!0 (BitStream!1786 (_ BitVec 32) (_ BitVec 32)) BitStream!1786)

(assert (=> b!45944 (= lt!70737 (readBitPure!0 (readerFrom!0 (_2!2313 lt!70729) (currentBit!2858 thiss!1379) (currentByte!2863 thiss!1379))))))

(declare-fun b!45945 () Bool)

(declare-fun e!30546 () Bool)

(declare-fun lt!70731 () tuple2!4470)

(declare-fun lt!70730 () tuple2!4440)

(assert (=> b!45945 (= e!30546 (= (bitIndex!0 (size!1021 (buf!1370 (_1!2328 lt!70731))) (currentByte!2863 (_1!2328 lt!70731)) (currentBit!2858 (_1!2328 lt!70731))) (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70730))) (currentByte!2863 (_2!2313 lt!70730)) (currentBit!2858 (_2!2313 lt!70730)))))))

(declare-fun b!45946 () Bool)

(declare-fun e!30547 () Bool)

(assert (=> b!45946 (= e!30547 e!30546)))

(declare-fun res!38807 () Bool)

(assert (=> b!45946 (=> (not res!38807) (not e!30546))))

(declare-fun lt!70733 () (_ BitVec 8))

(assert (=> b!45946 (= res!38807 (and (= (_2!2328 lt!70731) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!70733)) #b00000000000000000000000000000000))) (= (_1!2328 lt!70731) (_2!2313 lt!70730))))))

(declare-fun lt!70736 () tuple2!4464)

(declare-fun lt!70727 () BitStream!1786)

(assert (=> b!45946 (= lt!70736 (readBits!0 lt!70727 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!45946 (= lt!70731 (readBitPure!0 lt!70727))))

(assert (=> b!45946 (= lt!70727 (readerFrom!0 (_2!2313 lt!70730) (currentBit!2858 thiss!1379) (currentByte!2863 thiss!1379)))))

(declare-fun b!45948 () Bool)

(declare-fun res!38808 () Bool)

(assert (=> b!45948 (=> (not res!38808) (not e!30547))))

(assert (=> b!45948 (= res!38808 (isPrefixOf!0 thiss!1379 (_2!2313 lt!70730)))))

(declare-fun b!45949 () Bool)

(declare-fun res!38806 () Bool)

(assert (=> b!45949 (=> (not res!38806) (not e!30545))))

(assert (=> b!45949 (= res!38806 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70729))) (currentByte!2863 (_2!2313 lt!70729)) (currentBit!2858 (_2!2313 lt!70729))) (bvadd (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45950 () Bool)

(declare-fun res!38802 () Bool)

(assert (=> b!45950 (=> (not res!38802) (not e!30547))))

(declare-fun lt!70732 () (_ BitVec 64))

(declare-fun lt!70738 () (_ BitVec 64))

(assert (=> b!45950 (= res!38802 (= (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70730))) (currentByte!2863 (_2!2313 lt!70730)) (currentBit!2858 (_2!2313 lt!70730))) (bvadd lt!70732 lt!70738)))))

(assert (=> b!45950 (or (not (= (bvand lt!70732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70738 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!70732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!70732 lt!70738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45950 (= lt!70738 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!45950 (= lt!70732 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)))))

(declare-fun b!45951 () Bool)

(assert (=> b!45951 (= e!30548 (= (bitIndex!0 (size!1021 (buf!1370 (_1!2328 lt!70737))) (currentByte!2863 (_1!2328 lt!70737)) (currentBit!2858 (_1!2328 lt!70737))) (bitIndex!0 (size!1021 (buf!1370 (_2!2313 lt!70729))) (currentByte!2863 (_2!2313 lt!70729)) (currentBit!2858 (_2!2313 lt!70729)))))))

(declare-fun d!13396 () Bool)

(assert (=> d!13396 e!30547))

(declare-fun res!38804 () Bool)

(assert (=> d!13396 (=> (not res!38804) (not e!30547))))

(assert (=> d!13396 (= res!38804 (= (size!1021 (buf!1370 (_2!2313 lt!70730))) (size!1021 (buf!1370 thiss!1379))))))

(declare-fun lt!70734 () array!2269)

(assert (=> d!13396 (= lt!70733 (select (arr!1538 lt!70734) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13396 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1021 lt!70734)))))

(assert (=> d!13396 (= lt!70734 (array!2270 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!70728 () tuple2!4440)

(assert (=> d!13396 (= lt!70730 (tuple2!4441 (_1!2313 lt!70728) (_2!2313 lt!70728)))))

(assert (=> d!13396 (= lt!70728 lt!70729)))

(assert (=> d!13396 e!30545))

(declare-fun res!38805 () Bool)

(assert (=> d!13396 (=> (not res!38805) (not e!30545))))

(assert (=> d!13396 (= res!38805 (= (size!1021 (buf!1370 thiss!1379)) (size!1021 (buf!1370 (_2!2313 lt!70729)))))))

(declare-fun appendBit!0 (BitStream!1786 Bool) tuple2!4440)

(assert (=> d!13396 (= lt!70729 (appendBit!0 thiss!1379 lt!70735))))

(assert (=> d!13396 (= lt!70735 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13396 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13396 (= (appendBitFromByte!0 thiss!1379 (select (arr!1538 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!70730)))

(declare-fun b!45947 () Bool)

(declare-fun res!38809 () Bool)

(assert (=> b!45947 (=> (not res!38809) (not e!30545))))

(assert (=> b!45947 (= res!38809 (isPrefixOf!0 thiss!1379 (_2!2313 lt!70729)))))

(assert (= (and d!13396 res!38805) b!45949))

(assert (= (and b!45949 res!38806) b!45947))

(assert (= (and b!45947 res!38809) b!45944))

(assert (= (and b!45944 res!38803) b!45951))

(assert (= (and d!13396 res!38804) b!45950))

(assert (= (and b!45950 res!38802) b!45948))

(assert (= (and b!45948 res!38808) b!45946))

(assert (= (and b!45946 res!38807) b!45945))

(declare-fun m!70247 () Bool)

(assert (=> b!45951 m!70247))

(declare-fun m!70249 () Bool)

(assert (=> b!45951 m!70249))

(declare-fun m!70251 () Bool)

(assert (=> b!45945 m!70251))

(declare-fun m!70253 () Bool)

(assert (=> b!45945 m!70253))

(assert (=> b!45950 m!70253))

(assert (=> b!45950 m!69451))

(declare-fun m!70255 () Bool)

(assert (=> b!45948 m!70255))

(declare-fun m!70257 () Bool)

(assert (=> b!45947 m!70257))

(assert (=> b!45949 m!70249))

(assert (=> b!45949 m!69451))

(declare-fun m!70259 () Bool)

(assert (=> b!45944 m!70259))

(assert (=> b!45944 m!70259))

(declare-fun m!70261 () Bool)

(assert (=> b!45944 m!70261))

(declare-fun m!70263 () Bool)

(assert (=> b!45946 m!70263))

(declare-fun m!70265 () Bool)

(assert (=> b!45946 m!70265))

(declare-fun m!70267 () Bool)

(assert (=> b!45946 m!70267))

(declare-fun m!70269 () Bool)

(assert (=> d!13396 m!70269))

(declare-fun m!70271 () Bool)

(assert (=> d!13396 m!70271))

(assert (=> d!13396 m!69689))

(assert (=> b!45496 d!13396))

(declare-fun d!13410 () Bool)

(declare-fun res!38811 () Bool)

(declare-fun e!30549 () Bool)

(assert (=> d!13410 (=> (not res!38811) (not e!30549))))

(assert (=> d!13410 (= res!38811 (= (size!1021 (buf!1370 thiss!1379)) (size!1021 (buf!1370 thiss!1379))))))

(assert (=> d!13410 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30549)))

(declare-fun b!45952 () Bool)

(declare-fun res!38810 () Bool)

(assert (=> b!45952 (=> (not res!38810) (not e!30549))))

(assert (=> b!45952 (= res!38810 (bvsle (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)) (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(declare-fun b!45953 () Bool)

(declare-fun e!30550 () Bool)

(assert (=> b!45953 (= e!30549 e!30550)))

(declare-fun res!38812 () Bool)

(assert (=> b!45953 (=> res!38812 e!30550)))

(assert (=> b!45953 (= res!38812 (= (size!1021 (buf!1370 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45954 () Bool)

(assert (=> b!45954 (= e!30550 (arrayBitRangesEq!0 (buf!1370 thiss!1379) (buf!1370 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379))))))

(assert (= (and d!13410 res!38811) b!45952))

(assert (= (and b!45952 res!38810) b!45953))

(assert (= (and b!45953 (not res!38812)) b!45954))

(assert (=> b!45952 m!69451))

(assert (=> b!45952 m!69451))

(assert (=> b!45954 m!69451))

(assert (=> b!45954 m!69451))

(declare-fun m!70273 () Bool)

(assert (=> b!45954 m!70273))

(assert (=> b!45495 d!13410))

(declare-fun d!13412 () Bool)

(assert (=> d!13412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!70741 () Unit!3232)

(declare-fun choose!11 (BitStream!1786) Unit!3232)

(assert (=> d!13412 (= lt!70741 (choose!11 thiss!1379))))

(assert (=> d!13412 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!70741)))

(declare-fun bs!3541 () Bool)

(assert (= bs!3541 d!13412))

(assert (=> bs!3541 m!69447))

(declare-fun m!70275 () Bool)

(assert (=> bs!3541 m!70275))

(assert (=> b!45495 d!13412))

(declare-fun d!13414 () Bool)

(declare-fun e!30551 () Bool)

(assert (=> d!13414 e!30551))

(declare-fun res!38814 () Bool)

(assert (=> d!13414 (=> (not res!38814) (not e!30551))))

(declare-fun lt!70746 () (_ BitVec 64))

(declare-fun lt!70744 () (_ BitVec 64))

(declare-fun lt!70743 () (_ BitVec 64))

(assert (=> d!13414 (= res!38814 (= lt!70744 (bvsub lt!70746 lt!70743)))))

(assert (=> d!13414 (or (= (bvand lt!70746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70746 lt!70743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13414 (= lt!70743 (remainingBits!0 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))) ((_ sign_extend 32) (currentByte!2863 thiss!1379)) ((_ sign_extend 32) (currentBit!2858 thiss!1379))))))

(declare-fun lt!70747 () (_ BitVec 64))

(declare-fun lt!70745 () (_ BitVec 64))

(assert (=> d!13414 (= lt!70746 (bvmul lt!70747 lt!70745))))

(assert (=> d!13414 (or (= lt!70747 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70745 (bvsdiv (bvmul lt!70747 lt!70745) lt!70747)))))

(assert (=> d!13414 (= lt!70745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13414 (= lt!70747 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))))))

(assert (=> d!13414 (= lt!70744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2863 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2858 thiss!1379))))))

(assert (=> d!13414 (invariant!0 (currentBit!2858 thiss!1379) (currentByte!2863 thiss!1379) (size!1021 (buf!1370 thiss!1379)))))

(assert (=> d!13414 (= (bitIndex!0 (size!1021 (buf!1370 thiss!1379)) (currentByte!2863 thiss!1379) (currentBit!2858 thiss!1379)) lt!70744)))

(declare-fun b!45955 () Bool)

(declare-fun res!38813 () Bool)

(assert (=> b!45955 (=> (not res!38813) (not e!30551))))

(assert (=> b!45955 (= res!38813 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70744))))

(declare-fun b!45956 () Bool)

(declare-fun lt!70742 () (_ BitVec 64))

(assert (=> b!45956 (= e!30551 (bvsle lt!70744 (bvmul lt!70742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45956 (or (= lt!70742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70742)))))

(assert (=> b!45956 (= lt!70742 ((_ sign_extend 32) (size!1021 (buf!1370 thiss!1379))))))

(assert (= (and d!13414 res!38814) b!45955))

(assert (= (and b!45955 res!38813) b!45956))

(assert (=> d!13414 m!70097))

(assert (=> d!13414 m!70123))

(assert (=> b!45495 d!13414))

(declare-fun d!13416 () Bool)

(assert (=> d!13416 (= (invariant!0 (currentBit!2858 (_2!2313 lt!69812)) (currentByte!2863 (_2!2313 lt!69812)) (size!1021 (buf!1370 (_2!2313 lt!69812)))) (and (bvsge (currentBit!2858 (_2!2313 lt!69812)) #b00000000000000000000000000000000) (bvslt (currentBit!2858 (_2!2313 lt!69812)) #b00000000000000000000000000001000) (bvsge (currentByte!2863 (_2!2313 lt!69812)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2863 (_2!2313 lt!69812)) (size!1021 (buf!1370 (_2!2313 lt!69812)))) (and (= (currentBit!2858 (_2!2313 lt!69812)) #b00000000000000000000000000000000) (= (currentByte!2863 (_2!2313 lt!69812)) (size!1021 (buf!1370 (_2!2313 lt!69812))))))))))

(assert (=> b!45506 d!13416))

(push 1)

(assert (not b!45947))

(assert (not d!13412))

(assert (not b!45890))

(assert (not b!45946))

(assert (not d!13414))

(assert (not b!45948))

(assert (not b!45885))

(assert (not d!13254))

(assert (not d!13260))

(assert (not b!45871))

(assert (not d!13348))

(assert (not d!13356))

(assert (not b!45753))

(assert (not b!45886))

(assert (not b!45951))

(assert (not b!45652))

(assert (not d!13380))

(assert (not b!45911))

(assert (not b!45720))

(assert (not b!45887))

(assert (not b!45866))

(assert (not b!45743))

(assert (not d!13366))

(assert (not b!45905))

(assert (not b!45662))

(assert (not b!45897))

(assert (not d!13390))

(assert (not b!45722))

(assert (not b!45945))

(assert (not d!13392))

(assert (not d!13364))

(assert (not b!45865))

(assert (not b!45724))

(assert (not b!45952))

(assert (not d!13352))

(assert (not b!45904))

(assert (not b!45909))

(assert (not d!13292))

(assert (not b!45949))

(assert (not d!13280))

(assert (not b!45893))

(assert (not b!45745))

(assert (not b!45892))

(assert (not b!45944))

(assert (not b!45895))

(assert (not b!45950))

(assert (not b!45954))

(assert (not d!13284))

(assert (not b!45721))

(assert (not b!45888))

(assert (not b!45868))

(assert (not d!13396))

(assert (not d!13370))

(assert (not d!13374))

(assert (not b!45906))

(assert (not b!45870))

(assert (not b!45918))

(assert (not b!45663))

(assert (not d!13360))

(assert (not b!45889))

(assert (not b!45751))

(assert (not b!45664))

(assert (not d!13296))

(assert (not d!13242))

(assert (not b!45894))

(assert (not b!45869))

(assert (not bm!546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

