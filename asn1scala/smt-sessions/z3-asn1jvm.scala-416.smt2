; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10622 () Bool)

(assert start!10622)

(declare-fun b!53165 () Bool)

(declare-fun e!35436 () Bool)

(declare-fun e!35432 () Bool)

(assert (=> b!53165 (= e!35436 e!35432)))

(declare-fun res!44412 () Bool)

(assert (=> b!53165 (=> res!44412 e!35432)))

(declare-datatypes ((array!2514 0))(
  ( (array!2515 (arr!1683 (Array (_ BitVec 32) (_ BitVec 8))) (size!1147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1986 0))(
  ( (BitStream!1987 (buf!1497 array!2514) (currentByte!3058 (_ BitVec 32)) (currentBit!3053 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1986)

(declare-datatypes ((Unit!3701 0))(
  ( (Unit!3702) )
))
(declare-datatypes ((tuple2!4846 0))(
  ( (tuple2!4847 (_1!2528 Unit!3701) (_2!2528 BitStream!1986)) )
))
(declare-fun lt!82384 () tuple2!4846)

(assert (=> b!53165 (= res!44412 (not (= (size!1147 (buf!1497 thiss!1379)) (size!1147 (buf!1497 (_2!2528 lt!82384))))))))

(declare-datatypes ((tuple2!4848 0))(
  ( (tuple2!4849 (_1!2529 BitStream!1986) (_2!2529 BitStream!1986)) )
))
(declare-fun lt!82383 () tuple2!4848)

(declare-fun reader!0 (BitStream!1986 BitStream!1986) tuple2!4848)

(assert (=> b!53165 (= lt!82383 (reader!0 thiss!1379 (_2!2528 lt!82384)))))

(declare-fun b!53166 () Bool)

(declare-fun e!35433 () Bool)

(declare-fun e!35437 () Bool)

(assert (=> b!53166 (= e!35433 (not e!35437))))

(declare-fun res!44414 () Bool)

(assert (=> b!53166 (=> res!44414 e!35437)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!53166 (= res!44414 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1986 BitStream!1986) Bool)

(assert (=> b!53166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82382 () Unit!3701)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1986) Unit!3701)

(assert (=> b!53166 (= lt!82382 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82381 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53166 (= lt!82381 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)))))

(declare-fun b!53167 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53167 (= e!35432 (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!53168 () Bool)

(declare-fun res!44413 () Bool)

(assert (=> b!53168 (=> (not res!44413) (not e!35433))))

(assert (=> b!53168 (= res!44413 (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!44415 () Bool)

(assert (=> start!10622 (=> (not res!44415) (not e!35433))))

(declare-fun srcBuffer!2 () array!2514)

(assert (=> start!10622 (= res!44415 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1147 srcBuffer!2))))))))

(assert (=> start!10622 e!35433))

(assert (=> start!10622 true))

(declare-fun array_inv!1052 (array!2514) Bool)

(assert (=> start!10622 (array_inv!1052 srcBuffer!2)))

(declare-fun e!35434 () Bool)

(declare-fun inv!12 (BitStream!1986) Bool)

(assert (=> start!10622 (and (inv!12 thiss!1379) e!35434)))

(declare-fun b!53169 () Bool)

(assert (=> b!53169 (= e!35437 e!35436)))

(declare-fun res!44411 () Bool)

(assert (=> b!53169 (=> res!44411 e!35436)))

(assert (=> b!53169 (= res!44411 (not (isPrefixOf!0 thiss!1379 (_2!2528 lt!82384))))))

(assert (=> b!53169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 (_2!2528 lt!82384)))) ((_ sign_extend 32) (currentByte!3058 (_2!2528 lt!82384))) ((_ sign_extend 32) (currentBit!3053 (_2!2528 lt!82384))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82380 () Unit!3701)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1986 BitStream!1986 (_ BitVec 64) (_ BitVec 64)) Unit!3701)

(assert (=> b!53169 (= lt!82380 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2528 lt!82384) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1986 (_ BitVec 8) (_ BitVec 32)) tuple2!4846)

(assert (=> b!53169 (= lt!82384 (appendBitFromByte!0 thiss!1379 (select (arr!1683 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53170 () Bool)

(assert (=> b!53170 (= e!35434 (array_inv!1052 (buf!1497 thiss!1379)))))

(assert (= (and start!10622 res!44415) b!53168))

(assert (= (and b!53168 res!44413) b!53166))

(assert (= (and b!53166 (not res!44414)) b!53169))

(assert (= (and b!53169 (not res!44411)) b!53165))

(assert (= (and b!53165 (not res!44412)) b!53167))

(assert (= start!10622 b!53170))

(declare-fun m!83675 () Bool)

(assert (=> b!53166 m!83675))

(declare-fun m!83677 () Bool)

(assert (=> b!53166 m!83677))

(declare-fun m!83679 () Bool)

(assert (=> b!53166 m!83679))

(declare-fun m!83681 () Bool)

(assert (=> start!10622 m!83681))

(declare-fun m!83683 () Bool)

(assert (=> start!10622 m!83683))

(declare-fun m!83685 () Bool)

(assert (=> b!53168 m!83685))

(declare-fun m!83687 () Bool)

(assert (=> b!53170 m!83687))

(declare-fun m!83689 () Bool)

(assert (=> b!53167 m!83689))

(declare-fun m!83691 () Bool)

(assert (=> b!53169 m!83691))

(declare-fun m!83693 () Bool)

(assert (=> b!53169 m!83693))

(declare-fun m!83695 () Bool)

(assert (=> b!53169 m!83695))

(assert (=> b!53169 m!83691))

(declare-fun m!83697 () Bool)

(assert (=> b!53169 m!83697))

(declare-fun m!83699 () Bool)

(assert (=> b!53169 m!83699))

(declare-fun m!83701 () Bool)

(assert (=> b!53165 m!83701))

(check-sat (not b!53165) (not b!53169) (not b!53167) (not start!10622) (not b!53166) (not b!53170) (not b!53168))
(check-sat)
(get-model)

(declare-fun d!16822 () Bool)

(declare-fun res!44438 () Bool)

(declare-fun e!35465 () Bool)

(assert (=> d!16822 (=> (not res!44438) (not e!35465))))

(assert (=> d!16822 (= res!44438 (= (size!1147 (buf!1497 thiss!1379)) (size!1147 (buf!1497 (_2!2528 lt!82384)))))))

(assert (=> d!16822 (= (isPrefixOf!0 thiss!1379 (_2!2528 lt!82384)) e!35465)))

(declare-fun b!53195 () Bool)

(declare-fun res!44439 () Bool)

(assert (=> b!53195 (=> (not res!44439) (not e!35465))))

(assert (=> b!53195 (= res!44439 (bvsle (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)) (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82384))) (currentByte!3058 (_2!2528 lt!82384)) (currentBit!3053 (_2!2528 lt!82384)))))))

(declare-fun b!53196 () Bool)

(declare-fun e!35464 () Bool)

(assert (=> b!53196 (= e!35465 e!35464)))

(declare-fun res!44437 () Bool)

(assert (=> b!53196 (=> res!44437 e!35464)))

(assert (=> b!53196 (= res!44437 (= (size!1147 (buf!1497 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53197 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2514 array!2514 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53197 (= e!35464 (arrayBitRangesEq!0 (buf!1497 thiss!1379) (buf!1497 (_2!2528 lt!82384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379))))))

(assert (= (and d!16822 res!44438) b!53195))

(assert (= (and b!53195 res!44439) b!53196))

(assert (= (and b!53196 (not res!44437)) b!53197))

(assert (=> b!53195 m!83679))

(declare-fun m!83731 () Bool)

(assert (=> b!53195 m!83731))

(assert (=> b!53197 m!83679))

(assert (=> b!53197 m!83679))

(declare-fun m!83733 () Bool)

(assert (=> b!53197 m!83733))

(assert (=> b!53169 d!16822))

(declare-fun d!16824 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 (_2!2528 lt!82384)))) ((_ sign_extend 32) (currentByte!3058 (_2!2528 lt!82384))) ((_ sign_extend 32) (currentBit!3053 (_2!2528 lt!82384))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1147 (buf!1497 (_2!2528 lt!82384)))) ((_ sign_extend 32) (currentByte!3058 (_2!2528 lt!82384))) ((_ sign_extend 32) (currentBit!3053 (_2!2528 lt!82384)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4269 () Bool)

(assert (= bs!4269 d!16824))

(declare-fun m!83735 () Bool)

(assert (=> bs!4269 m!83735))

(assert (=> b!53169 d!16824))

(declare-fun d!16826 () Bool)

(declare-fun e!35468 () Bool)

(assert (=> d!16826 e!35468))

(declare-fun res!44442 () Bool)

(assert (=> d!16826 (=> (not res!44442) (not e!35468))))

(assert (=> d!16826 (= res!44442 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!82402 () Unit!3701)

(declare-fun choose!27 (BitStream!1986 BitStream!1986 (_ BitVec 64) (_ BitVec 64)) Unit!3701)

(assert (=> d!16826 (= lt!82402 (choose!27 thiss!1379 (_2!2528 lt!82384) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16826 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2528 lt!82384) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82402)))

(declare-fun b!53200 () Bool)

(assert (=> b!53200 (= e!35468 (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 (_2!2528 lt!82384)))) ((_ sign_extend 32) (currentByte!3058 (_2!2528 lt!82384))) ((_ sign_extend 32) (currentBit!3053 (_2!2528 lt!82384))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16826 res!44442) b!53200))

(declare-fun m!83737 () Bool)

(assert (=> d!16826 m!83737))

(assert (=> b!53200 m!83699))

(assert (=> b!53169 d!16826))

(declare-fun b!53239 () Bool)

(declare-fun e!35492 () Bool)

(declare-fun e!35493 () Bool)

(assert (=> b!53239 (= e!35492 e!35493)))

(declare-fun res!44481 () Bool)

(assert (=> b!53239 (=> (not res!44481) (not e!35493))))

(declare-datatypes ((tuple2!4854 0))(
  ( (tuple2!4855 (_1!2532 BitStream!1986) (_2!2532 Bool)) )
))
(declare-fun lt!82457 () tuple2!4854)

(declare-fun lt!82453 () Bool)

(declare-fun lt!82462 () tuple2!4846)

(assert (=> b!53239 (= res!44481 (and (= (_2!2532 lt!82457) lt!82453) (= (_1!2532 lt!82457) (_2!2528 lt!82462))))))

(declare-fun readBitPure!0 (BitStream!1986) tuple2!4854)

(declare-fun readerFrom!0 (BitStream!1986 (_ BitVec 32) (_ BitVec 32)) BitStream!1986)

(assert (=> b!53239 (= lt!82457 (readBitPure!0 (readerFrom!0 (_2!2528 lt!82462) (currentBit!3053 thiss!1379) (currentByte!3058 thiss!1379))))))

(declare-fun b!53240 () Bool)

(declare-fun res!44484 () Bool)

(assert (=> b!53240 (=> (not res!44484) (not e!35492))))

(assert (=> b!53240 (= res!44484 (isPrefixOf!0 thiss!1379 (_2!2528 lt!82462)))))

(declare-fun b!53241 () Bool)

(declare-fun res!44483 () Bool)

(declare-fun e!35491 () Bool)

(assert (=> b!53241 (=> (not res!44483) (not e!35491))))

(declare-fun lt!82460 () tuple2!4846)

(assert (=> b!53241 (= res!44483 (isPrefixOf!0 thiss!1379 (_2!2528 lt!82460)))))

(declare-fun d!16828 () Bool)

(assert (=> d!16828 e!35491))

(declare-fun res!44487 () Bool)

(assert (=> d!16828 (=> (not res!44487) (not e!35491))))

(assert (=> d!16828 (= res!44487 (= (size!1147 (buf!1497 (_2!2528 lt!82460))) (size!1147 (buf!1497 thiss!1379))))))

(declare-fun lt!82459 () (_ BitVec 8))

(declare-fun lt!82456 () array!2514)

(assert (=> d!16828 (= lt!82459 (select (arr!1683 lt!82456) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16828 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1147 lt!82456)))))

(assert (=> d!16828 (= lt!82456 (array!2515 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!82458 () tuple2!4846)

(assert (=> d!16828 (= lt!82460 (tuple2!4847 (_1!2528 lt!82458) (_2!2528 lt!82458)))))

(assert (=> d!16828 (= lt!82458 lt!82462)))

(assert (=> d!16828 e!35492))

(declare-fun res!44486 () Bool)

(assert (=> d!16828 (=> (not res!44486) (not e!35492))))

(assert (=> d!16828 (= res!44486 (= (size!1147 (buf!1497 thiss!1379)) (size!1147 (buf!1497 (_2!2528 lt!82462)))))))

(declare-fun appendBit!0 (BitStream!1986 Bool) tuple2!4846)

(assert (=> d!16828 (= lt!82462 (appendBit!0 thiss!1379 lt!82453))))

(assert (=> d!16828 (= lt!82453 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1683 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16828 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16828 (= (appendBitFromByte!0 thiss!1379 (select (arr!1683 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!82460)))

(declare-fun b!53242 () Bool)

(declare-fun e!35494 () Bool)

(declare-fun lt!82454 () tuple2!4854)

(assert (=> b!53242 (= e!35494 (= (bitIndex!0 (size!1147 (buf!1497 (_1!2532 lt!82454))) (currentByte!3058 (_1!2532 lt!82454)) (currentBit!3053 (_1!2532 lt!82454))) (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82460))) (currentByte!3058 (_2!2528 lt!82460)) (currentBit!3053 (_2!2528 lt!82460)))))))

(declare-fun b!53243 () Bool)

(assert (=> b!53243 (= e!35493 (= (bitIndex!0 (size!1147 (buf!1497 (_1!2532 lt!82457))) (currentByte!3058 (_1!2532 lt!82457)) (currentBit!3053 (_1!2532 lt!82457))) (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82462))) (currentByte!3058 (_2!2528 lt!82462)) (currentBit!3053 (_2!2528 lt!82462)))))))

(declare-fun b!53244 () Bool)

(declare-fun res!44482 () Bool)

(assert (=> b!53244 (=> (not res!44482) (not e!35492))))

(assert (=> b!53244 (= res!44482 (= (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82462))) (currentByte!3058 (_2!2528 lt!82462)) (currentBit!3053 (_2!2528 lt!82462))) (bvadd (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53245 () Bool)

(assert (=> b!53245 (= e!35491 e!35494)))

(declare-fun res!44480 () Bool)

(assert (=> b!53245 (=> (not res!44480) (not e!35494))))

(assert (=> b!53245 (= res!44480 (and (= (_2!2532 lt!82454) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1683 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!82459)) #b00000000000000000000000000000000))) (= (_1!2532 lt!82454) (_2!2528 lt!82460))))))

(declare-datatypes ((tuple2!4856 0))(
  ( (tuple2!4857 (_1!2533 array!2514) (_2!2533 BitStream!1986)) )
))
(declare-fun lt!82461 () tuple2!4856)

(declare-fun lt!82455 () BitStream!1986)

(declare-fun readBits!0 (BitStream!1986 (_ BitVec 64)) tuple2!4856)

(assert (=> b!53245 (= lt!82461 (readBits!0 lt!82455 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!53245 (= lt!82454 (readBitPure!0 lt!82455))))

(assert (=> b!53245 (= lt!82455 (readerFrom!0 (_2!2528 lt!82460) (currentBit!3053 thiss!1379) (currentByte!3058 thiss!1379)))))

(declare-fun b!53246 () Bool)

(declare-fun res!44485 () Bool)

(assert (=> b!53246 (=> (not res!44485) (not e!35491))))

(declare-fun lt!82452 () (_ BitVec 64))

(declare-fun lt!82451 () (_ BitVec 64))

(assert (=> b!53246 (= res!44485 (= (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82460))) (currentByte!3058 (_2!2528 lt!82460)) (currentBit!3053 (_2!2528 lt!82460))) (bvadd lt!82451 lt!82452)))))

(assert (=> b!53246 (or (not (= (bvand lt!82451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82452 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!82451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!82451 lt!82452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53246 (= lt!82452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53246 (= lt!82451 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)))))

(assert (= (and d!16828 res!44486) b!53244))

(assert (= (and b!53244 res!44482) b!53240))

(assert (= (and b!53240 res!44484) b!53239))

(assert (= (and b!53239 res!44481) b!53243))

(assert (= (and d!16828 res!44487) b!53246))

(assert (= (and b!53246 res!44485) b!53241))

(assert (= (and b!53241 res!44483) b!53245))

(assert (= (and b!53245 res!44480) b!53242))

(declare-fun m!83757 () Bool)

(assert (=> b!53245 m!83757))

(declare-fun m!83759 () Bool)

(assert (=> b!53245 m!83759))

(declare-fun m!83761 () Bool)

(assert (=> b!53245 m!83761))

(declare-fun m!83763 () Bool)

(assert (=> b!53242 m!83763))

(declare-fun m!83765 () Bool)

(assert (=> b!53242 m!83765))

(declare-fun m!83767 () Bool)

(assert (=> b!53244 m!83767))

(assert (=> b!53244 m!83679))

(declare-fun m!83769 () Bool)

(assert (=> b!53241 m!83769))

(declare-fun m!83771 () Bool)

(assert (=> b!53240 m!83771))

(declare-fun m!83773 () Bool)

(assert (=> b!53243 m!83773))

(assert (=> b!53243 m!83767))

(declare-fun m!83775 () Bool)

(assert (=> b!53239 m!83775))

(assert (=> b!53239 m!83775))

(declare-fun m!83777 () Bool)

(assert (=> b!53239 m!83777))

(assert (=> b!53246 m!83765))

(assert (=> b!53246 m!83679))

(declare-fun m!83779 () Bool)

(assert (=> d!16828 m!83779))

(declare-fun m!83781 () Bool)

(assert (=> d!16828 m!83781))

(declare-fun m!83783 () Bool)

(assert (=> d!16828 m!83783))

(assert (=> b!53169 d!16828))

(declare-fun d!16858 () Bool)

(assert (=> d!16858 (= (array_inv!1052 (buf!1497 thiss!1379)) (bvsge (size!1147 (buf!1497 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53170 d!16858))

(declare-fun d!16860 () Bool)

(assert (=> d!16860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4276 () Bool)

(assert (= bs!4276 d!16860))

(declare-fun m!83785 () Bool)

(assert (=> bs!4276 m!83785))

(assert (=> b!53168 d!16860))

(declare-fun d!16862 () Bool)

(assert (=> d!16862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4277 () Bool)

(assert (= bs!4277 d!16862))

(assert (=> bs!4277 m!83785))

(assert (=> b!53167 d!16862))

(declare-fun lt!82546 () tuple2!4848)

(declare-fun b!53274 () Bool)

(declare-fun lt!82542 () (_ BitVec 64))

(declare-fun lt!82538 () (_ BitVec 64))

(declare-fun e!35508 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1986 (_ BitVec 64)) BitStream!1986)

(assert (=> b!53274 (= e!35508 (= (_1!2529 lt!82546) (withMovedBitIndex!0 (_2!2529 lt!82546) (bvsub lt!82542 lt!82538))))))

(assert (=> b!53274 (or (= (bvand lt!82542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82542 lt!82538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53274 (= lt!82538 (bitIndex!0 (size!1147 (buf!1497 (_2!2528 lt!82384))) (currentByte!3058 (_2!2528 lt!82384)) (currentBit!3053 (_2!2528 lt!82384))))))

(assert (=> b!53274 (= lt!82542 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)))))

(declare-fun b!53275 () Bool)

(declare-fun res!44512 () Bool)

(assert (=> b!53275 (=> (not res!44512) (not e!35508))))

(assert (=> b!53275 (= res!44512 (isPrefixOf!0 (_1!2529 lt!82546) thiss!1379))))

(declare-fun b!53276 () Bool)

(declare-fun e!35507 () Unit!3701)

(declare-fun lt!82543 () Unit!3701)

(assert (=> b!53276 (= e!35507 lt!82543)))

(declare-fun lt!82535 () (_ BitVec 64))

(assert (=> b!53276 (= lt!82535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82529 () (_ BitVec 64))

(assert (=> b!53276 (= lt!82529 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2514 array!2514 (_ BitVec 64) (_ BitVec 64)) Unit!3701)

(assert (=> b!53276 (= lt!82543 (arrayBitRangesEqSymmetric!0 (buf!1497 thiss!1379) (buf!1497 (_2!2528 lt!82384)) lt!82535 lt!82529))))

(assert (=> b!53276 (arrayBitRangesEq!0 (buf!1497 (_2!2528 lt!82384)) (buf!1497 thiss!1379) lt!82535 lt!82529)))

(declare-fun d!16864 () Bool)

(assert (=> d!16864 e!35508))

(declare-fun res!44510 () Bool)

(assert (=> d!16864 (=> (not res!44510) (not e!35508))))

(assert (=> d!16864 (= res!44510 (isPrefixOf!0 (_1!2529 lt!82546) (_2!2529 lt!82546)))))

(declare-fun lt!82545 () BitStream!1986)

(assert (=> d!16864 (= lt!82546 (tuple2!4849 lt!82545 (_2!2528 lt!82384)))))

(declare-fun lt!82541 () Unit!3701)

(declare-fun lt!82527 () Unit!3701)

(assert (=> d!16864 (= lt!82541 lt!82527)))

(assert (=> d!16864 (isPrefixOf!0 lt!82545 (_2!2528 lt!82384))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1986 BitStream!1986 BitStream!1986) Unit!3701)

(assert (=> d!16864 (= lt!82527 (lemmaIsPrefixTransitive!0 lt!82545 (_2!2528 lt!82384) (_2!2528 lt!82384)))))

(declare-fun lt!82534 () Unit!3701)

(declare-fun lt!82532 () Unit!3701)

(assert (=> d!16864 (= lt!82534 lt!82532)))

(assert (=> d!16864 (isPrefixOf!0 lt!82545 (_2!2528 lt!82384))))

(assert (=> d!16864 (= lt!82532 (lemmaIsPrefixTransitive!0 lt!82545 thiss!1379 (_2!2528 lt!82384)))))

(declare-fun lt!82539 () Unit!3701)

(assert (=> d!16864 (= lt!82539 e!35507)))

(declare-fun c!3756 () Bool)

(assert (=> d!16864 (= c!3756 (not (= (size!1147 (buf!1497 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82540 () Unit!3701)

(declare-fun lt!82531 () Unit!3701)

(assert (=> d!16864 (= lt!82540 lt!82531)))

(assert (=> d!16864 (isPrefixOf!0 (_2!2528 lt!82384) (_2!2528 lt!82384))))

(assert (=> d!16864 (= lt!82531 (lemmaIsPrefixRefl!0 (_2!2528 lt!82384)))))

(declare-fun lt!82536 () Unit!3701)

(declare-fun lt!82544 () Unit!3701)

(assert (=> d!16864 (= lt!82536 lt!82544)))

(assert (=> d!16864 (= lt!82544 (lemmaIsPrefixRefl!0 (_2!2528 lt!82384)))))

(declare-fun lt!82533 () Unit!3701)

(declare-fun lt!82537 () Unit!3701)

(assert (=> d!16864 (= lt!82533 lt!82537)))

(assert (=> d!16864 (isPrefixOf!0 lt!82545 lt!82545)))

(assert (=> d!16864 (= lt!82537 (lemmaIsPrefixRefl!0 lt!82545))))

(declare-fun lt!82528 () Unit!3701)

(declare-fun lt!82530 () Unit!3701)

(assert (=> d!16864 (= lt!82528 lt!82530)))

(assert (=> d!16864 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16864 (= lt!82530 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16864 (= lt!82545 (BitStream!1987 (buf!1497 (_2!2528 lt!82384)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)))))

(assert (=> d!16864 (isPrefixOf!0 thiss!1379 (_2!2528 lt!82384))))

(assert (=> d!16864 (= (reader!0 thiss!1379 (_2!2528 lt!82384)) lt!82546)))

(declare-fun b!53277 () Bool)

(declare-fun Unit!3705 () Unit!3701)

(assert (=> b!53277 (= e!35507 Unit!3705)))

(declare-fun b!53278 () Bool)

(declare-fun res!44511 () Bool)

(assert (=> b!53278 (=> (not res!44511) (not e!35508))))

(assert (=> b!53278 (= res!44511 (isPrefixOf!0 (_2!2529 lt!82546) (_2!2528 lt!82384)))))

(assert (= (and d!16864 c!3756) b!53276))

(assert (= (and d!16864 (not c!3756)) b!53277))

(assert (= (and d!16864 res!44510) b!53275))

(assert (= (and b!53275 res!44512) b!53278))

(assert (= (and b!53278 res!44511) b!53274))

(declare-fun m!83787 () Bool)

(assert (=> d!16864 m!83787))

(declare-fun m!83789 () Bool)

(assert (=> d!16864 m!83789))

(declare-fun m!83791 () Bool)

(assert (=> d!16864 m!83791))

(assert (=> d!16864 m!83675))

(declare-fun m!83793 () Bool)

(assert (=> d!16864 m!83793))

(declare-fun m!83795 () Bool)

(assert (=> d!16864 m!83795))

(declare-fun m!83797 () Bool)

(assert (=> d!16864 m!83797))

(assert (=> d!16864 m!83677))

(declare-fun m!83799 () Bool)

(assert (=> d!16864 m!83799))

(declare-fun m!83801 () Bool)

(assert (=> d!16864 m!83801))

(assert (=> d!16864 m!83695))

(assert (=> b!53276 m!83679))

(declare-fun m!83803 () Bool)

(assert (=> b!53276 m!83803))

(declare-fun m!83805 () Bool)

(assert (=> b!53276 m!83805))

(declare-fun m!83807 () Bool)

(assert (=> b!53275 m!83807))

(declare-fun m!83809 () Bool)

(assert (=> b!53278 m!83809))

(declare-fun m!83811 () Bool)

(assert (=> b!53274 m!83811))

(assert (=> b!53274 m!83731))

(assert (=> b!53274 m!83679))

(assert (=> b!53165 d!16864))

(declare-fun d!16866 () Bool)

(assert (=> d!16866 (= (array_inv!1052 srcBuffer!2) (bvsge (size!1147 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10622 d!16866))

(declare-fun d!16868 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16868 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3053 thiss!1379) (currentByte!3058 thiss!1379) (size!1147 (buf!1497 thiss!1379))))))

(declare-fun bs!4278 () Bool)

(assert (= bs!4278 d!16868))

(declare-fun m!83821 () Bool)

(assert (=> bs!4278 m!83821))

(assert (=> start!10622 d!16868))

(declare-fun d!16870 () Bool)

(declare-fun res!44522 () Bool)

(declare-fun e!35516 () Bool)

(assert (=> d!16870 (=> (not res!44522) (not e!35516))))

(assert (=> d!16870 (= res!44522 (= (size!1147 (buf!1497 thiss!1379)) (size!1147 (buf!1497 thiss!1379))))))

(assert (=> d!16870 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35516)))

(declare-fun b!53291 () Bool)

(declare-fun res!44523 () Bool)

(assert (=> b!53291 (=> (not res!44523) (not e!35516))))

(assert (=> b!53291 (= res!44523 (bvsle (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)) (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379))))))

(declare-fun b!53292 () Bool)

(declare-fun e!35515 () Bool)

(assert (=> b!53292 (= e!35516 e!35515)))

(declare-fun res!44521 () Bool)

(assert (=> b!53292 (=> res!44521 e!35515)))

(assert (=> b!53292 (= res!44521 (= (size!1147 (buf!1497 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53293 () Bool)

(assert (=> b!53293 (= e!35515 (arrayBitRangesEq!0 (buf!1497 thiss!1379) (buf!1497 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379))))))

(assert (= (and d!16870 res!44522) b!53291))

(assert (= (and b!53291 res!44523) b!53292))

(assert (= (and b!53292 (not res!44521)) b!53293))

(assert (=> b!53291 m!83679))

(assert (=> b!53291 m!83679))

(assert (=> b!53293 m!83679))

(assert (=> b!53293 m!83679))

(declare-fun m!83843 () Bool)

(assert (=> b!53293 m!83843))

(assert (=> b!53166 d!16870))

(declare-fun d!16874 () Bool)

(assert (=> d!16874 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82601 () Unit!3701)

(declare-fun choose!11 (BitStream!1986) Unit!3701)

(assert (=> d!16874 (= lt!82601 (choose!11 thiss!1379))))

(assert (=> d!16874 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82601)))

(declare-fun bs!4280 () Bool)

(assert (= bs!4280 d!16874))

(assert (=> bs!4280 m!83675))

(declare-fun m!83845 () Bool)

(assert (=> bs!4280 m!83845))

(assert (=> b!53166 d!16874))

(declare-fun d!16876 () Bool)

(declare-fun e!35527 () Bool)

(assert (=> d!16876 e!35527))

(declare-fun res!44543 () Bool)

(assert (=> d!16876 (=> (not res!44543) (not e!35527))))

(declare-fun lt!82634 () (_ BitVec 64))

(declare-fun lt!82639 () (_ BitVec 64))

(declare-fun lt!82637 () (_ BitVec 64))

(assert (=> d!16876 (= res!44543 (= lt!82637 (bvsub lt!82639 lt!82634)))))

(assert (=> d!16876 (or (= (bvand lt!82639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82639 lt!82634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16876 (= lt!82634 (remainingBits!0 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))) ((_ sign_extend 32) (currentByte!3058 thiss!1379)) ((_ sign_extend 32) (currentBit!3053 thiss!1379))))))

(declare-fun lt!82636 () (_ BitVec 64))

(declare-fun lt!82638 () (_ BitVec 64))

(assert (=> d!16876 (= lt!82639 (bvmul lt!82636 lt!82638))))

(assert (=> d!16876 (or (= lt!82636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82638 (bvsdiv (bvmul lt!82636 lt!82638) lt!82636)))))

(assert (=> d!16876 (= lt!82638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16876 (= lt!82636 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))))))

(assert (=> d!16876 (= lt!82637 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3058 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3053 thiss!1379))))))

(assert (=> d!16876 (invariant!0 (currentBit!3053 thiss!1379) (currentByte!3058 thiss!1379) (size!1147 (buf!1497 thiss!1379)))))

(assert (=> d!16876 (= (bitIndex!0 (size!1147 (buf!1497 thiss!1379)) (currentByte!3058 thiss!1379) (currentBit!3053 thiss!1379)) lt!82637)))

(declare-fun b!53315 () Bool)

(declare-fun res!44544 () Bool)

(assert (=> b!53315 (=> (not res!44544) (not e!35527))))

(assert (=> b!53315 (= res!44544 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82637))))

(declare-fun b!53316 () Bool)

(declare-fun lt!82635 () (_ BitVec 64))

(assert (=> b!53316 (= e!35527 (bvsle lt!82637 (bvmul lt!82635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53316 (or (= lt!82635 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82635 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82635)))))

(assert (=> b!53316 (= lt!82635 ((_ sign_extend 32) (size!1147 (buf!1497 thiss!1379))))))

(assert (= (and d!16876 res!44543) b!53315))

(assert (= (and b!53315 res!44544) b!53316))

(assert (=> d!16876 m!83785))

(assert (=> d!16876 m!83821))

(assert (=> b!53166 d!16876))

(check-sat (not d!16826) (not b!53239) (not b!53240) (not d!16868) (not d!16862) (not b!53276) (not d!16874) (not b!53291) (not b!53246) (not d!16864) (not b!53243) (not b!53293) (not b!53241) (not d!16824) (not b!53274) (not b!53278) (not d!16828) (not d!16860) (not b!53245) (not b!53244) (not b!53197) (not d!16876) (not b!53200) (not b!53275) (not b!53242) (not b!53195))
