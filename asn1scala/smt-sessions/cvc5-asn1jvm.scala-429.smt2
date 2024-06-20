; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11478 () Bool)

(assert start!11478)

(declare-fun lt!89299 () (_ BitVec 64))

(declare-fun e!37734 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!89306 () (_ BitVec 64))

(declare-fun b!56773 () Bool)

(assert (=> b!56773 (= e!37734 (or (= lt!89306 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!89306 (bvand (bvsub lt!89299 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56773 (= lt!89306 (bvand lt!89299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2614 0))(
  ( (array!2615 (arr!1742 (Array (_ BitVec 32) (_ BitVec 8))) (size!1187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2062 0))(
  ( (BitStream!2063 (buf!1559 array!2614) (currentByte!3159 (_ BitVec 32)) (currentBit!3154 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3925 0))(
  ( (Unit!3926) )
))
(declare-datatypes ((tuple2!5174 0))(
  ( (tuple2!5175 (_1!2698 Unit!3925) (_2!2698 BitStream!2062)) )
))
(declare-fun lt!89303 () tuple2!5174)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56773 (= lt!89299 (bvadd (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))) to!314))))

(declare-fun lt!89301 () tuple2!5174)

(declare-fun thiss!1379 () BitStream!2062)

(assert (=> b!56773 (= (size!1187 (buf!1559 (_2!2698 lt!89301))) (size!1187 (buf!1559 thiss!1379)))))

(declare-fun b!56774 () Bool)

(declare-fun res!47203 () Bool)

(assert (=> b!56774 (=> res!47203 e!37734)))

(assert (=> b!56774 (= res!47203 (not (= (size!1187 (buf!1559 thiss!1379)) (size!1187 (buf!1559 (_2!2698 lt!89301))))))))

(declare-fun b!56775 () Bool)

(declare-fun res!47208 () Bool)

(assert (=> b!56775 (=> res!47208 e!37734)))

(declare-fun lt!89302 () (_ BitVec 64))

(assert (=> b!56775 (= res!47208 (not (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89301))) (currentByte!3159 (_2!2698 lt!89301)) (currentBit!3154 (_2!2698 lt!89301))) (bvsub (bvadd lt!89302 to!314) i!635))))))

(declare-fun b!56776 () Bool)

(declare-fun e!37739 () Bool)

(assert (=> b!56776 (= e!37739 e!37734)))

(declare-fun res!47209 () Bool)

(assert (=> b!56776 (=> res!47209 e!37734)))

(declare-fun isPrefixOf!0 (BitStream!2062 BitStream!2062) Bool)

(assert (=> b!56776 (= res!47209 (not (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!89301))))))

(assert (=> b!56776 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89301))))

(declare-fun lt!89308 () Unit!3925)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2062 BitStream!2062 BitStream!2062) Unit!3925)

(assert (=> b!56776 (= lt!89308 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2698 lt!89303) (_2!2698 lt!89301)))))

(declare-fun srcBuffer!2 () array!2614)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2062 array!2614 (_ BitVec 64) (_ BitVec 64)) tuple2!5174)

(assert (=> b!56776 (= lt!89301 (appendBitsMSBFirstLoop!0 (_2!2698 lt!89303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!37737 () Bool)

(assert (=> b!56776 e!37737))

(declare-fun res!47205 () Bool)

(assert (=> b!56776 (=> (not res!47205) (not e!37737))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56776 (= res!47205 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89305 () Unit!3925)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2062 array!2614 (_ BitVec 64)) Unit!3925)

(assert (=> b!56776 (= lt!89305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1559 (_2!2698 lt!89303)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5176 0))(
  ( (tuple2!5177 (_1!2699 BitStream!2062) (_2!2699 BitStream!2062)) )
))
(declare-fun lt!89304 () tuple2!5176)

(declare-fun reader!0 (BitStream!2062 BitStream!2062) tuple2!5176)

(assert (=> b!56776 (= lt!89304 (reader!0 thiss!1379 (_2!2698 lt!89303)))))

(declare-fun b!56777 () Bool)

(declare-fun res!47206 () Bool)

(declare-fun e!37732 () Bool)

(assert (=> b!56777 (=> (not res!47206) (not e!37732))))

(assert (=> b!56777 (= res!47206 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56779 () Bool)

(declare-fun e!37735 () Bool)

(declare-fun array_inv!1090 (array!2614) Bool)

(assert (=> b!56779 (= e!37735 (array_inv!1090 (buf!1559 thiss!1379)))))

(declare-fun b!56780 () Bool)

(declare-fun e!37736 () Bool)

(assert (=> b!56780 (= e!37736 e!37739)))

(declare-fun res!47207 () Bool)

(assert (=> b!56780 (=> res!47207 e!37739)))

(assert (=> b!56780 (= res!47207 (not (isPrefixOf!0 thiss!1379 (_2!2698 lt!89303))))))

(assert (=> b!56780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89307 () Unit!3925)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2062 BitStream!2062 (_ BitVec 64) (_ BitVec 64)) Unit!3925)

(assert (=> b!56780 (= lt!89307 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2698 lt!89303) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2062 (_ BitVec 8) (_ BitVec 32)) tuple2!5174)

(assert (=> b!56780 (= lt!89303 (appendBitFromByte!0 thiss!1379 (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!56781 () Bool)

(declare-datatypes ((List!606 0))(
  ( (Nil!603) (Cons!602 (h!721 Bool) (t!1356 List!606)) )
))
(declare-fun head!425 (List!606) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2062 array!2614 (_ BitVec 64) (_ BitVec 64)) List!606)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2062 BitStream!2062 (_ BitVec 64)) List!606)

(assert (=> b!56781 (= e!37737 (= (head!425 (byteArrayBitContentToList!0 (_2!2698 lt!89303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!425 (bitStreamReadBitsIntoList!0 (_2!2698 lt!89303) (_1!2699 lt!89304) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56782 () Bool)

(declare-fun res!47210 () Bool)

(assert (=> b!56782 (=> res!47210 e!37734)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56782 (= res!47210 (not (invariant!0 (currentBit!3154 (_2!2698 lt!89301)) (currentByte!3159 (_2!2698 lt!89301)) (size!1187 (buf!1559 (_2!2698 lt!89301))))))))

(declare-fun b!56778 () Bool)

(assert (=> b!56778 (= e!37732 (not e!37736))))

(declare-fun res!47211 () Bool)

(assert (=> b!56778 (=> res!47211 e!37736)))

(assert (=> b!56778 (= res!47211 (bvsge i!635 to!314))))

(assert (=> b!56778 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89300 () Unit!3925)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2062) Unit!3925)

(assert (=> b!56778 (= lt!89300 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!56778 (= lt!89302 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)))))

(declare-fun res!47204 () Bool)

(assert (=> start!11478 (=> (not res!47204) (not e!37732))))

(assert (=> start!11478 (= res!47204 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1187 srcBuffer!2))))))))

(assert (=> start!11478 e!37732))

(assert (=> start!11478 true))

(assert (=> start!11478 (array_inv!1090 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2062) Bool)

(assert (=> start!11478 (and (inv!12 thiss!1379) e!37735)))

(assert (= (and start!11478 res!47204) b!56777))

(assert (= (and b!56777 res!47206) b!56778))

(assert (= (and b!56778 (not res!47211)) b!56780))

(assert (= (and b!56780 (not res!47207)) b!56776))

(assert (= (and b!56776 res!47205) b!56781))

(assert (= (and b!56776 (not res!47209)) b!56775))

(assert (= (and b!56775 (not res!47208)) b!56782))

(assert (= (and b!56782 (not res!47210)) b!56774))

(assert (= (and b!56774 (not res!47203)) b!56773))

(assert (= start!11478 b!56779))

(declare-fun m!89491 () Bool)

(assert (=> b!56779 m!89491))

(declare-fun m!89493 () Bool)

(assert (=> b!56781 m!89493))

(assert (=> b!56781 m!89493))

(declare-fun m!89495 () Bool)

(assert (=> b!56781 m!89495))

(declare-fun m!89497 () Bool)

(assert (=> b!56781 m!89497))

(assert (=> b!56781 m!89497))

(declare-fun m!89499 () Bool)

(assert (=> b!56781 m!89499))

(declare-fun m!89501 () Bool)

(assert (=> b!56775 m!89501))

(declare-fun m!89503 () Bool)

(assert (=> b!56777 m!89503))

(declare-fun m!89505 () Bool)

(assert (=> b!56780 m!89505))

(declare-fun m!89507 () Bool)

(assert (=> b!56780 m!89507))

(declare-fun m!89509 () Bool)

(assert (=> b!56780 m!89509))

(assert (=> b!56780 m!89505))

(declare-fun m!89511 () Bool)

(assert (=> b!56780 m!89511))

(declare-fun m!89513 () Bool)

(assert (=> b!56780 m!89513))

(declare-fun m!89515 () Bool)

(assert (=> b!56773 m!89515))

(declare-fun m!89517 () Bool)

(assert (=> b!56778 m!89517))

(declare-fun m!89519 () Bool)

(assert (=> b!56778 m!89519))

(declare-fun m!89521 () Bool)

(assert (=> b!56778 m!89521))

(declare-fun m!89523 () Bool)

(assert (=> b!56782 m!89523))

(declare-fun m!89525 () Bool)

(assert (=> start!11478 m!89525))

(declare-fun m!89527 () Bool)

(assert (=> start!11478 m!89527))

(declare-fun m!89529 () Bool)

(assert (=> b!56776 m!89529))

(declare-fun m!89531 () Bool)

(assert (=> b!56776 m!89531))

(declare-fun m!89533 () Bool)

(assert (=> b!56776 m!89533))

(declare-fun m!89535 () Bool)

(assert (=> b!56776 m!89535))

(declare-fun m!89537 () Bool)

(assert (=> b!56776 m!89537))

(declare-fun m!89539 () Bool)

(assert (=> b!56776 m!89539))

(declare-fun m!89541 () Bool)

(assert (=> b!56776 m!89541))

(push 1)

(assert (not b!56778))

(assert (not start!11478))

(assert (not b!56777))

(assert (not b!56776))

(assert (not b!56775))

(assert (not b!56782))

(assert (not b!56781))

(assert (not b!56779))

(assert (not b!56780))

(assert (not b!56773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18104 () Bool)

(declare-fun res!47290 () Bool)

(declare-fun e!37803 () Bool)

(assert (=> d!18104 (=> (not res!47290) (not e!37803))))

(assert (=> d!18104 (= res!47290 (= (size!1187 (buf!1559 thiss!1379)) (size!1187 (buf!1559 (_2!2698 lt!89303)))))))

(assert (=> d!18104 (= (isPrefixOf!0 thiss!1379 (_2!2698 lt!89303)) e!37803)))

(declare-fun b!56867 () Bool)

(declare-fun res!47291 () Bool)

(assert (=> b!56867 (=> (not res!47291) (not e!37803))))

(assert (=> b!56867 (= res!47291 (bvsle (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)) (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303)))))))

(declare-fun b!56868 () Bool)

(declare-fun e!37804 () Bool)

(assert (=> b!56868 (= e!37803 e!37804)))

(declare-fun res!47292 () Bool)

(assert (=> b!56868 (=> res!47292 e!37804)))

(assert (=> b!56868 (= res!47292 (= (size!1187 (buf!1559 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56869 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2614 array!2614 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56869 (= e!37804 (arrayBitRangesEq!0 (buf!1559 thiss!1379) (buf!1559 (_2!2698 lt!89303)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379))))))

(assert (= (and d!18104 res!47290) b!56867))

(assert (= (and b!56867 res!47291) b!56868))

(assert (= (and b!56868 (not res!47292)) b!56869))

(assert (=> b!56867 m!89521))

(assert (=> b!56867 m!89515))

(assert (=> b!56869 m!89521))

(assert (=> b!56869 m!89521))

(declare-fun m!89655 () Bool)

(assert (=> b!56869 m!89655))

(assert (=> b!56780 d!18104))

(declare-fun d!18106 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18106 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4524 () Bool)

(assert (= bs!4524 d!18106))

(declare-fun m!89657 () Bool)

(assert (=> bs!4524 m!89657))

(assert (=> b!56780 d!18106))

(declare-fun d!18108 () Bool)

(declare-fun e!37807 () Bool)

(assert (=> d!18108 e!37807))

(declare-fun res!47295 () Bool)

(assert (=> d!18108 (=> (not res!47295) (not e!37807))))

(assert (=> d!18108 (= res!47295 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!89389 () Unit!3925)

(declare-fun choose!27 (BitStream!2062 BitStream!2062 (_ BitVec 64) (_ BitVec 64)) Unit!3925)

(assert (=> d!18108 (= lt!89389 (choose!27 thiss!1379 (_2!2698 lt!89303) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18108 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18108 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2698 lt!89303) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89389)))

(declare-fun b!56872 () Bool)

(assert (=> b!56872 (= e!37807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18108 res!47295) b!56872))

(declare-fun m!89659 () Bool)

(assert (=> d!18108 m!89659))

(assert (=> b!56872 m!89513))

(assert (=> b!56780 d!18108))

(declare-fun b!56908 () Bool)

(declare-fun e!37828 () Bool)

(declare-fun e!37830 () Bool)

(assert (=> b!56908 (= e!37828 e!37830)))

(declare-fun res!47332 () Bool)

(assert (=> b!56908 (=> (not res!47332) (not e!37830))))

(declare-fun lt!89441 () (_ BitVec 8))

(declare-datatypes ((tuple2!5194 0))(
  ( (tuple2!5195 (_1!2708 BitStream!2062) (_2!2708 Bool)) )
))
(declare-fun lt!89443 () tuple2!5194)

(declare-fun lt!89444 () tuple2!5174)

(assert (=> b!56908 (= res!47332 (and (= (_2!2708 lt!89443) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!89441)) #b00000000000000000000000000000000))) (= (_1!2708 lt!89443) (_2!2698 lt!89444))))))

(declare-datatypes ((tuple2!5196 0))(
  ( (tuple2!5197 (_1!2709 array!2614) (_2!2709 BitStream!2062)) )
))
(declare-fun lt!89435 () tuple2!5196)

(declare-fun lt!89440 () BitStream!2062)

(declare-fun readBits!0 (BitStream!2062 (_ BitVec 64)) tuple2!5196)

(assert (=> b!56908 (= lt!89435 (readBits!0 lt!89440 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2062) tuple2!5194)

(assert (=> b!56908 (= lt!89443 (readBitPure!0 lt!89440))))

(declare-fun readerFrom!0 (BitStream!2062 (_ BitVec 32) (_ BitVec 32)) BitStream!2062)

(assert (=> b!56908 (= lt!89440 (readerFrom!0 (_2!2698 lt!89444) (currentBit!3154 thiss!1379) (currentByte!3159 thiss!1379)))))

(declare-fun b!56909 () Bool)

(declare-fun res!47335 () Bool)

(assert (=> b!56909 (=> (not res!47335) (not e!37828))))

(assert (=> b!56909 (= res!47335 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89444)))))

(declare-fun b!56910 () Bool)

(declare-fun res!47331 () Bool)

(declare-fun e!37829 () Bool)

(assert (=> b!56910 (=> (not res!47331) (not e!37829))))

(declare-fun lt!89446 () tuple2!5174)

(assert (=> b!56910 (= res!47331 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89446)))))

(declare-fun b!56911 () Bool)

(assert (=> b!56911 (= e!37830 (= (bitIndex!0 (size!1187 (buf!1559 (_1!2708 lt!89443))) (currentByte!3159 (_1!2708 lt!89443)) (currentBit!3154 (_1!2708 lt!89443))) (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89444))) (currentByte!3159 (_2!2698 lt!89444)) (currentBit!3154 (_2!2698 lt!89444)))))))

(declare-fun b!56912 () Bool)

(declare-fun res!47333 () Bool)

(assert (=> b!56912 (=> (not res!47333) (not e!37828))))

(declare-fun lt!89439 () (_ BitVec 64))

(declare-fun lt!89437 () (_ BitVec 64))

(assert (=> b!56912 (= res!47333 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89444))) (currentByte!3159 (_2!2698 lt!89444)) (currentBit!3154 (_2!2698 lt!89444))) (bvadd lt!89437 lt!89439)))))

(assert (=> b!56912 (or (not (= (bvand lt!89437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89437 lt!89439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56912 (= lt!89439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56912 (= lt!89437 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)))))

(declare-fun b!56913 () Bool)

(declare-fun e!37831 () Bool)

(assert (=> b!56913 (= e!37829 e!37831)))

(declare-fun res!47337 () Bool)

(assert (=> b!56913 (=> (not res!47337) (not e!37831))))

(declare-fun lt!89445 () Bool)

(declare-fun lt!89438 () tuple2!5194)

(assert (=> b!56913 (= res!47337 (and (= (_2!2708 lt!89438) lt!89445) (= (_1!2708 lt!89438) (_2!2698 lt!89446))))))

(assert (=> b!56913 (= lt!89438 (readBitPure!0 (readerFrom!0 (_2!2698 lt!89446) (currentBit!3154 thiss!1379) (currentByte!3159 thiss!1379))))))

(declare-fun d!18110 () Bool)

(assert (=> d!18110 e!37828))

(declare-fun res!47336 () Bool)

(assert (=> d!18110 (=> (not res!47336) (not e!37828))))

(assert (=> d!18110 (= res!47336 (= (size!1187 (buf!1559 (_2!2698 lt!89444))) (size!1187 (buf!1559 thiss!1379))))))

(declare-fun lt!89442 () array!2614)

(assert (=> d!18110 (= lt!89441 (select (arr!1742 lt!89442) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18110 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1187 lt!89442)))))

(assert (=> d!18110 (= lt!89442 (array!2615 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!89436 () tuple2!5174)

(assert (=> d!18110 (= lt!89444 (tuple2!5175 (_1!2698 lt!89436) (_2!2698 lt!89436)))))

(assert (=> d!18110 (= lt!89436 lt!89446)))

(assert (=> d!18110 e!37829))

(declare-fun res!47330 () Bool)

(assert (=> d!18110 (=> (not res!47330) (not e!37829))))

(assert (=> d!18110 (= res!47330 (= (size!1187 (buf!1559 thiss!1379)) (size!1187 (buf!1559 (_2!2698 lt!89446)))))))

(declare-fun appendBit!0 (BitStream!2062 Bool) tuple2!5174)

(assert (=> d!18110 (= lt!89446 (appendBit!0 thiss!1379 lt!89445))))

(assert (=> d!18110 (= lt!89445 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18110 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18110 (= (appendBitFromByte!0 thiss!1379 (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!89444)))

(declare-fun b!56914 () Bool)

(assert (=> b!56914 (= e!37831 (= (bitIndex!0 (size!1187 (buf!1559 (_1!2708 lt!89438))) (currentByte!3159 (_1!2708 lt!89438)) (currentBit!3154 (_1!2708 lt!89438))) (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89446))) (currentByte!3159 (_2!2698 lt!89446)) (currentBit!3154 (_2!2698 lt!89446)))))))

(declare-fun b!56915 () Bool)

(declare-fun res!47334 () Bool)

(assert (=> b!56915 (=> (not res!47334) (not e!37829))))

(assert (=> b!56915 (= res!47334 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89446))) (currentByte!3159 (_2!2698 lt!89446)) (currentBit!3154 (_2!2698 lt!89446))) (bvadd (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18110 res!47330) b!56915))

(assert (= (and b!56915 res!47334) b!56910))

(assert (= (and b!56910 res!47331) b!56913))

(assert (= (and b!56913 res!47337) b!56914))

(assert (= (and d!18110 res!47336) b!56912))

(assert (= (and b!56912 res!47333) b!56909))

(assert (= (and b!56909 res!47335) b!56908))

(assert (= (and b!56908 res!47332) b!56911))

(declare-fun m!89669 () Bool)

(assert (=> b!56915 m!89669))

(assert (=> b!56915 m!89521))

(declare-fun m!89671 () Bool)

(assert (=> b!56914 m!89671))

(assert (=> b!56914 m!89669))

(declare-fun m!89673 () Bool)

(assert (=> b!56910 m!89673))

(declare-fun m!89675 () Bool)

(assert (=> b!56908 m!89675))

(declare-fun m!89677 () Bool)

(assert (=> b!56908 m!89677))

(declare-fun m!89679 () Bool)

(assert (=> b!56908 m!89679))

(declare-fun m!89681 () Bool)

(assert (=> b!56912 m!89681))

(assert (=> b!56912 m!89521))

(declare-fun m!89683 () Bool)

(assert (=> b!56909 m!89683))

(declare-fun m!89685 () Bool)

(assert (=> d!18110 m!89685))

(declare-fun m!89687 () Bool)

(assert (=> d!18110 m!89687))

(declare-fun m!89689 () Bool)

(assert (=> d!18110 m!89689))

(declare-fun m!89691 () Bool)

(assert (=> b!56913 m!89691))

(assert (=> b!56913 m!89691))

(declare-fun m!89693 () Bool)

(assert (=> b!56913 m!89693))

(declare-fun m!89695 () Bool)

(assert (=> b!56911 m!89695))

(assert (=> b!56911 m!89681))

(assert (=> b!56780 d!18110))

(declare-fun d!18124 () Bool)

(declare-fun e!37834 () Bool)

(assert (=> d!18124 e!37834))

(declare-fun res!47343 () Bool)

(assert (=> d!18124 (=> (not res!47343) (not e!37834))))

(declare-fun lt!89459 () (_ BitVec 64))

(declare-fun lt!89461 () (_ BitVec 64))

(declare-fun lt!89464 () (_ BitVec 64))

(assert (=> d!18124 (= res!47343 (= lt!89459 (bvsub lt!89464 lt!89461)))))

(assert (=> d!18124 (or (= (bvand lt!89464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89464 lt!89461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18124 (= lt!89461 (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89301)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89301))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89301)))))))

(declare-fun lt!89463 () (_ BitVec 64))

(declare-fun lt!89462 () (_ BitVec 64))

(assert (=> d!18124 (= lt!89464 (bvmul lt!89463 lt!89462))))

(assert (=> d!18124 (or (= lt!89463 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89462 (bvsdiv (bvmul lt!89463 lt!89462) lt!89463)))))

(assert (=> d!18124 (= lt!89462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18124 (= lt!89463 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89301)))))))

(assert (=> d!18124 (= lt!89459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89301))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89301)))))))

(assert (=> d!18124 (invariant!0 (currentBit!3154 (_2!2698 lt!89301)) (currentByte!3159 (_2!2698 lt!89301)) (size!1187 (buf!1559 (_2!2698 lt!89301))))))

(assert (=> d!18124 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89301))) (currentByte!3159 (_2!2698 lt!89301)) (currentBit!3154 (_2!2698 lt!89301))) lt!89459)))

(declare-fun b!56920 () Bool)

(declare-fun res!47342 () Bool)

(assert (=> b!56920 (=> (not res!47342) (not e!37834))))

(assert (=> b!56920 (= res!47342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89459))))

(declare-fun b!56921 () Bool)

(declare-fun lt!89460 () (_ BitVec 64))

(assert (=> b!56921 (= e!37834 (bvsle lt!89459 (bvmul lt!89460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56921 (or (= lt!89460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89460)))))

(assert (=> b!56921 (= lt!89460 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89301)))))))

(assert (= (and d!18124 res!47343) b!56920))

(assert (= (and b!56920 res!47342) b!56921))

(declare-fun m!89697 () Bool)

(assert (=> d!18124 m!89697))

(assert (=> d!18124 m!89523))

(assert (=> b!56775 d!18124))

(declare-fun d!18126 () Bool)

(assert (=> d!18126 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89301))))

(declare-fun lt!89467 () Unit!3925)

(declare-fun choose!30 (BitStream!2062 BitStream!2062 BitStream!2062) Unit!3925)

(assert (=> d!18126 (= lt!89467 (choose!30 thiss!1379 (_2!2698 lt!89303) (_2!2698 lt!89301)))))

(assert (=> d!18126 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89303))))

(assert (=> d!18126 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2698 lt!89303) (_2!2698 lt!89301)) lt!89467)))

(declare-fun bs!4526 () Bool)

(assert (= bs!4526 d!18126))

(assert (=> bs!4526 m!89537))

(declare-fun m!89699 () Bool)

(assert (=> bs!4526 m!89699))

(assert (=> bs!4526 m!89507))

(assert (=> b!56776 d!18126))

(declare-fun d!18128 () Bool)

(assert (=> d!18128 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89470 () Unit!3925)

(declare-fun choose!9 (BitStream!2062 array!2614 (_ BitVec 64) BitStream!2062) Unit!3925)

(assert (=> d!18128 (= lt!89470 (choose!9 thiss!1379 (buf!1559 (_2!2698 lt!89303)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2063 (buf!1559 (_2!2698 lt!89303)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379))))))

(assert (=> d!18128 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1559 (_2!2698 lt!89303)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89470)))

(declare-fun bs!4527 () Bool)

(assert (= bs!4527 d!18128))

(assert (=> bs!4527 m!89541))

(declare-fun m!89701 () Bool)

(assert (=> bs!4527 m!89701))

(assert (=> b!56776 d!18128))

(declare-fun d!18130 () Bool)

(declare-fun res!47344 () Bool)

(declare-fun e!37835 () Bool)

(assert (=> d!18130 (=> (not res!47344) (not e!37835))))

(assert (=> d!18130 (= res!47344 (= (size!1187 (buf!1559 (_2!2698 lt!89303))) (size!1187 (buf!1559 (_2!2698 lt!89301)))))))

(assert (=> d!18130 (= (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!89301)) e!37835)))

(declare-fun b!56922 () Bool)

(declare-fun res!47345 () Bool)

(assert (=> b!56922 (=> (not res!47345) (not e!37835))))

(assert (=> b!56922 (= res!47345 (bvsle (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))) (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89301))) (currentByte!3159 (_2!2698 lt!89301)) (currentBit!3154 (_2!2698 lt!89301)))))))

(declare-fun b!56923 () Bool)

(declare-fun e!37836 () Bool)

(assert (=> b!56923 (= e!37835 e!37836)))

(declare-fun res!47346 () Bool)

(assert (=> b!56923 (=> res!47346 e!37836)))

(assert (=> b!56923 (= res!47346 (= (size!1187 (buf!1559 (_2!2698 lt!89303))) #b00000000000000000000000000000000))))

(declare-fun b!56924 () Bool)

(assert (=> b!56924 (= e!37836 (arrayBitRangesEq!0 (buf!1559 (_2!2698 lt!89303)) (buf!1559 (_2!2698 lt!89301)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303)))))))

(assert (= (and d!18130 res!47344) b!56922))

(assert (= (and b!56922 res!47345) b!56923))

(assert (= (and b!56923 (not res!47346)) b!56924))

(assert (=> b!56922 m!89515))

(assert (=> b!56922 m!89501))

(assert (=> b!56924 m!89515))

(assert (=> b!56924 m!89515))

(declare-fun m!89703 () Bool)

(assert (=> b!56924 m!89703))

(assert (=> b!56776 d!18130))

(declare-fun d!18132 () Bool)

(declare-fun res!47347 () Bool)

(declare-fun e!37837 () Bool)

(assert (=> d!18132 (=> (not res!47347) (not e!37837))))

(assert (=> d!18132 (= res!47347 (= (size!1187 (buf!1559 thiss!1379)) (size!1187 (buf!1559 (_2!2698 lt!89301)))))))

(assert (=> d!18132 (= (isPrefixOf!0 thiss!1379 (_2!2698 lt!89301)) e!37837)))

(declare-fun b!56925 () Bool)

(declare-fun res!47348 () Bool)

(assert (=> b!56925 (=> (not res!47348) (not e!37837))))

(assert (=> b!56925 (= res!47348 (bvsle (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)) (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89301))) (currentByte!3159 (_2!2698 lt!89301)) (currentBit!3154 (_2!2698 lt!89301)))))))

(declare-fun b!56926 () Bool)

(declare-fun e!37838 () Bool)

(assert (=> b!56926 (= e!37837 e!37838)))

(declare-fun res!47349 () Bool)

(assert (=> b!56926 (=> res!47349 e!37838)))

(assert (=> b!56926 (= res!47349 (= (size!1187 (buf!1559 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56927 () Bool)

(assert (=> b!56927 (= e!37838 (arrayBitRangesEq!0 (buf!1559 thiss!1379) (buf!1559 (_2!2698 lt!89301)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379))))))

(assert (= (and d!18132 res!47347) b!56925))

(assert (= (and b!56925 res!47348) b!56926))

(assert (= (and b!56926 (not res!47349)) b!56927))

(assert (=> b!56925 m!89521))

(assert (=> b!56925 m!89501))

(assert (=> b!56927 m!89521))

(assert (=> b!56927 m!89521))

(declare-fun m!89705 () Bool)

(assert (=> b!56927 m!89705))

(assert (=> b!56776 d!18132))

(declare-fun b!56955 () Bool)

(declare-fun res!47374 () Bool)

(declare-fun e!37851 () Bool)

(assert (=> b!56955 (=> (not res!47374) (not e!37851))))

(declare-fun lt!89550 () tuple2!5176)

(assert (=> b!56955 (= res!47374 (isPrefixOf!0 (_1!2699 lt!89550) thiss!1379))))

(declare-fun b!56956 () Bool)

(declare-fun e!37852 () Unit!3925)

(declare-fun lt!89549 () Unit!3925)

(assert (=> b!56956 (= e!37852 lt!89549)))

(declare-fun lt!89552 () (_ BitVec 64))

(assert (=> b!56956 (= lt!89552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89547 () (_ BitVec 64))

(assert (=> b!56956 (= lt!89547 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2614 array!2614 (_ BitVec 64) (_ BitVec 64)) Unit!3925)

(assert (=> b!56956 (= lt!89549 (arrayBitRangesEqSymmetric!0 (buf!1559 thiss!1379) (buf!1559 (_2!2698 lt!89303)) lt!89552 lt!89547))))

(assert (=> b!56956 (arrayBitRangesEq!0 (buf!1559 (_2!2698 lt!89303)) (buf!1559 thiss!1379) lt!89552 lt!89547)))

(declare-fun b!56957 () Bool)

(declare-fun Unit!3939 () Unit!3925)

(assert (=> b!56957 (= e!37852 Unit!3939)))

(declare-fun lt!89536 () (_ BitVec 64))

(declare-fun lt!89554 () (_ BitVec 64))

(declare-fun b!56958 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2062 (_ BitVec 64)) BitStream!2062)

(assert (=> b!56958 (= e!37851 (= (_1!2699 lt!89550) (withMovedBitIndex!0 (_2!2699 lt!89550) (bvsub lt!89536 lt!89554))))))

(assert (=> b!56958 (or (= (bvand lt!89536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89536 lt!89554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56958 (= lt!89554 (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))))))

(assert (=> b!56958 (= lt!89536 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)))))

(declare-fun d!18134 () Bool)

(assert (=> d!18134 e!37851))

(declare-fun res!47372 () Bool)

(assert (=> d!18134 (=> (not res!47372) (not e!37851))))

(assert (=> d!18134 (= res!47372 (isPrefixOf!0 (_1!2699 lt!89550) (_2!2699 lt!89550)))))

(declare-fun lt!89545 () BitStream!2062)

(assert (=> d!18134 (= lt!89550 (tuple2!5177 lt!89545 (_2!2698 lt!89303)))))

(declare-fun lt!89538 () Unit!3925)

(declare-fun lt!89539 () Unit!3925)

(assert (=> d!18134 (= lt!89538 lt!89539)))

(assert (=> d!18134 (isPrefixOf!0 lt!89545 (_2!2698 lt!89303))))

(assert (=> d!18134 (= lt!89539 (lemmaIsPrefixTransitive!0 lt!89545 (_2!2698 lt!89303) (_2!2698 lt!89303)))))

(declare-fun lt!89541 () Unit!3925)

(declare-fun lt!89551 () Unit!3925)

(assert (=> d!18134 (= lt!89541 lt!89551)))

(assert (=> d!18134 (isPrefixOf!0 lt!89545 (_2!2698 lt!89303))))

(assert (=> d!18134 (= lt!89551 (lemmaIsPrefixTransitive!0 lt!89545 thiss!1379 (_2!2698 lt!89303)))))

(declare-fun lt!89542 () Unit!3925)

(assert (=> d!18134 (= lt!89542 e!37852)))

(declare-fun c!4095 () Bool)

(assert (=> d!18134 (= c!4095 (not (= (size!1187 (buf!1559 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!89535 () Unit!3925)

(declare-fun lt!89540 () Unit!3925)

(assert (=> d!18134 (= lt!89535 lt!89540)))

(assert (=> d!18134 (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!89303))))

(assert (=> d!18134 (= lt!89540 (lemmaIsPrefixRefl!0 (_2!2698 lt!89303)))))

(declare-fun lt!89553 () Unit!3925)

(declare-fun lt!89546 () Unit!3925)

(assert (=> d!18134 (= lt!89553 lt!89546)))

(assert (=> d!18134 (= lt!89546 (lemmaIsPrefixRefl!0 (_2!2698 lt!89303)))))

(declare-fun lt!89537 () Unit!3925)

(declare-fun lt!89544 () Unit!3925)

(assert (=> d!18134 (= lt!89537 lt!89544)))

(assert (=> d!18134 (isPrefixOf!0 lt!89545 lt!89545)))

(assert (=> d!18134 (= lt!89544 (lemmaIsPrefixRefl!0 lt!89545))))

(declare-fun lt!89548 () Unit!3925)

(declare-fun lt!89543 () Unit!3925)

(assert (=> d!18134 (= lt!89548 lt!89543)))

(assert (=> d!18134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18134 (= lt!89543 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18134 (= lt!89545 (BitStream!2063 (buf!1559 (_2!2698 lt!89303)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)))))

(assert (=> d!18134 (isPrefixOf!0 thiss!1379 (_2!2698 lt!89303))))

(assert (=> d!18134 (= (reader!0 thiss!1379 (_2!2698 lt!89303)) lt!89550)))

(declare-fun b!56959 () Bool)

(declare-fun res!47373 () Bool)

(assert (=> b!56959 (=> (not res!47373) (not e!37851))))

(assert (=> b!56959 (= res!47373 (isPrefixOf!0 (_2!2699 lt!89550) (_2!2698 lt!89303)))))

(assert (= (and d!18134 c!4095) b!56956))

(assert (= (and d!18134 (not c!4095)) b!56957))

(assert (= (and d!18134 res!47372) b!56955))

(assert (= (and b!56955 res!47374) b!56959))

(assert (= (and b!56959 res!47373) b!56958))

(assert (=> b!56956 m!89521))

(declare-fun m!89707 () Bool)

(assert (=> b!56956 m!89707))

(declare-fun m!89709 () Bool)

(assert (=> b!56956 m!89709))

(declare-fun m!89711 () Bool)

(assert (=> b!56955 m!89711))

(declare-fun m!89713 () Bool)

(assert (=> b!56959 m!89713))

(declare-fun m!89715 () Bool)

(assert (=> b!56958 m!89715))

(assert (=> b!56958 m!89515))

(assert (=> b!56958 m!89521))

(declare-fun m!89717 () Bool)

(assert (=> d!18134 m!89717))

(assert (=> d!18134 m!89519))

(declare-fun m!89719 () Bool)

(assert (=> d!18134 m!89719))

(declare-fun m!89721 () Bool)

(assert (=> d!18134 m!89721))

(declare-fun m!89723 () Bool)

(assert (=> d!18134 m!89723))

(assert (=> d!18134 m!89517))

(declare-fun m!89725 () Bool)

(assert (=> d!18134 m!89725))

(declare-fun m!89727 () Bool)

(assert (=> d!18134 m!89727))

(assert (=> d!18134 m!89507))

(declare-fun m!89729 () Bool)

(assert (=> d!18134 m!89729))

(declare-fun m!89731 () Bool)

(assert (=> d!18134 m!89731))

(assert (=> b!56776 d!18134))

(declare-fun lt!90090 () tuple2!5174)

(declare-fun lt!90087 () tuple2!5174)

(declare-fun bm!742 () Bool)

(declare-fun call!745 () tuple2!5176)

(declare-fun c!4116 () Bool)

(assert (=> bm!742 (= call!745 (reader!0 (ite c!4116 (_2!2698 lt!90090) (_2!2698 lt!89303)) (ite c!4116 (_2!2698 lt!90087) (_2!2698 lt!89303))))))

(declare-fun b!57110 () Bool)

(declare-fun e!37922 () Bool)

(declare-fun lt!90077 () (_ BitVec 64))

(assert (=> b!57110 (= e!37922 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) lt!90077))))

(declare-fun b!57111 () Bool)

(declare-fun e!37921 () tuple2!5174)

(declare-fun Unit!3940 () Unit!3925)

(assert (=> b!57111 (= e!37921 (tuple2!5175 Unit!3940 (_2!2698 lt!89303)))))

(assert (=> b!57111 (= (size!1187 (buf!1559 (_2!2698 lt!89303))) (size!1187 (buf!1559 (_2!2698 lt!89303))))))

(declare-fun lt!90066 () Unit!3925)

(declare-fun Unit!3941 () Unit!3925)

(assert (=> b!57111 (= lt!90066 Unit!3941)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2062 array!2614 array!2614 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57111 (checkByteArrayBitContent!0 (_2!2698 lt!89303) srcBuffer!2 (_1!2709 (readBits!0 (_1!2699 call!745) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57112 () Bool)

(declare-fun res!47484 () Bool)

(declare-fun e!37923 () Bool)

(assert (=> b!57112 (=> (not res!47484) (not e!37923))))

(declare-fun lt!90097 () tuple2!5174)

(assert (=> b!57112 (= res!47484 (invariant!0 (currentBit!3154 (_2!2698 lt!90097)) (currentByte!3159 (_2!2698 lt!90097)) (size!1187 (buf!1559 (_2!2698 lt!90097)))))))

(declare-fun b!57113 () Bool)

(declare-fun res!47486 () Bool)

(assert (=> b!57113 (=> (not res!47486) (not e!37923))))

(assert (=> b!57113 (= res!47486 (= (size!1187 (buf!1559 (_2!2698 lt!90097))) (size!1187 (buf!1559 (_2!2698 lt!89303)))))))

(declare-fun lt!90099 () tuple2!5176)

(declare-fun b!57114 () Bool)

(assert (=> b!57114 (= e!37923 (= (bitStreamReadBitsIntoList!0 (_2!2698 lt!90097) (_1!2699 lt!90099) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2698 lt!90097) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57114 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57114 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90069 () Unit!3925)

(declare-fun lt!90086 () Unit!3925)

(assert (=> b!57114 (= lt!90069 lt!90086)))

(assert (=> b!57114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!90097)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) lt!90077)))

(assert (=> b!57114 (= lt!90086 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2698 lt!89303) (buf!1559 (_2!2698 lt!90097)) lt!90077))))

(assert (=> b!57114 e!37922))

(declare-fun res!47485 () Bool)

(assert (=> b!57114 (=> (not res!47485) (not e!37922))))

(assert (=> b!57114 (= res!47485 (and (= (size!1187 (buf!1559 (_2!2698 lt!89303))) (size!1187 (buf!1559 (_2!2698 lt!90097)))) (bvsge lt!90077 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57114 (= lt!90077 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57114 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57114 (= lt!90099 (reader!0 (_2!2698 lt!89303) (_2!2698 lt!90097)))))

(declare-fun d!18136 () Bool)

(assert (=> d!18136 e!37923))

(declare-fun res!47489 () Bool)

(assert (=> d!18136 (=> (not res!47489) (not e!37923))))

(declare-fun lt!90072 () (_ BitVec 64))

(assert (=> d!18136 (= res!47489 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!90097))) (currentByte!3159 (_2!2698 lt!90097)) (currentBit!3154 (_2!2698 lt!90097))) (bvsub lt!90072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18136 (or (= (bvand lt!90072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90095 () (_ BitVec 64))

(assert (=> d!18136 (= lt!90072 (bvadd lt!90095 to!314))))

(assert (=> d!18136 (or (not (= (bvand lt!90095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90095 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18136 (= lt!90095 (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))))))

(assert (=> d!18136 (= lt!90097 e!37921)))

(assert (=> d!18136 (= c!4116 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!90089 () Unit!3925)

(declare-fun lt!90101 () Unit!3925)

(assert (=> d!18136 (= lt!90089 lt!90101)))

(assert (=> d!18136 (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!89303))))

(assert (=> d!18136 (= lt!90101 (lemmaIsPrefixRefl!0 (_2!2698 lt!89303)))))

(declare-fun lt!90091 () (_ BitVec 64))

(assert (=> d!18136 (= lt!90091 (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))))))

(assert (=> d!18136 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18136 (= (appendBitsMSBFirstLoop!0 (_2!2698 lt!89303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!90097)))

(declare-fun b!57115 () Bool)

(declare-fun Unit!3942 () Unit!3925)

(assert (=> b!57115 (= e!37921 (tuple2!5175 Unit!3942 (_2!2698 lt!90087)))))

(assert (=> b!57115 (= lt!90090 (appendBitFromByte!0 (_2!2698 lt!89303) (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!90103 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90103 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90075 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90070 () Unit!3925)

(assert (=> b!57115 (= lt!90070 (validateOffsetBitsIneqLemma!0 (_2!2698 lt!89303) (_2!2698 lt!90090) lt!90103 lt!90075))))

(assert (=> b!57115 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!90090)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!90090))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!90090))) (bvsub lt!90103 lt!90075))))

(declare-fun lt!90100 () Unit!3925)

(assert (=> b!57115 (= lt!90100 lt!90070)))

(declare-fun lt!90071 () tuple2!5176)

(assert (=> b!57115 (= lt!90071 (reader!0 (_2!2698 lt!89303) (_2!2698 lt!90090)))))

(declare-fun lt!90079 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90079 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90088 () Unit!3925)

(assert (=> b!57115 (= lt!90088 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2698 lt!89303) (buf!1559 (_2!2698 lt!90090)) lt!90079))))

(assert (=> b!57115 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!90090)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) lt!90079)))

(declare-fun lt!90067 () Unit!3925)

(assert (=> b!57115 (= lt!90067 lt!90088)))

(assert (=> b!57115 (= (head!425 (byteArrayBitContentToList!0 (_2!2698 lt!90090) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!425 (bitStreamReadBitsIntoList!0 (_2!2698 lt!90090) (_1!2699 lt!90071) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90073 () Unit!3925)

(declare-fun Unit!3943 () Unit!3925)

(assert (=> b!57115 (= lt!90073 Unit!3943)))

(assert (=> b!57115 (= lt!90087 (appendBitsMSBFirstLoop!0 (_2!2698 lt!90090) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!90068 () Unit!3925)

(assert (=> b!57115 (= lt!90068 (lemmaIsPrefixTransitive!0 (_2!2698 lt!89303) (_2!2698 lt!90090) (_2!2698 lt!90087)))))

(assert (=> b!57115 (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!90087))))

(declare-fun lt!90105 () Unit!3925)

(assert (=> b!57115 (= lt!90105 lt!90068)))

(assert (=> b!57115 (= (size!1187 (buf!1559 (_2!2698 lt!90087))) (size!1187 (buf!1559 (_2!2698 lt!89303))))))

(declare-fun lt!90104 () Unit!3925)

(declare-fun Unit!3944 () Unit!3925)

(assert (=> b!57115 (= lt!90104 Unit!3944)))

(assert (=> b!57115 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!90087))) (currentByte!3159 (_2!2698 lt!90087)) (currentBit!3154 (_2!2698 lt!90087))) (bvsub (bvadd (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90078 () Unit!3925)

(declare-fun Unit!3945 () Unit!3925)

(assert (=> b!57115 (= lt!90078 Unit!3945)))

(assert (=> b!57115 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!90087))) (currentByte!3159 (_2!2698 lt!90087)) (currentBit!3154 (_2!2698 lt!90087))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!90090))) (currentByte!3159 (_2!2698 lt!90090)) (currentBit!3154 (_2!2698 lt!90090))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90084 () Unit!3925)

(declare-fun Unit!3946 () Unit!3925)

(assert (=> b!57115 (= lt!90084 Unit!3946)))

(declare-fun lt!90108 () tuple2!5176)

(assert (=> b!57115 (= lt!90108 (reader!0 (_2!2698 lt!89303) (_2!2698 lt!90087)))))

(declare-fun lt!90109 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90109 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90102 () Unit!3925)

(assert (=> b!57115 (= lt!90102 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2698 lt!89303) (buf!1559 (_2!2698 lt!90087)) lt!90109))))

(assert (=> b!57115 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!90087)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303))) lt!90109)))

(declare-fun lt!90081 () Unit!3925)

(assert (=> b!57115 (= lt!90081 lt!90102)))

(declare-fun lt!90074 () tuple2!5176)

(assert (=> b!57115 (= lt!90074 call!745)))

(declare-fun lt!90076 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90076 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90080 () Unit!3925)

(assert (=> b!57115 (= lt!90080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2698 lt!90090) (buf!1559 (_2!2698 lt!90087)) lt!90076))))

(assert (=> b!57115 (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!90087)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!90090))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!90090))) lt!90076)))

(declare-fun lt!90098 () Unit!3925)

(assert (=> b!57115 (= lt!90098 lt!90080)))

(declare-fun lt!90106 () List!606)

(assert (=> b!57115 (= lt!90106 (byteArrayBitContentToList!0 (_2!2698 lt!90087) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90085 () List!606)

(assert (=> b!57115 (= lt!90085 (byteArrayBitContentToList!0 (_2!2698 lt!90087) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90093 () List!606)

(assert (=> b!57115 (= lt!90093 (bitStreamReadBitsIntoList!0 (_2!2698 lt!90087) (_1!2699 lt!90108) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90083 () List!606)

(assert (=> b!57115 (= lt!90083 (bitStreamReadBitsIntoList!0 (_2!2698 lt!90087) (_1!2699 lt!90074) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90096 () (_ BitVec 64))

(assert (=> b!57115 (= lt!90096 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90082 () Unit!3925)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2062 BitStream!2062 BitStream!2062 BitStream!2062 (_ BitVec 64) List!606) Unit!3925)

(assert (=> b!57115 (= lt!90082 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2698 lt!90087) (_2!2698 lt!90087) (_1!2699 lt!90108) (_1!2699 lt!90074) lt!90096 lt!90093))))

(declare-fun tail!274 (List!606) List!606)

(assert (=> b!57115 (= (bitStreamReadBitsIntoList!0 (_2!2698 lt!90087) (_1!2699 lt!90074) (bvsub lt!90096 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!274 lt!90093))))

(declare-fun lt!90094 () Unit!3925)

(assert (=> b!57115 (= lt!90094 lt!90082)))

(declare-fun lt!90092 () Unit!3925)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2614 array!2614 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3925)

(assert (=> b!57115 (= lt!90092 (arrayBitRangesEqImpliesEq!0 (buf!1559 (_2!2698 lt!90090)) (buf!1559 (_2!2698 lt!90087)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!90091 (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!90090))) (currentByte!3159 (_2!2698 lt!90090)) (currentBit!3154 (_2!2698 lt!90090)))))))

(declare-fun bitAt!0 (array!2614 (_ BitVec 64)) Bool)

(assert (=> b!57115 (= (bitAt!0 (buf!1559 (_2!2698 lt!90090)) lt!90091) (bitAt!0 (buf!1559 (_2!2698 lt!90087)) lt!90091))))

(declare-fun lt!90107 () Unit!3925)

(assert (=> b!57115 (= lt!90107 lt!90092)))

(declare-fun b!57116 () Bool)

(declare-fun res!47487 () Bool)

(assert (=> b!57116 (=> (not res!47487) (not e!37923))))

(assert (=> b!57116 (= res!47487 (isPrefixOf!0 (_2!2698 lt!89303) (_2!2698 lt!90097)))))

(declare-fun b!57117 () Bool)

(declare-fun res!47488 () Bool)

(assert (=> b!57117 (=> (not res!47488) (not e!37923))))

(assert (=> b!57117 (= res!47488 (= (size!1187 (buf!1559 (_2!2698 lt!89303))) (size!1187 (buf!1559 (_2!2698 lt!90097)))))))

(assert (= (and d!18136 c!4116) b!57115))

(assert (= (and d!18136 (not c!4116)) b!57111))

(assert (= (or b!57115 b!57111) bm!742))

(assert (= (and d!18136 res!47489) b!57112))

(assert (= (and b!57112 res!47484) b!57117))

(assert (= (and b!57117 res!47488) b!57116))

(assert (= (and b!57116 res!47487) b!57113))

(assert (= (and b!57113 res!47486) b!57114))

(assert (= (and b!57114 res!47485) b!57110))

(declare-fun m!90037 () Bool)

(assert (=> b!57115 m!90037))

(declare-fun m!90039 () Bool)

(assert (=> b!57115 m!90039))

(declare-fun m!90041 () Bool)

(assert (=> b!57115 m!90041))

(declare-fun m!90043 () Bool)

(assert (=> b!57115 m!90043))

(declare-fun m!90045 () Bool)

(assert (=> b!57115 m!90045))

(declare-fun m!90047 () Bool)

(assert (=> b!57115 m!90047))

(declare-fun m!90049 () Bool)

(assert (=> b!57115 m!90049))

(declare-fun m!90051 () Bool)

(assert (=> b!57115 m!90051))

(declare-fun m!90053 () Bool)

(assert (=> b!57115 m!90053))

(declare-fun m!90055 () Bool)

(assert (=> b!57115 m!90055))

(declare-fun m!90057 () Bool)

(assert (=> b!57115 m!90057))

(declare-fun m!90059 () Bool)

(assert (=> b!57115 m!90059))

(declare-fun m!90061 () Bool)

(assert (=> b!57115 m!90061))

(declare-fun m!90063 () Bool)

(assert (=> b!57115 m!90063))

(declare-fun m!90065 () Bool)

(assert (=> b!57115 m!90065))

(declare-fun m!90067 () Bool)

(assert (=> b!57115 m!90067))

(declare-fun m!90069 () Bool)

(assert (=> b!57115 m!90069))

(declare-fun m!90071 () Bool)

(assert (=> b!57115 m!90071))

(declare-fun m!90073 () Bool)

(assert (=> b!57115 m!90073))

(assert (=> b!57115 m!90063))

(declare-fun m!90075 () Bool)

(assert (=> b!57115 m!90075))

(declare-fun m!90077 () Bool)

(assert (=> b!57115 m!90077))

(declare-fun m!90079 () Bool)

(assert (=> b!57115 m!90079))

(assert (=> b!57115 m!90073))

(declare-fun m!90081 () Bool)

(assert (=> b!57115 m!90081))

(assert (=> b!57115 m!90079))

(declare-fun m!90083 () Bool)

(assert (=> b!57115 m!90083))

(declare-fun m!90085 () Bool)

(assert (=> b!57115 m!90085))

(assert (=> b!57115 m!89515))

(declare-fun m!90087 () Bool)

(assert (=> b!57115 m!90087))

(declare-fun m!90089 () Bool)

(assert (=> b!57115 m!90089))

(declare-fun m!90091 () Bool)

(assert (=> b!57115 m!90091))

(assert (=> b!57115 m!90039))

(declare-fun m!90093 () Bool)

(assert (=> b!57115 m!90093))

(declare-fun m!90095 () Bool)

(assert (=> b!57115 m!90095))

(declare-fun m!90097 () Bool)

(assert (=> b!57115 m!90097))

(declare-fun m!90099 () Bool)

(assert (=> d!18136 m!90099))

(assert (=> d!18136 m!89515))

(assert (=> d!18136 m!89725))

(assert (=> d!18136 m!89721))

(declare-fun m!90101 () Bool)

(assert (=> bm!742 m!90101))

(declare-fun m!90103 () Bool)

(assert (=> b!57114 m!90103))

(declare-fun m!90105 () Bool)

(assert (=> b!57114 m!90105))

(declare-fun m!90107 () Bool)

(assert (=> b!57114 m!90107))

(declare-fun m!90109 () Bool)

(assert (=> b!57114 m!90109))

(declare-fun m!90111 () Bool)

(assert (=> b!57114 m!90111))

(declare-fun m!90113 () Bool)

(assert (=> b!57112 m!90113))

(declare-fun m!90115 () Bool)

(assert (=> b!57111 m!90115))

(declare-fun m!90117 () Bool)

(assert (=> b!57111 m!90117))

(declare-fun m!90119 () Bool)

(assert (=> b!57110 m!90119))

(declare-fun m!90121 () Bool)

(assert (=> b!57116 m!90121))

(assert (=> b!56776 d!18136))

(declare-fun d!18204 () Bool)

(assert (=> d!18204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4542 () Bool)

(assert (= bs!4542 d!18204))

(declare-fun m!90123 () Bool)

(assert (=> bs!4542 m!90123))

(assert (=> b!56776 d!18204))

(declare-fun d!18206 () Bool)

(assert (=> d!18206 (= (head!425 (byteArrayBitContentToList!0 (_2!2698 lt!89303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!721 (byteArrayBitContentToList!0 (_2!2698 lt!89303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56781 d!18206))

(declare-fun d!18208 () Bool)

(declare-fun c!4119 () Bool)

(assert (=> d!18208 (= c!4119 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37926 () List!606)

(assert (=> d!18208 (= (byteArrayBitContentToList!0 (_2!2698 lt!89303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37926)))

(declare-fun b!57122 () Bool)

(assert (=> b!57122 (= e!37926 Nil!603)))

(declare-fun b!57123 () Bool)

(assert (=> b!57123 (= e!37926 (Cons!602 (not (= (bvand ((_ sign_extend 24) (select (arr!1742 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2698 lt!89303) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18208 c!4119) b!57122))

(assert (= (and d!18208 (not c!4119)) b!57123))

(assert (=> b!57123 m!89505))

(assert (=> b!57123 m!89689))

(declare-fun m!90125 () Bool)

(assert (=> b!57123 m!90125))

(assert (=> b!56781 d!18208))

(declare-fun d!18210 () Bool)

(assert (=> d!18210 (= (head!425 (bitStreamReadBitsIntoList!0 (_2!2698 lt!89303) (_1!2699 lt!89304) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!721 (bitStreamReadBitsIntoList!0 (_2!2698 lt!89303) (_1!2699 lt!89304) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56781 d!18210))

(declare-fun b!57135 () Bool)

(declare-fun e!37932 () Bool)

(declare-fun lt!90121 () List!606)

(declare-fun length!286 (List!606) Int)

(assert (=> b!57135 (= e!37932 (> (length!286 lt!90121) 0))))

(declare-fun lt!90120 () (_ BitVec 64))

(declare-fun b!57133 () Bool)

(declare-datatypes ((tuple2!5202 0))(
  ( (tuple2!5203 (_1!2712 List!606) (_2!2712 BitStream!2062)) )
))
(declare-fun e!37931 () tuple2!5202)

(declare-datatypes ((tuple2!5204 0))(
  ( (tuple2!5205 (_1!2713 Bool) (_2!2713 BitStream!2062)) )
))
(declare-fun lt!90119 () tuple2!5204)

(assert (=> b!57133 (= e!37931 (tuple2!5203 (Cons!602 (_1!2713 lt!90119) (bitStreamReadBitsIntoList!0 (_2!2698 lt!89303) (_2!2713 lt!90119) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!90120))) (_2!2713 lt!90119)))))

(declare-fun readBit!0 (BitStream!2062) tuple2!5204)

(assert (=> b!57133 (= lt!90119 (readBit!0 (_1!2699 lt!89304)))))

(assert (=> b!57133 (= lt!90120 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57134 () Bool)

(declare-fun isEmpty!172 (List!606) Bool)

(assert (=> b!57134 (= e!37932 (isEmpty!172 lt!90121))))

(declare-fun b!57132 () Bool)

(assert (=> b!57132 (= e!37931 (tuple2!5203 Nil!603 (_1!2699 lt!89304)))))

(declare-fun d!18212 () Bool)

(assert (=> d!18212 e!37932))

(declare-fun c!4125 () Bool)

(assert (=> d!18212 (= c!4125 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18212 (= lt!90121 (_1!2712 e!37931))))

(declare-fun c!4124 () Bool)

(assert (=> d!18212 (= c!4124 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18212 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18212 (= (bitStreamReadBitsIntoList!0 (_2!2698 lt!89303) (_1!2699 lt!89304) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90121)))

(assert (= (and d!18212 c!4124) b!57132))

(assert (= (and d!18212 (not c!4124)) b!57133))

(assert (= (and d!18212 c!4125) b!57134))

(assert (= (and d!18212 (not c!4125)) b!57135))

(declare-fun m!90127 () Bool)

(assert (=> b!57135 m!90127))

(declare-fun m!90129 () Bool)

(assert (=> b!57133 m!90129))

(declare-fun m!90131 () Bool)

(assert (=> b!57133 m!90131))

(declare-fun m!90133 () Bool)

(assert (=> b!57134 m!90133))

(assert (=> b!56781 d!18212))

(declare-fun d!18214 () Bool)

(assert (=> d!18214 (= (array_inv!1090 srcBuffer!2) (bvsge (size!1187 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11478 d!18214))

(declare-fun d!18216 () Bool)

(assert (=> d!18216 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3154 thiss!1379) (currentByte!3159 thiss!1379) (size!1187 (buf!1559 thiss!1379))))))

(declare-fun bs!4543 () Bool)

(assert (= bs!4543 d!18216))

(declare-fun m!90135 () Bool)

(assert (=> bs!4543 m!90135))

(assert (=> start!11478 d!18216))

(declare-fun d!18218 () Bool)

(assert (=> d!18218 (= (invariant!0 (currentBit!3154 (_2!2698 lt!89301)) (currentByte!3159 (_2!2698 lt!89301)) (size!1187 (buf!1559 (_2!2698 lt!89301)))) (and (bvsge (currentBit!3154 (_2!2698 lt!89301)) #b00000000000000000000000000000000) (bvslt (currentBit!3154 (_2!2698 lt!89301)) #b00000000000000000000000000001000) (bvsge (currentByte!3159 (_2!2698 lt!89301)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3159 (_2!2698 lt!89301)) (size!1187 (buf!1559 (_2!2698 lt!89301)))) (and (= (currentBit!3154 (_2!2698 lt!89301)) #b00000000000000000000000000000000) (= (currentByte!3159 (_2!2698 lt!89301)) (size!1187 (buf!1559 (_2!2698 lt!89301))))))))))

(assert (=> b!56782 d!18218))

(declare-fun d!18220 () Bool)

(assert (=> d!18220 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4544 () Bool)

(assert (= bs!4544 d!18220))

(declare-fun m!90137 () Bool)

(assert (=> bs!4544 m!90137))

(assert (=> b!56777 d!18220))

(declare-fun d!18222 () Bool)

(assert (=> d!18222 (= (array_inv!1090 (buf!1559 thiss!1379)) (bvsge (size!1187 (buf!1559 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56779 d!18222))

(declare-fun d!18224 () Bool)

(declare-fun res!47490 () Bool)

(declare-fun e!37933 () Bool)

(assert (=> d!18224 (=> (not res!47490) (not e!37933))))

(assert (=> d!18224 (= res!47490 (= (size!1187 (buf!1559 thiss!1379)) (size!1187 (buf!1559 thiss!1379))))))

(assert (=> d!18224 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37933)))

(declare-fun b!57136 () Bool)

(declare-fun res!47491 () Bool)

(assert (=> b!57136 (=> (not res!47491) (not e!37933))))

(assert (=> b!57136 (= res!47491 (bvsle (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)) (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379))))))

(declare-fun b!57137 () Bool)

(declare-fun e!37934 () Bool)

(assert (=> b!57137 (= e!37933 e!37934)))

(declare-fun res!47492 () Bool)

(assert (=> b!57137 (=> res!47492 e!37934)))

(assert (=> b!57137 (= res!47492 (= (size!1187 (buf!1559 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57138 () Bool)

(assert (=> b!57138 (= e!37934 (arrayBitRangesEq!0 (buf!1559 thiss!1379) (buf!1559 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379))))))

(assert (= (and d!18224 res!47490) b!57136))

(assert (= (and b!57136 res!47491) b!57137))

(assert (= (and b!57137 (not res!47492)) b!57138))

(assert (=> b!57136 m!89521))

(assert (=> b!57136 m!89521))

(assert (=> b!57138 m!89521))

(assert (=> b!57138 m!89521))

(declare-fun m!90139 () Bool)

(assert (=> b!57138 m!90139))

(assert (=> b!56778 d!18224))

(declare-fun d!18226 () Bool)

(assert (=> d!18226 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90124 () Unit!3925)

(declare-fun choose!11 (BitStream!2062) Unit!3925)

(assert (=> d!18226 (= lt!90124 (choose!11 thiss!1379))))

(assert (=> d!18226 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!90124)))

(declare-fun bs!4546 () Bool)

(assert (= bs!4546 d!18226))

(assert (=> bs!4546 m!89517))

(declare-fun m!90141 () Bool)

(assert (=> bs!4546 m!90141))

(assert (=> b!56778 d!18226))

(declare-fun d!18228 () Bool)

(declare-fun e!37935 () Bool)

(assert (=> d!18228 e!37935))

(declare-fun res!47494 () Bool)

(assert (=> d!18228 (=> (not res!47494) (not e!37935))))

(declare-fun lt!90125 () (_ BitVec 64))

(declare-fun lt!90130 () (_ BitVec 64))

(declare-fun lt!90127 () (_ BitVec 64))

(assert (=> d!18228 (= res!47494 (= lt!90125 (bvsub lt!90130 lt!90127)))))

(assert (=> d!18228 (or (= (bvand lt!90130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90130 lt!90127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18228 (= lt!90127 (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))) ((_ sign_extend 32) (currentByte!3159 thiss!1379)) ((_ sign_extend 32) (currentBit!3154 thiss!1379))))))

(declare-fun lt!90129 () (_ BitVec 64))

(declare-fun lt!90128 () (_ BitVec 64))

(assert (=> d!18228 (= lt!90130 (bvmul lt!90129 lt!90128))))

(assert (=> d!18228 (or (= lt!90129 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90128 (bvsdiv (bvmul lt!90129 lt!90128) lt!90129)))))

(assert (=> d!18228 (= lt!90128 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18228 (= lt!90129 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))))))

(assert (=> d!18228 (= lt!90125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3159 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3154 thiss!1379))))))

(assert (=> d!18228 (invariant!0 (currentBit!3154 thiss!1379) (currentByte!3159 thiss!1379) (size!1187 (buf!1559 thiss!1379)))))

(assert (=> d!18228 (= (bitIndex!0 (size!1187 (buf!1559 thiss!1379)) (currentByte!3159 thiss!1379) (currentBit!3154 thiss!1379)) lt!90125)))

(declare-fun b!57139 () Bool)

(declare-fun res!47493 () Bool)

(assert (=> b!57139 (=> (not res!47493) (not e!37935))))

(assert (=> b!57139 (= res!47493 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90125))))

(declare-fun b!57140 () Bool)

(declare-fun lt!90126 () (_ BitVec 64))

(assert (=> b!57140 (= e!37935 (bvsle lt!90125 (bvmul lt!90126 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57140 (or (= lt!90126 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90126 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90126)))))

(assert (=> b!57140 (= lt!90126 ((_ sign_extend 32) (size!1187 (buf!1559 thiss!1379))))))

(assert (= (and d!18228 res!47494) b!57139))

(assert (= (and b!57139 res!47493) b!57140))

(assert (=> d!18228 m!90137))

(assert (=> d!18228 m!90135))

(assert (=> b!56778 d!18228))

(declare-fun d!18230 () Bool)

(declare-fun e!37936 () Bool)

(assert (=> d!18230 e!37936))

(declare-fun res!47496 () Bool)

(assert (=> d!18230 (=> (not res!47496) (not e!37936))))

(declare-fun lt!90133 () (_ BitVec 64))

(declare-fun lt!90131 () (_ BitVec 64))

(declare-fun lt!90136 () (_ BitVec 64))

(assert (=> d!18230 (= res!47496 (= lt!90131 (bvsub lt!90136 lt!90133)))))

(assert (=> d!18230 (or (= (bvand lt!90136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90133 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90136 lt!90133) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18230 (= lt!90133 (remainingBits!0 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))) ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303)))))))

(declare-fun lt!90135 () (_ BitVec 64))

(declare-fun lt!90134 () (_ BitVec 64))

(assert (=> d!18230 (= lt!90136 (bvmul lt!90135 lt!90134))))

(assert (=> d!18230 (or (= lt!90135 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90134 (bvsdiv (bvmul lt!90135 lt!90134) lt!90135)))))

(assert (=> d!18230 (= lt!90134 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18230 (= lt!90135 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))))))

(assert (=> d!18230 (= lt!90131 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3159 (_2!2698 lt!89303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3154 (_2!2698 lt!89303)))))))

(assert (=> d!18230 (invariant!0 (currentBit!3154 (_2!2698 lt!89303)) (currentByte!3159 (_2!2698 lt!89303)) (size!1187 (buf!1559 (_2!2698 lt!89303))))))

(assert (=> d!18230 (= (bitIndex!0 (size!1187 (buf!1559 (_2!2698 lt!89303))) (currentByte!3159 (_2!2698 lt!89303)) (currentBit!3154 (_2!2698 lt!89303))) lt!90131)))

(declare-fun b!57141 () Bool)

(declare-fun res!47495 () Bool)

(assert (=> b!57141 (=> (not res!47495) (not e!37936))))

(assert (=> b!57141 (= res!47495 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90131))))

(declare-fun b!57142 () Bool)

(declare-fun lt!90132 () (_ BitVec 64))

(assert (=> b!57142 (= e!37936 (bvsle lt!90131 (bvmul lt!90132 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57142 (or (= lt!90132 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90132 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90132)))))

(assert (=> b!57142 (= lt!90132 ((_ sign_extend 32) (size!1187 (buf!1559 (_2!2698 lt!89303)))))))

(assert (= (and d!18230 res!47496) b!57141))

(assert (= (and b!57141 res!47495) b!57142))

(assert (=> d!18230 m!89657))

(declare-fun m!90143 () Bool)

(assert (=> d!18230 m!90143))

(assert (=> b!56773 d!18230))

(push 1)

(assert (not d!18216))

(assert (not b!56959))

(assert (not b!57123))

(assert (not b!56915))

(assert (not b!56912))

(assert (not d!18220))

(assert (not d!18128))

(assert (not d!18110))

(assert (not b!56867))

(assert (not b!57134))

(assert (not b!57138))

(assert (not b!56910))

(assert (not b!57110))

(assert (not b!56914))

(assert (not b!56872))

(assert (not b!56869))

(assert (not b!57112))

(assert (not d!18204))

(assert (not d!18228))

(assert (not b!56955))

(assert (not bm!742))

(assert (not b!57136))

(assert (not b!56913))

(assert (not d!18136))

(assert (not b!56927))

(assert (not d!18134))

(assert (not b!56911))

(assert (not d!18124))

(assert (not b!57115))

(assert (not d!18226))

(assert (not b!57114))

(assert (not b!56925))

(assert (not b!56922))

(assert (not d!18106))

(assert (not b!56956))

(assert (not b!56958))

(assert (not d!18126))

(assert (not b!57116))

(assert (not b!56908))

(assert (not b!57133))

(assert (not b!56909))

(assert (not b!57111))

(assert (not d!18230))

(assert (not b!57135))

(assert (not b!56924))

(assert (not d!18108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

