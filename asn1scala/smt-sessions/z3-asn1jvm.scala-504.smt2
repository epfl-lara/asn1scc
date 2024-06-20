; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14786 () Bool)

(assert start!14786)

(declare-fun b!76294 () Bool)

(declare-fun e!50074 () Bool)

(declare-fun e!50075 () Bool)

(assert (=> b!76294 (= e!50074 (not e!50075))))

(declare-fun res!63086 () Bool)

(assert (=> b!76294 (=> res!63086 e!50075)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!122212 () (_ BitVec 64))

(assert (=> b!76294 (= res!63086 (or (bvslt i!635 to!314) (not (= lt!122212 (bvsub (bvadd lt!122212 to!314) i!635)))))))

(declare-datatypes ((array!3153 0))(
  ( (array!3154 (arr!2068 (Array (_ BitVec 32) (_ BitVec 8))) (size!1470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2514 0))(
  ( (BitStream!2515 (buf!1851 array!3153) (currentByte!3642 (_ BitVec 32)) (currentBit!3637 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2514)

(declare-fun isPrefixOf!0 (BitStream!2514 BitStream!2514) Bool)

(assert (=> b!76294 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5040 0))(
  ( (Unit!5041) )
))
(declare-fun lt!122213 () Unit!5040)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2514) Unit!5040)

(assert (=> b!76294 (= lt!122213 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76294 (= lt!122212 (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)))))

(declare-fun b!76295 () Bool)

(declare-fun e!50073 () Bool)

(declare-fun array_inv!1316 (array!3153) Bool)

(assert (=> b!76295 (= e!50073 (array_inv!1316 (buf!1851 thiss!1379)))))

(declare-fun b!76296 () Bool)

(declare-fun res!63084 () Bool)

(assert (=> b!76296 (=> (not res!63084) (not e!50074))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76296 (= res!63084 (validate_offset_bits!1 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))) ((_ sign_extend 32) (currentByte!3642 thiss!1379)) ((_ sign_extend 32) (currentBit!3637 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!63085 () Bool)

(assert (=> start!14786 (=> (not res!63085) (not e!50074))))

(declare-fun srcBuffer!2 () array!3153)

(assert (=> start!14786 (= res!63085 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1470 srcBuffer!2))))))))

(assert (=> start!14786 e!50074))

(assert (=> start!14786 true))

(assert (=> start!14786 (array_inv!1316 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2514) Bool)

(assert (=> start!14786 (and (inv!12 thiss!1379) e!50073)))

(declare-fun b!76297 () Bool)

(declare-fun res!63088 () Bool)

(assert (=> b!76297 (=> res!63088 e!50075)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76297 (= res!63088 (not (invariant!0 (currentBit!3637 thiss!1379) (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379)))))))

(declare-datatypes ((tuple2!6638 0))(
  ( (tuple2!6639 (_1!3450 BitStream!2514) (_2!3450 BitStream!2514)) )
))
(declare-fun lt!122211 () tuple2!6638)

(declare-fun e!50076 () Bool)

(declare-fun b!76298 () Bool)

(declare-datatypes ((List!787 0))(
  ( (Nil!784) (Cons!783 (h!902 Bool) (t!1537 List!787)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2514 BitStream!2514 (_ BitVec 64)) List!787)

(declare-fun byteArrayBitContentToList!0 (BitStream!2514 array!3153 (_ BitVec 64) (_ BitVec 64)) List!787)

(assert (=> b!76298 (= e!50076 (= (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3450 lt!122211) (bvsub to!314 i!635)) (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun lt!122210 () Unit!5040)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2514 array!3153 (_ BitVec 64)) Unit!5040)

(assert (=> b!76298 (= lt!122210 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1851 thiss!1379) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!6640 0))(
  ( (tuple2!6641 (_1!3451 array!3153) (_2!3451 BitStream!2514)) )
))
(declare-fun lt!122214 () tuple2!6640)

(declare-fun checkByteArrayBitContent!0 (BitStream!2514 array!3153 array!3153 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76298 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3451 lt!122214) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76299 () Bool)

(assert (=> b!76299 (= e!50075 e!50076)))

(declare-fun res!63087 () Bool)

(assert (=> b!76299 (=> res!63087 e!50076)))

(assert (=> b!76299 (= res!63087 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2514 (_ BitVec 64)) tuple2!6640)

(assert (=> b!76299 (= lt!122214 (readBits!0 (_1!3450 lt!122211) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2514 BitStream!2514) tuple2!6638)

(assert (=> b!76299 (= lt!122211 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!14786 res!63085) b!76296))

(assert (= (and b!76296 res!63084) b!76294))

(assert (= (and b!76294 (not res!63086)) b!76297))

(assert (= (and b!76297 (not res!63088)) b!76299))

(assert (= (and b!76299 (not res!63087)) b!76298))

(assert (= start!14786 b!76295))

(declare-fun m!121527 () Bool)

(assert (=> b!76295 m!121527))

(declare-fun m!121529 () Bool)

(assert (=> b!76296 m!121529))

(declare-fun m!121531 () Bool)

(assert (=> b!76297 m!121531))

(declare-fun m!121533 () Bool)

(assert (=> b!76298 m!121533))

(declare-fun m!121535 () Bool)

(assert (=> b!76298 m!121535))

(declare-fun m!121537 () Bool)

(assert (=> b!76298 m!121537))

(declare-fun m!121539 () Bool)

(assert (=> b!76298 m!121539))

(declare-fun m!121541 () Bool)

(assert (=> b!76299 m!121541))

(declare-fun m!121543 () Bool)

(assert (=> b!76299 m!121543))

(declare-fun m!121545 () Bool)

(assert (=> b!76294 m!121545))

(declare-fun m!121547 () Bool)

(assert (=> b!76294 m!121547))

(declare-fun m!121549 () Bool)

(assert (=> b!76294 m!121549))

(declare-fun m!121551 () Bool)

(assert (=> start!14786 m!121551))

(declare-fun m!121553 () Bool)

(assert (=> start!14786 m!121553))

(check-sat (not start!14786) (not b!76297) (not b!76295) (not b!76298) (not b!76294) (not b!76296) (not b!76299))
(check-sat)
(get-model)

(declare-fun d!24108 () Bool)

(assert (=> d!24108 (= (array_inv!1316 (buf!1851 thiss!1379)) (bvsge (size!1470 (buf!1851 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!76295 d!24108))

(declare-fun d!24110 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))) ((_ sign_extend 32) (currentByte!3642 thiss!1379)) ((_ sign_extend 32) (currentBit!3637 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))) ((_ sign_extend 32) (currentByte!3642 thiss!1379)) ((_ sign_extend 32) (currentBit!3637 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5818 () Bool)

(assert (= bs!5818 d!24110))

(declare-fun m!121583 () Bool)

(assert (=> bs!5818 m!121583))

(assert (=> b!76296 d!24110))

(declare-fun d!24112 () Bool)

(assert (=> d!24112 (= (invariant!0 (currentBit!3637 thiss!1379) (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379))) (and (bvsge (currentBit!3637 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3637 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3642 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379))) (and (= (currentBit!3637 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379)))))))))

(assert (=> b!76297 d!24112))

(declare-fun d!24114 () Bool)

(assert (=> d!24114 (= (array_inv!1316 srcBuffer!2) (bvsge (size!1470 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14786 d!24114))

(declare-fun d!24116 () Bool)

(assert (=> d!24116 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3637 thiss!1379) (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379))))))

(declare-fun bs!5819 () Bool)

(assert (= bs!5819 d!24116))

(assert (=> bs!5819 m!121531))

(assert (=> start!14786 d!24116))

(declare-fun b!76329 () Bool)

(declare-fun e!50100 () Bool)

(declare-fun lt!122236 () List!787)

(declare-fun length!398 (List!787) Int)

(assert (=> b!76329 (= e!50100 (> (length!398 lt!122236) 0))))

(declare-fun b!76326 () Bool)

(declare-datatypes ((tuple2!6646 0))(
  ( (tuple2!6647 (_1!3454 List!787) (_2!3454 BitStream!2514)) )
))
(declare-fun e!50099 () tuple2!6646)

(assert (=> b!76326 (= e!50099 (tuple2!6647 Nil!784 (_1!3450 lt!122211)))))

(declare-datatypes ((tuple2!6648 0))(
  ( (tuple2!6649 (_1!3455 Bool) (_2!3455 BitStream!2514)) )
))
(declare-fun lt!122237 () tuple2!6648)

(declare-fun lt!122238 () (_ BitVec 64))

(declare-fun b!76327 () Bool)

(assert (=> b!76327 (= e!50099 (tuple2!6647 (Cons!783 (_1!3455 lt!122237) (bitStreamReadBitsIntoList!0 thiss!1379 (_2!3455 lt!122237) (bvsub (bvsub to!314 i!635) lt!122238))) (_2!3455 lt!122237)))))

(declare-fun readBit!0 (BitStream!2514) tuple2!6648)

(assert (=> b!76327 (= lt!122237 (readBit!0 (_1!3450 lt!122211)))))

(assert (=> b!76327 (= lt!122238 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!24118 () Bool)

(assert (=> d!24118 e!50100))

(declare-fun c!5546 () Bool)

(assert (=> d!24118 (= c!5546 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24118 (= lt!122236 (_1!3454 e!50099))))

(declare-fun c!5545 () Bool)

(assert (=> d!24118 (= c!5545 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24118 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!24118 (= (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3450 lt!122211) (bvsub to!314 i!635)) lt!122236)))

(declare-fun b!76328 () Bool)

(declare-fun isEmpty!239 (List!787) Bool)

(assert (=> b!76328 (= e!50100 (isEmpty!239 lt!122236))))

(assert (= (and d!24118 c!5545) b!76326))

(assert (= (and d!24118 (not c!5545)) b!76327))

(assert (= (and d!24118 c!5546) b!76328))

(assert (= (and d!24118 (not c!5546)) b!76329))

(declare-fun m!121585 () Bool)

(assert (=> b!76329 m!121585))

(declare-fun m!121587 () Bool)

(assert (=> b!76327 m!121587))

(declare-fun m!121589 () Bool)

(assert (=> b!76327 m!121589))

(declare-fun m!121591 () Bool)

(assert (=> b!76328 m!121591))

(assert (=> b!76298 d!24118))

(declare-fun d!24120 () Bool)

(declare-fun c!5549 () Bool)

(assert (=> d!24120 (= c!5549 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50103 () List!787)

(assert (=> d!24120 (= (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 i!635 (bvsub to!314 i!635)) e!50103)))

(declare-fun b!76334 () Bool)

(assert (=> b!76334 (= e!50103 Nil!784)))

(declare-fun b!76335 () Bool)

(assert (=> b!76335 (= e!50103 (Cons!783 (not (= (bvand ((_ sign_extend 24) (select (arr!2068 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!24120 c!5549) b!76334))

(assert (= (and d!24120 (not c!5549)) b!76335))

(declare-fun m!121593 () Bool)

(assert (=> b!76335 m!121593))

(declare-fun m!121595 () Bool)

(assert (=> b!76335 m!121595))

(declare-fun m!121597 () Bool)

(assert (=> b!76335 m!121597))

(assert (=> b!76298 d!24120))

(declare-fun d!24124 () Bool)

(assert (=> d!24124 (validate_offset_bits!1 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))) ((_ sign_extend 32) (currentByte!3642 thiss!1379)) ((_ sign_extend 32) (currentBit!3637 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!122241 () Unit!5040)

(declare-fun choose!9 (BitStream!2514 array!3153 (_ BitVec 64) BitStream!2514) Unit!5040)

(assert (=> d!24124 (= lt!122241 (choose!9 thiss!1379 (buf!1851 thiss!1379) (bvsub to!314 i!635) (BitStream!2515 (buf!1851 thiss!1379) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379))))))

(assert (=> d!24124 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1851 thiss!1379) (bvsub to!314 i!635)) lt!122241)))

(declare-fun bs!5820 () Bool)

(assert (= bs!5820 d!24124))

(assert (=> bs!5820 m!121529))

(declare-fun m!121599 () Bool)

(assert (=> bs!5820 m!121599))

(assert (=> b!76298 d!24124))

(declare-fun d!24126 () Bool)

(declare-fun res!63108 () Bool)

(declare-fun e!50108 () Bool)

(assert (=> d!24126 (=> res!63108 e!50108)))

(assert (=> d!24126 (= res!63108 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24126 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3451 lt!122214) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!50108)))

(declare-fun b!76340 () Bool)

(declare-fun e!50109 () Bool)

(assert (=> b!76340 (= e!50108 e!50109)))

(declare-fun res!63109 () Bool)

(assert (=> b!76340 (=> (not res!63109) (not e!50109))))

(assert (=> b!76340 (= res!63109 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2068 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2068 (_1!3451 lt!122214)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!76341 () Bool)

(assert (=> b!76341 (= e!50109 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3451 lt!122214) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24126 (not res!63108)) b!76340))

(assert (= (and b!76340 res!63109) b!76341))

(assert (=> b!76340 m!121593))

(assert (=> b!76340 m!121595))

(declare-fun m!121601 () Bool)

(assert (=> b!76340 m!121601))

(declare-fun m!121603 () Bool)

(assert (=> b!76340 m!121603))

(declare-fun m!121605 () Bool)

(assert (=> b!76341 m!121605))

(assert (=> b!76298 d!24126))

(declare-fun b!76367 () Bool)

(declare-fun res!63138 () Bool)

(declare-fun e!50115 () Bool)

(assert (=> b!76367 (=> (not res!63138) (not e!50115))))

(declare-fun lt!122290 () tuple2!6640)

(assert (=> b!76367 (= res!63138 (invariant!0 (currentBit!3637 (_2!3451 lt!122290)) (currentByte!3642 (_2!3451 lt!122290)) (size!1470 (buf!1851 (_2!3451 lt!122290)))))))

(declare-fun b!76368 () Bool)

(declare-fun res!63139 () Bool)

(assert (=> b!76368 (=> (not res!63139) (not e!50115))))

(declare-fun lt!122287 () (_ BitVec 64))

(assert (=> b!76368 (= res!63139 (= (bvadd lt!122287 (bvsub to!314 i!635)) (bitIndex!0 (size!1470 (buf!1851 (_2!3451 lt!122290))) (currentByte!3642 (_2!3451 lt!122290)) (currentBit!3637 (_2!3451 lt!122290)))))))

(assert (=> b!76368 (or (not (= (bvand lt!122287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122287 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76368 (= lt!122287 (bitIndex!0 (size!1470 (buf!1851 (_1!3450 lt!122211))) (currentByte!3642 (_1!3450 lt!122211)) (currentBit!3637 (_1!3450 lt!122211))))))

(declare-fun b!76369 () Bool)

(declare-fun res!63135 () Bool)

(assert (=> b!76369 (=> (not res!63135) (not e!50115))))

(declare-fun lt!122295 () (_ BitVec 64))

(assert (=> b!76369 (= res!63135 (= (size!1470 (_1!3451 lt!122290)) ((_ extract 31 0) lt!122295)))))

(assert (=> b!76369 (and (bvslt lt!122295 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!122295 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!122288 () (_ BitVec 64))

(declare-fun lt!122293 () (_ BitVec 64))

(assert (=> b!76369 (= lt!122295 (bvsdiv lt!122288 lt!122293))))

(assert (=> b!76369 (and (not (= lt!122293 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!122288 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!122293 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!76369 (= lt!122293 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!122294 () (_ BitVec 64))

(declare-fun lt!122291 () (_ BitVec 64))

(assert (=> b!76369 (= lt!122288 (bvsub lt!122294 lt!122291))))

(assert (=> b!76369 (or (= (bvand lt!122294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122294 lt!122291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76369 (= lt!122291 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!122289 () (_ BitVec 64))

(assert (=> b!76369 (= lt!122294 (bvadd (bvsub to!314 i!635) lt!122289))))

(assert (=> b!76369 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122289 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!122289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76369 (= lt!122289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!76370 () Bool)

(assert (=> b!76370 (= e!50115 (= (byteArrayBitContentToList!0 (_2!3451 lt!122290) (_1!3451 lt!122290) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3451 lt!122290) (_1!3450 lt!122211) (bvsub to!314 i!635))))))

(declare-fun d!24128 () Bool)

(assert (=> d!24128 e!50115))

(declare-fun res!63137 () Bool)

(assert (=> d!24128 (=> (not res!63137) (not e!50115))))

(assert (=> d!24128 (= res!63137 (= (buf!1851 (_2!3451 lt!122290)) (buf!1851 (_1!3450 lt!122211))))))

(declare-datatypes ((tuple3!222 0))(
  ( (tuple3!223 (_1!3457 Unit!5040) (_2!3457 BitStream!2514) (_3!132 array!3153)) )
))
(declare-fun lt!122292 () tuple3!222)

(assert (=> d!24128 (= lt!122290 (tuple2!6641 (_3!132 lt!122292) (_2!3457 lt!122292)))))

(declare-fun readBitsLoop!0 (BitStream!2514 (_ BitVec 64) array!3153 (_ BitVec 64) (_ BitVec 64)) tuple3!222)

(assert (=> d!24128 (= lt!122292 (readBitsLoop!0 (_1!3450 lt!122211) (bvsub to!314 i!635) (array!3154 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24128 (= (readBits!0 (_1!3450 lt!122211) (bvsub to!314 i!635)) lt!122290)))

(declare-fun b!76371 () Bool)

(declare-fun res!63136 () Bool)

(assert (=> b!76371 (=> (not res!63136) (not e!50115))))

(assert (=> b!76371 (= res!63136 (bvsle (currentByte!3642 (_1!3450 lt!122211)) (currentByte!3642 (_2!3451 lt!122290))))))

(assert (= (and d!24128 res!63137) b!76368))

(assert (= (and b!76368 res!63139) b!76367))

(assert (= (and b!76367 res!63138) b!76369))

(assert (= (and b!76369 res!63135) b!76371))

(assert (= (and b!76371 res!63136) b!76370))

(declare-fun m!121619 () Bool)

(assert (=> b!76367 m!121619))

(declare-fun m!121621 () Bool)

(assert (=> b!76368 m!121621))

(declare-fun m!121623 () Bool)

(assert (=> b!76368 m!121623))

(declare-fun m!121625 () Bool)

(assert (=> b!76370 m!121625))

(declare-fun m!121627 () Bool)

(assert (=> b!76370 m!121627))

(declare-fun m!121629 () Bool)

(assert (=> d!24128 m!121629))

(assert (=> b!76299 d!24128))

(declare-fun d!24134 () Bool)

(declare-fun e!50139 () Bool)

(assert (=> d!24134 e!50139))

(declare-fun res!63172 () Bool)

(assert (=> d!24134 (=> (not res!63172) (not e!50139))))

(declare-fun lt!122436 () tuple2!6638)

(assert (=> d!24134 (= res!63172 (isPrefixOf!0 (_1!3450 lt!122436) (_2!3450 lt!122436)))))

(declare-fun lt!122441 () BitStream!2514)

(assert (=> d!24134 (= lt!122436 (tuple2!6639 lt!122441 thiss!1379))))

(declare-fun lt!122433 () Unit!5040)

(declare-fun lt!122451 () Unit!5040)

(assert (=> d!24134 (= lt!122433 lt!122451)))

(assert (=> d!24134 (isPrefixOf!0 lt!122441 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2514 BitStream!2514 BitStream!2514) Unit!5040)

(assert (=> d!24134 (= lt!122451 (lemmaIsPrefixTransitive!0 lt!122441 thiss!1379 thiss!1379))))

(declare-fun lt!122448 () Unit!5040)

(declare-fun lt!122439 () Unit!5040)

(assert (=> d!24134 (= lt!122448 lt!122439)))

(assert (=> d!24134 (isPrefixOf!0 lt!122441 thiss!1379)))

(assert (=> d!24134 (= lt!122439 (lemmaIsPrefixTransitive!0 lt!122441 thiss!1379 thiss!1379))))

(declare-fun lt!122446 () Unit!5040)

(declare-fun e!50138 () Unit!5040)

(assert (=> d!24134 (= lt!122446 e!50138)))

(declare-fun c!5564 () Bool)

(assert (=> d!24134 (= c!5564 (not (= (size!1470 (buf!1851 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!122449 () Unit!5040)

(declare-fun lt!122440 () Unit!5040)

(assert (=> d!24134 (= lt!122449 lt!122440)))

(assert (=> d!24134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24134 (= lt!122440 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122434 () Unit!5040)

(declare-fun lt!122435 () Unit!5040)

(assert (=> d!24134 (= lt!122434 lt!122435)))

(assert (=> d!24134 (= lt!122435 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122443 () Unit!5040)

(declare-fun lt!122437 () Unit!5040)

(assert (=> d!24134 (= lt!122443 lt!122437)))

(assert (=> d!24134 (isPrefixOf!0 lt!122441 lt!122441)))

(assert (=> d!24134 (= lt!122437 (lemmaIsPrefixRefl!0 lt!122441))))

(declare-fun lt!122447 () Unit!5040)

(declare-fun lt!122432 () Unit!5040)

(assert (=> d!24134 (= lt!122447 lt!122432)))

(assert (=> d!24134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24134 (= lt!122432 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24134 (= lt!122441 (BitStream!2515 (buf!1851 thiss!1379) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)))))

(assert (=> d!24134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24134 (= (reader!0 thiss!1379 thiss!1379) lt!122436)))

(declare-fun b!76430 () Bool)

(declare-fun res!63171 () Bool)

(assert (=> b!76430 (=> (not res!63171) (not e!50139))))

(assert (=> b!76430 (= res!63171 (isPrefixOf!0 (_2!3450 lt!122436) thiss!1379))))

(declare-fun b!76431 () Bool)

(declare-fun lt!122445 () Unit!5040)

(assert (=> b!76431 (= e!50138 lt!122445)))

(declare-fun lt!122442 () (_ BitVec 64))

(assert (=> b!76431 (= lt!122442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122450 () (_ BitVec 64))

(assert (=> b!76431 (= lt!122450 (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3153 array!3153 (_ BitVec 64) (_ BitVec 64)) Unit!5040)

(assert (=> b!76431 (= lt!122445 (arrayBitRangesEqSymmetric!0 (buf!1851 thiss!1379) (buf!1851 thiss!1379) lt!122442 lt!122450))))

(declare-fun arrayBitRangesEq!0 (array!3153 array!3153 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76431 (arrayBitRangesEq!0 (buf!1851 thiss!1379) (buf!1851 thiss!1379) lt!122442 lt!122450)))

(declare-fun lt!122438 () (_ BitVec 64))

(declare-fun b!76432 () Bool)

(declare-fun lt!122444 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2514 (_ BitVec 64)) BitStream!2514)

(assert (=> b!76432 (= e!50139 (= (_1!3450 lt!122436) (withMovedBitIndex!0 (_2!3450 lt!122436) (bvsub lt!122444 lt!122438))))))

(assert (=> b!76432 (or (= (bvand lt!122444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122444 lt!122438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76432 (= lt!122438 (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)))))

(assert (=> b!76432 (= lt!122444 (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)))))

(declare-fun b!76433 () Bool)

(declare-fun Unit!5044 () Unit!5040)

(assert (=> b!76433 (= e!50138 Unit!5044)))

(declare-fun b!76434 () Bool)

(declare-fun res!63170 () Bool)

(assert (=> b!76434 (=> (not res!63170) (not e!50139))))

(assert (=> b!76434 (= res!63170 (isPrefixOf!0 (_1!3450 lt!122436) thiss!1379))))

(assert (= (and d!24134 c!5564) b!76431))

(assert (= (and d!24134 (not c!5564)) b!76433))

(assert (= (and d!24134 res!63172) b!76434))

(assert (= (and b!76434 res!63170) b!76430))

(assert (= (and b!76430 res!63171) b!76432))

(declare-fun m!121677 () Bool)

(assert (=> d!24134 m!121677))

(assert (=> d!24134 m!121545))

(assert (=> d!24134 m!121547))

(assert (=> d!24134 m!121545))

(declare-fun m!121679 () Bool)

(assert (=> d!24134 m!121679))

(declare-fun m!121681 () Bool)

(assert (=> d!24134 m!121681))

(declare-fun m!121683 () Bool)

(assert (=> d!24134 m!121683))

(assert (=> d!24134 m!121681))

(assert (=> d!24134 m!121547))

(assert (=> d!24134 m!121545))

(declare-fun m!121685 () Bool)

(assert (=> d!24134 m!121685))

(assert (=> b!76431 m!121549))

(declare-fun m!121687 () Bool)

(assert (=> b!76431 m!121687))

(declare-fun m!121689 () Bool)

(assert (=> b!76431 m!121689))

(declare-fun m!121691 () Bool)

(assert (=> b!76430 m!121691))

(declare-fun m!121693 () Bool)

(assert (=> b!76434 m!121693))

(declare-fun m!121695 () Bool)

(assert (=> b!76432 m!121695))

(assert (=> b!76432 m!121549))

(assert (=> b!76432 m!121549))

(assert (=> b!76299 d!24134))

(declare-fun d!24144 () Bool)

(declare-fun res!63180 () Bool)

(declare-fun e!50144 () Bool)

(assert (=> d!24144 (=> (not res!63180) (not e!50144))))

(assert (=> d!24144 (= res!63180 (= (size!1470 (buf!1851 thiss!1379)) (size!1470 (buf!1851 thiss!1379))))))

(assert (=> d!24144 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!50144)))

(declare-fun b!76441 () Bool)

(declare-fun res!63181 () Bool)

(assert (=> b!76441 (=> (not res!63181) (not e!50144))))

(assert (=> b!76441 (= res!63181 (bvsle (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)) (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379))))))

(declare-fun b!76442 () Bool)

(declare-fun e!50145 () Bool)

(assert (=> b!76442 (= e!50144 e!50145)))

(declare-fun res!63179 () Bool)

(assert (=> b!76442 (=> res!63179 e!50145)))

(assert (=> b!76442 (= res!63179 (= (size!1470 (buf!1851 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!76443 () Bool)

(assert (=> b!76443 (= e!50145 (arrayBitRangesEq!0 (buf!1851 thiss!1379) (buf!1851 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379))))))

(assert (= (and d!24144 res!63180) b!76441))

(assert (= (and b!76441 res!63181) b!76442))

(assert (= (and b!76442 (not res!63179)) b!76443))

(assert (=> b!76441 m!121549))

(assert (=> b!76441 m!121549))

(assert (=> b!76443 m!121549))

(assert (=> b!76443 m!121549))

(declare-fun m!121699 () Bool)

(assert (=> b!76443 m!121699))

(assert (=> b!76294 d!24144))

(declare-fun d!24148 () Bool)

(assert (=> d!24148 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122457 () Unit!5040)

(declare-fun choose!11 (BitStream!2514) Unit!5040)

(assert (=> d!24148 (= lt!122457 (choose!11 thiss!1379))))

(assert (=> d!24148 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!122457)))

(declare-fun bs!5823 () Bool)

(assert (= bs!5823 d!24148))

(assert (=> bs!5823 m!121545))

(declare-fun m!121701 () Bool)

(assert (=> bs!5823 m!121701))

(assert (=> b!76294 d!24148))

(declare-fun d!24150 () Bool)

(declare-fun e!50158 () Bool)

(assert (=> d!24150 e!50158))

(declare-fun res!63199 () Bool)

(assert (=> d!24150 (=> (not res!63199) (not e!50158))))

(declare-fun lt!122475 () (_ BitVec 64))

(declare-fun lt!122472 () (_ BitVec 64))

(declare-fun lt!122473 () (_ BitVec 64))

(assert (=> d!24150 (= res!63199 (= lt!122473 (bvsub lt!122472 lt!122475)))))

(assert (=> d!24150 (or (= (bvand lt!122472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122472 lt!122475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24150 (= lt!122475 (remainingBits!0 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))) ((_ sign_extend 32) (currentByte!3642 thiss!1379)) ((_ sign_extend 32) (currentBit!3637 thiss!1379))))))

(declare-fun lt!122471 () (_ BitVec 64))

(declare-fun lt!122474 () (_ BitVec 64))

(assert (=> d!24150 (= lt!122472 (bvmul lt!122471 lt!122474))))

(assert (=> d!24150 (or (= lt!122471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122474 (bvsdiv (bvmul lt!122471 lt!122474) lt!122471)))))

(assert (=> d!24150 (= lt!122474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24150 (= lt!122471 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))))))

(assert (=> d!24150 (= lt!122473 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3642 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3637 thiss!1379))))))

(assert (=> d!24150 (invariant!0 (currentBit!3637 thiss!1379) (currentByte!3642 thiss!1379) (size!1470 (buf!1851 thiss!1379)))))

(assert (=> d!24150 (= (bitIndex!0 (size!1470 (buf!1851 thiss!1379)) (currentByte!3642 thiss!1379) (currentBit!3637 thiss!1379)) lt!122473)))

(declare-fun b!76460 () Bool)

(declare-fun res!63198 () Bool)

(assert (=> b!76460 (=> (not res!63198) (not e!50158))))

(assert (=> b!76460 (= res!63198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122473))))

(declare-fun b!76461 () Bool)

(declare-fun lt!122470 () (_ BitVec 64))

(assert (=> b!76461 (= e!50158 (bvsle lt!122473 (bvmul lt!122470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76461 (or (= lt!122470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122470)))))

(assert (=> b!76461 (= lt!122470 ((_ sign_extend 32) (size!1470 (buf!1851 thiss!1379))))))

(assert (= (and d!24150 res!63199) b!76460))

(assert (= (and b!76460 res!63198) b!76461))

(assert (=> d!24150 m!121583))

(assert (=> d!24150 m!121531))

(assert (=> b!76294 d!24150))

(check-sat (not b!76430) (not b!76327) (not b!76329) (not b!76443) (not b!76328) (not d!24150) (not b!76431) (not b!76434) (not d!24148) (not d!24128) (not b!76441) (not b!76341) (not d!24110) (not b!76335) (not b!76367) (not b!76370) (not b!76432) (not d!24124) (not d!24134) (not d!24116) (not b!76368))
