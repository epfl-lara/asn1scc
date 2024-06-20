; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14788 () Bool)

(assert start!14788)

(declare-fun b!76312 () Bool)

(declare-fun e!50091 () Bool)

(declare-datatypes ((array!3155 0))(
  ( (array!3156 (arr!2069 (Array (_ BitVec 32) (_ BitVec 8))) (size!1471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2516 0))(
  ( (BitStream!2517 (buf!1852 array!3155) (currentByte!3643 (_ BitVec 32)) (currentBit!3638 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2516)

(declare-fun array_inv!1317 (array!3155) Bool)

(assert (=> b!76312 (= e!50091 (array_inv!1317 (buf!1852 thiss!1379)))))

(declare-fun b!76313 () Bool)

(declare-fun res!63102 () Bool)

(declare-fun e!50094 () Bool)

(assert (=> b!76313 (=> (not res!63102) (not e!50094))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76313 (= res!63102 (validate_offset_bits!1 ((_ sign_extend 32) (size!1471 (buf!1852 thiss!1379))) ((_ sign_extend 32) (currentByte!3643 thiss!1379)) ((_ sign_extend 32) (currentBit!3638 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76314 () Bool)

(declare-fun e!50090 () Bool)

(assert (=> b!76314 (= e!50094 (not e!50090))))

(declare-fun res!63103 () Bool)

(assert (=> b!76314 (=> res!63103 e!50090)))

(declare-fun lt!122225 () (_ BitVec 64))

(assert (=> b!76314 (= res!63103 (or (bvslt i!635 to!314) (not (= lt!122225 (bvsub (bvadd lt!122225 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2516 BitStream!2516) Bool)

(assert (=> b!76314 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5042 0))(
  ( (Unit!5043) )
))
(declare-fun lt!122229 () Unit!5042)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2516) Unit!5042)

(assert (=> b!76314 (= lt!122229 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76314 (= lt!122225 (bitIndex!0 (size!1471 (buf!1852 thiss!1379)) (currentByte!3643 thiss!1379) (currentBit!3638 thiss!1379)))))

(declare-fun b!76315 () Bool)

(declare-fun e!50089 () Bool)

(assert (=> b!76315 (= e!50090 e!50089)))

(declare-fun res!63099 () Bool)

(assert (=> b!76315 (=> res!63099 e!50089)))

(assert (=> b!76315 (= res!63099 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6642 0))(
  ( (tuple2!6643 (_1!3452 BitStream!2516) (_2!3452 BitStream!2516)) )
))
(declare-fun lt!122228 () tuple2!6642)

(declare-datatypes ((tuple2!6644 0))(
  ( (tuple2!6645 (_1!3453 array!3155) (_2!3453 BitStream!2516)) )
))
(declare-fun lt!122227 () tuple2!6644)

(declare-fun readBits!0 (BitStream!2516 (_ BitVec 64)) tuple2!6644)

(assert (=> b!76315 (= lt!122227 (readBits!0 (_1!3452 lt!122228) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2516 BitStream!2516) tuple2!6642)

(assert (=> b!76315 (= lt!122228 (reader!0 thiss!1379 thiss!1379))))

(declare-fun res!63101 () Bool)

(assert (=> start!14788 (=> (not res!63101) (not e!50094))))

(declare-fun srcBuffer!2 () array!3155)

(assert (=> start!14788 (= res!63101 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1471 srcBuffer!2))))))))

(assert (=> start!14788 e!50094))

(assert (=> start!14788 true))

(assert (=> start!14788 (array_inv!1317 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2516) Bool)

(assert (=> start!14788 (and (inv!12 thiss!1379) e!50091)))

(declare-fun b!76316 () Bool)

(declare-datatypes ((List!788 0))(
  ( (Nil!785) (Cons!784 (h!903 Bool) (t!1538 List!788)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2516 BitStream!2516 (_ BitVec 64)) List!788)

(declare-fun byteArrayBitContentToList!0 (BitStream!2516 array!3155 (_ BitVec 64) (_ BitVec 64)) List!788)

(assert (=> b!76316 (= e!50089 (= (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3452 lt!122228) (bvsub to!314 i!635)) (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun lt!122226 () Unit!5042)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2516 array!3155 (_ BitVec 64)) Unit!5042)

(assert (=> b!76316 (= lt!122226 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1852 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2516 array!3155 array!3155 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76316 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3453 lt!122227) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76317 () Bool)

(declare-fun res!63100 () Bool)

(assert (=> b!76317 (=> res!63100 e!50090)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76317 (= res!63100 (not (invariant!0 (currentBit!3638 thiss!1379) (currentByte!3643 thiss!1379) (size!1471 (buf!1852 thiss!1379)))))))

(assert (= (and start!14788 res!63101) b!76313))

(assert (= (and b!76313 res!63102) b!76314))

(assert (= (and b!76314 (not res!63103)) b!76317))

(assert (= (and b!76317 (not res!63100)) b!76315))

(assert (= (and b!76315 (not res!63099)) b!76316))

(assert (= start!14788 b!76312))

(declare-fun m!121555 () Bool)

(assert (=> b!76316 m!121555))

(declare-fun m!121557 () Bool)

(assert (=> b!76316 m!121557))

(declare-fun m!121559 () Bool)

(assert (=> b!76316 m!121559))

(declare-fun m!121561 () Bool)

(assert (=> b!76316 m!121561))

(declare-fun m!121563 () Bool)

(assert (=> b!76312 m!121563))

(declare-fun m!121565 () Bool)

(assert (=> b!76314 m!121565))

(declare-fun m!121567 () Bool)

(assert (=> b!76314 m!121567))

(declare-fun m!121569 () Bool)

(assert (=> b!76314 m!121569))

(declare-fun m!121571 () Bool)

(assert (=> start!14788 m!121571))

(declare-fun m!121573 () Bool)

(assert (=> start!14788 m!121573))

(declare-fun m!121575 () Bool)

(assert (=> b!76317 m!121575))

(declare-fun m!121577 () Bool)

(assert (=> b!76315 m!121577))

(declare-fun m!121579 () Bool)

(assert (=> b!76315 m!121579))

(declare-fun m!121581 () Bool)

(assert (=> b!76313 m!121581))

(push 1)

(assert (not b!76316))

(assert (not b!76317))

(assert (not b!76313))

(assert (not b!76312))

(assert (not b!76314))

(assert (not b!76315))

(assert (not start!14788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!76397 () Bool)

(declare-fun res!63161 () Bool)

(declare-fun e!50124 () Bool)

(assert (=> b!76397 (=> (not res!63161) (not e!50124))))

(declare-fun lt!122378 () tuple2!6644)

(declare-fun lt!122382 () (_ BitVec 64))

(assert (=> b!76397 (= res!63161 (= (size!1471 (_1!3453 lt!122378)) ((_ extract 31 0) lt!122382)))))

(assert (=> b!76397 (and (bvslt lt!122382 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!122382 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!122379 () (_ BitVec 64))

(declare-fun lt!122377 () (_ BitVec 64))

(assert (=> b!76397 (= lt!122382 (bvsdiv lt!122379 lt!122377))))

(assert (=> b!76397 (and (not (= lt!122377 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!122379 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!122377 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!76397 (= lt!122377 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!122374 () (_ BitVec 64))

(declare-fun lt!122380 () (_ BitVec 64))

(assert (=> b!76397 (= lt!122379 (bvsub lt!122374 lt!122380))))

(assert (=> b!76397 (or (= (bvand lt!122374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122374 lt!122380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76397 (= lt!122380 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!122381 () (_ BitVec 64))

(assert (=> b!76397 (= lt!122374 (bvadd (bvsub to!314 i!635) lt!122381))))

(assert (=> b!76397 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122381 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!122381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76397 (= lt!122381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!76398 () Bool)

(declare-fun res!63160 () Bool)

(assert (=> b!76398 (=> (not res!63160) (not e!50124))))

(assert (=> b!76398 (= res!63160 (bvsle (currentByte!3643 (_1!3452 lt!122228)) (currentByte!3643 (_2!3453 lt!122378))))))

(declare-fun d!24130 () Bool)

(assert (=> d!24130 e!50124))

(declare-fun res!63162 () Bool)

(assert (=> d!24130 (=> (not res!63162) (not e!50124))))

(assert (=> d!24130 (= res!63162 (= (buf!1852 (_2!3453 lt!122378)) (buf!1852 (_1!3452 lt!122228))))))

(declare-datatypes ((tuple3!224 0))(
  ( (tuple3!225 (_1!3460 Unit!5042) (_2!3460 BitStream!2516) (_3!133 array!3155)) )
))
(declare-fun lt!122375 () tuple3!224)

(assert (=> d!24130 (= lt!122378 (tuple2!6645 (_3!133 lt!122375) (_2!3460 lt!122375)))))

(declare-fun readBitsLoop!0 (BitStream!2516 (_ BitVec 64) array!3155 (_ BitVec 64) (_ BitVec 64)) tuple3!224)

(assert (=> d!24130 (= lt!122375 (readBitsLoop!0 (_1!3452 lt!122228) (bvsub to!314 i!635) (array!3156 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24130 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24130 (= (readBits!0 (_1!3452 lt!122228) (bvsub to!314 i!635)) lt!122378)))

(declare-fun b!76399 () Bool)

(assert (=> b!76399 (= e!50124 (= (byteArrayBitContentToList!0 (_2!3453 lt!122378) (_1!3453 lt!122378) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3453 lt!122378) (_1!3452 lt!122228) (bvsub to!314 i!635))))))

(declare-fun b!76400 () Bool)

(declare-fun res!63159 () Bool)

(assert (=> b!76400 (=> (not res!63159) (not e!50124))))

(assert (=> b!76400 (= res!63159 (invariant!0 (currentBit!3638 (_2!3453 lt!122378)) (currentByte!3643 (_2!3453 lt!122378)) (size!1471 (buf!1852 (_2!3453 lt!122378)))))))

(declare-fun b!76401 () Bool)

(declare-fun res!63163 () Bool)

(assert (=> b!76401 (=> (not res!63163) (not e!50124))))

(declare-fun lt!122376 () (_ BitVec 64))

(assert (=> b!76401 (= res!63163 (= (bvadd lt!122376 (bvsub to!314 i!635)) (bitIndex!0 (size!1471 (buf!1852 (_2!3453 lt!122378))) (currentByte!3643 (_2!3453 lt!122378)) (currentBit!3638 (_2!3453 lt!122378)))))))

(assert (=> b!76401 (or (not (= (bvand lt!122376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122376 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76401 (= lt!122376 (bitIndex!0 (size!1471 (buf!1852 (_1!3452 lt!122228))) (currentByte!3643 (_1!3452 lt!122228)) (currentBit!3638 (_1!3452 lt!122228))))))

(assert (= (and d!24130 res!63162) b!76401))

(assert (= (and b!76401 res!63163) b!76400))

(assert (= (and b!76400 res!63159) b!76397))

(assert (= (and b!76397 res!63161) b!76398))

(assert (= (and b!76398 res!63160) b!76399))

(declare-fun m!121651 () Bool)

(assert (=> d!24130 m!121651))

(declare-fun m!121653 () Bool)

(assert (=> b!76399 m!121653))

(declare-fun m!121655 () Bool)

(assert (=> b!76399 m!121655))

(declare-fun m!121657 () Bool)

(assert (=> b!76400 m!121657))

(declare-fun m!121659 () Bool)

(assert (=> b!76401 m!121659))

(declare-fun m!121661 () Bool)

(assert (=> b!76401 m!121661))

(assert (=> b!76315 d!24130))

(declare-fun b!76475 () Bool)

(declare-fun e!50166 () Unit!5042)

(declare-fun lt!122527 () Unit!5042)

(assert (=> b!76475 (= e!50166 lt!122527)))

(declare-fun lt!122529 () (_ BitVec 64))

(assert (=> b!76475 (= lt!122529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122526 () (_ BitVec 64))

(assert (=> b!76475 (= lt!122526 (bitIndex!0 (size!1471 (buf!1852 thiss!1379)) (currentByte!3643 thiss!1379) (currentBit!3638 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3155 array!3155 (_ BitVec 64) (_ BitVec 64)) Unit!5042)

(assert (=> b!76475 (= lt!122527 (arrayBitRangesEqSymmetric!0 (buf!1852 thiss!1379) (buf!1852 thiss!1379) lt!122529 lt!122526))))

(declare-fun arrayBitRangesEq!0 (array!3155 array!3155 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76475 (arrayBitRangesEq!0 (buf!1852 thiss!1379) (buf!1852 thiss!1379) lt!122529 lt!122526)))

(declare-fun b!76477 () Bool)

(declare-fun res!63210 () Bool)

(declare-fun e!50165 () Bool)

(assert (=> b!76477 (=> (not res!63210) (not e!50165))))

(declare-fun lt!122530 () tuple2!6642)

(assert (=> b!76477 (= res!63210 (isPrefixOf!0 (_1!3452 lt!122530) thiss!1379))))

(declare-fun lt!122535 () (_ BitVec 64))

(declare-fun b!76478 () Bool)

(declare-fun lt!122532 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2516 (_ BitVec 64)) BitStream!2516)

(assert (=> b!76478 (= e!50165 (= (_1!3452 lt!122530) (withMovedBitIndex!0 (_2!3452 lt!122530) (bvsub lt!122532 lt!122535))))))

(assert (=> b!76478 (or (= (bvand lt!122532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122532 lt!122535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76478 (= lt!122535 (bitIndex!0 (size!1471 (buf!1852 thiss!1379)) (currentByte!3643 thiss!1379) (currentBit!3638 thiss!1379)))))

(assert (=> b!76478 (= lt!122532 (bitIndex!0 (size!1471 (buf!1852 thiss!1379)) (currentByte!3643 thiss!1379) (currentBit!3638 thiss!1379)))))

(declare-fun b!76479 () Bool)

(declare-fun Unit!5046 () Unit!5042)

(assert (=> b!76479 (= e!50166 Unit!5046)))

(declare-fun d!24138 () Bool)

(assert (=> d!24138 e!50165))

(declare-fun res!63211 () Bool)

(assert (=> d!24138 (=> (not res!63211) (not e!50165))))

(assert (=> d!24138 (= res!63211 (isPrefixOf!0 (_1!3452 lt!122530) (_2!3452 lt!122530)))))

(declare-fun lt!122521 () BitStream!2516)

(assert (=> d!24138 (= lt!122530 (tuple2!6643 lt!122521 thiss!1379))))

(declare-fun lt!122522 () Unit!5042)

(declare-fun lt!122533 () Unit!5042)

(assert (=> d!24138 (= lt!122522 lt!122533)))

(assert (=> d!24138 (isPrefixOf!0 lt!122521 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2516 BitStream!2516 BitStream!2516) Unit!5042)

(assert (=> d!24138 (= lt!122533 (lemmaIsPrefixTransitive!0 lt!122521 thiss!1379 thiss!1379))))

(declare-fun lt!122537 () Unit!5042)

(declare-fun lt!122523 () Unit!5042)

(assert (=> d!24138 (= lt!122537 lt!122523)))

(assert (=> d!24138 (isPrefixOf!0 lt!122521 thiss!1379)))

(assert (=> d!24138 (= lt!122523 (lemmaIsPrefixTransitive!0 lt!122521 thiss!1379 thiss!1379))))

(declare-fun lt!122536 () Unit!5042)

(assert (=> d!24138 (= lt!122536 e!50166)))

(declare-fun c!5567 () Bool)

(assert (=> d!24138 (= c!5567 (not (= (size!1471 (buf!1852 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!122520 () Unit!5042)

(declare-fun lt!122528 () Unit!5042)

(assert (=> d!24138 (= lt!122520 lt!122528)))

(assert (=> d!24138 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24138 (= lt!122528 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122534 () Unit!5042)

(declare-fun lt!122531 () Unit!5042)

(assert (=> d!24138 (= lt!122534 lt!122531)))

(assert (=> d!24138 (= lt!122531 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122525 () Unit!5042)

(declare-fun lt!122538 () Unit!5042)

(assert (=> d!24138 (= lt!122525 lt!122538)))

(assert (=> d!24138 (isPrefixOf!0 lt!122521 lt!122521)))

(assert (=> d!24138 (= lt!122538 (lemmaIsPrefixRefl!0 lt!122521))))

(declare-fun lt!122519 () Unit!5042)

(declare-fun lt!122524 () Unit!5042)

(assert (=> d!24138 (= lt!122519 lt!122524)))

(assert (=> d!24138 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24138 (= lt!122524 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24138 (= lt!122521 (BitStream!2517 (buf!1852 thiss!1379) (currentByte!3643 thiss!1379) (currentBit!3638 thiss!1379)))))

(assert (=> d!24138 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24138 (= (reader!0 thiss!1379 thiss!1379) lt!122530)))

(declare-fun b!76476 () Bool)

(declare-fun res!63209 () Bool)

(assert (=> b!76476 (=> (not res!63209) (not e!50165))))

(assert (=> b!76476 (= res!63209 (isPrefixOf!0 (_2!3452 lt!122530) thiss!1379))))

(assert (= (and d!24138 c!5567) b!76475))

(assert (= (and d!24138 (not c!5567)) b!76479))

(assert (= (and d!24138 res!63211) b!76477))

(assert (= (and b!76477 res!63210) b!76476))

(assert (= (and b!76476 res!63209) b!76478))

(declare-fun m!121715 () Bool)

(assert (=> b!76478 m!121715))

(assert (=> b!76478 m!121569))

(assert (=> b!76478 m!121569))

(assert (=> b!76475 m!121569))

(declare-fun m!121717 () Bool)

(assert (=> b!76475 m!121717))

(declare-fun m!121719 () Bool)

(assert (=> b!76475 m!121719))

(declare-fun m!121721 () Bool)

(assert (=> b!76476 m!121721))

(declare-fun m!121723 () Bool)

(assert (=> b!76477 m!121723))

(declare-fun m!121725 () Bool)

(assert (=> d!24138 m!121725))

(assert (=> d!24138 m!121567))

(declare-fun m!121727 () Bool)

(assert (=> d!24138 m!121727))

(assert (=> d!24138 m!121565))

(assert (=> d!24138 m!121565))

(declare-fun m!121729 () Bool)

(assert (=> d!24138 m!121729))

(assert (=> d!24138 m!121565))

(declare-fun m!121731 () Bool)

(assert (=> d!24138 m!121731))

(assert (=> d!24138 m!121567))

(declare-fun m!121733 () Bool)

(assert (=> d!24138 m!121733))

(assert (=> d!24138 m!121731))

(assert (=> b!76315 d!24138))

(declare-fun d!24168 () Bool)

(assert (=> d!24168 (= (array_inv!1317 srcBuffer!2) (bvsge (size!1471 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14788 d!24168))

(declare-fun d!24170 () Bool)

(assert (=> d!24170 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3638 thiss!1379) (currentByte!3643 thiss!1379) (size!1471 (buf!1852 thiss!1379))))))

(declare-fun bs!5828 () Bool)

(assert (= bs!5828 d!24170))

(assert (=> bs!5828 m!121575))

(assert (=> start!14788 d!24170))

(declare-fun b!76494 () Bool)

(declare-datatypes ((tuple2!6654 0))(
  ( (tuple2!6655 (_1!3461 List!788) (_2!3461 BitStream!2516)) )
))
(declare-fun e!50174 () tuple2!6654)

(assert (=> b!76494 (= e!50174 (tuple2!6655 Nil!785 (_1!3452 lt!122228)))))

(declare-fun d!24172 () Bool)

(declare-fun e!50175 () Bool)

(assert (=> d!24172 e!50175))

(declare-fun c!5572 () Bool)

(assert (=> d!24172 (= c!5572 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!122563 () List!788)

(assert (=> d!24172 (= lt!122563 (_1!3461 e!50174))))

(declare-fun c!5573 () Bool)

(assert (=> d!24172 (= c!5573 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

