; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6016 () Bool)

(assert start!6016)

(declare-fun b!28348 () Bool)

(declare-fun e!19107 () Bool)

(declare-fun e!19108 () Bool)

(assert (=> b!28348 (= e!19107 e!19108)))

(declare-fun res!24604 () Bool)

(assert (=> b!28348 (=> res!24604 e!19108)))

(declare-fun lt!39823 () (_ BitVec 64))

(declare-fun lt!39828 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!28348 (= res!24604 (not (= lt!39828 (bvsub (bvadd lt!39823 to!314) i!635))))))

(declare-datatypes ((array!1753 0))(
  ( (array!1754 (arr!1221 (Array (_ BitVec 32) (_ BitVec 8))) (size!759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1350 0))(
  ( (BitStream!1351 (buf!1086 array!1753) (currentByte!2411 (_ BitVec 32)) (currentBit!2406 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2221 0))(
  ( (Unit!2222) )
))
(declare-datatypes ((tuple2!3066 0))(
  ( (tuple2!3067 (_1!1620 Unit!2221) (_2!1620 BitStream!1350)) )
))
(declare-fun lt!39824 () tuple2!3066)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28348 (= lt!39828 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824))))))

(declare-fun b!28349 () Bool)

(declare-fun e!19105 () Bool)

(declare-fun e!19101 () Bool)

(assert (=> b!28349 (= e!19105 e!19101)))

(declare-fun res!24603 () Bool)

(assert (=> b!28349 (=> res!24603 e!19101)))

(declare-fun thiss!1379 () BitStream!1350)

(declare-fun lt!39819 () tuple2!3066)

(declare-fun isPrefixOf!0 (BitStream!1350 BitStream!1350) Bool)

(assert (=> b!28349 (= res!24603 (not (isPrefixOf!0 thiss!1379 (_2!1620 lt!39819))))))

(declare-fun lt!39827 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28349 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!39827)))

(assert (=> b!28349 (= lt!39827 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39826 () Unit!2221)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1350 BitStream!1350 (_ BitVec 64) (_ BitVec 64)) Unit!2221)

(assert (=> b!28349 (= lt!39826 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1620 lt!39819) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1753)

(declare-fun appendBitFromByte!0 (BitStream!1350 (_ BitVec 8) (_ BitVec 32)) tuple2!3066)

(assert (=> b!28349 (= lt!39819 (appendBitFromByte!0 thiss!1379 (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28350 () Bool)

(declare-fun res!24600 () Bool)

(declare-fun e!19103 () Bool)

(assert (=> b!28350 (=> res!24600 e!19103)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28350 (= res!24600 (not (invariant!0 (currentBit!2406 (_2!1620 lt!39819)) (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39824))))))))

(declare-fun b!28351 () Bool)

(assert (=> b!28351 (= e!19108 e!19103)))

(declare-fun res!24607 () Bool)

(assert (=> b!28351 (=> res!24607 e!19103)))

(assert (=> b!28351 (= res!24607 (not (= (size!759 (buf!1086 (_2!1620 lt!39819))) (size!759 (buf!1086 (_2!1620 lt!39824))))))))

(declare-fun e!19104 () Bool)

(assert (=> b!28351 e!19104))

(declare-fun res!24611 () Bool)

(assert (=> b!28351 (=> (not res!24611) (not e!19104))))

(assert (=> b!28351 (= res!24611 (= (size!759 (buf!1086 (_2!1620 lt!39824))) (size!759 (buf!1086 thiss!1379))))))

(declare-fun b!28352 () Bool)

(assert (=> b!28352 (= e!19101 e!19107)))

(declare-fun res!24598 () Bool)

(assert (=> b!28352 (=> res!24598 e!19107)))

(assert (=> b!28352 (= res!24598 (not (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39824))))))

(assert (=> b!28352 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39824))))

(declare-fun lt!39820 () Unit!2221)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1350 BitStream!1350 BitStream!1350) Unit!2221)

(assert (=> b!28352 (= lt!39820 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1620 lt!39819) (_2!1620 lt!39824)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1350 array!1753 (_ BitVec 64) (_ BitVec 64)) tuple2!3066)

(assert (=> b!28352 (= lt!39824 (appendBitsMSBFirstLoop!0 (_2!1620 lt!39819) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19097 () Bool)

(assert (=> b!28352 e!19097))

(declare-fun res!24606 () Bool)

(assert (=> b!28352 (=> (not res!24606) (not e!19097))))

(assert (=> b!28352 (= res!24606 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39825 () Unit!2221)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1350 array!1753 (_ BitVec 64)) Unit!2221)

(assert (=> b!28352 (= lt!39825 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1086 (_2!1620 lt!39819)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3068 0))(
  ( (tuple2!3069 (_1!1621 BitStream!1350) (_2!1621 BitStream!1350)) )
))
(declare-fun lt!39832 () tuple2!3068)

(declare-fun reader!0 (BitStream!1350 BitStream!1350) tuple2!3068)

(assert (=> b!28352 (= lt!39832 (reader!0 thiss!1379 (_2!1620 lt!39819)))))

(declare-fun b!28353 () Bool)

(declare-fun res!24608 () Bool)

(declare-fun e!19098 () Bool)

(assert (=> b!28353 (=> (not res!24608) (not e!19098))))

(assert (=> b!28353 (= res!24608 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!24605 () Bool)

(assert (=> start!6016 (=> (not res!24605) (not e!19098))))

(assert (=> start!6016 (= res!24605 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!759 srcBuffer!2))))))))

(assert (=> start!6016 e!19098))

(assert (=> start!6016 true))

(declare-fun array_inv!728 (array!1753) Bool)

(assert (=> start!6016 (array_inv!728 srcBuffer!2)))

(declare-fun e!19100 () Bool)

(declare-fun inv!12 (BitStream!1350) Bool)

(assert (=> start!6016 (and (inv!12 thiss!1379) e!19100)))

(declare-fun b!28354 () Bool)

(declare-fun e!19106 () Bool)

(declare-datatypes ((List!376 0))(
  ( (Nil!373) (Cons!372 (h!491 Bool) (t!1126 List!376)) )
))
(declare-fun lt!39830 () List!376)

(assert (=> b!28354 (= e!19106 (not (= lt!39830 Nil!373)))))

(declare-fun lt!39822 () List!376)

(declare-fun tail!93 (List!376) List!376)

(assert (=> b!28354 (= lt!39822 (tail!93 lt!39830))))

(declare-fun lt!39821 () Unit!2221)

(declare-fun lt!39817 () tuple2!3068)

(declare-fun lt!39831 () tuple2!3068)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1350 BitStream!1350 BitStream!1350 BitStream!1350 (_ BitVec 64) List!376) Unit!2221)

(assert (=> b!28354 (= lt!39821 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1620 lt!39824) (_2!1620 lt!39824) (_1!1621 lt!39831) (_1!1621 lt!39817) (bvsub to!314 i!635) lt!39830))))

(declare-fun b!28355 () Bool)

(declare-fun res!24612 () Bool)

(assert (=> b!28355 (=> res!24612 e!19103)))

(assert (=> b!28355 (= res!24612 (not (invariant!0 (currentBit!2406 (_2!1620 lt!39819)) (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39819))))))))

(declare-fun b!28356 () Bool)

(declare-fun res!24601 () Bool)

(assert (=> b!28356 (=> res!24601 e!19106)))

(declare-fun length!102 (List!376) Int)

(assert (=> b!28356 (= res!24601 (<= (length!102 lt!39830) 0))))

(declare-fun b!28357 () Bool)

(declare-fun head!213 (List!376) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1350 array!1753 (_ BitVec 64) (_ BitVec 64)) List!376)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1350 BitStream!1350 (_ BitVec 64)) List!376)

(assert (=> b!28357 (= e!19097 (= (head!213 (byteArrayBitContentToList!0 (_2!1620 lt!39819) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!213 (bitStreamReadBitsIntoList!0 (_2!1620 lt!39819) (_1!1621 lt!39832) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28358 () Bool)

(assert (=> b!28358 (= e!19104 (= lt!39828 (bvsub (bvsub (bvadd (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28359 () Bool)

(assert (=> b!28359 (= e!19100 (array_inv!728 (buf!1086 thiss!1379)))))

(declare-fun b!28360 () Bool)

(declare-fun res!24609 () Bool)

(assert (=> b!28360 (=> res!24609 e!19108)))

(assert (=> b!28360 (= res!24609 (not (invariant!0 (currentBit!2406 (_2!1620 lt!39824)) (currentByte!2411 (_2!1620 lt!39824)) (size!759 (buf!1086 (_2!1620 lt!39824))))))))

(declare-fun b!28361 () Bool)

(assert (=> b!28361 (= e!19103 e!19106)))

(declare-fun res!24610 () Bool)

(assert (=> b!28361 (=> res!24610 e!19106)))

(assert (=> b!28361 (= res!24610 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!28361 (= lt!39822 (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_1!1621 lt!39817) lt!39827))))

(assert (=> b!28361 (= lt!39830 (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_1!1621 lt!39831) (bvsub to!314 i!635)))))

(assert (=> b!28361 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!39827)))

(declare-fun lt!39829 () Unit!2221)

(assert (=> b!28361 (= lt!39829 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!39824)) lt!39827))))

(assert (=> b!28361 (= lt!39817 (reader!0 (_2!1620 lt!39819) (_2!1620 lt!39824)))))

(assert (=> b!28361 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39818 () Unit!2221)

(assert (=> b!28361 (= lt!39818 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1086 (_2!1620 lt!39824)) (bvsub to!314 i!635)))))

(assert (=> b!28361 (= lt!39831 (reader!0 thiss!1379 (_2!1620 lt!39824)))))

(declare-fun b!28362 () Bool)

(assert (=> b!28362 (= e!19098 (not e!19105))))

(declare-fun res!24602 () Bool)

(assert (=> b!28362 (=> res!24602 e!19105)))

(assert (=> b!28362 (= res!24602 (bvsge i!635 to!314))))

(assert (=> b!28362 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39816 () Unit!2221)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1350) Unit!2221)

(assert (=> b!28362 (= lt!39816 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28362 (= lt!39823 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(declare-fun b!28363 () Bool)

(declare-fun res!24599 () Bool)

(assert (=> b!28363 (=> res!24599 e!19108)))

(assert (=> b!28363 (= res!24599 (not (= (size!759 (buf!1086 thiss!1379)) (size!759 (buf!1086 (_2!1620 lt!39824))))))))

(assert (= (and start!6016 res!24605) b!28353))

(assert (= (and b!28353 res!24608) b!28362))

(assert (= (and b!28362 (not res!24602)) b!28349))

(assert (= (and b!28349 (not res!24603)) b!28352))

(assert (= (and b!28352 res!24606) b!28357))

(assert (= (and b!28352 (not res!24598)) b!28348))

(assert (= (and b!28348 (not res!24604)) b!28360))

(assert (= (and b!28360 (not res!24609)) b!28363))

(assert (= (and b!28363 (not res!24599)) b!28351))

(assert (= (and b!28351 res!24611) b!28358))

(assert (= (and b!28351 (not res!24607)) b!28355))

(assert (= (and b!28355 (not res!24612)) b!28350))

(assert (= (and b!28350 (not res!24600)) b!28361))

(assert (= (and b!28361 (not res!24610)) b!28356))

(assert (= (and b!28356 (not res!24601)) b!28354))

(assert (= start!6016 b!28359))

(declare-fun m!40611 () Bool)

(assert (=> b!28353 m!40611))

(declare-fun m!40613 () Bool)

(assert (=> b!28356 m!40613))

(declare-fun m!40615 () Bool)

(assert (=> start!6016 m!40615))

(declare-fun m!40617 () Bool)

(assert (=> start!6016 m!40617))

(declare-fun m!40619 () Bool)

(assert (=> b!28348 m!40619))

(declare-fun m!40621 () Bool)

(assert (=> b!28361 m!40621))

(declare-fun m!40623 () Bool)

(assert (=> b!28361 m!40623))

(declare-fun m!40625 () Bool)

(assert (=> b!28361 m!40625))

(declare-fun m!40627 () Bool)

(assert (=> b!28361 m!40627))

(declare-fun m!40629 () Bool)

(assert (=> b!28361 m!40629))

(declare-fun m!40631 () Bool)

(assert (=> b!28361 m!40631))

(declare-fun m!40633 () Bool)

(assert (=> b!28361 m!40633))

(declare-fun m!40635 () Bool)

(assert (=> b!28361 m!40635))

(declare-fun m!40637 () Bool)

(assert (=> b!28349 m!40637))

(declare-fun m!40639 () Bool)

(assert (=> b!28349 m!40639))

(declare-fun m!40641 () Bool)

(assert (=> b!28349 m!40641))

(declare-fun m!40643 () Bool)

(assert (=> b!28349 m!40643))

(declare-fun m!40645 () Bool)

(assert (=> b!28349 m!40645))

(assert (=> b!28349 m!40641))

(declare-fun m!40647 () Bool)

(assert (=> b!28354 m!40647))

(declare-fun m!40649 () Bool)

(assert (=> b!28354 m!40649))

(declare-fun m!40651 () Bool)

(assert (=> b!28362 m!40651))

(declare-fun m!40653 () Bool)

(assert (=> b!28362 m!40653))

(declare-fun m!40655 () Bool)

(assert (=> b!28362 m!40655))

(declare-fun m!40657 () Bool)

(assert (=> b!28359 m!40657))

(declare-fun m!40659 () Bool)

(assert (=> b!28350 m!40659))

(declare-fun m!40661 () Bool)

(assert (=> b!28355 m!40661))

(declare-fun m!40663 () Bool)

(assert (=> b!28358 m!40663))

(declare-fun m!40665 () Bool)

(assert (=> b!28352 m!40665))

(declare-fun m!40667 () Bool)

(assert (=> b!28352 m!40667))

(declare-fun m!40669 () Bool)

(assert (=> b!28352 m!40669))

(declare-fun m!40671 () Bool)

(assert (=> b!28352 m!40671))

(declare-fun m!40673 () Bool)

(assert (=> b!28352 m!40673))

(declare-fun m!40675 () Bool)

(assert (=> b!28352 m!40675))

(declare-fun m!40677 () Bool)

(assert (=> b!28352 m!40677))

(declare-fun m!40679 () Bool)

(assert (=> b!28360 m!40679))

(declare-fun m!40681 () Bool)

(assert (=> b!28357 m!40681))

(assert (=> b!28357 m!40681))

(declare-fun m!40683 () Bool)

(assert (=> b!28357 m!40683))

(declare-fun m!40685 () Bool)

(assert (=> b!28357 m!40685))

(assert (=> b!28357 m!40685))

(declare-fun m!40687 () Bool)

(assert (=> b!28357 m!40687))

(check-sat (not b!28349) (not b!28357) (not b!28348) (not b!28362) (not b!28353) (not b!28356) (not b!28355) (not b!28358) (not start!6016) (not b!28352) (not b!28350) (not b!28359) (not b!28361) (not b!28354) (not b!28360))
(check-sat)
(get-model)

(declare-fun d!7880 () Bool)

(assert (=> d!7880 (= (head!213 (byteArrayBitContentToList!0 (_2!1620 lt!39819) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!491 (byteArrayBitContentToList!0 (_2!1620 lt!39819) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28357 d!7880))

(declare-fun d!7882 () Bool)

(declare-fun c!1779 () Bool)

(assert (=> d!7882 (= c!1779 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19147 () List!376)

(assert (=> d!7882 (= (byteArrayBitContentToList!0 (_2!1620 lt!39819) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19147)))

(declare-fun b!28416 () Bool)

(assert (=> b!28416 (= e!19147 Nil!373)))

(declare-fun b!28417 () Bool)

(assert (=> b!28417 (= e!19147 (Cons!372 (not (= (bvand ((_ sign_extend 24) (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1620 lt!39819) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7882 c!1779) b!28416))

(assert (= (and d!7882 (not c!1779)) b!28417))

(assert (=> b!28417 m!40641))

(declare-fun m!40767 () Bool)

(assert (=> b!28417 m!40767))

(declare-fun m!40769 () Bool)

(assert (=> b!28417 m!40769))

(assert (=> b!28357 d!7882))

(declare-fun d!7884 () Bool)

(assert (=> d!7884 (= (head!213 (bitStreamReadBitsIntoList!0 (_2!1620 lt!39819) (_1!1621 lt!39832) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!491 (bitStreamReadBitsIntoList!0 (_2!1620 lt!39819) (_1!1621 lt!39832) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28357 d!7884))

(declare-datatypes ((tuple2!3074 0))(
  ( (tuple2!3075 (_1!1624 List!376) (_2!1624 BitStream!1350)) )
))
(declare-fun e!19152 () tuple2!3074)

(declare-datatypes ((tuple2!3076 0))(
  ( (tuple2!3077 (_1!1625 Bool) (_2!1625 BitStream!1350)) )
))
(declare-fun lt!39891 () tuple2!3076)

(declare-fun lt!39892 () (_ BitVec 64))

(declare-fun b!28427 () Bool)

(assert (=> b!28427 (= e!19152 (tuple2!3075 (Cons!372 (_1!1625 lt!39891) (bitStreamReadBitsIntoList!0 (_2!1620 lt!39819) (_2!1625 lt!39891) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!39892))) (_2!1625 lt!39891)))))

(declare-fun readBit!0 (BitStream!1350) tuple2!3076)

(assert (=> b!28427 (= lt!39891 (readBit!0 (_1!1621 lt!39832)))))

(assert (=> b!28427 (= lt!39892 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28429 () Bool)

(declare-fun e!19153 () Bool)

(declare-fun lt!39890 () List!376)

(assert (=> b!28429 (= e!19153 (> (length!102 lt!39890) 0))))

(declare-fun b!28428 () Bool)

(declare-fun isEmpty!70 (List!376) Bool)

(assert (=> b!28428 (= e!19153 (isEmpty!70 lt!39890))))

(declare-fun d!7886 () Bool)

(assert (=> d!7886 e!19153))

(declare-fun c!1784 () Bool)

(assert (=> d!7886 (= c!1784 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7886 (= lt!39890 (_1!1624 e!19152))))

(declare-fun c!1785 () Bool)

(assert (=> d!7886 (= c!1785 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7886 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7886 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!39819) (_1!1621 lt!39832) #b0000000000000000000000000000000000000000000000000000000000000001) lt!39890)))

(declare-fun b!28426 () Bool)

(assert (=> b!28426 (= e!19152 (tuple2!3075 Nil!373 (_1!1621 lt!39832)))))

(assert (= (and d!7886 c!1785) b!28426))

(assert (= (and d!7886 (not c!1785)) b!28427))

(assert (= (and d!7886 c!1784) b!28428))

(assert (= (and d!7886 (not c!1784)) b!28429))

(declare-fun m!40771 () Bool)

(assert (=> b!28427 m!40771))

(declare-fun m!40773 () Bool)

(assert (=> b!28427 m!40773))

(declare-fun m!40775 () Bool)

(assert (=> b!28429 m!40775))

(declare-fun m!40777 () Bool)

(assert (=> b!28428 m!40777))

(assert (=> b!28357 d!7886))

(declare-fun d!7888 () Bool)

(declare-fun e!19156 () Bool)

(assert (=> d!7888 e!19156))

(declare-fun res!24663 () Bool)

(assert (=> d!7888 (=> (not res!24663) (not e!19156))))

(declare-fun lt!39910 () (_ BitVec 64))

(declare-fun lt!39907 () (_ BitVec 64))

(declare-fun lt!39905 () (_ BitVec 64))

(assert (=> d!7888 (= res!24663 (= lt!39910 (bvsub lt!39907 lt!39905)))))

(assert (=> d!7888 (or (= (bvand lt!39907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!39905 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!39907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!39907 lt!39905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7888 (= lt!39905 (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39824))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39824)))))))

(declare-fun lt!39909 () (_ BitVec 64))

(declare-fun lt!39908 () (_ BitVec 64))

(assert (=> d!7888 (= lt!39907 (bvmul lt!39909 lt!39908))))

(assert (=> d!7888 (or (= lt!39909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!39908 (bvsdiv (bvmul lt!39909 lt!39908) lt!39909)))))

(assert (=> d!7888 (= lt!39908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7888 (= lt!39909 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))))))

(assert (=> d!7888 (= lt!39910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39824))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39824)))))))

(assert (=> d!7888 (invariant!0 (currentBit!2406 (_2!1620 lt!39824)) (currentByte!2411 (_2!1620 lt!39824)) (size!759 (buf!1086 (_2!1620 lt!39824))))))

(assert (=> d!7888 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824))) lt!39910)))

(declare-fun b!28434 () Bool)

(declare-fun res!24662 () Bool)

(assert (=> b!28434 (=> (not res!24662) (not e!19156))))

(assert (=> b!28434 (= res!24662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!39910))))

(declare-fun b!28435 () Bool)

(declare-fun lt!39906 () (_ BitVec 64))

(assert (=> b!28435 (= e!19156 (bvsle lt!39910 (bvmul lt!39906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28435 (or (= lt!39906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!39906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!39906)))))

(assert (=> b!28435 (= lt!39906 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))))))

(assert (= (and d!7888 res!24663) b!28434))

(assert (= (and b!28434 res!24662) b!28435))

(declare-fun m!40779 () Bool)

(assert (=> d!7888 m!40779))

(assert (=> d!7888 m!40679))

(assert (=> b!28348 d!7888))

(declare-fun d!7890 () Bool)

(declare-fun e!19157 () Bool)

(assert (=> d!7890 e!19157))

(declare-fun res!24665 () Bool)

(assert (=> d!7890 (=> (not res!24665) (not e!19157))))

(declare-fun lt!39911 () (_ BitVec 64))

(declare-fun lt!39916 () (_ BitVec 64))

(declare-fun lt!39913 () (_ BitVec 64))

(assert (=> d!7890 (= res!24665 (= lt!39916 (bvsub lt!39913 lt!39911)))))

(assert (=> d!7890 (or (= (bvand lt!39913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!39911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!39913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!39913 lt!39911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7890 (= lt!39911 (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819)))))))

(declare-fun lt!39915 () (_ BitVec 64))

(declare-fun lt!39914 () (_ BitVec 64))

(assert (=> d!7890 (= lt!39913 (bvmul lt!39915 lt!39914))))

(assert (=> d!7890 (or (= lt!39915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!39914 (bvsdiv (bvmul lt!39915 lt!39914) lt!39915)))))

(assert (=> d!7890 (= lt!39914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7890 (= lt!39915 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))))))

(assert (=> d!7890 (= lt!39916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819)))))))

(assert (=> d!7890 (invariant!0 (currentBit!2406 (_2!1620 lt!39819)) (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39819))))))

(assert (=> d!7890 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))) lt!39916)))

(declare-fun b!28436 () Bool)

(declare-fun res!24664 () Bool)

(assert (=> b!28436 (=> (not res!24664) (not e!19157))))

(assert (=> b!28436 (= res!24664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!39916))))

(declare-fun b!28437 () Bool)

(declare-fun lt!39912 () (_ BitVec 64))

(assert (=> b!28437 (= e!19157 (bvsle lt!39916 (bvmul lt!39912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28437 (or (= lt!39912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!39912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!39912)))))

(assert (=> b!28437 (= lt!39912 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))))))

(assert (= (and d!7890 res!24665) b!28436))

(assert (= (and b!28436 res!24664) b!28437))

(declare-fun m!40781 () Bool)

(assert (=> d!7890 m!40781))

(assert (=> d!7890 m!40661))

(assert (=> b!28358 d!7890))

(declare-fun d!7892 () Bool)

(assert (=> d!7892 (= (invariant!0 (currentBit!2406 (_2!1620 lt!39824)) (currentByte!2411 (_2!1620 lt!39824)) (size!759 (buf!1086 (_2!1620 lt!39824)))) (and (bvsge (currentBit!2406 (_2!1620 lt!39824)) #b00000000000000000000000000000000) (bvslt (currentBit!2406 (_2!1620 lt!39824)) #b00000000000000000000000000001000) (bvsge (currentByte!2411 (_2!1620 lt!39824)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2411 (_2!1620 lt!39824)) (size!759 (buf!1086 (_2!1620 lt!39824)))) (and (= (currentBit!2406 (_2!1620 lt!39824)) #b00000000000000000000000000000000) (= (currentByte!2411 (_2!1620 lt!39824)) (size!759 (buf!1086 (_2!1620 lt!39824))))))))))

(assert (=> b!28360 d!7892))

(declare-fun d!7894 () Bool)

(declare-fun res!24673 () Bool)

(declare-fun e!19162 () Bool)

(assert (=> d!7894 (=> (not res!24673) (not e!19162))))

(assert (=> d!7894 (= res!24673 (= (size!759 (buf!1086 thiss!1379)) (size!759 (buf!1086 (_2!1620 lt!39819)))))))

(assert (=> d!7894 (= (isPrefixOf!0 thiss!1379 (_2!1620 lt!39819)) e!19162)))

(declare-fun b!28444 () Bool)

(declare-fun res!24672 () Bool)

(assert (=> b!28444 (=> (not res!24672) (not e!19162))))

(assert (=> b!28444 (= res!24672 (bvsle (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)) (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819)))))))

(declare-fun b!28445 () Bool)

(declare-fun e!19163 () Bool)

(assert (=> b!28445 (= e!19162 e!19163)))

(declare-fun res!24674 () Bool)

(assert (=> b!28445 (=> res!24674 e!19163)))

(assert (=> b!28445 (= res!24674 (= (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28446 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1753 array!1753 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28446 (= e!19163 (arrayBitRangesEq!0 (buf!1086 thiss!1379) (buf!1086 (_2!1620 lt!39819)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(assert (= (and d!7894 res!24673) b!28444))

(assert (= (and b!28444 res!24672) b!28445))

(assert (= (and b!28445 (not res!24674)) b!28446))

(assert (=> b!28444 m!40655))

(assert (=> b!28444 m!40663))

(assert (=> b!28446 m!40655))

(assert (=> b!28446 m!40655))

(declare-fun m!40783 () Bool)

(assert (=> b!28446 m!40783))

(assert (=> b!28349 d!7894))

(declare-fun d!7896 () Bool)

(assert (=> d!7896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!39827) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819)))) lt!39827))))

(declare-fun bs!2288 () Bool)

(assert (= bs!2288 d!7896))

(assert (=> bs!2288 m!40781))

(assert (=> b!28349 d!7896))

(declare-fun d!7898 () Bool)

(declare-fun e!19166 () Bool)

(assert (=> d!7898 e!19166))

(declare-fun res!24677 () Bool)

(assert (=> d!7898 (=> (not res!24677) (not e!19166))))

(assert (=> d!7898 (= res!24677 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!39919 () Unit!2221)

(declare-fun choose!27 (BitStream!1350 BitStream!1350 (_ BitVec 64) (_ BitVec 64)) Unit!2221)

(assert (=> d!7898 (= lt!39919 (choose!27 thiss!1379 (_2!1620 lt!39819) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7898 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7898 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1620 lt!39819) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!39919)))

(declare-fun b!28449 () Bool)

(assert (=> b!28449 (= e!19166 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7898 res!24677) b!28449))

(declare-fun m!40785 () Bool)

(assert (=> d!7898 m!40785))

(declare-fun m!40787 () Bool)

(assert (=> b!28449 m!40787))

(assert (=> b!28349 d!7898))

(declare-fun b!28467 () Bool)

(declare-fun res!24695 () Bool)

(declare-fun e!19176 () Bool)

(assert (=> b!28467 (=> (not res!24695) (not e!19176))))

(declare-fun lt!39945 () (_ BitVec 64))

(declare-fun lt!39951 () (_ BitVec 64))

(declare-fun lt!39946 () tuple2!3066)

(assert (=> b!28467 (= res!24695 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39946))) (currentByte!2411 (_2!1620 lt!39946)) (currentBit!2406 (_2!1620 lt!39946))) (bvadd lt!39945 lt!39951)))))

(assert (=> b!28467 (or (not (= (bvand lt!39945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!39951 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!39945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!39945 lt!39951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28467 (= lt!39951 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!28467 (= lt!39945 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(declare-fun b!28468 () Bool)

(declare-fun res!24697 () Bool)

(declare-fun e!19177 () Bool)

(assert (=> b!28468 (=> (not res!24697) (not e!19177))))

(declare-fun lt!39952 () tuple2!3066)

(assert (=> b!28468 (= res!24697 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39952)))))

(declare-fun b!28469 () Bool)

(declare-fun e!19175 () Bool)

(assert (=> b!28469 (= e!19177 e!19175)))

(declare-fun res!24699 () Bool)

(assert (=> b!28469 (=> (not res!24699) (not e!19175))))

(declare-datatypes ((tuple2!3078 0))(
  ( (tuple2!3079 (_1!1626 BitStream!1350) (_2!1626 Bool)) )
))
(declare-fun lt!39955 () tuple2!3078)

(declare-fun lt!39953 () Bool)

(assert (=> b!28469 (= res!24699 (and (= (_2!1626 lt!39955) lt!39953) (= (_1!1626 lt!39955) (_2!1620 lt!39952))))))

(declare-fun readBitPure!0 (BitStream!1350) tuple2!3078)

(declare-fun readerFrom!0 (BitStream!1350 (_ BitVec 32) (_ BitVec 32)) BitStream!1350)

(assert (=> b!28469 (= lt!39955 (readBitPure!0 (readerFrom!0 (_2!1620 lt!39952) (currentBit!2406 thiss!1379) (currentByte!2411 thiss!1379))))))

(declare-fun b!28471 () Bool)

(declare-fun e!19178 () Bool)

(declare-fun lt!39949 () tuple2!3078)

(assert (=> b!28471 (= e!19178 (= (bitIndex!0 (size!759 (buf!1086 (_1!1626 lt!39949))) (currentByte!2411 (_1!1626 lt!39949)) (currentBit!2406 (_1!1626 lt!39949))) (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39946))) (currentByte!2411 (_2!1620 lt!39946)) (currentBit!2406 (_2!1620 lt!39946)))))))

(declare-fun b!28472 () Bool)

(declare-fun res!24696 () Bool)

(assert (=> b!28472 (=> (not res!24696) (not e!19177))))

(assert (=> b!28472 (= res!24696 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39952))) (currentByte!2411 (_2!1620 lt!39952)) (currentBit!2406 (_2!1620 lt!39952))) (bvadd (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7900 () Bool)

(assert (=> d!7900 e!19176))

(declare-fun res!24700 () Bool)

(assert (=> d!7900 (=> (not res!24700) (not e!19176))))

(assert (=> d!7900 (= res!24700 (= (size!759 (buf!1086 (_2!1620 lt!39946))) (size!759 (buf!1086 thiss!1379))))))

(declare-fun lt!39947 () (_ BitVec 8))

(declare-fun lt!39948 () array!1753)

(assert (=> d!7900 (= lt!39947 (select (arr!1221 lt!39948) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7900 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!759 lt!39948)))))

(assert (=> d!7900 (= lt!39948 (array!1754 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!39954 () tuple2!3066)

(assert (=> d!7900 (= lt!39946 (tuple2!3067 (_1!1620 lt!39954) (_2!1620 lt!39954)))))

(assert (=> d!7900 (= lt!39954 lt!39952)))

(assert (=> d!7900 e!19177))

(declare-fun res!24694 () Bool)

(assert (=> d!7900 (=> (not res!24694) (not e!19177))))

(assert (=> d!7900 (= res!24694 (= (size!759 (buf!1086 thiss!1379)) (size!759 (buf!1086 (_2!1620 lt!39952)))))))

(declare-fun appendBit!0 (BitStream!1350 Bool) tuple2!3066)

(assert (=> d!7900 (= lt!39952 (appendBit!0 thiss!1379 lt!39953))))

(assert (=> d!7900 (= lt!39953 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7900 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7900 (= (appendBitFromByte!0 thiss!1379 (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!39946)))

(declare-fun b!28470 () Bool)

(declare-fun res!24701 () Bool)

(assert (=> b!28470 (=> (not res!24701) (not e!19176))))

(assert (=> b!28470 (= res!24701 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39946)))))

(declare-fun b!28473 () Bool)

(assert (=> b!28473 (= e!19176 e!19178)))

(declare-fun res!24698 () Bool)

(assert (=> b!28473 (=> (not res!24698) (not e!19178))))

(assert (=> b!28473 (= res!24698 (and (= (_2!1626 lt!39949) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!39947)) #b00000000000000000000000000000000))) (= (_1!1626 lt!39949) (_2!1620 lt!39946))))))

(declare-datatypes ((tuple2!3080 0))(
  ( (tuple2!3081 (_1!1627 array!1753) (_2!1627 BitStream!1350)) )
))
(declare-fun lt!39950 () tuple2!3080)

(declare-fun lt!39944 () BitStream!1350)

(declare-fun readBits!0 (BitStream!1350 (_ BitVec 64)) tuple2!3080)

(assert (=> b!28473 (= lt!39950 (readBits!0 lt!39944 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!28473 (= lt!39949 (readBitPure!0 lt!39944))))

(assert (=> b!28473 (= lt!39944 (readerFrom!0 (_2!1620 lt!39946) (currentBit!2406 thiss!1379) (currentByte!2411 thiss!1379)))))

(declare-fun b!28474 () Bool)

(assert (=> b!28474 (= e!19175 (= (bitIndex!0 (size!759 (buf!1086 (_1!1626 lt!39955))) (currentByte!2411 (_1!1626 lt!39955)) (currentBit!2406 (_1!1626 lt!39955))) (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39952))) (currentByte!2411 (_2!1620 lt!39952)) (currentBit!2406 (_2!1620 lt!39952)))))))

(assert (= (and d!7900 res!24694) b!28472))

(assert (= (and b!28472 res!24696) b!28468))

(assert (= (and b!28468 res!24697) b!28469))

(assert (= (and b!28469 res!24699) b!28474))

(assert (= (and d!7900 res!24700) b!28467))

(assert (= (and b!28467 res!24695) b!28470))

(assert (= (and b!28470 res!24701) b!28473))

(assert (= (and b!28473 res!24698) b!28471))

(declare-fun m!40789 () Bool)

(assert (=> b!28471 m!40789))

(declare-fun m!40791 () Bool)

(assert (=> b!28471 m!40791))

(declare-fun m!40793 () Bool)

(assert (=> b!28468 m!40793))

(declare-fun m!40795 () Bool)

(assert (=> b!28472 m!40795))

(assert (=> b!28472 m!40655))

(declare-fun m!40797 () Bool)

(assert (=> b!28469 m!40797))

(assert (=> b!28469 m!40797))

(declare-fun m!40799 () Bool)

(assert (=> b!28469 m!40799))

(assert (=> b!28467 m!40791))

(assert (=> b!28467 m!40655))

(declare-fun m!40801 () Bool)

(assert (=> d!7900 m!40801))

(declare-fun m!40803 () Bool)

(assert (=> d!7900 m!40803))

(assert (=> d!7900 m!40767))

(declare-fun m!40805 () Bool)

(assert (=> b!28474 m!40805))

(assert (=> b!28474 m!40795))

(declare-fun m!40807 () Bool)

(assert (=> b!28470 m!40807))

(declare-fun m!40809 () Bool)

(assert (=> b!28473 m!40809))

(declare-fun m!40811 () Bool)

(assert (=> b!28473 m!40811))

(declare-fun m!40813 () Bool)

(assert (=> b!28473 m!40813))

(assert (=> b!28349 d!7900))

(declare-fun d!7904 () Bool)

(assert (=> d!7904 (= (array_inv!728 (buf!1086 thiss!1379)) (bvsge (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!28359 d!7904))

(declare-fun b!28485 () Bool)

(declare-fun res!24708 () Bool)

(declare-fun e!19184 () Bool)

(assert (=> b!28485 (=> (not res!24708) (not e!19184))))

(declare-fun lt!40012 () tuple2!3068)

(assert (=> b!28485 (= res!24708 (isPrefixOf!0 (_1!1621 lt!40012) thiss!1379))))

(declare-fun d!7906 () Bool)

(assert (=> d!7906 e!19184))

(declare-fun res!24710 () Bool)

(assert (=> d!7906 (=> (not res!24710) (not e!19184))))

(assert (=> d!7906 (= res!24710 (isPrefixOf!0 (_1!1621 lt!40012) (_2!1621 lt!40012)))))

(declare-fun lt!40000 () BitStream!1350)

(assert (=> d!7906 (= lt!40012 (tuple2!3069 lt!40000 (_2!1620 lt!39824)))))

(declare-fun lt!40014 () Unit!2221)

(declare-fun lt!40015 () Unit!2221)

(assert (=> d!7906 (= lt!40014 lt!40015)))

(assert (=> d!7906 (isPrefixOf!0 lt!40000 (_2!1620 lt!39824))))

(assert (=> d!7906 (= lt!40015 (lemmaIsPrefixTransitive!0 lt!40000 (_2!1620 lt!39824) (_2!1620 lt!39824)))))

(declare-fun lt!40010 () Unit!2221)

(declare-fun lt!40001 () Unit!2221)

(assert (=> d!7906 (= lt!40010 lt!40001)))

(assert (=> d!7906 (isPrefixOf!0 lt!40000 (_2!1620 lt!39824))))

(assert (=> d!7906 (= lt!40001 (lemmaIsPrefixTransitive!0 lt!40000 thiss!1379 (_2!1620 lt!39824)))))

(declare-fun lt!40003 () Unit!2221)

(declare-fun e!19183 () Unit!2221)

(assert (=> d!7906 (= lt!40003 e!19183)))

(declare-fun c!1788 () Bool)

(assert (=> d!7906 (= c!1788 (not (= (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!39996 () Unit!2221)

(declare-fun lt!40005 () Unit!2221)

(assert (=> d!7906 (= lt!39996 lt!40005)))

(assert (=> d!7906 (isPrefixOf!0 (_2!1620 lt!39824) (_2!1620 lt!39824))))

(assert (=> d!7906 (= lt!40005 (lemmaIsPrefixRefl!0 (_2!1620 lt!39824)))))

(declare-fun lt!40009 () Unit!2221)

(declare-fun lt!39999 () Unit!2221)

(assert (=> d!7906 (= lt!40009 lt!39999)))

(assert (=> d!7906 (= lt!39999 (lemmaIsPrefixRefl!0 (_2!1620 lt!39824)))))

(declare-fun lt!39997 () Unit!2221)

(declare-fun lt!40008 () Unit!2221)

(assert (=> d!7906 (= lt!39997 lt!40008)))

(assert (=> d!7906 (isPrefixOf!0 lt!40000 lt!40000)))

(assert (=> d!7906 (= lt!40008 (lemmaIsPrefixRefl!0 lt!40000))))

(declare-fun lt!40006 () Unit!2221)

(declare-fun lt!40004 () Unit!2221)

(assert (=> d!7906 (= lt!40006 lt!40004)))

(assert (=> d!7906 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7906 (= lt!40004 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7906 (= lt!40000 (BitStream!1351 (buf!1086 (_2!1620 lt!39824)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(assert (=> d!7906 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39824))))

(assert (=> d!7906 (= (reader!0 thiss!1379 (_2!1620 lt!39824)) lt!40012)))

(declare-fun b!28486 () Bool)

(declare-fun lt!39998 () Unit!2221)

(assert (=> b!28486 (= e!19183 lt!39998)))

(declare-fun lt!40007 () (_ BitVec 64))

(assert (=> b!28486 (= lt!40007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40002 () (_ BitVec 64))

(assert (=> b!28486 (= lt!40002 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1753 array!1753 (_ BitVec 64) (_ BitVec 64)) Unit!2221)

(assert (=> b!28486 (= lt!39998 (arrayBitRangesEqSymmetric!0 (buf!1086 thiss!1379) (buf!1086 (_2!1620 lt!39824)) lt!40007 lt!40002))))

(assert (=> b!28486 (arrayBitRangesEq!0 (buf!1086 (_2!1620 lt!39824)) (buf!1086 thiss!1379) lt!40007 lt!40002)))

(declare-fun lt!40013 () (_ BitVec 64))

(declare-fun b!28487 () Bool)

(declare-fun lt!40011 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1350 (_ BitVec 64)) BitStream!1350)

(assert (=> b!28487 (= e!19184 (= (_1!1621 lt!40012) (withMovedBitIndex!0 (_2!1621 lt!40012) (bvsub lt!40011 lt!40013))))))

(assert (=> b!28487 (or (= (bvand lt!40011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40011 lt!40013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28487 (= lt!40013 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824))))))

(assert (=> b!28487 (= lt!40011 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(declare-fun b!28488 () Bool)

(declare-fun Unit!2232 () Unit!2221)

(assert (=> b!28488 (= e!19183 Unit!2232)))

(declare-fun b!28489 () Bool)

(declare-fun res!24709 () Bool)

(assert (=> b!28489 (=> (not res!24709) (not e!19184))))

(assert (=> b!28489 (= res!24709 (isPrefixOf!0 (_2!1621 lt!40012) (_2!1620 lt!39824)))))

(assert (= (and d!7906 c!1788) b!28486))

(assert (= (and d!7906 (not c!1788)) b!28488))

(assert (= (and d!7906 res!24710) b!28485))

(assert (= (and b!28485 res!24708) b!28489))

(assert (= (and b!28489 res!24709) b!28487))

(declare-fun m!40815 () Bool)

(assert (=> b!28485 m!40815))

(declare-fun m!40817 () Bool)

(assert (=> b!28487 m!40817))

(assert (=> b!28487 m!40619))

(assert (=> b!28487 m!40655))

(declare-fun m!40819 () Bool)

(assert (=> b!28489 m!40819))

(declare-fun m!40821 () Bool)

(assert (=> d!7906 m!40821))

(declare-fun m!40823 () Bool)

(assert (=> d!7906 m!40823))

(assert (=> d!7906 m!40651))

(declare-fun m!40825 () Bool)

(assert (=> d!7906 m!40825))

(declare-fun m!40827 () Bool)

(assert (=> d!7906 m!40827))

(assert (=> d!7906 m!40665))

(declare-fun m!40829 () Bool)

(assert (=> d!7906 m!40829))

(assert (=> d!7906 m!40653))

(declare-fun m!40831 () Bool)

(assert (=> d!7906 m!40831))

(declare-fun m!40833 () Bool)

(assert (=> d!7906 m!40833))

(declare-fun m!40835 () Bool)

(assert (=> d!7906 m!40835))

(assert (=> b!28486 m!40655))

(declare-fun m!40837 () Bool)

(assert (=> b!28486 m!40837))

(declare-fun m!40839 () Bool)

(assert (=> b!28486 m!40839))

(assert (=> b!28361 d!7906))

(declare-fun d!7908 () Bool)

(assert (=> d!7908 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!40018 () Unit!2221)

(declare-fun choose!9 (BitStream!1350 array!1753 (_ BitVec 64) BitStream!1350) Unit!2221)

(assert (=> d!7908 (= lt!40018 (choose!9 thiss!1379 (buf!1086 (_2!1620 lt!39824)) (bvsub to!314 i!635) (BitStream!1351 (buf!1086 (_2!1620 lt!39824)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(assert (=> d!7908 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1086 (_2!1620 lt!39824)) (bvsub to!314 i!635)) lt!40018)))

(declare-fun bs!2289 () Bool)

(assert (= bs!2289 d!7908))

(assert (=> bs!2289 m!40633))

(declare-fun m!40841 () Bool)

(assert (=> bs!2289 m!40841))

(assert (=> b!28361 d!7908))

(declare-fun d!7910 () Bool)

(assert (=> d!7910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2290 () Bool)

(assert (= bs!2290 d!7910))

(declare-fun m!40843 () Bool)

(assert (=> bs!2290 m!40843))

(assert (=> b!28361 d!7910))

(declare-fun b!28490 () Bool)

(declare-fun res!24711 () Bool)

(declare-fun e!19186 () Bool)

(assert (=> b!28490 (=> (not res!24711) (not e!19186))))

(declare-fun lt!40035 () tuple2!3068)

(assert (=> b!28490 (= res!24711 (isPrefixOf!0 (_1!1621 lt!40035) (_2!1620 lt!39819)))))

(declare-fun d!7912 () Bool)

(assert (=> d!7912 e!19186))

(declare-fun res!24713 () Bool)

(assert (=> d!7912 (=> (not res!24713) (not e!19186))))

(assert (=> d!7912 (= res!24713 (isPrefixOf!0 (_1!1621 lt!40035) (_2!1621 lt!40035)))))

(declare-fun lt!40023 () BitStream!1350)

(assert (=> d!7912 (= lt!40035 (tuple2!3069 lt!40023 (_2!1620 lt!39824)))))

(declare-fun lt!40037 () Unit!2221)

(declare-fun lt!40038 () Unit!2221)

(assert (=> d!7912 (= lt!40037 lt!40038)))

(assert (=> d!7912 (isPrefixOf!0 lt!40023 (_2!1620 lt!39824))))

(assert (=> d!7912 (= lt!40038 (lemmaIsPrefixTransitive!0 lt!40023 (_2!1620 lt!39824) (_2!1620 lt!39824)))))

(declare-fun lt!40033 () Unit!2221)

(declare-fun lt!40024 () Unit!2221)

(assert (=> d!7912 (= lt!40033 lt!40024)))

(assert (=> d!7912 (isPrefixOf!0 lt!40023 (_2!1620 lt!39824))))

(assert (=> d!7912 (= lt!40024 (lemmaIsPrefixTransitive!0 lt!40023 (_2!1620 lt!39819) (_2!1620 lt!39824)))))

(declare-fun lt!40026 () Unit!2221)

(declare-fun e!19185 () Unit!2221)

(assert (=> d!7912 (= lt!40026 e!19185)))

(declare-fun c!1789 () Bool)

(assert (=> d!7912 (= c!1789 (not (= (size!759 (buf!1086 (_2!1620 lt!39819))) #b00000000000000000000000000000000)))))

(declare-fun lt!40019 () Unit!2221)

(declare-fun lt!40028 () Unit!2221)

(assert (=> d!7912 (= lt!40019 lt!40028)))

(assert (=> d!7912 (isPrefixOf!0 (_2!1620 lt!39824) (_2!1620 lt!39824))))

(assert (=> d!7912 (= lt!40028 (lemmaIsPrefixRefl!0 (_2!1620 lt!39824)))))

(declare-fun lt!40032 () Unit!2221)

(declare-fun lt!40022 () Unit!2221)

(assert (=> d!7912 (= lt!40032 lt!40022)))

(assert (=> d!7912 (= lt!40022 (lemmaIsPrefixRefl!0 (_2!1620 lt!39824)))))

(declare-fun lt!40020 () Unit!2221)

(declare-fun lt!40031 () Unit!2221)

(assert (=> d!7912 (= lt!40020 lt!40031)))

(assert (=> d!7912 (isPrefixOf!0 lt!40023 lt!40023)))

(assert (=> d!7912 (= lt!40031 (lemmaIsPrefixRefl!0 lt!40023))))

(declare-fun lt!40029 () Unit!2221)

(declare-fun lt!40027 () Unit!2221)

(assert (=> d!7912 (= lt!40029 lt!40027)))

(assert (=> d!7912 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39819))))

(assert (=> d!7912 (= lt!40027 (lemmaIsPrefixRefl!0 (_2!1620 lt!39819)))))

(assert (=> d!7912 (= lt!40023 (BitStream!1351 (buf!1086 (_2!1620 lt!39824)) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(assert (=> d!7912 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39824))))

(assert (=> d!7912 (= (reader!0 (_2!1620 lt!39819) (_2!1620 lt!39824)) lt!40035)))

(declare-fun b!28491 () Bool)

(declare-fun lt!40021 () Unit!2221)

(assert (=> b!28491 (= e!19185 lt!40021)))

(declare-fun lt!40030 () (_ BitVec 64))

(assert (=> b!28491 (= lt!40030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40025 () (_ BitVec 64))

(assert (=> b!28491 (= lt!40025 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(assert (=> b!28491 (= lt!40021 (arrayBitRangesEqSymmetric!0 (buf!1086 (_2!1620 lt!39819)) (buf!1086 (_2!1620 lt!39824)) lt!40030 lt!40025))))

(assert (=> b!28491 (arrayBitRangesEq!0 (buf!1086 (_2!1620 lt!39824)) (buf!1086 (_2!1620 lt!39819)) lt!40030 lt!40025)))

(declare-fun lt!40036 () (_ BitVec 64))

(declare-fun lt!40034 () (_ BitVec 64))

(declare-fun b!28492 () Bool)

(assert (=> b!28492 (= e!19186 (= (_1!1621 lt!40035) (withMovedBitIndex!0 (_2!1621 lt!40035) (bvsub lt!40034 lt!40036))))))

(assert (=> b!28492 (or (= (bvand lt!40034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40034 lt!40036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28492 (= lt!40036 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824))))))

(assert (=> b!28492 (= lt!40034 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(declare-fun b!28493 () Bool)

(declare-fun Unit!2233 () Unit!2221)

(assert (=> b!28493 (= e!19185 Unit!2233)))

(declare-fun b!28494 () Bool)

(declare-fun res!24712 () Bool)

(assert (=> b!28494 (=> (not res!24712) (not e!19186))))

(assert (=> b!28494 (= res!24712 (isPrefixOf!0 (_2!1621 lt!40035) (_2!1620 lt!39824)))))

(assert (= (and d!7912 c!1789) b!28491))

(assert (= (and d!7912 (not c!1789)) b!28493))

(assert (= (and d!7912 res!24713) b!28490))

(assert (= (and b!28490 res!24711) b!28494))

(assert (= (and b!28494 res!24712) b!28492))

(declare-fun m!40845 () Bool)

(assert (=> b!28490 m!40845))

(declare-fun m!40847 () Bool)

(assert (=> b!28492 m!40847))

(assert (=> b!28492 m!40619))

(assert (=> b!28492 m!40663))

(declare-fun m!40849 () Bool)

(assert (=> b!28494 m!40849))

(assert (=> d!7912 m!40821))

(declare-fun m!40851 () Bool)

(assert (=> d!7912 m!40851))

(declare-fun m!40853 () Bool)

(assert (=> d!7912 m!40853))

(declare-fun m!40855 () Bool)

(assert (=> d!7912 m!40855))

(declare-fun m!40857 () Bool)

(assert (=> d!7912 m!40857))

(assert (=> d!7912 m!40673))

(declare-fun m!40859 () Bool)

(assert (=> d!7912 m!40859))

(declare-fun m!40861 () Bool)

(assert (=> d!7912 m!40861))

(assert (=> d!7912 m!40831))

(declare-fun m!40863 () Bool)

(assert (=> d!7912 m!40863))

(declare-fun m!40865 () Bool)

(assert (=> d!7912 m!40865))

(assert (=> b!28491 m!40663))

(declare-fun m!40867 () Bool)

(assert (=> b!28491 m!40867))

(declare-fun m!40869 () Bool)

(assert (=> b!28491 m!40869))

(assert (=> b!28361 d!7912))

(declare-fun d!7914 () Bool)

(assert (=> d!7914 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!39827)))

(declare-fun lt!40039 () Unit!2221)

(assert (=> d!7914 (= lt!40039 (choose!9 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!39824)) lt!39827 (BitStream!1351 (buf!1086 (_2!1620 lt!39824)) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819)))))))

(assert (=> d!7914 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!39824)) lt!39827) lt!40039)))

(declare-fun bs!2291 () Bool)

(assert (= bs!2291 d!7914))

(assert (=> bs!2291 m!40623))

(declare-fun m!40871 () Bool)

(assert (=> bs!2291 m!40871))

(assert (=> b!28361 d!7914))

(declare-fun d!7916 () Bool)

(assert (=> d!7916 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!39827) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39824)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819)))) lt!39827))))

(declare-fun bs!2292 () Bool)

(assert (= bs!2292 d!7916))

(declare-fun m!40873 () Bool)

(assert (=> bs!2292 m!40873))

(assert (=> b!28361 d!7916))

(declare-fun e!19187 () tuple2!3074)

(declare-fun lt!40042 () (_ BitVec 64))

(declare-fun b!28496 () Bool)

(declare-fun lt!40041 () tuple2!3076)

(assert (=> b!28496 (= e!19187 (tuple2!3075 (Cons!372 (_1!1625 lt!40041) (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_2!1625 lt!40041) (bvsub lt!39827 lt!40042))) (_2!1625 lt!40041)))))

(assert (=> b!28496 (= lt!40041 (readBit!0 (_1!1621 lt!39817)))))

(assert (=> b!28496 (= lt!40042 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28498 () Bool)

(declare-fun e!19188 () Bool)

(declare-fun lt!40040 () List!376)

(assert (=> b!28498 (= e!19188 (> (length!102 lt!40040) 0))))

(declare-fun b!28497 () Bool)

(assert (=> b!28497 (= e!19188 (isEmpty!70 lt!40040))))

(declare-fun d!7918 () Bool)

(assert (=> d!7918 e!19188))

(declare-fun c!1790 () Bool)

(assert (=> d!7918 (= c!1790 (= lt!39827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7918 (= lt!40040 (_1!1624 e!19187))))

(declare-fun c!1791 () Bool)

(assert (=> d!7918 (= c!1791 (= lt!39827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7918 (bvsge lt!39827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7918 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_1!1621 lt!39817) lt!39827) lt!40040)))

(declare-fun b!28495 () Bool)

(assert (=> b!28495 (= e!19187 (tuple2!3075 Nil!373 (_1!1621 lt!39817)))))

(assert (= (and d!7918 c!1791) b!28495))

(assert (= (and d!7918 (not c!1791)) b!28496))

(assert (= (and d!7918 c!1790) b!28497))

(assert (= (and d!7918 (not c!1790)) b!28498))

(declare-fun m!40875 () Bool)

(assert (=> b!28496 m!40875))

(declare-fun m!40877 () Bool)

(assert (=> b!28496 m!40877))

(declare-fun m!40879 () Bool)

(assert (=> b!28498 m!40879))

(declare-fun m!40881 () Bool)

(assert (=> b!28497 m!40881))

(assert (=> b!28361 d!7918))

(declare-fun lt!40045 () (_ BitVec 64))

(declare-fun e!19189 () tuple2!3074)

(declare-fun b!28500 () Bool)

(declare-fun lt!40044 () tuple2!3076)

(assert (=> b!28500 (= e!19189 (tuple2!3075 (Cons!372 (_1!1625 lt!40044) (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_2!1625 lt!40044) (bvsub (bvsub to!314 i!635) lt!40045))) (_2!1625 lt!40044)))))

(assert (=> b!28500 (= lt!40044 (readBit!0 (_1!1621 lt!39831)))))

(assert (=> b!28500 (= lt!40045 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28502 () Bool)

(declare-fun e!19190 () Bool)

(declare-fun lt!40043 () List!376)

(assert (=> b!28502 (= e!19190 (> (length!102 lt!40043) 0))))

(declare-fun b!28501 () Bool)

(assert (=> b!28501 (= e!19190 (isEmpty!70 lt!40043))))

(declare-fun d!7920 () Bool)

(assert (=> d!7920 e!19190))

(declare-fun c!1792 () Bool)

(assert (=> d!7920 (= c!1792 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7920 (= lt!40043 (_1!1624 e!19189))))

(declare-fun c!1793 () Bool)

(assert (=> d!7920 (= c!1793 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7920 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7920 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_1!1621 lt!39831) (bvsub to!314 i!635)) lt!40043)))

(declare-fun b!28499 () Bool)

(assert (=> b!28499 (= e!19189 (tuple2!3075 Nil!373 (_1!1621 lt!39831)))))

(assert (= (and d!7920 c!1793) b!28499))

(assert (= (and d!7920 (not c!1793)) b!28500))

(assert (= (and d!7920 c!1792) b!28501))

(assert (= (and d!7920 (not c!1792)) b!28502))

(declare-fun m!40883 () Bool)

(assert (=> b!28500 m!40883))

(declare-fun m!40885 () Bool)

(assert (=> b!28500 m!40885))

(declare-fun m!40887 () Bool)

(assert (=> b!28502 m!40887))

(declare-fun m!40889 () Bool)

(assert (=> b!28501 m!40889))

(assert (=> b!28361 d!7920))

(declare-fun d!7922 () Bool)

(assert (=> d!7922 (= (invariant!0 (currentBit!2406 (_2!1620 lt!39819)) (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39824)))) (and (bvsge (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (bvslt (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000001000) (bvsge (currentByte!2411 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39824)))) (and (= (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (= (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39824))))))))))

(assert (=> b!28350 d!7922))

(declare-fun d!7924 () Bool)

(assert (=> d!7924 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40046 () Unit!2221)

(assert (=> d!7924 (= lt!40046 (choose!9 thiss!1379 (buf!1086 (_2!1620 lt!39819)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1351 (buf!1086 (_2!1620 lt!39819)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(assert (=> d!7924 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1086 (_2!1620 lt!39819)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40046)))

(declare-fun bs!2293 () Bool)

(assert (= bs!2293 d!7924))

(assert (=> bs!2293 m!40671))

(declare-fun m!40891 () Bool)

(assert (=> bs!2293 m!40891))

(assert (=> b!28352 d!7924))

(declare-fun b!28503 () Bool)

(declare-fun res!24714 () Bool)

(declare-fun e!19192 () Bool)

(assert (=> b!28503 (=> (not res!24714) (not e!19192))))

(declare-fun lt!40063 () tuple2!3068)

(assert (=> b!28503 (= res!24714 (isPrefixOf!0 (_1!1621 lt!40063) thiss!1379))))

(declare-fun d!7926 () Bool)

(assert (=> d!7926 e!19192))

(declare-fun res!24716 () Bool)

(assert (=> d!7926 (=> (not res!24716) (not e!19192))))

(assert (=> d!7926 (= res!24716 (isPrefixOf!0 (_1!1621 lt!40063) (_2!1621 lt!40063)))))

(declare-fun lt!40051 () BitStream!1350)

(assert (=> d!7926 (= lt!40063 (tuple2!3069 lt!40051 (_2!1620 lt!39819)))))

(declare-fun lt!40065 () Unit!2221)

(declare-fun lt!40066 () Unit!2221)

(assert (=> d!7926 (= lt!40065 lt!40066)))

(assert (=> d!7926 (isPrefixOf!0 lt!40051 (_2!1620 lt!39819))))

(assert (=> d!7926 (= lt!40066 (lemmaIsPrefixTransitive!0 lt!40051 (_2!1620 lt!39819) (_2!1620 lt!39819)))))

(declare-fun lt!40061 () Unit!2221)

(declare-fun lt!40052 () Unit!2221)

(assert (=> d!7926 (= lt!40061 lt!40052)))

(assert (=> d!7926 (isPrefixOf!0 lt!40051 (_2!1620 lt!39819))))

(assert (=> d!7926 (= lt!40052 (lemmaIsPrefixTransitive!0 lt!40051 thiss!1379 (_2!1620 lt!39819)))))

(declare-fun lt!40054 () Unit!2221)

(declare-fun e!19191 () Unit!2221)

(assert (=> d!7926 (= lt!40054 e!19191)))

(declare-fun c!1794 () Bool)

(assert (=> d!7926 (= c!1794 (not (= (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!40047 () Unit!2221)

(declare-fun lt!40056 () Unit!2221)

(assert (=> d!7926 (= lt!40047 lt!40056)))

(assert (=> d!7926 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39819))))

(assert (=> d!7926 (= lt!40056 (lemmaIsPrefixRefl!0 (_2!1620 lt!39819)))))

(declare-fun lt!40060 () Unit!2221)

(declare-fun lt!40050 () Unit!2221)

(assert (=> d!7926 (= lt!40060 lt!40050)))

(assert (=> d!7926 (= lt!40050 (lemmaIsPrefixRefl!0 (_2!1620 lt!39819)))))

(declare-fun lt!40048 () Unit!2221)

(declare-fun lt!40059 () Unit!2221)

(assert (=> d!7926 (= lt!40048 lt!40059)))

(assert (=> d!7926 (isPrefixOf!0 lt!40051 lt!40051)))

(assert (=> d!7926 (= lt!40059 (lemmaIsPrefixRefl!0 lt!40051))))

(declare-fun lt!40057 () Unit!2221)

(declare-fun lt!40055 () Unit!2221)

(assert (=> d!7926 (= lt!40057 lt!40055)))

(assert (=> d!7926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7926 (= lt!40055 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7926 (= lt!40051 (BitStream!1351 (buf!1086 (_2!1620 lt!39819)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(assert (=> d!7926 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39819))))

(assert (=> d!7926 (= (reader!0 thiss!1379 (_2!1620 lt!39819)) lt!40063)))

(declare-fun b!28504 () Bool)

(declare-fun lt!40049 () Unit!2221)

(assert (=> b!28504 (= e!19191 lt!40049)))

(declare-fun lt!40058 () (_ BitVec 64))

(assert (=> b!28504 (= lt!40058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40053 () (_ BitVec 64))

(assert (=> b!28504 (= lt!40053 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(assert (=> b!28504 (= lt!40049 (arrayBitRangesEqSymmetric!0 (buf!1086 thiss!1379) (buf!1086 (_2!1620 lt!39819)) lt!40058 lt!40053))))

(assert (=> b!28504 (arrayBitRangesEq!0 (buf!1086 (_2!1620 lt!39819)) (buf!1086 thiss!1379) lt!40058 lt!40053)))

(declare-fun lt!40064 () (_ BitVec 64))

(declare-fun b!28505 () Bool)

(declare-fun lt!40062 () (_ BitVec 64))

(assert (=> b!28505 (= e!19192 (= (_1!1621 lt!40063) (withMovedBitIndex!0 (_2!1621 lt!40063) (bvsub lt!40062 lt!40064))))))

(assert (=> b!28505 (or (= (bvand lt!40062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40064 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40062 lt!40064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28505 (= lt!40064 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(assert (=> b!28505 (= lt!40062 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)))))

(declare-fun b!28506 () Bool)

(declare-fun Unit!2235 () Unit!2221)

(assert (=> b!28506 (= e!19191 Unit!2235)))

(declare-fun b!28507 () Bool)

(declare-fun res!24715 () Bool)

(assert (=> b!28507 (=> (not res!24715) (not e!19192))))

(assert (=> b!28507 (= res!24715 (isPrefixOf!0 (_2!1621 lt!40063) (_2!1620 lt!39819)))))

(assert (= (and d!7926 c!1794) b!28504))

(assert (= (and d!7926 (not c!1794)) b!28506))

(assert (= (and d!7926 res!24716) b!28503))

(assert (= (and b!28503 res!24714) b!28507))

(assert (= (and b!28507 res!24715) b!28505))

(declare-fun m!40893 () Bool)

(assert (=> b!28503 m!40893))

(declare-fun m!40895 () Bool)

(assert (=> b!28505 m!40895))

(assert (=> b!28505 m!40663))

(assert (=> b!28505 m!40655))

(declare-fun m!40897 () Bool)

(assert (=> b!28507 m!40897))

(assert (=> d!7926 m!40853))

(declare-fun m!40899 () Bool)

(assert (=> d!7926 m!40899))

(assert (=> d!7926 m!40651))

(declare-fun m!40901 () Bool)

(assert (=> d!7926 m!40901))

(declare-fun m!40903 () Bool)

(assert (=> d!7926 m!40903))

(assert (=> d!7926 m!40645))

(declare-fun m!40905 () Bool)

(assert (=> d!7926 m!40905))

(assert (=> d!7926 m!40653))

(assert (=> d!7926 m!40861))

(declare-fun m!40907 () Bool)

(assert (=> d!7926 m!40907))

(declare-fun m!40909 () Bool)

(assert (=> d!7926 m!40909))

(assert (=> b!28504 m!40655))

(declare-fun m!40911 () Bool)

(assert (=> b!28504 m!40911))

(declare-fun m!40913 () Bool)

(assert (=> b!28504 m!40913))

(assert (=> b!28352 d!7926))

(declare-fun d!7928 () Bool)

(declare-fun res!24718 () Bool)

(declare-fun e!19193 () Bool)

(assert (=> d!7928 (=> (not res!24718) (not e!19193))))

(assert (=> d!7928 (= res!24718 (= (size!759 (buf!1086 thiss!1379)) (size!759 (buf!1086 (_2!1620 lt!39824)))))))

(assert (=> d!7928 (= (isPrefixOf!0 thiss!1379 (_2!1620 lt!39824)) e!19193)))

(declare-fun b!28508 () Bool)

(declare-fun res!24717 () Bool)

(assert (=> b!28508 (=> (not res!24717) (not e!19193))))

(assert (=> b!28508 (= res!24717 (bvsle (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)) (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824)))))))

(declare-fun b!28509 () Bool)

(declare-fun e!19194 () Bool)

(assert (=> b!28509 (= e!19193 e!19194)))

(declare-fun res!24719 () Bool)

(assert (=> b!28509 (=> res!24719 e!19194)))

(assert (=> b!28509 (= res!24719 (= (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28510 () Bool)

(assert (=> b!28510 (= e!19194 (arrayBitRangesEq!0 (buf!1086 thiss!1379) (buf!1086 (_2!1620 lt!39824)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(assert (= (and d!7928 res!24718) b!28508))

(assert (= (and b!28508 res!24717) b!28509))

(assert (= (and b!28509 (not res!24719)) b!28510))

(assert (=> b!28508 m!40655))

(assert (=> b!28508 m!40619))

(assert (=> b!28510 m!40655))

(assert (=> b!28510 m!40655))

(declare-fun m!40915 () Bool)

(assert (=> b!28510 m!40915))

(assert (=> b!28352 d!7928))

(declare-fun b!28710 () Bool)

(declare-fun res!24853 () Bool)

(declare-fun e!19297 () Bool)

(assert (=> b!28710 (=> (not res!24853) (not e!19297))))

(declare-fun lt!40573 () tuple2!3066)

(assert (=> b!28710 (= res!24853 (invariant!0 (currentBit!2406 (_2!1620 lt!40573)) (currentByte!2411 (_2!1620 lt!40573)) (size!759 (buf!1086 (_2!1620 lt!40573)))))))

(declare-fun lt!40591 () tuple2!3068)

(declare-fun b!28711 () Bool)

(assert (=> b!28711 (= e!19297 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!40573) (_1!1621 lt!40591) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1620 lt!40573) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!28711 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28711 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!40592 () Unit!2221)

(declare-fun lt!40569 () Unit!2221)

(assert (=> b!28711 (= lt!40592 lt!40569)))

(declare-fun lt!40576 () (_ BitVec 64))

(assert (=> b!28711 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!40573)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!40576)))

(assert (=> b!28711 (= lt!40569 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!40573)) lt!40576))))

(declare-fun e!19298 () Bool)

(assert (=> b!28711 e!19298))

(declare-fun res!24848 () Bool)

(assert (=> b!28711 (=> (not res!24848) (not e!19298))))

(assert (=> b!28711 (= res!24848 (and (= (size!759 (buf!1086 (_2!1620 lt!39819))) (size!759 (buf!1086 (_2!1620 lt!40573)))) (bvsge lt!40576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28711 (= lt!40576 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!28711 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28711 (= lt!40591 (reader!0 (_2!1620 lt!39819) (_2!1620 lt!40573)))))

(declare-fun b!28712 () Bool)

(declare-fun res!24851 () Bool)

(assert (=> b!28712 (=> (not res!24851) (not e!19297))))

(assert (=> b!28712 (= res!24851 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!40573)))))

(declare-fun b!28713 () Bool)

(declare-fun res!24849 () Bool)

(assert (=> b!28713 (=> (not res!24849) (not e!19297))))

(assert (=> b!28713 (= res!24849 (= (size!759 (buf!1086 (_2!1620 lt!40573))) (size!759 (buf!1086 (_2!1620 lt!39819)))))))

(declare-fun c!1830 () Bool)

(declare-fun call!361 () tuple2!3068)

(declare-fun lt!40589 () tuple2!3066)

(declare-fun lt!40572 () tuple2!3066)

(declare-fun bm!358 () Bool)

(assert (=> bm!358 (= call!361 (reader!0 (ite c!1830 (_2!1620 lt!40589) (_2!1620 lt!39819)) (ite c!1830 (_2!1620 lt!40572) (_2!1620 lt!39819))))))

(declare-fun d!7930 () Bool)

(assert (=> d!7930 e!19297))

(declare-fun res!24850 () Bool)

(assert (=> d!7930 (=> (not res!24850) (not e!19297))))

(declare-fun lt!40597 () (_ BitVec 64))

(assert (=> d!7930 (= res!24850 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!40573))) (currentByte!2411 (_2!1620 lt!40573)) (currentBit!2406 (_2!1620 lt!40573))) (bvsub lt!40597 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7930 (or (= (bvand lt!40597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40597 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!40566 () (_ BitVec 64))

(assert (=> d!7930 (= lt!40597 (bvadd lt!40566 to!314))))

(assert (=> d!7930 (or (not (= (bvand lt!40566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!40566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!40566 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7930 (= lt!40566 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(declare-fun e!19296 () tuple2!3066)

(assert (=> d!7930 (= lt!40573 e!19296)))

(assert (=> d!7930 (= c!1830 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!40607 () Unit!2221)

(declare-fun lt!40575 () Unit!2221)

(assert (=> d!7930 (= lt!40607 lt!40575)))

(assert (=> d!7930 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39819))))

(assert (=> d!7930 (= lt!40575 (lemmaIsPrefixRefl!0 (_2!1620 lt!39819)))))

(declare-fun lt!40593 () (_ BitVec 64))

(assert (=> d!7930 (= lt!40593 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))))))

(assert (=> d!7930 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7930 (= (appendBitsMSBFirstLoop!0 (_2!1620 lt!39819) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!40573)))

(declare-fun b!28714 () Bool)

(declare-fun Unit!2236 () Unit!2221)

(assert (=> b!28714 (= e!19296 (tuple2!3067 Unit!2236 (_2!1620 lt!40572)))))

(assert (=> b!28714 (= lt!40589 (appendBitFromByte!0 (_2!1620 lt!39819) (select (arr!1221 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!40594 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40594 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40567 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40567 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40595 () Unit!2221)

(assert (=> b!28714 (= lt!40595 (validateOffsetBitsIneqLemma!0 (_2!1620 lt!39819) (_2!1620 lt!40589) lt!40594 lt!40567))))

(assert (=> b!28714 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!40589)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!40589))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!40589))) (bvsub lt!40594 lt!40567))))

(declare-fun lt!40571 () Unit!2221)

(assert (=> b!28714 (= lt!40571 lt!40595)))

(declare-fun lt!40584 () tuple2!3068)

(assert (=> b!28714 (= lt!40584 (reader!0 (_2!1620 lt!39819) (_2!1620 lt!40589)))))

(declare-fun lt!40600 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40600 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40579 () Unit!2221)

(assert (=> b!28714 (= lt!40579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!40589)) lt!40600))))

(assert (=> b!28714 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!40589)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!40600)))

(declare-fun lt!40590 () Unit!2221)

(assert (=> b!28714 (= lt!40590 lt!40579)))

(assert (=> b!28714 (= (head!213 (byteArrayBitContentToList!0 (_2!1620 lt!40589) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!213 (bitStreamReadBitsIntoList!0 (_2!1620 lt!40589) (_1!1621 lt!40584) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40609 () Unit!2221)

(declare-fun Unit!2237 () Unit!2221)

(assert (=> b!28714 (= lt!40609 Unit!2237)))

(assert (=> b!28714 (= lt!40572 (appendBitsMSBFirstLoop!0 (_2!1620 lt!40589) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!40604 () Unit!2221)

(assert (=> b!28714 (= lt!40604 (lemmaIsPrefixTransitive!0 (_2!1620 lt!39819) (_2!1620 lt!40589) (_2!1620 lt!40572)))))

(assert (=> b!28714 (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!40572))))

(declare-fun lt!40581 () Unit!2221)

(assert (=> b!28714 (= lt!40581 lt!40604)))

(assert (=> b!28714 (= (size!759 (buf!1086 (_2!1620 lt!40572))) (size!759 (buf!1086 (_2!1620 lt!39819))))))

(declare-fun lt!40570 () Unit!2221)

(declare-fun Unit!2238 () Unit!2221)

(assert (=> b!28714 (= lt!40570 Unit!2238)))

(assert (=> b!28714 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!40572))) (currentByte!2411 (_2!1620 lt!40572)) (currentBit!2406 (_2!1620 lt!40572))) (bvsub (bvadd (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40577 () Unit!2221)

(declare-fun Unit!2239 () Unit!2221)

(assert (=> b!28714 (= lt!40577 Unit!2239)))

(assert (=> b!28714 (= (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!40572))) (currentByte!2411 (_2!1620 lt!40572)) (currentBit!2406 (_2!1620 lt!40572))) (bvsub (bvsub (bvadd (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!40589))) (currentByte!2411 (_2!1620 lt!40589)) (currentBit!2406 (_2!1620 lt!40589))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40598 () Unit!2221)

(declare-fun Unit!2240 () Unit!2221)

(assert (=> b!28714 (= lt!40598 Unit!2240)))

(declare-fun lt!40568 () tuple2!3068)

(assert (=> b!28714 (= lt!40568 (reader!0 (_2!1620 lt!39819) (_2!1620 lt!40572)))))

(declare-fun lt!40606 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40606 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40585 () Unit!2221)

(assert (=> b!28714 (= lt!40585 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!39819) (buf!1086 (_2!1620 lt!40572)) lt!40606))))

(assert (=> b!28714 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!40572)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!40606)))

(declare-fun lt!40582 () Unit!2221)

(assert (=> b!28714 (= lt!40582 lt!40585)))

(declare-fun lt!40608 () tuple2!3068)

(assert (=> b!28714 (= lt!40608 call!361)))

(declare-fun lt!40601 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40601 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40578 () Unit!2221)

(assert (=> b!28714 (= lt!40578 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1620 lt!40589) (buf!1086 (_2!1620 lt!40572)) lt!40601))))

(assert (=> b!28714 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!40572)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!40589))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!40589))) lt!40601)))

(declare-fun lt!40574 () Unit!2221)

(assert (=> b!28714 (= lt!40574 lt!40578)))

(declare-fun lt!40586 () List!376)

(assert (=> b!28714 (= lt!40586 (byteArrayBitContentToList!0 (_2!1620 lt!40572) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!40602 () List!376)

(assert (=> b!28714 (= lt!40602 (byteArrayBitContentToList!0 (_2!1620 lt!40572) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40587 () List!376)

(assert (=> b!28714 (= lt!40587 (bitStreamReadBitsIntoList!0 (_2!1620 lt!40572) (_1!1621 lt!40568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!40588 () List!376)

(assert (=> b!28714 (= lt!40588 (bitStreamReadBitsIntoList!0 (_2!1620 lt!40572) (_1!1621 lt!40608) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40599 () (_ BitVec 64))

(assert (=> b!28714 (= lt!40599 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40603 () Unit!2221)

(assert (=> b!28714 (= lt!40603 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1620 lt!40572) (_2!1620 lt!40572) (_1!1621 lt!40568) (_1!1621 lt!40608) lt!40599 lt!40587))))

(assert (=> b!28714 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!40572) (_1!1621 lt!40608) (bvsub lt!40599 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!93 lt!40587))))

(declare-fun lt!40583 () Unit!2221)

(assert (=> b!28714 (= lt!40583 lt!40603)))

(declare-fun lt!40596 () Unit!2221)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1753 array!1753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2221)

(assert (=> b!28714 (= lt!40596 (arrayBitRangesEqImpliesEq!0 (buf!1086 (_2!1620 lt!40589)) (buf!1086 (_2!1620 lt!40572)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!40593 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!40589))) (currentByte!2411 (_2!1620 lt!40589)) (currentBit!2406 (_2!1620 lt!40589)))))))

(declare-fun bitAt!0 (array!1753 (_ BitVec 64)) Bool)

(assert (=> b!28714 (= (bitAt!0 (buf!1086 (_2!1620 lt!40589)) lt!40593) (bitAt!0 (buf!1086 (_2!1620 lt!40572)) lt!40593))))

(declare-fun lt!40580 () Unit!2221)

(assert (=> b!28714 (= lt!40580 lt!40596)))

(declare-fun b!28715 () Bool)

(declare-fun Unit!2241 () Unit!2221)

(assert (=> b!28715 (= e!19296 (tuple2!3067 Unit!2241 (_2!1620 lt!39819)))))

(assert (=> b!28715 (= (size!759 (buf!1086 (_2!1620 lt!39819))) (size!759 (buf!1086 (_2!1620 lt!39819))))))

(declare-fun lt!40605 () Unit!2221)

(declare-fun Unit!2242 () Unit!2221)

(assert (=> b!28715 (= lt!40605 Unit!2242)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1350 array!1753 array!1753 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28715 (checkByteArrayBitContent!0 (_2!1620 lt!39819) srcBuffer!2 (_1!1627 (readBits!0 (_1!1621 call!361) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!28716 () Bool)

(assert (=> b!28716 (= e!19298 (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 (_2!1620 lt!39819))) ((_ sign_extend 32) (currentBit!2406 (_2!1620 lt!39819))) lt!40576))))

(declare-fun b!28717 () Bool)

(declare-fun res!24852 () Bool)

(assert (=> b!28717 (=> (not res!24852) (not e!19297))))

(assert (=> b!28717 (= res!24852 (= (size!759 (buf!1086 (_2!1620 lt!39819))) (size!759 (buf!1086 (_2!1620 lt!40573)))))))

(assert (= (and d!7930 c!1830) b!28714))

(assert (= (and d!7930 (not c!1830)) b!28715))

(assert (= (or b!28714 b!28715) bm!358))

(assert (= (and d!7930 res!24850) b!28710))

(assert (= (and b!28710 res!24853) b!28717))

(assert (= (and b!28717 res!24852) b!28712))

(assert (= (and b!28712 res!24851) b!28713))

(assert (= (and b!28713 res!24849) b!28711))

(assert (= (and b!28711 res!24848) b!28716))

(declare-fun m!41227 () Bool)

(assert (=> b!28710 m!41227))

(declare-fun m!41229 () Bool)

(assert (=> b!28712 m!41229))

(declare-fun m!41231 () Bool)

(assert (=> b!28711 m!41231))

(declare-fun m!41233 () Bool)

(assert (=> b!28711 m!41233))

(declare-fun m!41235 () Bool)

(assert (=> b!28711 m!41235))

(declare-fun m!41237 () Bool)

(assert (=> b!28711 m!41237))

(declare-fun m!41239 () Bool)

(assert (=> b!28711 m!41239))

(declare-fun m!41241 () Bool)

(assert (=> b!28715 m!41241))

(declare-fun m!41243 () Bool)

(assert (=> b!28715 m!41243))

(declare-fun m!41245 () Bool)

(assert (=> b!28716 m!41245))

(declare-fun m!41247 () Bool)

(assert (=> bm!358 m!41247))

(declare-fun m!41249 () Bool)

(assert (=> d!7930 m!41249))

(assert (=> d!7930 m!40663))

(assert (=> d!7930 m!40853))

(assert (=> d!7930 m!40861))

(declare-fun m!41251 () Bool)

(assert (=> b!28714 m!41251))

(declare-fun m!41253 () Bool)

(assert (=> b!28714 m!41253))

(declare-fun m!41255 () Bool)

(assert (=> b!28714 m!41255))

(declare-fun m!41257 () Bool)

(assert (=> b!28714 m!41257))

(declare-fun m!41259 () Bool)

(assert (=> b!28714 m!41259))

(declare-fun m!41261 () Bool)

(assert (=> b!28714 m!41261))

(declare-fun m!41263 () Bool)

(assert (=> b!28714 m!41263))

(declare-fun m!41265 () Bool)

(assert (=> b!28714 m!41265))

(declare-fun m!41267 () Bool)

(assert (=> b!28714 m!41267))

(declare-fun m!41269 () Bool)

(assert (=> b!28714 m!41269))

(declare-fun m!41271 () Bool)

(assert (=> b!28714 m!41271))

(declare-fun m!41273 () Bool)

(assert (=> b!28714 m!41273))

(declare-fun m!41275 () Bool)

(assert (=> b!28714 m!41275))

(declare-fun m!41277 () Bool)

(assert (=> b!28714 m!41277))

(declare-fun m!41279 () Bool)

(assert (=> b!28714 m!41279))

(declare-fun m!41281 () Bool)

(assert (=> b!28714 m!41281))

(declare-fun m!41283 () Bool)

(assert (=> b!28714 m!41283))

(assert (=> b!28714 m!41251))

(declare-fun m!41285 () Bool)

(assert (=> b!28714 m!41285))

(declare-fun m!41287 () Bool)

(assert (=> b!28714 m!41287))

(declare-fun m!41289 () Bool)

(assert (=> b!28714 m!41289))

(declare-fun m!41291 () Bool)

(assert (=> b!28714 m!41291))

(assert (=> b!28714 m!40663))

(declare-fun m!41293 () Bool)

(assert (=> b!28714 m!41293))

(assert (=> b!28714 m!41281))

(declare-fun m!41295 () Bool)

(assert (=> b!28714 m!41295))

(assert (=> b!28714 m!41279))

(declare-fun m!41297 () Bool)

(assert (=> b!28714 m!41297))

(declare-fun m!41299 () Bool)

(assert (=> b!28714 m!41299))

(declare-fun m!41301 () Bool)

(assert (=> b!28714 m!41301))

(declare-fun m!41303 () Bool)

(assert (=> b!28714 m!41303))

(declare-fun m!41305 () Bool)

(assert (=> b!28714 m!41305))

(declare-fun m!41307 () Bool)

(assert (=> b!28714 m!41307))

(declare-fun m!41309 () Bool)

(assert (=> b!28714 m!41309))

(declare-fun m!41311 () Bool)

(assert (=> b!28714 m!41311))

(assert (=> b!28714 m!41299))

(assert (=> b!28352 d!7930))

(declare-fun d!8028 () Bool)

(declare-fun res!24855 () Bool)

(declare-fun e!19299 () Bool)

(assert (=> d!8028 (=> (not res!24855) (not e!19299))))

(assert (=> d!8028 (= res!24855 (= (size!759 (buf!1086 (_2!1620 lt!39819))) (size!759 (buf!1086 (_2!1620 lt!39824)))))))

(assert (=> d!8028 (= (isPrefixOf!0 (_2!1620 lt!39819) (_2!1620 lt!39824)) e!19299)))

(declare-fun b!28718 () Bool)

(declare-fun res!24854 () Bool)

(assert (=> b!28718 (=> (not res!24854) (not e!19299))))

(assert (=> b!28718 (= res!24854 (bvsle (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819))) (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39824))) (currentByte!2411 (_2!1620 lt!39824)) (currentBit!2406 (_2!1620 lt!39824)))))))

(declare-fun b!28719 () Bool)

(declare-fun e!19300 () Bool)

(assert (=> b!28719 (= e!19299 e!19300)))

(declare-fun res!24856 () Bool)

(assert (=> b!28719 (=> res!24856 e!19300)))

(assert (=> b!28719 (= res!24856 (= (size!759 (buf!1086 (_2!1620 lt!39819))) #b00000000000000000000000000000000))))

(declare-fun b!28720 () Bool)

(assert (=> b!28720 (= e!19300 (arrayBitRangesEq!0 (buf!1086 (_2!1620 lt!39819)) (buf!1086 (_2!1620 lt!39824)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!759 (buf!1086 (_2!1620 lt!39819))) (currentByte!2411 (_2!1620 lt!39819)) (currentBit!2406 (_2!1620 lt!39819)))))))

(assert (= (and d!8028 res!24855) b!28718))

(assert (= (and b!28718 res!24854) b!28719))

(assert (= (and b!28719 (not res!24856)) b!28720))

(assert (=> b!28718 m!40663))

(assert (=> b!28718 m!40619))

(assert (=> b!28720 m!40663))

(assert (=> b!28720 m!40663))

(declare-fun m!41313 () Bool)

(assert (=> b!28720 m!41313))

(assert (=> b!28352 d!8028))

(declare-fun d!8030 () Bool)

(assert (=> d!8030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 (_2!1620 lt!39819)))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2309 () Bool)

(assert (= bs!2309 d!8030))

(declare-fun m!41315 () Bool)

(assert (=> bs!2309 m!41315))

(assert (=> b!28352 d!8030))

(declare-fun d!8032 () Bool)

(assert (=> d!8032 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39824))))

(declare-fun lt!40612 () Unit!2221)

(declare-fun choose!30 (BitStream!1350 BitStream!1350 BitStream!1350) Unit!2221)

(assert (=> d!8032 (= lt!40612 (choose!30 thiss!1379 (_2!1620 lt!39819) (_2!1620 lt!39824)))))

(assert (=> d!8032 (isPrefixOf!0 thiss!1379 (_2!1620 lt!39819))))

(assert (=> d!8032 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1620 lt!39819) (_2!1620 lt!39824)) lt!40612)))

(declare-fun bs!2310 () Bool)

(assert (= bs!2310 d!8032))

(assert (=> bs!2310 m!40665))

(declare-fun m!41317 () Bool)

(assert (=> bs!2310 m!41317))

(assert (=> bs!2310 m!40645))

(assert (=> b!28352 d!8032))

(declare-fun d!8034 () Bool)

(declare-fun res!24858 () Bool)

(declare-fun e!19301 () Bool)

(assert (=> d!8034 (=> (not res!24858) (not e!19301))))

(assert (=> d!8034 (= res!24858 (= (size!759 (buf!1086 thiss!1379)) (size!759 (buf!1086 thiss!1379))))))

(assert (=> d!8034 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19301)))

(declare-fun b!28721 () Bool)

(declare-fun res!24857 () Bool)

(assert (=> b!28721 (=> (not res!24857) (not e!19301))))

(assert (=> b!28721 (= res!24857 (bvsle (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)) (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(declare-fun b!28722 () Bool)

(declare-fun e!19302 () Bool)

(assert (=> b!28722 (= e!19301 e!19302)))

(declare-fun res!24859 () Bool)

(assert (=> b!28722 (=> res!24859 e!19302)))

(assert (=> b!28722 (= res!24859 (= (size!759 (buf!1086 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28723 () Bool)

(assert (=> b!28723 (= e!19302 (arrayBitRangesEq!0 (buf!1086 thiss!1379) (buf!1086 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379))))))

(assert (= (and d!8034 res!24858) b!28721))

(assert (= (and b!28721 res!24857) b!28722))

(assert (= (and b!28722 (not res!24859)) b!28723))

(assert (=> b!28721 m!40655))

(assert (=> b!28721 m!40655))

(assert (=> b!28723 m!40655))

(assert (=> b!28723 m!40655))

(declare-fun m!41319 () Bool)

(assert (=> b!28723 m!41319))

(assert (=> b!28362 d!8034))

(declare-fun d!8036 () Bool)

(assert (=> d!8036 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!40615 () Unit!2221)

(declare-fun choose!11 (BitStream!1350) Unit!2221)

(assert (=> d!8036 (= lt!40615 (choose!11 thiss!1379))))

(assert (=> d!8036 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!40615)))

(declare-fun bs!2312 () Bool)

(assert (= bs!2312 d!8036))

(assert (=> bs!2312 m!40651))

(declare-fun m!41321 () Bool)

(assert (=> bs!2312 m!41321))

(assert (=> b!28362 d!8036))

(declare-fun d!8038 () Bool)

(declare-fun e!19303 () Bool)

(assert (=> d!8038 e!19303))

(declare-fun res!24861 () Bool)

(assert (=> d!8038 (=> (not res!24861) (not e!19303))))

(declare-fun lt!40616 () (_ BitVec 64))

(declare-fun lt!40621 () (_ BitVec 64))

(declare-fun lt!40618 () (_ BitVec 64))

(assert (=> d!8038 (= res!24861 (= lt!40621 (bvsub lt!40618 lt!40616)))))

(assert (=> d!8038 (or (= (bvand lt!40618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40616 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40618 lt!40616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8038 (= lt!40616 (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379))))))

(declare-fun lt!40620 () (_ BitVec 64))

(declare-fun lt!40619 () (_ BitVec 64))

(assert (=> d!8038 (= lt!40618 (bvmul lt!40620 lt!40619))))

(assert (=> d!8038 (or (= lt!40620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!40619 (bvsdiv (bvmul lt!40620 lt!40619) lt!40620)))))

(assert (=> d!8038 (= lt!40619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8038 (= lt!40620 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))))))

(assert (=> d!8038 (= lt!40621 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2411 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2406 thiss!1379))))))

(assert (=> d!8038 (invariant!0 (currentBit!2406 thiss!1379) (currentByte!2411 thiss!1379) (size!759 (buf!1086 thiss!1379)))))

(assert (=> d!8038 (= (bitIndex!0 (size!759 (buf!1086 thiss!1379)) (currentByte!2411 thiss!1379) (currentBit!2406 thiss!1379)) lt!40621)))

(declare-fun b!28724 () Bool)

(declare-fun res!24860 () Bool)

(assert (=> b!28724 (=> (not res!24860) (not e!19303))))

(assert (=> b!28724 (= res!24860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40621))))

(declare-fun b!28725 () Bool)

(declare-fun lt!40617 () (_ BitVec 64))

(assert (=> b!28725 (= e!19303 (bvsle lt!40621 (bvmul lt!40617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28725 (or (= lt!40617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!40617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!40617)))))

(assert (=> b!28725 (= lt!40617 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))))))

(assert (= (and d!8038 res!24861) b!28724))

(assert (= (and b!28724 res!24860) b!28725))

(declare-fun m!41323 () Bool)

(assert (=> d!8038 m!41323))

(declare-fun m!41325 () Bool)

(assert (=> d!8038 m!41325))

(assert (=> b!28362 d!8038))

(declare-fun d!8040 () Bool)

(assert (=> d!8040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!759 (buf!1086 thiss!1379))) ((_ sign_extend 32) (currentByte!2411 thiss!1379)) ((_ sign_extend 32) (currentBit!2406 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2313 () Bool)

(assert (= bs!2313 d!8040))

(assert (=> bs!2313 m!41323))

(assert (=> b!28353 d!8040))

(declare-fun d!8042 () Bool)

(assert (=> d!8042 (= (tail!93 lt!39830) (t!1126 lt!39830))))

(assert (=> b!28354 d!8042))

(declare-fun d!8044 () Bool)

(declare-fun e!19306 () Bool)

(assert (=> d!8044 e!19306))

(declare-fun res!24864 () Bool)

(assert (=> d!8044 (=> (not res!24864) (not e!19306))))

(declare-fun lt!40627 () (_ BitVec 64))

(assert (=> d!8044 (= res!24864 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!40627) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8044 (= lt!40627 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40626 () Unit!2221)

(declare-fun choose!42 (BitStream!1350 BitStream!1350 BitStream!1350 BitStream!1350 (_ BitVec 64) List!376) Unit!2221)

(assert (=> d!8044 (= lt!40626 (choose!42 (_2!1620 lt!39824) (_2!1620 lt!39824) (_1!1621 lt!39831) (_1!1621 lt!39817) (bvsub to!314 i!635) lt!39830))))

(assert (=> d!8044 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8044 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1620 lt!39824) (_2!1620 lt!39824) (_1!1621 lt!39831) (_1!1621 lt!39817) (bvsub to!314 i!635) lt!39830) lt!40626)))

(declare-fun b!28728 () Bool)

(assert (=> b!28728 (= e!19306 (= (bitStreamReadBitsIntoList!0 (_2!1620 lt!39824) (_1!1621 lt!39817) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!93 lt!39830)))))

(assert (= (and d!8044 res!24864) b!28728))

(declare-fun m!41327 () Bool)

(assert (=> d!8044 m!41327))

(declare-fun m!41329 () Bool)

(assert (=> b!28728 m!41329))

(assert (=> b!28728 m!40647))

(assert (=> b!28354 d!8044))

(declare-fun d!8046 () Bool)

(assert (=> d!8046 (= (array_inv!728 srcBuffer!2) (bvsge (size!759 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6016 d!8046))

(declare-fun d!8048 () Bool)

(assert (=> d!8048 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2406 thiss!1379) (currentByte!2411 thiss!1379) (size!759 (buf!1086 thiss!1379))))))

(declare-fun bs!2314 () Bool)

(assert (= bs!2314 d!8048))

(assert (=> bs!2314 m!41325))

(assert (=> start!6016 d!8048))

(declare-fun d!8050 () Bool)

(declare-fun size!762 (List!376) Int)

(assert (=> d!8050 (= (length!102 lt!39830) (size!762 lt!39830))))

(declare-fun bs!2315 () Bool)

(assert (= bs!2315 d!8050))

(declare-fun m!41331 () Bool)

(assert (=> bs!2315 m!41331))

(assert (=> b!28356 d!8050))

(declare-fun d!8052 () Bool)

(assert (=> d!8052 (= (invariant!0 (currentBit!2406 (_2!1620 lt!39819)) (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39819)))) (and (bvsge (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (bvslt (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000001000) (bvsge (currentByte!2411 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39819)))) (and (= (currentBit!2406 (_2!1620 lt!39819)) #b00000000000000000000000000000000) (= (currentByte!2411 (_2!1620 lt!39819)) (size!759 (buf!1086 (_2!1620 lt!39819))))))))))

(assert (=> b!28355 d!8052))

(check-sat (not d!7916) (not d!7888) (not d!7890) (not b!28486) (not b!28505) (not b!28510) (not d!8040) (not b!28417) (not b!28494) (not b!28467) (not d!8044) (not b!28715) (not b!28497) (not d!7896) (not b!28446) (not d!7914) (not d!7930) (not b!28710) (not d!8032) (not d!7900) (not d!8038) (not b!28718) (not b!28723) (not d!8050) (not b!28711) (not b!28469) (not d!7924) (not bm!358) (not b!28503) (not b!28501) (not d!7910) (not b!28471) (not d!7926) (not d!8030) (not b!28491) (not b!28498) (not b!28473) (not b!28504) (not b!28508) (not b!28728) (not d!8048) (not b!28507) (not b!28496) (not b!28444) (not b!28502) (not b!28472) (not b!28474) (not b!28489) (not b!28428) (not b!28720) (not d!7908) (not b!28487) (not b!28429) (not b!28492) (not d!7898) (not d!8036) (not d!7906) (not b!28714) (not b!28490) (not b!28712) (not b!28449) (not b!28500) (not b!28716) (not b!28470) (not b!28427) (not b!28485) (not b!28721) (not d!7912) (not b!28468))
