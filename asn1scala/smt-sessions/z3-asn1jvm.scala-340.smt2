; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8074 () Bool)

(assert start!8074)

(declare-fun b!40142 () Bool)

(declare-fun res!34114 () Bool)

(declare-fun e!26410 () Bool)

(assert (=> b!40142 (=> res!34114 e!26410)))

(declare-datatypes ((array!1996 0))(
  ( (array!1997 (arr!1401 (Array (_ BitVec 32) (_ BitVec 8))) (size!902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1548 0))(
  ( (BitStream!1549 (buf!1230 array!1996) (currentByte!2648 (_ BitVec 32)) (currentBit!2643 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2849 0))(
  ( (Unit!2850) )
))
(declare-datatypes ((tuple2!3856 0))(
  ( (tuple2!3857 (_1!2015 Unit!2849) (_2!2015 BitStream!1548)) )
))
(declare-fun lt!61231 () tuple2!3856)

(declare-fun lt!61237 () tuple2!3856)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40142 (= res!34114 (not (invariant!0 (currentBit!2643 (_2!2015 lt!61231)) (currentByte!2648 (_2!2015 lt!61231)) (size!902 (buf!1230 (_2!2015 lt!61237))))))))

(declare-fun b!40143 () Bool)

(declare-fun e!26413 () Bool)

(declare-fun e!26412 () Bool)

(assert (=> b!40143 (= e!26413 (not e!26412))))

(declare-fun res!34100 () Bool)

(assert (=> b!40143 (=> res!34100 e!26412)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40143 (= res!34100 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1548)

(declare-fun isPrefixOf!0 (BitStream!1548 BitStream!1548) Bool)

(assert (=> b!40143 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61234 () Unit!2849)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1548) Unit!2849)

(assert (=> b!40143 (= lt!61234 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!61229 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40143 (= lt!61229 (bitIndex!0 (size!902 (buf!1230 thiss!1379)) (currentByte!2648 thiss!1379) (currentBit!2643 thiss!1379)))))

(declare-fun b!40144 () Bool)

(declare-fun res!34103 () Bool)

(declare-fun e!26404 () Bool)

(assert (=> b!40144 (=> res!34103 e!26404)))

(declare-datatypes ((List!475 0))(
  ( (Nil!472) (Cons!471 (h!590 Bool) (t!1225 List!475)) )
))
(declare-fun lt!61235 () List!475)

(declare-fun length!201 (List!475) Int)

(assert (=> b!40144 (= res!34103 (<= (length!201 lt!61235) 0))))

(declare-fun b!40145 () Bool)

(declare-fun res!34112 () Bool)

(declare-fun e!26405 () Bool)

(assert (=> b!40145 (=> res!34112 e!26405)))

(assert (=> b!40145 (= res!34112 (not (invariant!0 (currentBit!2643 (_2!2015 lt!61237)) (currentByte!2648 (_2!2015 lt!61237)) (size!902 (buf!1230 (_2!2015 lt!61237))))))))

(declare-fun b!40146 () Bool)

(declare-fun e!26416 () Bool)

(declare-fun array_inv!827 (array!1996) Bool)

(assert (=> b!40146 (= e!26416 (array_inv!827 (buf!1230 thiss!1379)))))

(declare-fun res!34111 () Bool)

(assert (=> start!8074 (=> (not res!34111) (not e!26413))))

(declare-fun srcBuffer!2 () array!1996)

(assert (=> start!8074 (= res!34111 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!902 srcBuffer!2))))))))

(assert (=> start!8074 e!26413))

(assert (=> start!8074 true))

(assert (=> start!8074 (array_inv!827 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1548) Bool)

(assert (=> start!8074 (and (inv!12 thiss!1379) e!26416)))

(declare-fun b!40147 () Bool)

(declare-fun res!34110 () Bool)

(assert (=> b!40147 (=> (not res!34110) (not e!26413))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40147 (= res!34110 (validate_offset_bits!1 ((_ sign_extend 32) (size!902 (buf!1230 thiss!1379))) ((_ sign_extend 32) (currentByte!2648 thiss!1379)) ((_ sign_extend 32) (currentBit!2643 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40148 () Bool)

(declare-fun e!26406 () Bool)

(declare-fun e!26407 () Bool)

(assert (=> b!40148 (= e!26406 e!26407)))

(declare-fun res!34119 () Bool)

(assert (=> b!40148 (=> res!34119 e!26407)))

(declare-fun lt!61220 () Bool)

(declare-fun lt!61232 () Bool)

(assert (=> b!40148 (= res!34119 (not (= lt!61220 lt!61232)))))

(declare-fun lt!61228 () Bool)

(assert (=> b!40148 (= lt!61228 lt!61220)))

(declare-fun bitAt!0 (array!1996 (_ BitVec 64)) Bool)

(assert (=> b!40148 (= lt!61220 (bitAt!0 (buf!1230 (_2!2015 lt!61237)) lt!61229))))

(declare-fun lt!61215 () (_ BitVec 64))

(declare-fun lt!61224 () Unit!2849)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1996 array!1996 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2849)

(assert (=> b!40148 (= lt!61224 (arrayBitRangesEqImpliesEq!0 (buf!1230 (_2!2015 lt!61231)) (buf!1230 (_2!2015 lt!61237)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61229 lt!61215))))

(declare-fun b!40149 () Bool)

(declare-fun res!34104 () Bool)

(assert (=> b!40149 (=> res!34104 e!26410)))

(assert (=> b!40149 (= res!34104 (not (invariant!0 (currentBit!2643 (_2!2015 lt!61231)) (currentByte!2648 (_2!2015 lt!61231)) (size!902 (buf!1230 (_2!2015 lt!61231))))))))

(declare-fun b!40150 () Bool)

(declare-fun e!26408 () Bool)

(assert (=> b!40150 (= e!26408 e!26405)))

(declare-fun res!34117 () Bool)

(assert (=> b!40150 (=> res!34117 e!26405)))

(declare-fun lt!61214 () (_ BitVec 64))

(assert (=> b!40150 (= res!34117 (not (= lt!61214 (bvsub (bvadd lt!61229 to!314) i!635))))))

(assert (=> b!40150 (= lt!61214 (bitIndex!0 (size!902 (buf!1230 (_2!2015 lt!61237))) (currentByte!2648 (_2!2015 lt!61237)) (currentBit!2643 (_2!2015 lt!61237))))))

(declare-fun b!40151 () Bool)

(assert (=> b!40151 (= e!26405 e!26410)))

(declare-fun res!34101 () Bool)

(assert (=> b!40151 (=> res!34101 e!26410)))

(assert (=> b!40151 (= res!34101 (not (= (size!902 (buf!1230 (_2!2015 lt!61231))) (size!902 (buf!1230 (_2!2015 lt!61237))))))))

(assert (=> b!40151 (= lt!61214 (bvsub (bvsub (bvadd lt!61215 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!40151 (= lt!61215 (bitIndex!0 (size!902 (buf!1230 (_2!2015 lt!61231))) (currentByte!2648 (_2!2015 lt!61231)) (currentBit!2643 (_2!2015 lt!61231))))))

(assert (=> b!40151 (= (size!902 (buf!1230 (_2!2015 lt!61237))) (size!902 (buf!1230 thiss!1379)))))

(declare-fun e!26415 () Bool)

(declare-datatypes ((tuple2!3858 0))(
  ( (tuple2!3859 (_1!2016 BitStream!1548) (_2!2016 BitStream!1548)) )
))
(declare-fun lt!61223 () tuple2!3858)

(declare-fun b!40152 () Bool)

(declare-fun head!312 (List!475) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1548 array!1996 (_ BitVec 64) (_ BitVec 64)) List!475)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1548 BitStream!1548 (_ BitVec 64)) List!475)

(assert (=> b!40152 (= e!26415 (= (head!312 (byteArrayBitContentToList!0 (_2!2015 lt!61231) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!312 (bitStreamReadBitsIntoList!0 (_2!2015 lt!61231) (_1!2016 lt!61223) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40153 () Bool)

(declare-fun e!26411 () Bool)

(assert (=> b!40153 (= e!26411 e!26406)))

(declare-fun res!34115 () Bool)

(assert (=> b!40153 (=> res!34115 e!26406)))

(assert (=> b!40153 (= res!34115 (not (= lt!61228 lt!61232)))))

(assert (=> b!40153 (= lt!61228 (bitAt!0 (buf!1230 (_2!2015 lt!61231)) lt!61229))))

(declare-fun b!40154 () Bool)

(declare-fun e!26403 () Bool)

(assert (=> b!40154 (= e!26412 e!26403)))

(declare-fun res!34113 () Bool)

(assert (=> b!40154 (=> res!34113 e!26403)))

(assert (=> b!40154 (= res!34113 (not (isPrefixOf!0 thiss!1379 (_2!2015 lt!61231))))))

(declare-fun lt!61226 () (_ BitVec 64))

(assert (=> b!40154 (validate_offset_bits!1 ((_ sign_extend 32) (size!902 (buf!1230 (_2!2015 lt!61231)))) ((_ sign_extend 32) (currentByte!2648 (_2!2015 lt!61231))) ((_ sign_extend 32) (currentBit!2643 (_2!2015 lt!61231))) lt!61226)))

(assert (=> b!40154 (= lt!61226 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61227 () Unit!2849)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1548 BitStream!1548 (_ BitVec 64) (_ BitVec 64)) Unit!2849)

(assert (=> b!40154 (= lt!61227 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2015 lt!61231) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1548 (_ BitVec 8) (_ BitVec 32)) tuple2!3856)

(assert (=> b!40154 (= lt!61231 (appendBitFromByte!0 thiss!1379 (select (arr!1401 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!40155 () Bool)

(declare-fun e!26409 () Bool)

(assert (=> b!40155 (= e!26404 e!26409)))

(declare-fun res!34108 () Bool)

(assert (=> b!40155 (=> res!34108 e!26409)))

(declare-fun lt!61216 () List!475)

(declare-fun lt!61233 () List!475)

(assert (=> b!40155 (= res!34108 (not (= lt!61216 lt!61233)))))

(assert (=> b!40155 (= lt!61233 lt!61216)))

(declare-fun tail!192 (List!475) List!475)

(assert (=> b!40155 (= lt!61216 (tail!192 lt!61235))))

(declare-fun lt!61225 () Unit!2849)

(declare-fun lt!61222 () tuple2!3858)

(declare-fun lt!61217 () tuple2!3858)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1548 BitStream!1548 BitStream!1548 BitStream!1548 (_ BitVec 64) List!475) Unit!2849)

(assert (=> b!40155 (= lt!61225 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2015 lt!61237) (_2!2015 lt!61237) (_1!2016 lt!61222) (_1!2016 lt!61217) (bvsub to!314 i!635) lt!61235))))

(declare-fun b!40156 () Bool)

(declare-fun e!26401 () Bool)

(assert (=> b!40156 (= e!26401 e!26411)))

(declare-fun res!34109 () Bool)

(assert (=> b!40156 (=> res!34109 e!26411)))

(assert (=> b!40156 (= res!34109 (not (= (head!312 (byteArrayBitContentToList!0 (_2!2015 lt!61237) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61232)))))

(assert (=> b!40156 (= lt!61232 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40157 () Bool)

(assert (=> b!40157 (= e!26403 e!26408)))

(declare-fun res!34118 () Bool)

(assert (=> b!40157 (=> res!34118 e!26408)))

(assert (=> b!40157 (= res!34118 (not (isPrefixOf!0 (_2!2015 lt!61231) (_2!2015 lt!61237))))))

(assert (=> b!40157 (isPrefixOf!0 thiss!1379 (_2!2015 lt!61237))))

(declare-fun lt!61219 () Unit!2849)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1548 BitStream!1548 BitStream!1548) Unit!2849)

(assert (=> b!40157 (= lt!61219 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2015 lt!61231) (_2!2015 lt!61237)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1548 array!1996 (_ BitVec 64) (_ BitVec 64)) tuple2!3856)

(assert (=> b!40157 (= lt!61237 (appendBitsMSBFirstLoop!0 (_2!2015 lt!61231) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!40157 e!26415))

(declare-fun res!34105 () Bool)

(assert (=> b!40157 (=> (not res!34105) (not e!26415))))

(assert (=> b!40157 (= res!34105 (validate_offset_bits!1 ((_ sign_extend 32) (size!902 (buf!1230 (_2!2015 lt!61231)))) ((_ sign_extend 32) (currentByte!2648 thiss!1379)) ((_ sign_extend 32) (currentBit!2643 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61213 () Unit!2849)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1548 array!1996 (_ BitVec 64)) Unit!2849)

(assert (=> b!40157 (= lt!61213 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1230 (_2!2015 lt!61231)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1548 BitStream!1548) tuple2!3858)

(assert (=> b!40157 (= lt!61223 (reader!0 thiss!1379 (_2!2015 lt!61231)))))

(declare-fun b!40158 () Bool)

(assert (=> b!40158 (= e!26407 true)))

(declare-datatypes ((tuple2!3860 0))(
  ( (tuple2!3861 (_1!2017 BitStream!1548) (_2!2017 Bool)) )
))
(declare-fun lt!61236 () tuple2!3860)

(declare-fun readBitPure!0 (BitStream!1548) tuple2!3860)

(assert (=> b!40158 (= lt!61236 (readBitPure!0 (_1!2016 lt!61222)))))

(declare-fun b!40159 () Bool)

(declare-fun res!34106 () Bool)

(assert (=> b!40159 (=> res!34106 e!26401)))

(declare-fun lt!61221 () Bool)

(assert (=> b!40159 (= res!34106 (not (= (head!312 lt!61235) lt!61221)))))

(declare-fun b!40160 () Bool)

(assert (=> b!40160 (= e!26410 e!26404)))

(declare-fun res!34107 () Bool)

(assert (=> b!40160 (=> res!34107 e!26404)))

(assert (=> b!40160 (= res!34107 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40160 (= lt!61233 (bitStreamReadBitsIntoList!0 (_2!2015 lt!61237) (_1!2016 lt!61217) lt!61226))))

(assert (=> b!40160 (= lt!61235 (bitStreamReadBitsIntoList!0 (_2!2015 lt!61237) (_1!2016 lt!61222) (bvsub to!314 i!635)))))

(assert (=> b!40160 (validate_offset_bits!1 ((_ sign_extend 32) (size!902 (buf!1230 (_2!2015 lt!61237)))) ((_ sign_extend 32) (currentByte!2648 (_2!2015 lt!61231))) ((_ sign_extend 32) (currentBit!2643 (_2!2015 lt!61231))) lt!61226)))

(declare-fun lt!61218 () Unit!2849)

(assert (=> b!40160 (= lt!61218 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2015 lt!61231) (buf!1230 (_2!2015 lt!61237)) lt!61226))))

(assert (=> b!40160 (= lt!61217 (reader!0 (_2!2015 lt!61231) (_2!2015 lt!61237)))))

(assert (=> b!40160 (validate_offset_bits!1 ((_ sign_extend 32) (size!902 (buf!1230 (_2!2015 lt!61237)))) ((_ sign_extend 32) (currentByte!2648 thiss!1379)) ((_ sign_extend 32) (currentBit!2643 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61230 () Unit!2849)

(assert (=> b!40160 (= lt!61230 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1230 (_2!2015 lt!61237)) (bvsub to!314 i!635)))))

(assert (=> b!40160 (= lt!61222 (reader!0 thiss!1379 (_2!2015 lt!61237)))))

(declare-fun b!40161 () Bool)

(assert (=> b!40161 (= e!26409 e!26401)))

(declare-fun res!34102 () Bool)

(assert (=> b!40161 (=> res!34102 e!26401)))

(assert (=> b!40161 (= res!34102 (not (= lt!61221 (bitAt!0 (buf!1230 (_1!2016 lt!61217)) lt!61229))))))

(assert (=> b!40161 (= lt!61221 (bitAt!0 (buf!1230 (_1!2016 lt!61222)) lt!61229))))

(declare-fun b!40162 () Bool)

(declare-fun res!34116 () Bool)

(assert (=> b!40162 (=> res!34116 e!26405)))

(assert (=> b!40162 (= res!34116 (not (= (size!902 (buf!1230 thiss!1379)) (size!902 (buf!1230 (_2!2015 lt!61237))))))))

(assert (= (and start!8074 res!34111) b!40147))

(assert (= (and b!40147 res!34110) b!40143))

(assert (= (and b!40143 (not res!34100)) b!40154))

(assert (= (and b!40154 (not res!34113)) b!40157))

(assert (= (and b!40157 res!34105) b!40152))

(assert (= (and b!40157 (not res!34118)) b!40150))

(assert (= (and b!40150 (not res!34117)) b!40145))

(assert (= (and b!40145 (not res!34112)) b!40162))

(assert (= (and b!40162 (not res!34116)) b!40151))

(assert (= (and b!40151 (not res!34101)) b!40149))

(assert (= (and b!40149 (not res!34104)) b!40142))

(assert (= (and b!40142 (not res!34114)) b!40160))

(assert (= (and b!40160 (not res!34107)) b!40144))

(assert (= (and b!40144 (not res!34103)) b!40155))

(assert (= (and b!40155 (not res!34108)) b!40161))

(assert (= (and b!40161 (not res!34102)) b!40159))

(assert (= (and b!40159 (not res!34106)) b!40156))

(assert (= (and b!40156 (not res!34109)) b!40153))

(assert (= (and b!40153 (not res!34115)) b!40148))

(assert (= (and b!40148 (not res!34119)) b!40158))

(assert (= start!8074 b!40146))

(declare-fun m!61379 () Bool)

(assert (=> b!40142 m!61379))

(declare-fun m!61381 () Bool)

(assert (=> b!40152 m!61381))

(assert (=> b!40152 m!61381))

(declare-fun m!61383 () Bool)

(assert (=> b!40152 m!61383))

(declare-fun m!61385 () Bool)

(assert (=> b!40152 m!61385))

(assert (=> b!40152 m!61385))

(declare-fun m!61387 () Bool)

(assert (=> b!40152 m!61387))

(declare-fun m!61389 () Bool)

(assert (=> b!40153 m!61389))

(declare-fun m!61391 () Bool)

(assert (=> b!40147 m!61391))

(declare-fun m!61393 () Bool)

(assert (=> b!40150 m!61393))

(declare-fun m!61395 () Bool)

(assert (=> b!40151 m!61395))

(declare-fun m!61397 () Bool)

(assert (=> b!40145 m!61397))

(declare-fun m!61399 () Bool)

(assert (=> b!40159 m!61399))

(declare-fun m!61401 () Bool)

(assert (=> b!40156 m!61401))

(assert (=> b!40156 m!61401))

(declare-fun m!61403 () Bool)

(assert (=> b!40156 m!61403))

(declare-fun m!61405 () Bool)

(assert (=> b!40156 m!61405))

(declare-fun m!61407 () Bool)

(assert (=> b!40144 m!61407))

(declare-fun m!61409 () Bool)

(assert (=> b!40149 m!61409))

(declare-fun m!61411 () Bool)

(assert (=> start!8074 m!61411))

(declare-fun m!61413 () Bool)

(assert (=> start!8074 m!61413))

(declare-fun m!61415 () Bool)

(assert (=> b!40160 m!61415))

(declare-fun m!61417 () Bool)

(assert (=> b!40160 m!61417))

(declare-fun m!61419 () Bool)

(assert (=> b!40160 m!61419))

(declare-fun m!61421 () Bool)

(assert (=> b!40160 m!61421))

(declare-fun m!61423 () Bool)

(assert (=> b!40160 m!61423))

(declare-fun m!61425 () Bool)

(assert (=> b!40160 m!61425))

(declare-fun m!61427 () Bool)

(assert (=> b!40160 m!61427))

(declare-fun m!61429 () Bool)

(assert (=> b!40160 m!61429))

(declare-fun m!61431 () Bool)

(assert (=> b!40154 m!61431))

(declare-fun m!61433 () Bool)

(assert (=> b!40154 m!61433))

(declare-fun m!61435 () Bool)

(assert (=> b!40154 m!61435))

(declare-fun m!61437 () Bool)

(assert (=> b!40154 m!61437))

(declare-fun m!61439 () Bool)

(assert (=> b!40154 m!61439))

(assert (=> b!40154 m!61433))

(declare-fun m!61441 () Bool)

(assert (=> b!40161 m!61441))

(declare-fun m!61443 () Bool)

(assert (=> b!40161 m!61443))

(declare-fun m!61445 () Bool)

(assert (=> b!40143 m!61445))

(declare-fun m!61447 () Bool)

(assert (=> b!40143 m!61447))

(declare-fun m!61449 () Bool)

(assert (=> b!40143 m!61449))

(declare-fun m!61451 () Bool)

(assert (=> b!40157 m!61451))

(declare-fun m!61453 () Bool)

(assert (=> b!40157 m!61453))

(declare-fun m!61455 () Bool)

(assert (=> b!40157 m!61455))

(declare-fun m!61457 () Bool)

(assert (=> b!40157 m!61457))

(declare-fun m!61459 () Bool)

(assert (=> b!40157 m!61459))

(declare-fun m!61461 () Bool)

(assert (=> b!40157 m!61461))

(declare-fun m!61463 () Bool)

(assert (=> b!40157 m!61463))

(declare-fun m!61465 () Bool)

(assert (=> b!40148 m!61465))

(declare-fun m!61467 () Bool)

(assert (=> b!40148 m!61467))

(declare-fun m!61469 () Bool)

(assert (=> b!40146 m!61469))

(declare-fun m!61471 () Bool)

(assert (=> b!40155 m!61471))

(declare-fun m!61473 () Bool)

(assert (=> b!40155 m!61473))

(declare-fun m!61475 () Bool)

(assert (=> b!40158 m!61475))

(check-sat (not b!40153) (not b!40146) (not b!40147) (not b!40152) (not b!40143) (not b!40142) (not b!40160) (not b!40150) (not b!40144) (not b!40149) (not b!40154) (not b!40145) (not b!40155) (not b!40161) (not b!40156) (not b!40158) (not start!8074) (not b!40148) (not b!40151) (not b!40159) (not b!40157))
