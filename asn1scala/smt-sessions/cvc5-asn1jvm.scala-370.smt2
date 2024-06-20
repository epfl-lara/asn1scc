; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8548 () Bool)

(assert start!8548)

(declare-fun b!42644 () Bool)

(declare-fun e!28497 () Bool)

(declare-fun e!28495 () Bool)

(assert (=> b!42644 (= e!28497 (not e!28495))))

(declare-fun res!36280 () Bool)

(assert (=> b!42644 (=> res!36280 e!28495)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!42644 (= res!36280 (bvsge i!635 to!314))))

(declare-datatypes ((array!2192 0))(
  ( (array!2193 (arr!1490 (Array (_ BitVec 32) (_ BitVec 8))) (size!991 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1726 0))(
  ( (BitStream!1727 (buf!1322 array!2192) (currentByte!2786 (_ BitVec 32)) (currentBit!2781 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1726)

(declare-fun isPrefixOf!0 (BitStream!1726 BitStream!1726) Bool)

(assert (=> b!42644 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3036 0))(
  ( (Unit!3037) )
))
(declare-fun lt!64053 () Unit!3036)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1726) Unit!3036)

(assert (=> b!42644 (= lt!64053 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64048 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42644 (= lt!64048 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2192)

(declare-datatypes ((tuple2!4186 0))(
  ( (tuple2!4187 (_1!2186 Unit!3036) (_2!2186 BitStream!1726)) )
))
(declare-fun lt!64049 () tuple2!4186)

(declare-fun b!42645 () Bool)

(declare-fun e!28496 () Bool)

(declare-datatypes ((tuple2!4188 0))(
  ( (tuple2!4189 (_1!2187 BitStream!1726) (_2!2187 BitStream!1726)) )
))
(declare-fun lt!64051 () tuple2!4188)

(declare-datatypes ((List!504 0))(
  ( (Nil!501) (Cons!500 (h!619 Bool) (t!1254 List!504)) )
))
(declare-fun head!323 (List!504) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1726 array!2192 (_ BitVec 64) (_ BitVec 64)) List!504)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1726 BitStream!1726 (_ BitVec 64)) List!504)

(assert (=> b!42645 (= e!28496 (= (head!323 (byteArrayBitContentToList!0 (_2!2186 lt!64049) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!323 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64049) (_1!2187 lt!64051) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!42646 () Bool)

(declare-fun res!36278 () Bool)

(assert (=> b!42646 (=> (not res!36278) (not e!28497))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42646 (= res!36278 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42647 () Bool)

(declare-fun e!28498 () Bool)

(declare-fun array_inv!916 (array!2192) Bool)

(assert (=> b!42647 (= e!28498 (array_inv!916 (buf!1322 thiss!1379)))))

(declare-fun b!42649 () Bool)

(declare-fun e!28492 () Bool)

(declare-fun lt!64047 () tuple2!4186)

(assert (=> b!42649 (= e!28492 (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64047)))))

(assert (=> b!42649 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64047))))

(declare-fun lt!64054 () Unit!3036)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1726 BitStream!1726 BitStream!1726) Unit!3036)

(assert (=> b!42649 (= lt!64054 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2186 lt!64049) (_2!2186 lt!64047)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1726 array!2192 (_ BitVec 64) (_ BitVec 64)) tuple2!4186)

(assert (=> b!42649 (= lt!64047 (appendBitsMSBFirstLoop!0 (_2!2186 lt!64049) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!42649 e!28496))

(declare-fun res!36281 () Bool)

(assert (=> b!42649 (=> (not res!36281) (not e!28496))))

(assert (=> b!42649 (= res!36281 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64052 () Unit!3036)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1726 array!2192 (_ BitVec 64)) Unit!3036)

(assert (=> b!42649 (= lt!64052 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1322 (_2!2186 lt!64049)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1726 BitStream!1726) tuple2!4188)

(assert (=> b!42649 (= lt!64051 (reader!0 thiss!1379 (_2!2186 lt!64049)))))

(declare-fun b!42648 () Bool)

(assert (=> b!42648 (= e!28495 e!28492)))

(declare-fun res!36279 () Bool)

(assert (=> b!42648 (=> res!36279 e!28492)))

(assert (=> b!42648 (= res!36279 (not (isPrefixOf!0 thiss!1379 (_2!2186 lt!64049))))))

(assert (=> b!42648 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64050 () Unit!3036)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1726 BitStream!1726 (_ BitVec 64) (_ BitVec 64)) Unit!3036)

(assert (=> b!42648 (= lt!64050 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2186 lt!64049) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1726 (_ BitVec 8) (_ BitVec 32)) tuple2!4186)

(assert (=> b!42648 (= lt!64049 (appendBitFromByte!0 thiss!1379 (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!36282 () Bool)

(assert (=> start!8548 (=> (not res!36282) (not e!28497))))

(assert (=> start!8548 (= res!36282 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!991 srcBuffer!2))))))))

(assert (=> start!8548 e!28497))

(assert (=> start!8548 true))

(assert (=> start!8548 (array_inv!916 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1726) Bool)

(assert (=> start!8548 (and (inv!12 thiss!1379) e!28498)))

(assert (= (and start!8548 res!36282) b!42646))

(assert (= (and b!42646 res!36278) b!42644))

(assert (= (and b!42644 (not res!36280)) b!42648))

(assert (= (and b!42648 (not res!36279)) b!42649))

(assert (= (and b!42649 res!36281) b!42645))

(assert (= start!8548 b!42647))

(declare-fun m!64651 () Bool)

(assert (=> b!42647 m!64651))

(declare-fun m!64653 () Bool)

(assert (=> b!42649 m!64653))

(declare-fun m!64655 () Bool)

(assert (=> b!42649 m!64655))

(declare-fun m!64657 () Bool)

(assert (=> b!42649 m!64657))

(declare-fun m!64659 () Bool)

(assert (=> b!42649 m!64659))

(declare-fun m!64661 () Bool)

(assert (=> b!42649 m!64661))

(declare-fun m!64663 () Bool)

(assert (=> b!42649 m!64663))

(declare-fun m!64665 () Bool)

(assert (=> b!42649 m!64665))

(declare-fun m!64667 () Bool)

(assert (=> b!42648 m!64667))

(declare-fun m!64669 () Bool)

(assert (=> b!42648 m!64669))

(declare-fun m!64671 () Bool)

(assert (=> b!42648 m!64671))

(assert (=> b!42648 m!64667))

(declare-fun m!64673 () Bool)

(assert (=> b!42648 m!64673))

(declare-fun m!64675 () Bool)

(assert (=> b!42648 m!64675))

(declare-fun m!64677 () Bool)

(assert (=> b!42644 m!64677))

(declare-fun m!64679 () Bool)

(assert (=> b!42644 m!64679))

(declare-fun m!64681 () Bool)

(assert (=> b!42644 m!64681))

(declare-fun m!64683 () Bool)

(assert (=> start!8548 m!64683))

(declare-fun m!64685 () Bool)

(assert (=> start!8548 m!64685))

(declare-fun m!64687 () Bool)

(assert (=> b!42646 m!64687))

(declare-fun m!64689 () Bool)

(assert (=> b!42645 m!64689))

(assert (=> b!42645 m!64689))

(declare-fun m!64691 () Bool)

(assert (=> b!42645 m!64691))

(declare-fun m!64693 () Bool)

(assert (=> b!42645 m!64693))

(assert (=> b!42645 m!64693))

(declare-fun m!64695 () Bool)

(assert (=> b!42645 m!64695))

(push 1)

(assert (not b!42645))

(assert (not b!42649))

(assert (not start!8548))

(assert (not b!42646))

(assert (not b!42648))

(assert (not b!42647))

(assert (not b!42644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12354 () Bool)

(declare-fun res!36336 () Bool)

(declare-fun e!28562 () Bool)

(assert (=> d!12354 (=> (not res!36336) (not e!28562))))

(assert (=> d!12354 (= res!36336 (= (size!991 (buf!1322 thiss!1379)) (size!991 (buf!1322 (_2!2186 lt!64049)))))))

(assert (=> d!12354 (= (isPrefixOf!0 thiss!1379 (_2!2186 lt!64049)) e!28562)))

(declare-fun b!42721 () Bool)

(declare-fun res!36334 () Bool)

(assert (=> b!42721 (=> (not res!36334) (not e!28562))))

(assert (=> b!42721 (= res!36334 (bvsle (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)) (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049)))))))

(declare-fun b!42722 () Bool)

(declare-fun e!28561 () Bool)

(assert (=> b!42722 (= e!28562 e!28561)))

(declare-fun res!36335 () Bool)

(assert (=> b!42722 (=> res!36335 e!28561)))

(assert (=> b!42722 (= res!36335 (= (size!991 (buf!1322 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42723 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2192 array!2192 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42723 (= e!28561 (arrayBitRangesEq!0 (buf!1322 thiss!1379) (buf!1322 (_2!2186 lt!64049)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379))))))

(assert (= (and d!12354 res!36336) b!42721))

(assert (= (and b!42721 res!36334) b!42722))

(assert (= (and b!42722 (not res!36335)) b!42723))

(assert (=> b!42721 m!64681))

(declare-fun m!64801 () Bool)

(assert (=> b!42721 m!64801))

(assert (=> b!42723 m!64681))

(assert (=> b!42723 m!64681))

(declare-fun m!64803 () Bool)

(assert (=> b!42723 m!64803))

(assert (=> b!42648 d!12354))

(declare-fun d!12356 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12356 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3336 () Bool)

(assert (= bs!3336 d!12356))

(declare-fun m!64813 () Bool)

(assert (=> bs!3336 m!64813))

(assert (=> b!42648 d!12356))

(declare-fun d!12360 () Bool)

(declare-fun e!28569 () Bool)

(assert (=> d!12360 e!28569))

(declare-fun res!36342 () Bool)

(assert (=> d!12360 (=> (not res!36342) (not e!28569))))

(assert (=> d!12360 (= res!36342 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!64135 () Unit!3036)

(declare-fun choose!27 (BitStream!1726 BitStream!1726 (_ BitVec 64) (_ BitVec 64)) Unit!3036)

(assert (=> d!12360 (= lt!64135 (choose!27 thiss!1379 (_2!2186 lt!64049) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12360 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12360 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2186 lt!64049) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64135)))

(declare-fun b!42733 () Bool)

(assert (=> b!42733 (= e!28569 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12360 res!36342) b!42733))

(declare-fun m!64821 () Bool)

(assert (=> d!12360 m!64821))

(assert (=> b!42733 m!64675))

(assert (=> b!42648 d!12360))

(declare-fun b!42771 () Bool)

(declare-fun e!28589 () Bool)

(declare-datatypes ((tuple2!4206 0))(
  ( (tuple2!4207 (_1!2196 BitStream!1726) (_2!2196 Bool)) )
))
(declare-fun lt!64190 () tuple2!4206)

(declare-fun lt!64193 () tuple2!4186)

(assert (=> b!42771 (= e!28589 (= (bitIndex!0 (size!991 (buf!1322 (_1!2196 lt!64190))) (currentByte!2786 (_1!2196 lt!64190)) (currentBit!2781 (_1!2196 lt!64190))) (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64193))) (currentByte!2786 (_2!2186 lt!64193)) (currentBit!2781 (_2!2186 lt!64193)))))))

(declare-fun b!42772 () Bool)

(declare-fun res!36381 () Bool)

(declare-fun e!28591 () Bool)

(assert (=> b!42772 (=> (not res!36381) (not e!28591))))

(declare-fun lt!64195 () tuple2!4186)

(assert (=> b!42772 (= res!36381 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64195)))))

(declare-fun b!42773 () Bool)

(declare-fun res!36379 () Bool)

(assert (=> b!42773 (=> (not res!36379) (not e!28591))))

(assert (=> b!42773 (= res!36379 (= (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64195))) (currentByte!2786 (_2!2186 lt!64195)) (currentBit!2781 (_2!2186 lt!64195))) (bvadd (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!42774 () Bool)

(declare-fun res!36383 () Bool)

(declare-fun e!28590 () Bool)

(assert (=> b!42774 (=> (not res!36383) (not e!28590))))

(declare-fun lt!64188 () (_ BitVec 64))

(declare-fun lt!64191 () (_ BitVec 64))

(assert (=> b!42774 (= res!36383 (= (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64193))) (currentByte!2786 (_2!2186 lt!64193)) (currentBit!2781 (_2!2186 lt!64193))) (bvadd lt!64188 lt!64191)))))

(assert (=> b!42774 (or (not (= (bvand lt!64188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64191 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!64188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!64188 lt!64191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42774 (= lt!64191 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!42774 (= lt!64188 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)))))

(declare-fun b!42775 () Bool)

(declare-fun e!28592 () Bool)

(assert (=> b!42775 (= e!28591 e!28592)))

(declare-fun res!36382 () Bool)

(assert (=> b!42775 (=> (not res!36382) (not e!28592))))

(declare-fun lt!64196 () tuple2!4206)

(declare-fun lt!64198 () Bool)

(assert (=> b!42775 (= res!36382 (and (= (_2!2196 lt!64196) lt!64198) (= (_1!2196 lt!64196) (_2!2186 lt!64195))))))

(declare-fun readBitPure!0 (BitStream!1726) tuple2!4206)

(declare-fun readerFrom!0 (BitStream!1726 (_ BitVec 32) (_ BitVec 32)) BitStream!1726)

(assert (=> b!42775 (= lt!64196 (readBitPure!0 (readerFrom!0 (_2!2186 lt!64195) (currentBit!2781 thiss!1379) (currentByte!2786 thiss!1379))))))

(declare-fun b!42777 () Bool)

(declare-fun res!36385 () Bool)

(assert (=> b!42777 (=> (not res!36385) (not e!28590))))

(assert (=> b!42777 (= res!36385 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64193)))))

(declare-fun b!42778 () Bool)

(assert (=> b!42778 (= e!28592 (= (bitIndex!0 (size!991 (buf!1322 (_1!2196 lt!64196))) (currentByte!2786 (_1!2196 lt!64196)) (currentBit!2781 (_1!2196 lt!64196))) (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64195))) (currentByte!2786 (_2!2186 lt!64195)) (currentBit!2781 (_2!2186 lt!64195)))))))

(declare-fun d!12372 () Bool)

(assert (=> d!12372 e!28590))

(declare-fun res!36380 () Bool)

(assert (=> d!12372 (=> (not res!36380) (not e!28590))))

(assert (=> d!12372 (= res!36380 (= (size!991 (buf!1322 (_2!2186 lt!64193))) (size!991 (buf!1322 thiss!1379))))))

(declare-fun lt!64197 () (_ BitVec 8))

(declare-fun lt!64192 () array!2192)

(assert (=> d!12372 (= lt!64197 (select (arr!1490 lt!64192) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12372 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!991 lt!64192)))))

(assert (=> d!12372 (= lt!64192 (array!2193 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!64187 () tuple2!4186)

(assert (=> d!12372 (= lt!64193 (tuple2!4187 (_1!2186 lt!64187) (_2!2186 lt!64187)))))

(assert (=> d!12372 (= lt!64187 lt!64195)))

(assert (=> d!12372 e!28591))

(declare-fun res!36384 () Bool)

(assert (=> d!12372 (=> (not res!36384) (not e!28591))))

(assert (=> d!12372 (= res!36384 (= (size!991 (buf!1322 thiss!1379)) (size!991 (buf!1322 (_2!2186 lt!64195)))))))

(declare-fun appendBit!0 (BitStream!1726 Bool) tuple2!4186)

(assert (=> d!12372 (= lt!64195 (appendBit!0 thiss!1379 lt!64198))))

(assert (=> d!12372 (= lt!64198 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12372 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12372 (= (appendBitFromByte!0 thiss!1379 (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!64193)))

(declare-fun b!42776 () Bool)

(assert (=> b!42776 (= e!28590 e!28589)))

(declare-fun res!36378 () Bool)

(assert (=> b!42776 (=> (not res!36378) (not e!28589))))

(assert (=> b!42776 (= res!36378 (and (= (_2!2196 lt!64190) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!64197)) #b00000000000000000000000000000000))) (= (_1!2196 lt!64190) (_2!2186 lt!64193))))))

(declare-datatypes ((tuple2!4208 0))(
  ( (tuple2!4209 (_1!2197 array!2192) (_2!2197 BitStream!1726)) )
))
(declare-fun lt!64189 () tuple2!4208)

(declare-fun lt!64194 () BitStream!1726)

(declare-fun readBits!0 (BitStream!1726 (_ BitVec 64)) tuple2!4208)

(assert (=> b!42776 (= lt!64189 (readBits!0 lt!64194 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!42776 (= lt!64190 (readBitPure!0 lt!64194))))

(assert (=> b!42776 (= lt!64194 (readerFrom!0 (_2!2186 lt!64193) (currentBit!2781 thiss!1379) (currentByte!2786 thiss!1379)))))

(assert (= (and d!12372 res!36384) b!42773))

(assert (= (and b!42773 res!36379) b!42772))

(assert (= (and b!42772 res!36381) b!42775))

(assert (= (and b!42775 res!36382) b!42778))

(assert (= (and d!12372 res!36380) b!42774))

(assert (= (and b!42774 res!36383) b!42777))

(assert (= (and b!42777 res!36385) b!42776))

(assert (= (and b!42776 res!36378) b!42771))

(declare-fun m!64825 () Bool)

(assert (=> d!12372 m!64825))

(declare-fun m!64827 () Bool)

(assert (=> d!12372 m!64827))

(declare-fun m!64829 () Bool)

(assert (=> d!12372 m!64829))

(declare-fun m!64831 () Bool)

(assert (=> b!42773 m!64831))

(assert (=> b!42773 m!64681))

(declare-fun m!64833 () Bool)

(assert (=> b!42777 m!64833))

(declare-fun m!64835 () Bool)

(assert (=> b!42774 m!64835))

(assert (=> b!42774 m!64681))

(declare-fun m!64837 () Bool)

(assert (=> b!42772 m!64837))

(declare-fun m!64839 () Bool)

(assert (=> b!42775 m!64839))

(assert (=> b!42775 m!64839))

(declare-fun m!64841 () Bool)

(assert (=> b!42775 m!64841))

(declare-fun m!64843 () Bool)

(assert (=> b!42778 m!64843))

(assert (=> b!42778 m!64831))

(declare-fun m!64845 () Bool)

(assert (=> b!42776 m!64845))

(declare-fun m!64847 () Bool)

(assert (=> b!42776 m!64847))

(declare-fun m!64849 () Bool)

(assert (=> b!42776 m!64849))

(declare-fun m!64851 () Bool)

(assert (=> b!42771 m!64851))

(assert (=> b!42771 m!64835))

(assert (=> b!42648 d!12372))

(declare-fun b!42821 () Bool)

(declare-fun res!36418 () Bool)

(declare-fun e!28613 () Bool)

(assert (=> b!42821 (=> (not res!36418) (not e!28613))))

(declare-fun lt!64368 () tuple2!4186)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42821 (= res!36418 (invariant!0 (currentBit!2781 (_2!2186 lt!64368)) (currentByte!2786 (_2!2186 lt!64368)) (size!991 (buf!1322 (_2!2186 lt!64368)))))))

(declare-fun b!42822 () Bool)

(declare-fun res!36423 () Bool)

(assert (=> b!42822 (=> (not res!36423) (not e!28613))))

(assert (=> b!42822 (= res!36423 (= (size!991 (buf!1322 (_2!2186 lt!64368))) (size!991 (buf!1322 (_2!2186 lt!64049)))))))

(declare-fun bm!490 () Bool)

(declare-fun call!493 () tuple2!4188)

(declare-fun c!2793 () Bool)

(declare-fun lt!64390 () tuple2!4186)

(assert (=> bm!490 (= call!493 (reader!0 (_2!2186 lt!64049) (ite c!2793 (_2!2186 lt!64390) (_2!2186 lt!64049))))))

(declare-fun b!42823 () Bool)

(declare-fun e!28612 () tuple2!4186)

(declare-fun Unit!3049 () Unit!3036)

(assert (=> b!42823 (= e!28612 (tuple2!4187 Unit!3049 (_2!2186 lt!64390)))))

(declare-fun lt!64391 () tuple2!4186)

(assert (=> b!42823 (= lt!64391 (appendBitFromByte!0 (_2!2186 lt!64049) (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!64375 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64375 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64387 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64387 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64384 () Unit!3036)

(assert (=> b!42823 (= lt!64384 (validateOffsetBitsIneqLemma!0 (_2!2186 lt!64049) (_2!2186 lt!64391) lt!64375 lt!64387))))

(assert (=> b!42823 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64391)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64391))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64391))) (bvsub lt!64375 lt!64387))))

(declare-fun lt!64406 () Unit!3036)

(assert (=> b!42823 (= lt!64406 lt!64384)))

(declare-fun lt!64379 () tuple2!4188)

(assert (=> b!42823 (= lt!64379 (reader!0 (_2!2186 lt!64049) (_2!2186 lt!64391)))))

(declare-fun lt!64380 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64380 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64376 () Unit!3036)

(assert (=> b!42823 (= lt!64376 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2186 lt!64049) (buf!1322 (_2!2186 lt!64391)) lt!64380))))

(assert (=> b!42823 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64391)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) lt!64380)))

(declare-fun lt!64408 () Unit!3036)

(assert (=> b!42823 (= lt!64408 lt!64376)))

(assert (=> b!42823 (= (head!323 (byteArrayBitContentToList!0 (_2!2186 lt!64391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!323 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64391) (_1!2187 lt!64379) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64396 () Unit!3036)

(declare-fun Unit!3051 () Unit!3036)

(assert (=> b!42823 (= lt!64396 Unit!3051)))

(assert (=> b!42823 (= lt!64390 (appendBitsMSBFirstLoop!0 (_2!2186 lt!64391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!64366 () Unit!3036)

(assert (=> b!42823 (= lt!64366 (lemmaIsPrefixTransitive!0 (_2!2186 lt!64049) (_2!2186 lt!64391) (_2!2186 lt!64390)))))

(assert (=> b!42823 (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64390))))

(declare-fun lt!64370 () Unit!3036)

(assert (=> b!42823 (= lt!64370 lt!64366)))

(assert (=> b!42823 (= (size!991 (buf!1322 (_2!2186 lt!64390))) (size!991 (buf!1322 (_2!2186 lt!64049))))))

(declare-fun lt!64407 () Unit!3036)

(declare-fun Unit!3052 () Unit!3036)

(assert (=> b!42823 (= lt!64407 Unit!3052)))

(assert (=> b!42823 (= (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64390))) (currentByte!2786 (_2!2186 lt!64390)) (currentBit!2781 (_2!2186 lt!64390))) (bvsub (bvadd (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64369 () Unit!3036)

(declare-fun Unit!3053 () Unit!3036)

(assert (=> b!42823 (= lt!64369 Unit!3053)))

(assert (=> b!42823 (= (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64390))) (currentByte!2786 (_2!2186 lt!64390)) (currentBit!2781 (_2!2186 lt!64390))) (bvsub (bvsub (bvadd (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64391))) (currentByte!2786 (_2!2186 lt!64391)) (currentBit!2781 (_2!2186 lt!64391))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64386 () Unit!3036)

(declare-fun Unit!3054 () Unit!3036)

(assert (=> b!42823 (= lt!64386 Unit!3054)))

(declare-fun lt!64400 () tuple2!4188)

(assert (=> b!42823 (= lt!64400 call!493)))

(declare-fun lt!64378 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64378 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64402 () Unit!3036)

(assert (=> b!42823 (= lt!64402 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2186 lt!64049) (buf!1322 (_2!2186 lt!64390)) lt!64378))))

(assert (=> b!42823 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64390)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) lt!64378)))

(declare-fun lt!64388 () Unit!3036)

(assert (=> b!42823 (= lt!64388 lt!64402)))

(declare-fun lt!64398 () tuple2!4188)

(assert (=> b!42823 (= lt!64398 (reader!0 (_2!2186 lt!64391) (_2!2186 lt!64390)))))

(declare-fun lt!64394 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64394 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64393 () Unit!3036)

(assert (=> b!42823 (= lt!64393 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2186 lt!64391) (buf!1322 (_2!2186 lt!64390)) lt!64394))))

(assert (=> b!42823 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64390)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64391))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64391))) lt!64394)))

(declare-fun lt!64381 () Unit!3036)

(assert (=> b!42823 (= lt!64381 lt!64393)))

(declare-fun lt!64392 () List!504)

(assert (=> b!42823 (= lt!64392 (byteArrayBitContentToList!0 (_2!2186 lt!64390) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!64373 () List!504)

(assert (=> b!42823 (= lt!64373 (byteArrayBitContentToList!0 (_2!2186 lt!64390) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64372 () List!504)

(assert (=> b!42823 (= lt!64372 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64390) (_1!2187 lt!64400) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!64385 () List!504)

(assert (=> b!42823 (= lt!64385 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64390) (_1!2187 lt!64398) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!64365 () (_ BitVec 64))

(assert (=> b!42823 (= lt!64365 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!64405 () Unit!3036)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1726 BitStream!1726 BitStream!1726 BitStream!1726 (_ BitVec 64) List!504) Unit!3036)

(assert (=> b!42823 (= lt!64405 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2186 lt!64390) (_2!2186 lt!64390) (_1!2187 lt!64400) (_1!2187 lt!64398) lt!64365 lt!64372))))

(declare-fun tail!204 (List!504) List!504)

(assert (=> b!42823 (= (bitStreamReadBitsIntoList!0 (_2!2186 lt!64390) (_1!2187 lt!64398) (bvsub lt!64365 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!204 lt!64372))))

(declare-fun lt!64377 () Unit!3036)

(assert (=> b!42823 (= lt!64377 lt!64405)))

(declare-fun lt!64399 () (_ BitVec 64))

(declare-fun lt!64389 () Unit!3036)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2192 array!2192 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3036)

(assert (=> b!42823 (= lt!64389 (arrayBitRangesEqImpliesEq!0 (buf!1322 (_2!2186 lt!64391)) (buf!1322 (_2!2186 lt!64390)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!64399 (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64391))) (currentByte!2786 (_2!2186 lt!64391)) (currentBit!2781 (_2!2186 lt!64391)))))))

(declare-fun bitAt!0 (array!2192 (_ BitVec 64)) Bool)

(assert (=> b!42823 (= (bitAt!0 (buf!1322 (_2!2186 lt!64391)) lt!64399) (bitAt!0 (buf!1322 (_2!2186 lt!64390)) lt!64399))))

(declare-fun lt!64382 () Unit!3036)

(assert (=> b!42823 (= lt!64382 lt!64389)))

(declare-fun d!12378 () Bool)

(assert (=> d!12378 e!28613))

(declare-fun res!36421 () Bool)

(assert (=> d!12378 (=> (not res!36421) (not e!28613))))

(declare-fun lt!64401 () (_ BitVec 64))

(assert (=> d!12378 (= res!36421 (= (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64368))) (currentByte!2786 (_2!2186 lt!64368)) (currentBit!2781 (_2!2186 lt!64368))) (bvsub lt!64401 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12378 (or (= (bvand lt!64401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64401 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!64395 () (_ BitVec 64))

(assert (=> d!12378 (= lt!64401 (bvadd lt!64395 to!314))))

(assert (=> d!12378 (or (not (= (bvand lt!64395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!64395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!64395 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12378 (= lt!64395 (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049))))))

(assert (=> d!12378 (= lt!64368 e!28612)))

(assert (=> d!12378 (= c!2793 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!64383 () Unit!3036)

(declare-fun lt!64404 () Unit!3036)

(assert (=> d!12378 (= lt!64383 lt!64404)))

(assert (=> d!12378 (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64049))))

(assert (=> d!12378 (= lt!64404 (lemmaIsPrefixRefl!0 (_2!2186 lt!64049)))))

(assert (=> d!12378 (= lt!64399 (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049))))))

(assert (=> d!12378 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12378 (= (appendBitsMSBFirstLoop!0 (_2!2186 lt!64049) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!64368)))

(declare-fun b!42824 () Bool)

(declare-fun res!36419 () Bool)

(assert (=> b!42824 (=> (not res!36419) (not e!28613))))

(assert (=> b!42824 (= res!36419 (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64368)))))

(declare-fun b!42825 () Bool)

(declare-fun res!36420 () Bool)

(assert (=> b!42825 (=> (not res!36420) (not e!28613))))

(assert (=> b!42825 (= res!36420 (= (size!991 (buf!1322 (_2!2186 lt!64049))) (size!991 (buf!1322 (_2!2186 lt!64368)))))))

(declare-fun b!42826 () Bool)

(declare-fun e!28611 () Bool)

(declare-fun lt!64403 () (_ BitVec 64))

(assert (=> b!42826 (= e!28611 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) lt!64403))))

(declare-fun b!42827 () Bool)

(declare-fun lt!64367 () tuple2!4188)

(assert (=> b!42827 (= e!28613 (= (bitStreamReadBitsIntoList!0 (_2!2186 lt!64368) (_1!2187 lt!64367) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2186 lt!64368) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!42827 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42827 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!64397 () Unit!3036)

(declare-fun lt!64371 () Unit!3036)

(assert (=> b!42827 (= lt!64397 lt!64371)))

(assert (=> b!42827 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64368)))) ((_ sign_extend 32) (currentByte!2786 (_2!2186 lt!64049))) ((_ sign_extend 32) (currentBit!2781 (_2!2186 lt!64049))) lt!64403)))

(assert (=> b!42827 (= lt!64371 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2186 lt!64049) (buf!1322 (_2!2186 lt!64368)) lt!64403))))

(assert (=> b!42827 e!28611))

(declare-fun res!36422 () Bool)

(assert (=> b!42827 (=> (not res!36422) (not e!28611))))

(assert (=> b!42827 (= res!36422 (and (= (size!991 (buf!1322 (_2!2186 lt!64049))) (size!991 (buf!1322 (_2!2186 lt!64368)))) (bvsge lt!64403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42827 (= lt!64403 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!42827 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42827 (= lt!64367 (reader!0 (_2!2186 lt!64049) (_2!2186 lt!64368)))))

(declare-fun b!42828 () Bool)

(declare-fun Unit!3055 () Unit!3036)

(assert (=> b!42828 (= e!28612 (tuple2!4187 Unit!3055 (_2!2186 lt!64049)))))

(assert (=> b!42828 (= (size!991 (buf!1322 (_2!2186 lt!64049))) (size!991 (buf!1322 (_2!2186 lt!64049))))))

(declare-fun lt!64374 () Unit!3036)

(declare-fun Unit!3056 () Unit!3036)

(assert (=> b!42828 (= lt!64374 Unit!3056)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1726 array!2192 array!2192 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42828 (checkByteArrayBitContent!0 (_2!2186 lt!64049) srcBuffer!2 (_1!2197 (readBits!0 (_1!2187 call!493) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!12378 c!2793) b!42823))

(assert (= (and d!12378 (not c!2793)) b!42828))

(assert (= (or b!42823 b!42828) bm!490))

(assert (= (and d!12378 res!36421) b!42821))

(assert (= (and b!42821 res!36418) b!42825))

(assert (= (and b!42825 res!36420) b!42824))

(assert (= (and b!42824 res!36419) b!42822))

(assert (= (and b!42822 res!36423) b!42827))

(assert (= (and b!42827 res!36422) b!42826))

(declare-fun m!64913 () Bool)

(assert (=> b!42821 m!64913))

(declare-fun m!64915 () Bool)

(assert (=> d!12378 m!64915))

(assert (=> d!12378 m!64801))

(declare-fun m!64917 () Bool)

(assert (=> d!12378 m!64917))

(declare-fun m!64919 () Bool)

(assert (=> d!12378 m!64919))

(declare-fun m!64921 () Bool)

(assert (=> b!42826 m!64921))

(declare-fun m!64923 () Bool)

(assert (=> b!42823 m!64923))

(declare-fun m!64925 () Bool)

(assert (=> b!42823 m!64925))

(declare-fun m!64927 () Bool)

(assert (=> b!42823 m!64927))

(declare-fun m!64929 () Bool)

(assert (=> b!42823 m!64929))

(declare-fun m!64931 () Bool)

(assert (=> b!42823 m!64931))

(declare-fun m!64933 () Bool)

(assert (=> b!42823 m!64933))

(declare-fun m!64935 () Bool)

(assert (=> b!42823 m!64935))

(declare-fun m!64937 () Bool)

(assert (=> b!42823 m!64937))

(declare-fun m!64939 () Bool)

(assert (=> b!42823 m!64939))

(declare-fun m!64941 () Bool)

(assert (=> b!42823 m!64941))

(declare-fun m!64943 () Bool)

(assert (=> b!42823 m!64943))

(declare-fun m!64945 () Bool)

(assert (=> b!42823 m!64945))

(declare-fun m!64947 () Bool)

(assert (=> b!42823 m!64947))

(declare-fun m!64949 () Bool)

(assert (=> b!42823 m!64949))

(declare-fun m!64951 () Bool)

(assert (=> b!42823 m!64951))

(declare-fun m!64953 () Bool)

(assert (=> b!42823 m!64953))

(assert (=> b!42823 m!64923))

(assert (=> b!42823 m!64801))

(declare-fun m!64955 () Bool)

(assert (=> b!42823 m!64955))

(declare-fun m!64957 () Bool)

(assert (=> b!42823 m!64957))

(declare-fun m!64959 () Bool)

(assert (=> b!42823 m!64959))

(declare-fun m!64961 () Bool)

(assert (=> b!42823 m!64961))

(declare-fun m!64963 () Bool)

(assert (=> b!42823 m!64963))

(assert (=> b!42823 m!64951))

(declare-fun m!64965 () Bool)

(assert (=> b!42823 m!64965))

(declare-fun m!64967 () Bool)

(assert (=> b!42823 m!64967))

(declare-fun m!64969 () Bool)

(assert (=> b!42823 m!64969))

(declare-fun m!64971 () Bool)

(assert (=> b!42823 m!64971))

(declare-fun m!64973 () Bool)

(assert (=> b!42823 m!64973))

(assert (=> b!42823 m!64947))

(declare-fun m!64975 () Bool)

(assert (=> b!42823 m!64975))

(declare-fun m!64977 () Bool)

(assert (=> b!42823 m!64977))

(declare-fun m!64979 () Bool)

(assert (=> b!42823 m!64979))

(declare-fun m!64981 () Bool)

(assert (=> b!42823 m!64981))

(assert (=> b!42823 m!64975))

(declare-fun m!64983 () Bool)

(assert (=> b!42823 m!64983))

(declare-fun m!64985 () Bool)

(assert (=> b!42824 m!64985))

(declare-fun m!64987 () Bool)

(assert (=> b!42827 m!64987))

(declare-fun m!64989 () Bool)

(assert (=> b!42827 m!64989))

(declare-fun m!64991 () Bool)

(assert (=> b!42827 m!64991))

(declare-fun m!64993 () Bool)

(assert (=> b!42827 m!64993))

(declare-fun m!64995 () Bool)

(assert (=> b!42827 m!64995))

(declare-fun m!64997 () Bool)

(assert (=> b!42828 m!64997))

(declare-fun m!64999 () Bool)

(assert (=> b!42828 m!64999))

(declare-fun m!65001 () Bool)

(assert (=> bm!490 m!65001))

(assert (=> b!42649 d!12378))

(declare-fun d!12392 () Bool)

(assert (=> d!12392 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64047))))

(declare-fun lt!64411 () Unit!3036)

(declare-fun choose!30 (BitStream!1726 BitStream!1726 BitStream!1726) Unit!3036)

(assert (=> d!12392 (= lt!64411 (choose!30 thiss!1379 (_2!2186 lt!64049) (_2!2186 lt!64047)))))

(assert (=> d!12392 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64049))))

(assert (=> d!12392 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2186 lt!64049) (_2!2186 lt!64047)) lt!64411)))

(declare-fun bs!3342 () Bool)

(assert (= bs!3342 d!12392))

(assert (=> bs!3342 m!64653))

(declare-fun m!65003 () Bool)

(assert (=> bs!3342 m!65003))

(assert (=> bs!3342 m!64671))

(assert (=> b!42649 d!12392))

(declare-fun d!12394 () Bool)

(assert (=> d!12394 (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!64414 () Unit!3036)

(declare-fun choose!9 (BitStream!1726 array!2192 (_ BitVec 64) BitStream!1726) Unit!3036)

(assert (=> d!12394 (= lt!64414 (choose!9 thiss!1379 (buf!1322 (_2!2186 lt!64049)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1727 (buf!1322 (_2!2186 lt!64049)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379))))))

(assert (=> d!12394 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1322 (_2!2186 lt!64049)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64414)))

(declare-fun bs!3343 () Bool)

(assert (= bs!3343 d!12394))

(assert (=> bs!3343 m!64657))

(declare-fun m!65005 () Bool)

(assert (=> bs!3343 m!65005))

(assert (=> b!42649 d!12394))

(declare-fun b!42870 () Bool)

(declare-fun res!36452 () Bool)

(declare-fun e!28632 () Bool)

(assert (=> b!42870 (=> (not res!36452) (not e!28632))))

(declare-fun lt!64617 () tuple2!4188)

(assert (=> b!42870 (= res!36452 (isPrefixOf!0 (_2!2187 lt!64617) (_2!2186 lt!64049)))))

(declare-fun d!12396 () Bool)

(assert (=> d!12396 e!28632))

(declare-fun res!36451 () Bool)

(assert (=> d!12396 (=> (not res!36451) (not e!28632))))

(assert (=> d!12396 (= res!36451 (isPrefixOf!0 (_1!2187 lt!64617) (_2!2187 lt!64617)))))

(declare-fun lt!64622 () BitStream!1726)

(assert (=> d!12396 (= lt!64617 (tuple2!4189 lt!64622 (_2!2186 lt!64049)))))

(declare-fun lt!64633 () Unit!3036)

(declare-fun lt!64627 () Unit!3036)

(assert (=> d!12396 (= lt!64633 lt!64627)))

(assert (=> d!12396 (isPrefixOf!0 lt!64622 (_2!2186 lt!64049))))

(assert (=> d!12396 (= lt!64627 (lemmaIsPrefixTransitive!0 lt!64622 (_2!2186 lt!64049) (_2!2186 lt!64049)))))

(declare-fun lt!64632 () Unit!3036)

(declare-fun lt!64631 () Unit!3036)

(assert (=> d!12396 (= lt!64632 lt!64631)))

(assert (=> d!12396 (isPrefixOf!0 lt!64622 (_2!2186 lt!64049))))

(assert (=> d!12396 (= lt!64631 (lemmaIsPrefixTransitive!0 lt!64622 thiss!1379 (_2!2186 lt!64049)))))

(declare-fun lt!64634 () Unit!3036)

(declare-fun e!28631 () Unit!3036)

(assert (=> d!12396 (= lt!64634 e!28631)))

(declare-fun c!2801 () Bool)

(assert (=> d!12396 (= c!2801 (not (= (size!991 (buf!1322 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!64624 () Unit!3036)

(declare-fun lt!64623 () Unit!3036)

(assert (=> d!12396 (= lt!64624 lt!64623)))

(assert (=> d!12396 (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64049))))

(assert (=> d!12396 (= lt!64623 (lemmaIsPrefixRefl!0 (_2!2186 lt!64049)))))

(declare-fun lt!64615 () Unit!3036)

(declare-fun lt!64629 () Unit!3036)

(assert (=> d!12396 (= lt!64615 lt!64629)))

(assert (=> d!12396 (= lt!64629 (lemmaIsPrefixRefl!0 (_2!2186 lt!64049)))))

(declare-fun lt!64626 () Unit!3036)

(declare-fun lt!64620 () Unit!3036)

(assert (=> d!12396 (= lt!64626 lt!64620)))

(assert (=> d!12396 (isPrefixOf!0 lt!64622 lt!64622)))

(assert (=> d!12396 (= lt!64620 (lemmaIsPrefixRefl!0 lt!64622))))

(declare-fun lt!64616 () Unit!3036)

(declare-fun lt!64621 () Unit!3036)

(assert (=> d!12396 (= lt!64616 lt!64621)))

(assert (=> d!12396 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12396 (= lt!64621 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12396 (= lt!64622 (BitStream!1727 (buf!1322 (_2!2186 lt!64049)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)))))

(assert (=> d!12396 (isPrefixOf!0 thiss!1379 (_2!2186 lt!64049))))

(assert (=> d!12396 (= (reader!0 thiss!1379 (_2!2186 lt!64049)) lt!64617)))

(declare-fun b!42871 () Bool)

(declare-fun lt!64628 () Unit!3036)

(assert (=> b!42871 (= e!28631 lt!64628)))

(declare-fun lt!64625 () (_ BitVec 64))

(assert (=> b!42871 (= lt!64625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64630 () (_ BitVec 64))

(assert (=> b!42871 (= lt!64630 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2192 array!2192 (_ BitVec 64) (_ BitVec 64)) Unit!3036)

(assert (=> b!42871 (= lt!64628 (arrayBitRangesEqSymmetric!0 (buf!1322 thiss!1379) (buf!1322 (_2!2186 lt!64049)) lt!64625 lt!64630))))

(assert (=> b!42871 (arrayBitRangesEq!0 (buf!1322 (_2!2186 lt!64049)) (buf!1322 thiss!1379) lt!64625 lt!64630)))

(declare-fun b!42872 () Bool)

(declare-fun Unit!3057 () Unit!3036)

(assert (=> b!42872 (= e!28631 Unit!3057)))

(declare-fun lt!64619 () (_ BitVec 64))

(declare-fun b!42873 () Bool)

(declare-fun lt!64618 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1726 (_ BitVec 64)) BitStream!1726)

(assert (=> b!42873 (= e!28632 (= (_1!2187 lt!64617) (withMovedBitIndex!0 (_2!2187 lt!64617) (bvsub lt!64619 lt!64618))))))

(assert (=> b!42873 (or (= (bvand lt!64619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64619 lt!64618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42873 (= lt!64618 (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049))))))

(assert (=> b!42873 (= lt!64619 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)))))

(declare-fun b!42874 () Bool)

(declare-fun res!36453 () Bool)

(assert (=> b!42874 (=> (not res!36453) (not e!28632))))

(assert (=> b!42874 (= res!36453 (isPrefixOf!0 (_1!2187 lt!64617) thiss!1379))))

(assert (= (and d!12396 c!2801) b!42871))

(assert (= (and d!12396 (not c!2801)) b!42872))

(assert (= (and d!12396 res!36451) b!42874))

(assert (= (and b!42874 res!36453) b!42870))

(assert (= (and b!42870 res!36452) b!42873))

(assert (=> d!12396 m!64917))

(declare-fun m!65097 () Bool)

(assert (=> d!12396 m!65097))

(declare-fun m!65099 () Bool)

(assert (=> d!12396 m!65099))

(assert (=> d!12396 m!64677))

(declare-fun m!65101 () Bool)

(assert (=> d!12396 m!65101))

(assert (=> d!12396 m!64679))

(assert (=> d!12396 m!64919))

(assert (=> d!12396 m!64671))

(declare-fun m!65103 () Bool)

(assert (=> d!12396 m!65103))

(declare-fun m!65105 () Bool)

(assert (=> d!12396 m!65105))

(declare-fun m!65107 () Bool)

(assert (=> d!12396 m!65107))

(declare-fun m!65109 () Bool)

(assert (=> b!42873 m!65109))

(assert (=> b!42873 m!64801))

(assert (=> b!42873 m!64681))

(declare-fun m!65111 () Bool)

(assert (=> b!42874 m!65111))

(declare-fun m!65113 () Bool)

(assert (=> b!42870 m!65113))

(assert (=> b!42871 m!64681))

(declare-fun m!65115 () Bool)

(assert (=> b!42871 m!65115))

(declare-fun m!65117 () Bool)

(assert (=> b!42871 m!65117))

(assert (=> b!42649 d!12396))

(declare-fun d!12402 () Bool)

(assert (=> d!12402 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!991 (buf!1322 (_2!2186 lt!64049)))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3345 () Bool)

(assert (= bs!3345 d!12402))

(declare-fun m!65119 () Bool)

(assert (=> bs!3345 m!65119))

(assert (=> b!42649 d!12402))

(declare-fun d!12404 () Bool)

(declare-fun res!36456 () Bool)

(declare-fun e!28634 () Bool)

(assert (=> d!12404 (=> (not res!36456) (not e!28634))))

(assert (=> d!12404 (= res!36456 (= (size!991 (buf!1322 (_2!2186 lt!64049))) (size!991 (buf!1322 (_2!2186 lt!64047)))))))

(assert (=> d!12404 (= (isPrefixOf!0 (_2!2186 lt!64049) (_2!2186 lt!64047)) e!28634)))

(declare-fun b!42875 () Bool)

(declare-fun res!36454 () Bool)

(assert (=> b!42875 (=> (not res!36454) (not e!28634))))

(assert (=> b!42875 (= res!36454 (bvsle (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049))) (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64047))) (currentByte!2786 (_2!2186 lt!64047)) (currentBit!2781 (_2!2186 lt!64047)))))))

(declare-fun b!42876 () Bool)

(declare-fun e!28633 () Bool)

(assert (=> b!42876 (= e!28634 e!28633)))

(declare-fun res!36455 () Bool)

(assert (=> b!42876 (=> res!36455 e!28633)))

(assert (=> b!42876 (= res!36455 (= (size!991 (buf!1322 (_2!2186 lt!64049))) #b00000000000000000000000000000000))))

(declare-fun b!42877 () Bool)

(assert (=> b!42877 (= e!28633 (arrayBitRangesEq!0 (buf!1322 (_2!2186 lt!64049)) (buf!1322 (_2!2186 lt!64047)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64049))) (currentByte!2786 (_2!2186 lt!64049)) (currentBit!2781 (_2!2186 lt!64049)))))))

(assert (= (and d!12404 res!36456) b!42875))

(assert (= (and b!42875 res!36454) b!42876))

(assert (= (and b!42876 (not res!36455)) b!42877))

(assert (=> b!42875 m!64801))

(declare-fun m!65121 () Bool)

(assert (=> b!42875 m!65121))

(assert (=> b!42877 m!64801))

(assert (=> b!42877 m!64801))

(declare-fun m!65123 () Bool)

(assert (=> b!42877 m!65123))

(assert (=> b!42649 d!12404))

(declare-fun d!12406 () Bool)

(declare-fun res!36459 () Bool)

(declare-fun e!28636 () Bool)

(assert (=> d!12406 (=> (not res!36459) (not e!28636))))

(assert (=> d!12406 (= res!36459 (= (size!991 (buf!1322 thiss!1379)) (size!991 (buf!1322 (_2!2186 lt!64047)))))))

(assert (=> d!12406 (= (isPrefixOf!0 thiss!1379 (_2!2186 lt!64047)) e!28636)))

(declare-fun b!42878 () Bool)

(declare-fun res!36457 () Bool)

(assert (=> b!42878 (=> (not res!36457) (not e!28636))))

(assert (=> b!42878 (= res!36457 (bvsle (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)) (bitIndex!0 (size!991 (buf!1322 (_2!2186 lt!64047))) (currentByte!2786 (_2!2186 lt!64047)) (currentBit!2781 (_2!2186 lt!64047)))))))

(declare-fun b!42879 () Bool)

(declare-fun e!28635 () Bool)

(assert (=> b!42879 (= e!28636 e!28635)))

(declare-fun res!36458 () Bool)

(assert (=> b!42879 (=> res!36458 e!28635)))

(assert (=> b!42879 (= res!36458 (= (size!991 (buf!1322 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42880 () Bool)

(assert (=> b!42880 (= e!28635 (arrayBitRangesEq!0 (buf!1322 thiss!1379) (buf!1322 (_2!2186 lt!64047)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379))))))

(assert (= (and d!12406 res!36459) b!42878))

(assert (= (and b!42878 res!36457) b!42879))

(assert (= (and b!42879 (not res!36458)) b!42880))

(assert (=> b!42878 m!64681))

(assert (=> b!42878 m!65121))

(assert (=> b!42880 m!64681))

(assert (=> b!42880 m!64681))

(declare-fun m!65125 () Bool)

(assert (=> b!42880 m!65125))

(assert (=> b!42649 d!12406))

(declare-fun d!12408 () Bool)

(assert (=> d!12408 (= (array_inv!916 (buf!1322 thiss!1379)) (bvsge (size!991 (buf!1322 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42647 d!12408))

(declare-fun d!12410 () Bool)

(assert (=> d!12410 (= (array_inv!916 srcBuffer!2) (bvsge (size!991 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8548 d!12410))

(declare-fun d!12412 () Bool)

(assert (=> d!12412 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2781 thiss!1379) (currentByte!2786 thiss!1379) (size!991 (buf!1322 thiss!1379))))))

(declare-fun bs!3346 () Bool)

(assert (= bs!3346 d!12412))

(declare-fun m!65127 () Bool)

(assert (=> bs!3346 m!65127))

(assert (=> start!8548 d!12412))

(declare-fun d!12414 () Bool)

(assert (=> d!12414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3347 () Bool)

(assert (= bs!3347 d!12414))

(declare-fun m!65129 () Bool)

(assert (=> bs!3347 m!65129))

(assert (=> b!42646 d!12414))

(declare-fun d!12416 () Bool)

(declare-fun res!36462 () Bool)

(declare-fun e!28638 () Bool)

(assert (=> d!12416 (=> (not res!36462) (not e!28638))))

(assert (=> d!12416 (= res!36462 (= (size!991 (buf!1322 thiss!1379)) (size!991 (buf!1322 thiss!1379))))))

(assert (=> d!12416 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28638)))

(declare-fun b!42881 () Bool)

(declare-fun res!36460 () Bool)

(assert (=> b!42881 (=> (not res!36460) (not e!28638))))

(assert (=> b!42881 (= res!36460 (bvsle (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)) (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379))))))

(declare-fun b!42882 () Bool)

(declare-fun e!28637 () Bool)

(assert (=> b!42882 (= e!28638 e!28637)))

(declare-fun res!36461 () Bool)

(assert (=> b!42882 (=> res!36461 e!28637)))

(assert (=> b!42882 (= res!36461 (= (size!991 (buf!1322 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42883 () Bool)

(assert (=> b!42883 (= e!28637 (arrayBitRangesEq!0 (buf!1322 thiss!1379) (buf!1322 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379))))))

(assert (= (and d!12416 res!36462) b!42881))

(assert (= (and b!42881 res!36460) b!42882))

(assert (= (and b!42882 (not res!36461)) b!42883))

(assert (=> b!42881 m!64681))

(assert (=> b!42881 m!64681))

(assert (=> b!42883 m!64681))

(assert (=> b!42883 m!64681))

(declare-fun m!65131 () Bool)

(assert (=> b!42883 m!65131))

(assert (=> b!42644 d!12416))

(declare-fun d!12418 () Bool)

(assert (=> d!12418 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64689 () Unit!3036)

(declare-fun choose!11 (BitStream!1726) Unit!3036)

(assert (=> d!12418 (= lt!64689 (choose!11 thiss!1379))))

(assert (=> d!12418 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!64689)))

(declare-fun bs!3349 () Bool)

(assert (= bs!3349 d!12418))

(assert (=> bs!3349 m!64677))

(declare-fun m!65133 () Bool)

(assert (=> bs!3349 m!65133))

(assert (=> b!42644 d!12418))

(declare-fun d!12420 () Bool)

(declare-fun e!28645 () Bool)

(assert (=> d!12420 e!28645))

(declare-fun res!36480 () Bool)

(assert (=> d!12420 (=> (not res!36480) (not e!28645))))

(declare-fun lt!64711 () (_ BitVec 64))

(declare-fun lt!64710 () (_ BitVec 64))

(declare-fun lt!64713 () (_ BitVec 64))

(assert (=> d!12420 (= res!36480 (= lt!64711 (bvsub lt!64713 lt!64710)))))

(assert (=> d!12420 (or (= (bvand lt!64713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!64710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!64713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!64713 lt!64710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12420 (= lt!64710 (remainingBits!0 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))) ((_ sign_extend 32) (currentByte!2786 thiss!1379)) ((_ sign_extend 32) (currentBit!2781 thiss!1379))))))

(declare-fun lt!64715 () (_ BitVec 64))

(declare-fun lt!64712 () (_ BitVec 64))

(assert (=> d!12420 (= lt!64713 (bvmul lt!64715 lt!64712))))

(assert (=> d!12420 (or (= lt!64715 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!64712 (bvsdiv (bvmul lt!64715 lt!64712) lt!64715)))))

(assert (=> d!12420 (= lt!64712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12420 (= lt!64715 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))))))

(assert (=> d!12420 (= lt!64711 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2786 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2781 thiss!1379))))))

(assert (=> d!12420 (invariant!0 (currentBit!2781 thiss!1379) (currentByte!2786 thiss!1379) (size!991 (buf!1322 thiss!1379)))))

(assert (=> d!12420 (= (bitIndex!0 (size!991 (buf!1322 thiss!1379)) (currentByte!2786 thiss!1379) (currentBit!2781 thiss!1379)) lt!64711)))

(declare-fun b!42900 () Bool)

(declare-fun res!36479 () Bool)

(assert (=> b!42900 (=> (not res!36479) (not e!28645))))

(assert (=> b!42900 (= res!36479 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!64711))))

(declare-fun b!42901 () Bool)

(declare-fun lt!64714 () (_ BitVec 64))

(assert (=> b!42901 (= e!28645 (bvsle lt!64711 (bvmul lt!64714 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42901 (or (= lt!64714 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!64714 #b0000000000000000000000000000000000000000000000000000000000001000) lt!64714)))))

(assert (=> b!42901 (= lt!64714 ((_ sign_extend 32) (size!991 (buf!1322 thiss!1379))))))

(assert (= (and d!12420 res!36480) b!42900))

(assert (= (and b!42900 res!36479) b!42901))

(assert (=> d!12420 m!65129))

(assert (=> d!12420 m!65127))

(assert (=> b!42644 d!12420))

(declare-fun d!12422 () Bool)

(assert (=> d!12422 (= (head!323 (byteArrayBitContentToList!0 (_2!2186 lt!64049) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!619 (byteArrayBitContentToList!0 (_2!2186 lt!64049) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!42645 d!12422))

(declare-fun d!12424 () Bool)

(declare-fun c!2805 () Bool)

(assert (=> d!12424 (= c!2805 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28651 () List!504)

(assert (=> d!12424 (= (byteArrayBitContentToList!0 (_2!2186 lt!64049) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!28651)))

(declare-fun b!42914 () Bool)

(assert (=> b!42914 (= e!28651 Nil!501)))

(declare-fun b!42915 () Bool)

(assert (=> b!42915 (= e!28651 (Cons!500 (not (= (bvand ((_ sign_extend 24) (select (arr!1490 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2186 lt!64049) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12424 c!2805) b!42914))

(assert (= (and d!12424 (not c!2805)) b!42915))

(assert (=> b!42915 m!64667))

(assert (=> b!42915 m!64829))

(declare-fun m!65135 () Bool)

(assert (=> b!42915 m!65135))

(assert (=> b!42645 d!12424))

(declare-fun d!12426 () Bool)

(assert (=> d!12426 (= (head!323 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64049) (_1!2187 lt!64051) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!619 (bitStreamReadBitsIntoList!0 (_2!2186 lt!64049) (_1!2187 lt!64051) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!42645 d!12426))

(declare-fun b!42933 () Bool)

(declare-fun e!28661 () Bool)

(declare-fun lt!64770 () List!504)

(declare-fun length!213 (List!504) Int)

(assert (=> b!42933 (= e!28661 (> (length!213 lt!64770) 0))))

(declare-fun lt!64771 () (_ BitVec 64))

(declare-datatypes ((tuple2!4210 0))(
  ( (tuple2!4211 (_1!2198 List!504) (_2!2198 BitStream!1726)) )
))
(declare-fun e!28660 () tuple2!4210)

(declare-fun b!42930 () Bool)

(declare-datatypes ((tuple2!4212 0))(
  ( (tuple2!4213 (_1!2199 Bool) (_2!2199 BitStream!1726)) )
))
(declare-fun lt!64769 () tuple2!4212)

(assert (=> b!42930 (= e!28660 (tuple2!4211 (Cons!500 (_1!2199 lt!64769) (bitStreamReadBitsIntoList!0 (_2!2186 lt!64049) (_2!2199 lt!64769) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!64771))) (_2!2199 lt!64769)))))

(declare-fun readBit!0 (BitStream!1726) tuple2!4212)

(assert (=> b!42930 (= lt!64769 (readBit!0 (_1!2187 lt!64051)))))

(assert (=> b!42930 (= lt!64771 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!42929 () Bool)

(assert (=> b!42929 (= e!28660 (tuple2!4211 Nil!501 (_1!2187 lt!64051)))))

(declare-fun d!12428 () Bool)

(assert (=> d!12428 e!28661))

(declare-fun c!2810 () Bool)

(assert (=> d!12428 (= c!2810 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12428 (= lt!64770 (_1!2198 e!28660))))

(declare-fun c!2811 () Bool)

(assert (=> d!12428 (= c!2811 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12428 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12428 (= (bitStreamReadBitsIntoList!0 (_2!2186 lt!64049) (_1!2187 lt!64051) #b0000000000000000000000000000000000000000000000000000000000000001) lt!64770)))

(declare-fun b!42932 () Bool)

(declare-fun isEmpty!115 (List!504) Bool)

(assert (=> b!42932 (= e!28661 (isEmpty!115 lt!64770))))

(assert (= (and d!12428 c!2811) b!42929))

(assert (= (and d!12428 (not c!2811)) b!42930))

(assert (= (and d!12428 c!2810) b!42932))

(assert (= (and d!12428 (not c!2810)) b!42933))

(declare-fun m!65231 () Bool)

(assert (=> b!42933 m!65231))

(declare-fun m!65233 () Bool)

(assert (=> b!42930 m!65233))

(declare-fun m!65235 () Bool)

(assert (=> b!42930 m!65235))

(declare-fun m!65237 () Bool)

(assert (=> b!42932 m!65237))

(assert (=> b!42645 d!12428))

(push 1)

(assert (not b!42774))

(assert (not b!42932))

(assert (not b!42721))

(assert (not b!42880))

(assert (not b!42821))

(assert (not d!12356))

(assert (not b!42930))

(assert (not b!42733))

(assert (not d!12420))

(assert (not d!12394))

(assert (not b!42828))

(assert (not d!12372))

(assert (not b!42877))

(assert (not b!42875))

(assert (not b!42881))

(assert (not d!12378))

(assert (not b!42776))

(assert (not b!42933))

(assert (not b!42775))

(assert (not d!12402))

(assert (not d!12396))

(assert (not b!42773))

(assert (not d!12392))

(assert (not b!42878))

(assert (not b!42771))

(assert (not b!42883))

(assert (not b!42870))

(assert (not b!42824))

(assert (not b!42873))

(assert (not b!42874))

(assert (not d!12418))

(assert (not b!42823))

(assert (not b!42723))

(assert (not d!12360))

(assert (not b!42871))

(assert (not d!12414))

(assert (not bm!490))

(assert (not b!42915))

(assert (not b!42777))

(assert (not b!42827))

(assert (not b!42826))

(assert (not b!42778))

(assert (not b!42772))

(assert (not d!12412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

