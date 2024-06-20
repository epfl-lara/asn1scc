; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4452 () Bool)

(assert start!4452)

(declare-fun b!18183 () Bool)

(declare-fun e!11653 () Bool)

(declare-fun e!11652 () Bool)

(assert (=> b!18183 (= e!11653 (not e!11652))))

(declare-fun res!15994 () Bool)

(assert (=> b!18183 (=> res!15994 e!11652)))

(declare-datatypes ((array!1213 0))(
  ( (array!1214 (arr!947 (Array (_ BitVec 32) (_ BitVec 8))) (size!512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!894 0))(
  ( (BitStream!895 (buf!830 array!1213) (currentByte!2069 (_ BitVec 32)) (currentBit!2064 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!894)

(declare-datatypes ((tuple2!2104 0))(
  ( (tuple2!2105 (_1!1128 array!1213) (_2!1128 BitStream!894)) )
))
(declare-fun lt!26164 () tuple2!2104)

(assert (=> b!18183 (= res!15994 (= (currentByte!2069 thiss!1917) (size!512 (buf!830 (_2!1128 lt!26164)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18183 (invariant!0 (currentBit!2064 (_2!1128 lt!26164)) (currentByte!2069 (_2!1128 lt!26164)) (size!512 (buf!830 (_2!1128 lt!26164))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!894 (_ BitVec 64)) tuple2!2104)

(assert (=> b!18183 (= lt!26164 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18182 () Bool)

(declare-fun res!15995 () Bool)

(assert (=> b!18182 (=> (not res!15995) (not e!11653))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18182 (= res!15995 (validate_offset_bits!1 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) ((_ sign_extend 32) (currentByte!2069 thiss!1917)) ((_ sign_extend 32) (currentBit!2064 thiss!1917)) nBits!604))))

(declare-fun b!18184 () Bool)

(declare-fun inv!12 (BitStream!894) Bool)

(assert (=> b!18184 (= e!11652 (inv!12 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))))))

(declare-fun res!15993 () Bool)

(assert (=> start!4452 (=> (not res!15993) (not e!11653))))

(assert (=> start!4452 (= res!15993 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4452 e!11653))

(assert (=> start!4452 true))

(declare-fun e!11655 () Bool)

(assert (=> start!4452 (and (inv!12 thiss!1917) e!11655)))

(declare-fun b!18185 () Bool)

(declare-fun array_inv!482 (array!1213) Bool)

(assert (=> b!18185 (= e!11655 (array_inv!482 (buf!830 thiss!1917)))))

(assert (= (and start!4452 res!15993) b!18182))

(assert (= (and b!18182 res!15995) b!18183))

(assert (= (and b!18183 (not res!15994)) b!18184))

(assert (= start!4452 b!18185))

(declare-fun m!24523 () Bool)

(assert (=> b!18185 m!24523))

(declare-fun m!24525 () Bool)

(assert (=> b!18182 m!24525))

(declare-fun m!24527 () Bool)

(assert (=> start!4452 m!24527))

(declare-fun m!24529 () Bool)

(assert (=> b!18184 m!24529))

(declare-fun m!24531 () Bool)

(assert (=> b!18183 m!24531))

(declare-fun m!24533 () Bool)

(assert (=> b!18183 m!24533))

(check-sat (not b!18184) (not start!4452) (not b!18183) (not b!18182) (not b!18185))
(check-sat)
(get-model)

(declare-fun d!5998 () Bool)

(assert (=> d!5998 (= (invariant!0 (currentBit!2064 (_2!1128 lt!26164)) (currentByte!2069 (_2!1128 lt!26164)) (size!512 (buf!830 (_2!1128 lt!26164)))) (and (bvsge (currentBit!2064 (_2!1128 lt!26164)) #b00000000000000000000000000000000) (bvslt (currentBit!2064 (_2!1128 lt!26164)) #b00000000000000000000000000001000) (bvsge (currentByte!2069 (_2!1128 lt!26164)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2069 (_2!1128 lt!26164)) (size!512 (buf!830 (_2!1128 lt!26164)))) (and (= (currentBit!2064 (_2!1128 lt!26164)) #b00000000000000000000000000000000) (= (currentByte!2069 (_2!1128 lt!26164)) (size!512 (buf!830 (_2!1128 lt!26164))))))))))

(assert (=> b!18183 d!5998))

(declare-fun b!18233 () Bool)

(declare-fun res!16043 () Bool)

(declare-fun e!11675 () Bool)

(assert (=> b!18233 (=> (not res!16043) (not e!11675))))

(declare-fun lt!26234 () (_ BitVec 64))

(declare-fun lt!26235 () tuple2!2104)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18233 (= res!16043 (= (bvadd lt!26234 nBits!604) (bitIndex!0 (size!512 (buf!830 (_2!1128 lt!26235))) (currentByte!2069 (_2!1128 lt!26235)) (currentBit!2064 (_2!1128 lt!26235)))))))

(assert (=> b!18233 (or (not (= (bvand lt!26234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26234 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18233 (= lt!26234 (bitIndex!0 (size!512 (buf!830 thiss!1917)) (currentByte!2069 thiss!1917) (currentBit!2064 thiss!1917)))))

(declare-fun b!18234 () Bool)

(declare-datatypes ((List!206 0))(
  ( (Nil!203) (Cons!202 (h!321 Bool) (t!956 List!206)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!894 array!1213 (_ BitVec 64) (_ BitVec 64)) List!206)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!894 BitStream!894 (_ BitVec 64)) List!206)

(assert (=> b!18234 (= e!11675 (= (byteArrayBitContentToList!0 (_2!1128 lt!26235) (_1!1128 lt!26235) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1128 lt!26235) thiss!1917 nBits!604)))))

(declare-fun b!18235 () Bool)

(declare-fun res!16042 () Bool)

(assert (=> b!18235 (=> (not res!16042) (not e!11675))))

(assert (=> b!18235 (= res!16042 (invariant!0 (currentBit!2064 (_2!1128 lt!26235)) (currentByte!2069 (_2!1128 lt!26235)) (size!512 (buf!830 (_2!1128 lt!26235)))))))

(declare-fun b!18236 () Bool)

(declare-fun res!16040 () Bool)

(assert (=> b!18236 (=> (not res!16040) (not e!11675))))

(assert (=> b!18236 (= res!16040 (bvsle (currentByte!2069 thiss!1917) (currentByte!2069 (_2!1128 lt!26235))))))

(declare-fun d!6002 () Bool)

(assert (=> d!6002 e!11675))

(declare-fun res!16041 () Bool)

(assert (=> d!6002 (=> (not res!16041) (not e!11675))))

(assert (=> d!6002 (= res!16041 (= (buf!830 (_2!1128 lt!26235)) (buf!830 thiss!1917)))))

(declare-datatypes ((Unit!1618 0))(
  ( (Unit!1619) )
))
(declare-datatypes ((tuple3!144 0))(
  ( (tuple3!145 (_1!1132 Unit!1618) (_2!1132 BitStream!894) (_3!78 array!1213)) )
))
(declare-fun lt!26236 () tuple3!144)

(assert (=> d!6002 (= lt!26235 (tuple2!2105 (_3!78 lt!26236) (_2!1132 lt!26236)))))

(declare-fun readBitsLoop!0 (BitStream!894 (_ BitVec 64) array!1213 (_ BitVec 64) (_ BitVec 64)) tuple3!144)

(assert (=> d!6002 (= lt!26236 (readBitsLoop!0 thiss!1917 nBits!604 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6002 (= (readBits!0 thiss!1917 nBits!604) lt!26235)))

(declare-fun b!18237 () Bool)

(declare-fun res!16044 () Bool)

(assert (=> b!18237 (=> (not res!16044) (not e!11675))))

(declare-fun lt!26233 () (_ BitVec 64))

(assert (=> b!18237 (= res!16044 (= (size!512 (_1!1128 lt!26235)) ((_ extract 31 0) lt!26233)))))

(assert (=> b!18237 (and (bvslt lt!26233 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26233 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26231 () (_ BitVec 64))

(declare-fun lt!26238 () (_ BitVec 64))

(assert (=> b!18237 (= lt!26233 (bvsdiv lt!26231 lt!26238))))

(assert (=> b!18237 (and (not (= lt!26238 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26231 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26238 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18237 (= lt!26238 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26239 () (_ BitVec 64))

(declare-fun lt!26232 () (_ BitVec 64))

(assert (=> b!18237 (= lt!26231 (bvsub lt!26239 lt!26232))))

(assert (=> b!18237 (or (= (bvand lt!26239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26239 lt!26232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18237 (= lt!26232 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26237 () (_ BitVec 64))

(assert (=> b!18237 (= lt!26239 (bvadd nBits!604 lt!26237))))

(assert (=> b!18237 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26237 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18237 (= lt!26237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!6002 res!16041) b!18233))

(assert (= (and b!18233 res!16043) b!18235))

(assert (= (and b!18235 res!16042) b!18237))

(assert (= (and b!18237 res!16044) b!18236))

(assert (= (and b!18236 res!16040) b!18234))

(declare-fun m!24567 () Bool)

(assert (=> b!18233 m!24567))

(declare-fun m!24569 () Bool)

(assert (=> b!18233 m!24569))

(declare-fun m!24575 () Bool)

(assert (=> b!18234 m!24575))

(declare-fun m!24577 () Bool)

(assert (=> b!18234 m!24577))

(declare-fun m!24581 () Bool)

(assert (=> b!18235 m!24581))

(declare-fun m!24585 () Bool)

(assert (=> d!6002 m!24585))

(assert (=> b!18183 d!6002))

(declare-fun d!6014 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6014 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) ((_ sign_extend 32) (currentByte!2069 thiss!1917)) ((_ sign_extend 32) (currentBit!2064 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) ((_ sign_extend 32) (currentByte!2069 thiss!1917)) ((_ sign_extend 32) (currentBit!2064 thiss!1917))) nBits!604))))

(declare-fun bs!1704 () Bool)

(assert (= bs!1704 d!6014))

(declare-fun m!24589 () Bool)

(assert (=> bs!1704 m!24589))

(assert (=> b!18182 d!6014))

(declare-fun d!6017 () Bool)

(assert (=> d!6017 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2064 thiss!1917) (currentByte!2069 thiss!1917) (size!512 (buf!830 thiss!1917))))))

(declare-fun bs!1706 () Bool)

(assert (= bs!1706 d!6017))

(declare-fun m!24593 () Bool)

(assert (=> bs!1706 m!24593))

(assert (=> start!4452 d!6017))

(declare-fun d!6020 () Bool)

(assert (=> d!6020 (= (array_inv!482 (buf!830 thiss!1917)) (bvsge (size!512 (buf!830 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18185 d!6020))

(declare-fun d!6026 () Bool)

(assert (=> d!6026 (= (inv!12 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (invariant!0 (currentBit!2064 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (currentByte!2069 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (size!512 (buf!830 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))))))))

(declare-fun bs!1709 () Bool)

(assert (= bs!1709 d!6026))

(declare-fun m!24599 () Bool)

(assert (=> bs!1709 m!24599))

(assert (=> b!18184 d!6026))

(check-sat (not b!18233) (not d!6017) (not d!6014) (not b!18234) (not d!6026) (not b!18235) (not d!6002))
(check-sat)
(get-model)

(declare-fun d!6034 () Bool)

(declare-fun c!1354 () Bool)

(assert (=> d!6034 (= c!1354 (= nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11683 () List!206)

(assert (=> d!6034 (= (byteArrayBitContentToList!0 (_2!1128 lt!26235) (_1!1128 lt!26235) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) e!11683)))

(declare-fun b!18255 () Bool)

(assert (=> b!18255 (= e!11683 Nil!203)))

(declare-fun b!18256 () Bool)

(assert (=> b!18256 (= e!11683 (Cons!202 (not (= (bvand ((_ sign_extend 24) (select (arr!947 (_1!1128 lt!26235)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1128 lt!26235) (_1!1128 lt!26235) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6034 c!1354) b!18255))

(assert (= (and d!6034 (not c!1354)) b!18256))

(declare-fun m!24603 () Bool)

(assert (=> b!18256 m!24603))

(declare-fun m!24605 () Bool)

(assert (=> b!18256 m!24605))

(declare-fun m!24607 () Bool)

(assert (=> b!18256 m!24607))

(assert (=> b!18234 d!6034))

(declare-fun b!18266 () Bool)

(declare-fun lt!26281 () (_ BitVec 64))

(declare-datatypes ((tuple2!2114 0))(
  ( (tuple2!2115 (_1!1136 Bool) (_2!1136 BitStream!894)) )
))
(declare-fun lt!26280 () tuple2!2114)

(declare-datatypes ((tuple2!2116 0))(
  ( (tuple2!2117 (_1!1137 List!206) (_2!1137 BitStream!894)) )
))
(declare-fun e!11689 () tuple2!2116)

(assert (=> b!18266 (= e!11689 (tuple2!2117 (Cons!202 (_1!1136 lt!26280) (bitStreamReadBitsIntoList!0 (_2!1128 lt!26235) (_2!1136 lt!26280) (bvsub nBits!604 lt!26281))) (_2!1136 lt!26280)))))

(declare-fun readBit!0 (BitStream!894) tuple2!2114)

(assert (=> b!18266 (= lt!26280 (readBit!0 thiss!1917))))

(assert (=> b!18266 (= lt!26281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!6036 () Bool)

(declare-fun e!11688 () Bool)

(assert (=> d!6036 e!11688))

(declare-fun c!1359 () Bool)

(assert (=> d!6036 (= c!1359 (= nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!26279 () List!206)

(assert (=> d!6036 (= lt!26279 (_1!1137 e!11689))))

(declare-fun c!1360 () Bool)

(assert (=> d!6036 (= c!1360 (= nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6036 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6036 (= (bitStreamReadBitsIntoList!0 (_2!1128 lt!26235) thiss!1917 nBits!604) lt!26279)))

(declare-fun b!18267 () Bool)

(declare-fun isEmpty!47 (List!206) Bool)

(assert (=> b!18267 (= e!11688 (isEmpty!47 lt!26279))))

(declare-fun b!18265 () Bool)

(assert (=> b!18265 (= e!11689 (tuple2!2117 Nil!203 thiss!1917))))

(declare-fun b!18268 () Bool)

(declare-fun length!42 (List!206) Int)

(assert (=> b!18268 (= e!11688 (> (length!42 lt!26279) 0))))

(assert (= (and d!6036 c!1360) b!18265))

(assert (= (and d!6036 (not c!1360)) b!18266))

(assert (= (and d!6036 c!1359) b!18267))

(assert (= (and d!6036 (not c!1359)) b!18268))

(declare-fun m!24609 () Bool)

(assert (=> b!18266 m!24609))

(declare-fun m!24611 () Bool)

(assert (=> b!18266 m!24611))

(declare-fun m!24613 () Bool)

(assert (=> b!18267 m!24613))

(declare-fun m!24615 () Bool)

(assert (=> b!18268 m!24615))

(assert (=> b!18234 d!6036))

(declare-fun d!6038 () Bool)

(declare-fun e!11692 () Bool)

(assert (=> d!6038 e!11692))

(declare-fun res!16062 () Bool)

(assert (=> d!6038 (=> (not res!16062) (not e!11692))))

(declare-fun lt!26295 () (_ BitVec 64))

(declare-fun lt!26299 () (_ BitVec 64))

(declare-fun lt!26297 () (_ BitVec 64))

(assert (=> d!6038 (= res!16062 (= lt!26297 (bvsub lt!26295 lt!26299)))))

(assert (=> d!6038 (or (= (bvand lt!26295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26295 lt!26299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6038 (= lt!26299 (remainingBits!0 ((_ sign_extend 32) (size!512 (buf!830 (_2!1128 lt!26235)))) ((_ sign_extend 32) (currentByte!2069 (_2!1128 lt!26235))) ((_ sign_extend 32) (currentBit!2064 (_2!1128 lt!26235)))))))

(declare-fun lt!26298 () (_ BitVec 64))

(declare-fun lt!26296 () (_ BitVec 64))

(assert (=> d!6038 (= lt!26295 (bvmul lt!26298 lt!26296))))

(assert (=> d!6038 (or (= lt!26298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!26296 (bvsdiv (bvmul lt!26298 lt!26296) lt!26298)))))

(assert (=> d!6038 (= lt!26296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6038 (= lt!26298 ((_ sign_extend 32) (size!512 (buf!830 (_2!1128 lt!26235)))))))

(assert (=> d!6038 (= lt!26297 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2069 (_2!1128 lt!26235))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2064 (_2!1128 lt!26235)))))))

(assert (=> d!6038 (invariant!0 (currentBit!2064 (_2!1128 lt!26235)) (currentByte!2069 (_2!1128 lt!26235)) (size!512 (buf!830 (_2!1128 lt!26235))))))

(assert (=> d!6038 (= (bitIndex!0 (size!512 (buf!830 (_2!1128 lt!26235))) (currentByte!2069 (_2!1128 lt!26235)) (currentBit!2064 (_2!1128 lt!26235))) lt!26297)))

(declare-fun b!18273 () Bool)

(declare-fun res!16063 () Bool)

(assert (=> b!18273 (=> (not res!16063) (not e!11692))))

(assert (=> b!18273 (= res!16063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!26297))))

(declare-fun b!18274 () Bool)

(declare-fun lt!26294 () (_ BitVec 64))

(assert (=> b!18274 (= e!11692 (bvsle lt!26297 (bvmul lt!26294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18274 (or (= lt!26294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!26294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!26294)))))

(assert (=> b!18274 (= lt!26294 ((_ sign_extend 32) (size!512 (buf!830 (_2!1128 lt!26235)))))))

(assert (= (and d!6038 res!16062) b!18273))

(assert (= (and b!18273 res!16063) b!18274))

(declare-fun m!24617 () Bool)

(assert (=> d!6038 m!24617))

(assert (=> d!6038 m!24581))

(assert (=> b!18233 d!6038))

(declare-fun d!6040 () Bool)

(declare-fun e!11693 () Bool)

(assert (=> d!6040 e!11693))

(declare-fun res!16064 () Bool)

(assert (=> d!6040 (=> (not res!16064) (not e!11693))))

(declare-fun lt!26303 () (_ BitVec 64))

(declare-fun lt!26305 () (_ BitVec 64))

(declare-fun lt!26301 () (_ BitVec 64))

(assert (=> d!6040 (= res!16064 (= lt!26303 (bvsub lt!26301 lt!26305)))))

(assert (=> d!6040 (or (= (bvand lt!26301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26301 lt!26305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6040 (= lt!26305 (remainingBits!0 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) ((_ sign_extend 32) (currentByte!2069 thiss!1917)) ((_ sign_extend 32) (currentBit!2064 thiss!1917))))))

(declare-fun lt!26304 () (_ BitVec 64))

(declare-fun lt!26302 () (_ BitVec 64))

(assert (=> d!6040 (= lt!26301 (bvmul lt!26304 lt!26302))))

(assert (=> d!6040 (or (= lt!26304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!26302 (bvsdiv (bvmul lt!26304 lt!26302) lt!26304)))))

(assert (=> d!6040 (= lt!26302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6040 (= lt!26304 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))))))

(assert (=> d!6040 (= lt!26303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2069 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2064 thiss!1917))))))

(assert (=> d!6040 (invariant!0 (currentBit!2064 thiss!1917) (currentByte!2069 thiss!1917) (size!512 (buf!830 thiss!1917)))))

(assert (=> d!6040 (= (bitIndex!0 (size!512 (buf!830 thiss!1917)) (currentByte!2069 thiss!1917) (currentBit!2064 thiss!1917)) lt!26303)))

(declare-fun b!18275 () Bool)

(declare-fun res!16065 () Bool)

(assert (=> b!18275 (=> (not res!16065) (not e!11693))))

(assert (=> b!18275 (= res!16065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!26303))))

(declare-fun b!18276 () Bool)

(declare-fun lt!26300 () (_ BitVec 64))

(assert (=> b!18276 (= e!11693 (bvsle lt!26303 (bvmul lt!26300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18276 (or (= lt!26300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!26300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!26300)))))

(assert (=> b!18276 (= lt!26300 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))))))

(assert (= (and d!6040 res!16064) b!18275))

(assert (= (and b!18275 res!16065) b!18276))

(assert (=> d!6040 m!24589))

(assert (=> d!6040 m!24593))

(assert (=> b!18233 d!6040))

(declare-fun d!6042 () Bool)

(assert (=> d!6042 (= (invariant!0 (currentBit!2064 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (currentByte!2069 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (size!512 (buf!830 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))))) (and (bvsge (currentBit!2064 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) #b00000000000000000000000000000000) (bvslt (currentBit!2064 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) #b00000000000000000000000000001000) (bvsge (currentByte!2069 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!2069 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (size!512 (buf!830 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))))) (and (= (currentBit!2064 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) #b00000000000000000000000000000000) (= (currentByte!2069 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164)))) (size!512 (buf!830 (BitStream!895 (buf!830 (_2!1128 lt!26164)) (currentByte!2069 thiss!1917) (currentBit!2064 (_2!1128 lt!26164))))))))))))

(assert (=> d!6026 d!6042))

(declare-fun d!6044 () Bool)

(assert (=> d!6044 (= (remainingBits!0 ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) ((_ sign_extend 32) (currentByte!2069 thiss!1917)) ((_ sign_extend 32) (currentBit!2064 thiss!1917))) (bvsub (bvmul ((_ sign_extend 32) (size!512 (buf!830 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2069 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2064 thiss!1917)))))))

(assert (=> d!6014 d!6044))

(declare-fun d!6046 () Bool)

(assert (=> d!6046 (= (invariant!0 (currentBit!2064 thiss!1917) (currentByte!2069 thiss!1917) (size!512 (buf!830 thiss!1917))) (and (bvsge (currentBit!2064 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2064 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2069 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!2069 thiss!1917) (size!512 (buf!830 thiss!1917))) (and (= (currentBit!2064 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2069 thiss!1917) (size!512 (buf!830 thiss!1917)))))))))

(assert (=> d!6017 d!6046))

(declare-fun lt!26514 () tuple3!144)

(declare-fun b!18340 () Bool)

(declare-fun e!11724 () Bool)

(assert (=> b!18340 (= e!11724 (and (= (buf!830 thiss!1917) (buf!830 (_2!1132 lt!26514))) (= (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!512 (_3!78 lt!26514)))))))

(declare-fun b!18341 () Bool)

(declare-fun res!16103 () Bool)

(declare-fun e!11726 () Bool)

(assert (=> b!18341 (=> (not res!16103) (not e!11726))))

(declare-fun lt!26528 () tuple3!144)

(assert (=> b!18341 (= res!16103 (and (= (buf!830 thiss!1917) (buf!830 (_2!1132 lt!26528))) (= (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!512 (_3!78 lt!26528)))))))

(declare-fun b!18342 () Bool)

(declare-fun res!16107 () Bool)

(assert (=> b!18342 (=> (not res!16107) (not e!11726))))

(assert (=> b!18342 (= res!16107 (invariant!0 (currentBit!2064 (_2!1132 lt!26528)) (currentByte!2069 (_2!1132 lt!26528)) (size!512 (buf!830 (_2!1132 lt!26528)))))))

(declare-fun b!18343 () Bool)

(declare-fun res!16106 () Bool)

(assert (=> b!18343 (=> (not res!16106) (not e!11726))))

(declare-fun arrayBitRangesEq!0 (array!1213 array!1213 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18343 (= res!16106 (arrayBitRangesEq!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!78 lt!26528) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!6048 () Bool)

(assert (=> d!6048 e!11726))

(declare-fun res!16102 () Bool)

(assert (=> d!6048 (=> (not res!16102) (not e!11726))))

(declare-fun lt!26504 () (_ BitVec 64))

(assert (=> d!6048 (= res!16102 (= (bvsub lt!26504 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!512 (buf!830 (_2!1132 lt!26528))) (currentByte!2069 (_2!1132 lt!26528)) (currentBit!2064 (_2!1132 lt!26528)))))))

(assert (=> d!6048 (or (= (bvand lt!26504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26504 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!26524 () (_ BitVec 64))

(assert (=> d!6048 (= lt!26504 (bvadd lt!26524 nBits!604))))

(assert (=> d!6048 (or (not (= (bvand lt!26524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26524 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6048 (= lt!26524 (bitIndex!0 (size!512 (buf!830 thiss!1917)) (currentByte!2069 thiss!1917) (currentBit!2064 thiss!1917)))))

(declare-fun e!11725 () tuple3!144)

(assert (=> d!6048 (= lt!26528 e!11725)))

(declare-fun c!1375 () Bool)

(assert (=> d!6048 (= c!1375 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6048 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6048 (= (readBitsLoop!0 thiss!1917 nBits!604 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) lt!26528)))

(declare-fun b!18344 () Bool)

(declare-fun res!16105 () Bool)

(assert (=> b!18344 (=> (not res!16105) (not e!11726))))

(declare-fun e!11723 () Bool)

(assert (=> b!18344 (= res!16105 e!11723)))

(declare-fun res!16104 () Bool)

(assert (=> b!18344 (=> res!16104 e!11723)))

(assert (=> b!18344 (= res!16104 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604)))))

(declare-fun b!18345 () Bool)

(assert (=> b!18345 (= e!11726 (= (byteArrayBitContentToList!0 (_2!1132 lt!26528) (_3!78 lt!26528) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!1132 lt!26528) thiss!1917 (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18345 (or (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18345 (or (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!287 () Bool)

(declare-fun lt!26507 () (_ BitVec 32))

(declare-fun bm!283 () Bool)

(declare-fun lt!26522 () (_ BitVec 32))

(declare-fun lt!26500 () tuple2!2114)

(assert (=> bm!283 (= call!287 (arrayBitRangesEq!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!1375 (array!1214 (store (arr!947 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!26507 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!947 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!26507)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!26522)))) ((_ sign_extend 24) (ite (_1!1136 lt!26500) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!26522) #b00000000))))) (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1375 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!26509 () Unit!1618)

(declare-fun b!18346 () Bool)

(assert (=> b!18346 (= e!11725 (tuple3!145 lt!26509 thiss!1917 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!26503 () Unit!1618)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!1213) Unit!1618)

(assert (=> b!18346 (= lt!26503 (arrayBitRangesEqReflexiveLemma!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!18346 call!287))

(declare-fun lt!26501 () Unit!1618)

(assert (=> b!18346 (= lt!26501 lt!26503)))

(declare-fun lt!26523 () array!1213)

(assert (=> b!18346 (= lt!26523 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!26512 () array!1213)

(assert (=> b!18346 (= lt!26512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!26520 () (_ BitVec 64))

(assert (=> b!18346 (= lt!26520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!26527 () (_ BitVec 64))

(assert (=> b!18346 (= lt!26527 ((_ sign_extend 32) (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!26508 () (_ BitVec 64))

(assert (=> b!18346 (= lt!26508 (bvmul lt!26527 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!26499 () (_ BitVec 64))

(assert (=> b!18346 (= lt!26499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!26496 () (_ BitVec 64))

(assert (=> b!18346 (= lt!26496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!1213 array!1213 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1618)

(assert (=> b!18346 (= lt!26509 (arrayBitRangesEqSlicedLemma!0 lt!26523 lt!26512 lt!26520 lt!26508 lt!26499 lt!26496))))

(declare-fun call!286 () Bool)

(assert (=> b!18346 call!286))

(declare-fun b!18347 () Bool)

(declare-fun lt!26502 () Unit!1618)

(assert (=> b!18347 (= e!11725 (tuple3!145 lt!26502 (_2!1132 lt!26514) (_3!78 lt!26514)))))

(assert (=> b!18347 (= lt!26500 (readBit!0 thiss!1917))))

(declare-fun lt!26526 () (_ BitVec 32))

(assert (=> b!18347 (= lt!26526 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!26530 () (_ BitVec 32))

(assert (=> b!18347 (= lt!26530 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!26515 () array!1213)

(assert (=> b!18347 (= lt!26515 (array!1214 (store (arr!947 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!26526 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!947 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!26526)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!26530)))) ((_ sign_extend 24) (ite (_1!1136 lt!26500) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!26530) #b00000000))))) (size!512 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!26517 () (_ BitVec 64))

(assert (=> b!18347 (= lt!26517 (bvsub nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!26518 () (_ BitVec 64))

(assert (=> b!18347 (= lt!26518 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26521 () Unit!1618)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!894 BitStream!894 (_ BitVec 64) (_ BitVec 64)) Unit!1618)

(assert (=> b!18347 (= lt!26521 (validateOffsetBitsIneqLemma!0 thiss!1917 (_2!1136 lt!26500) lt!26517 lt!26518))))

(assert (=> b!18347 (validate_offset_bits!1 ((_ sign_extend 32) (size!512 (buf!830 (_2!1136 lt!26500)))) ((_ sign_extend 32) (currentByte!2069 (_2!1136 lt!26500))) ((_ sign_extend 32) (currentBit!2064 (_2!1136 lt!26500))) (bvsub lt!26517 lt!26518))))

(declare-fun lt!26511 () Unit!1618)

(assert (=> b!18347 (= lt!26511 lt!26521)))

(assert (=> b!18347 (= lt!26514 (readBitsLoop!0 (_2!1136 lt!26500) nBits!604 lt!26515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!604))))

(declare-fun res!16101 () Bool)

(assert (=> b!18347 (= res!16101 (= (bvsub (bvadd (bitIndex!0 (size!512 (buf!830 thiss!1917)) (currentByte!2069 thiss!1917) (currentBit!2064 thiss!1917)) nBits!604) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!512 (buf!830 (_2!1132 lt!26514))) (currentByte!2069 (_2!1132 lt!26514)) (currentBit!2064 (_2!1132 lt!26514)))))))

(assert (=> b!18347 (=> (not res!16101) (not e!11724))))

(assert (=> b!18347 e!11724))

(declare-fun lt!26505 () Unit!1618)

(declare-fun Unit!1624 () Unit!1618)

(assert (=> b!18347 (= lt!26505 Unit!1624)))

(assert (=> b!18347 (= lt!26507 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18347 (= lt!26522 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!26516 () Unit!1618)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!1213 (_ BitVec 64) Bool) Unit!1618)

(assert (=> b!18347 (= lt!26516 (arrayBitRangesUpdatedAtLemma!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!1136 lt!26500)))))

(assert (=> b!18347 call!287))

(declare-fun lt!26513 () Unit!1618)

(assert (=> b!18347 (= lt!26513 lt!26516)))

(declare-fun lt!26510 () (_ BitVec 64))

(assert (=> b!18347 (= lt!26510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!26525 () Unit!1618)

(declare-fun arrayBitRangesEqTransitive!0 (array!1213 array!1213 array!1213 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1618)

(assert (=> b!18347 (= lt!26525 (arrayBitRangesEqTransitive!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!26515 (_3!78 lt!26514) lt!26510 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!18347 (arrayBitRangesEq!0 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!78 lt!26514) lt!26510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!26506 () Unit!1618)

(assert (=> b!18347 (= lt!26506 lt!26525)))

(assert (=> b!18347 call!286))

(declare-fun lt!26495 () Unit!1618)

(declare-fun Unit!1625 () Unit!1618)

(assert (=> b!18347 (= lt!26495 Unit!1625)))

(declare-fun lt!26498 () Unit!1618)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1213 array!1213 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1618)

(assert (=> b!18347 (= lt!26498 (arrayBitRangesEqImpliesEq!0 lt!26515 (_3!78 lt!26514) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!1213 (_ BitVec 64)) Bool)

(assert (=> b!18347 (= (bitAt!0 lt!26515 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!78 lt!26514) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!26529 () Unit!1618)

(assert (=> b!18347 (= lt!26529 lt!26498)))

(declare-fun lt!26519 () Unit!1618)

(declare-fun Unit!1626 () Unit!1618)

(assert (=> b!18347 (= lt!26519 Unit!1626)))

(declare-fun lt!26497 () Bool)

(assert (=> b!18347 (= lt!26497 (= (bitAt!0 (_3!78 lt!26514) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!1136 lt!26500)))))

(declare-fun Unit!1627 () Unit!1618)

(assert (=> b!18347 (= lt!26502 Unit!1627)))

(assert (=> b!18347 lt!26497))

(declare-fun bm!284 () Bool)

(assert (=> bm!284 (= call!286 (arrayBitRangesEq!0 (ite c!1375 (array!1214 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!26523) (ite c!1375 (_3!78 lt!26514) lt!26512) (ite c!1375 #b0000000000000000000000000000000000000000000000000000000000000000 lt!26499) (ite c!1375 #b0000000000000000000000000000000000000000000000000000000000000000 lt!26496)))))

(declare-fun b!18348 () Bool)

(declare-datatypes ((tuple2!2118 0))(
  ( (tuple2!2119 (_1!1138 BitStream!894) (_2!1138 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!894) tuple2!2118)

(assert (=> b!18348 (= e!11723 (= (bitAt!0 (_3!78 lt!26528) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!1138 (readBitPure!0 thiss!1917))))))

(assert (= (and d!6048 c!1375) b!18347))

(assert (= (and d!6048 (not c!1375)) b!18346))

(assert (= (and b!18347 res!16101) b!18340))

(assert (= (or b!18347 b!18346) bm!283))

(assert (= (or b!18347 b!18346) bm!284))

(assert (= (and d!6048 res!16102) b!18341))

(assert (= (and b!18341 res!16103) b!18343))

(assert (= (and b!18343 res!16106) b!18344))

(assert (= (and b!18344 (not res!16104)) b!18348))

(assert (= (and b!18344 res!16105) b!18342))

(assert (= (and b!18342 res!16107) b!18345))

(declare-fun m!24687 () Bool)

(assert (=> bm!284 m!24687))

(declare-fun m!24689 () Bool)

(assert (=> b!18348 m!24689))

(declare-fun m!24691 () Bool)

(assert (=> b!18348 m!24691))

(declare-fun m!24693 () Bool)

(assert (=> d!6048 m!24693))

(assert (=> d!6048 m!24569))

(declare-fun m!24695 () Bool)

(assert (=> b!18343 m!24695))

(declare-fun m!24697 () Bool)

(assert (=> b!18346 m!24697))

(declare-fun m!24699 () Bool)

(assert (=> b!18346 m!24699))

(declare-fun m!24701 () Bool)

(assert (=> b!18347 m!24701))

(declare-fun m!24703 () Bool)

(assert (=> b!18347 m!24703))

(declare-fun m!24705 () Bool)

(assert (=> b!18347 m!24705))

(declare-fun m!24707 () Bool)

(assert (=> b!18347 m!24707))

(declare-fun m!24709 () Bool)

(assert (=> b!18347 m!24709))

(declare-fun m!24711 () Bool)

(assert (=> b!18347 m!24711))

(declare-fun m!24713 () Bool)

(assert (=> b!18347 m!24713))

(declare-fun m!24715 () Bool)

(assert (=> b!18347 m!24715))

(declare-fun m!24717 () Bool)

(assert (=> b!18347 m!24717))

(declare-fun m!24719 () Bool)

(assert (=> b!18347 m!24719))

(declare-fun m!24721 () Bool)

(assert (=> b!18347 m!24721))

(assert (=> b!18347 m!24569))

(declare-fun m!24723 () Bool)

(assert (=> b!18347 m!24723))

(assert (=> b!18347 m!24611))

(declare-fun m!24725 () Bool)

(assert (=> b!18347 m!24725))

(declare-fun m!24727 () Bool)

(assert (=> b!18342 m!24727))

(declare-fun m!24729 () Bool)

(assert (=> bm!283 m!24729))

(declare-fun m!24731 () Bool)

(assert (=> bm!283 m!24731))

(declare-fun m!24733 () Bool)

(assert (=> bm!283 m!24733))

(declare-fun m!24735 () Bool)

(assert (=> bm!283 m!24735))

(declare-fun m!24737 () Bool)

(assert (=> b!18345 m!24737))

(declare-fun m!24739 () Bool)

(assert (=> b!18345 m!24739))

(assert (=> d!6002 d!6048))

(declare-fun d!6062 () Bool)

(assert (=> d!6062 (= (invariant!0 (currentBit!2064 (_2!1128 lt!26235)) (currentByte!2069 (_2!1128 lt!26235)) (size!512 (buf!830 (_2!1128 lt!26235)))) (and (bvsge (currentBit!2064 (_2!1128 lt!26235)) #b00000000000000000000000000000000) (bvslt (currentBit!2064 (_2!1128 lt!26235)) #b00000000000000000000000000001000) (bvsge (currentByte!2069 (_2!1128 lt!26235)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2069 (_2!1128 lt!26235)) (size!512 (buf!830 (_2!1128 lt!26235)))) (and (= (currentBit!2064 (_2!1128 lt!26235)) #b00000000000000000000000000000000) (= (currentByte!2069 (_2!1128 lt!26235)) (size!512 (buf!830 (_2!1128 lt!26235))))))))))

(assert (=> b!18235 d!6062))

(check-sat (not b!18342) (not d!6040) (not bm!284) (not b!18346) (not b!18256) (not bm!283) (not b!18268) (not b!18266) (not b!18343) (not b!18267) (not b!18348) (not d!6038) (not b!18347) (not b!18345) (not d!6048))
(check-sat)
