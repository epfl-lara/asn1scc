; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9404 () Bool)

(assert start!9404)

(declare-fun b!46727 () Bool)

(declare-fun e!31021 () Bool)

(declare-datatypes ((array!2293 0))(
  ( (array!2294 (arr!1556 (Array (_ BitVec 32) (_ BitVec 8))) (size!1036 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1804 0))(
  ( (BitStream!1805 (buf!1385 array!2293) (currentByte!2890 (_ BitVec 32)) (currentBit!2885 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1804)

(declare-fun array_inv!955 (array!2293) Bool)

(assert (=> b!46727 (= e!31021 (array_inv!955 (buf!1385 thiss!1379)))))

(declare-fun b!46728 () Bool)

(declare-fun res!39442 () Bool)

(declare-fun e!31024 () Bool)

(assert (=> b!46728 (=> res!39442 e!31024)))

(declare-datatypes ((List!543 0))(
  ( (Nil!540) (Cons!539 (h!658 Bool) (t!1293 List!543)) )
))
(declare-fun lt!72269 () List!543)

(declare-fun length!238 (List!543) Int)

(assert (=> b!46728 (= res!39442 (<= (length!238 lt!72269) 0))))

(declare-fun b!46729 () Bool)

(declare-fun e!31027 () Bool)

(declare-fun e!31028 () Bool)

(assert (=> b!46729 (= e!31027 e!31028)))

(declare-fun res!39441 () Bool)

(assert (=> b!46729 (=> res!39441 e!31028)))

(declare-datatypes ((Unit!3309 0))(
  ( (Unit!3310) )
))
(declare-datatypes ((tuple2!4524 0))(
  ( (tuple2!4525 (_1!2355 Unit!3309) (_2!2355 BitStream!1804)) )
))
(declare-fun lt!72283 () tuple2!4524)

(declare-fun lt!72275 () tuple2!4524)

(declare-fun isPrefixOf!0 (BitStream!1804 BitStream!1804) Bool)

(assert (=> b!46729 (= res!39441 (not (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72275))))))

(assert (=> b!46729 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72275))))

(declare-fun lt!72270 () Unit!3309)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1804 BitStream!1804 BitStream!1804) Unit!3309)

(assert (=> b!46729 (= lt!72270 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2355 lt!72283) (_2!2355 lt!72275)))))

(declare-fun srcBuffer!2 () array!2293)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1804 array!2293 (_ BitVec 64) (_ BitVec 64)) tuple2!4524)

(assert (=> b!46729 (= lt!72275 (appendBitsMSBFirstLoop!0 (_2!2355 lt!72283) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!31033 () Bool)

(assert (=> b!46729 e!31033))

(declare-fun res!39437 () Bool)

(assert (=> b!46729 (=> (not res!39437) (not e!31033))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46729 (= res!39437 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72265 () Unit!3309)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1804 array!2293 (_ BitVec 64)) Unit!3309)

(assert (=> b!46729 (= lt!72265 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4526 0))(
  ( (tuple2!4527 (_1!2356 BitStream!1804) (_2!2356 BitStream!1804)) )
))
(declare-fun lt!72272 () tuple2!4526)

(declare-fun reader!0 (BitStream!1804 BitStream!1804) tuple2!4526)

(assert (=> b!46729 (= lt!72272 (reader!0 thiss!1379 (_2!2355 lt!72283)))))

(declare-fun b!46730 () Bool)

(declare-fun e!31034 () Bool)

(assert (=> b!46730 (= e!31024 e!31034)))

(declare-fun res!39430 () Bool)

(assert (=> b!46730 (=> res!39430 e!31034)))

(declare-fun lt!72282 () List!543)

(declare-fun lt!72268 () List!543)

(assert (=> b!46730 (= res!39430 (not (= lt!72282 lt!72268)))))

(assert (=> b!46730 (= lt!72268 lt!72282)))

(declare-fun tail!229 (List!543) List!543)

(assert (=> b!46730 (= lt!72282 (tail!229 lt!72269))))

(declare-fun lt!72279 () tuple2!4526)

(declare-fun lt!72267 () tuple2!4526)

(declare-fun lt!72271 () Unit!3309)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1804 BitStream!1804 BitStream!1804 BitStream!1804 (_ BitVec 64) List!543) Unit!3309)

(assert (=> b!46730 (= lt!72271 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2355 lt!72275) (_2!2355 lt!72275) (_1!2356 lt!72267) (_1!2356 lt!72279) (bvsub to!314 i!635) lt!72269))))

(declare-fun b!46731 () Bool)

(declare-fun e!31025 () Bool)

(declare-fun lt!72273 () Bool)

(declare-fun head!362 (List!543) Bool)

(assert (=> b!46731 (= e!31025 (= (head!362 lt!72269) lt!72273))))

(declare-fun b!46732 () Bool)

(declare-fun e!31022 () Bool)

(declare-fun e!31031 () Bool)

(assert (=> b!46732 (= e!31022 (not e!31031))))

(declare-fun res!39440 () Bool)

(assert (=> b!46732 (=> res!39440 e!31031)))

(assert (=> b!46732 (= res!39440 (bvsge i!635 to!314))))

(assert (=> b!46732 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72281 () Unit!3309)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1804) Unit!3309)

(assert (=> b!46732 (= lt!72281 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!72274 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46732 (= lt!72274 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun res!39428 () Bool)

(assert (=> start!9404 (=> (not res!39428) (not e!31022))))

(assert (=> start!9404 (= res!39428 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1036 srcBuffer!2))))))))

(assert (=> start!9404 e!31022))

(assert (=> start!9404 true))

(assert (=> start!9404 (array_inv!955 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1804) Bool)

(assert (=> start!9404 (and (inv!12 thiss!1379) e!31021)))

(declare-fun b!46733 () Bool)

(declare-fun e!31026 () Bool)

(declare-fun e!31029 () Bool)

(assert (=> b!46733 (= e!31026 e!31029)))

(declare-fun res!39444 () Bool)

(assert (=> b!46733 (=> res!39444 e!31029)))

(assert (=> b!46733 (= res!39444 (not (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))

(declare-fun e!31032 () Bool)

(assert (=> b!46733 e!31032))

(declare-fun res!39431 () Bool)

(assert (=> b!46733 (=> (not res!39431) (not e!31032))))

(assert (=> b!46733 (= res!39431 (= (size!1036 (buf!1385 (_2!2355 lt!72275))) (size!1036 (buf!1385 thiss!1379))))))

(declare-fun b!46734 () Bool)

(declare-fun res!39439 () Bool)

(assert (=> b!46734 (=> res!39439 e!31029)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46734 (= res!39439 (not (invariant!0 (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72283))))))))

(declare-fun b!46735 () Bool)

(assert (=> b!46735 (= e!31029 e!31024)))

(declare-fun res!39429 () Bool)

(assert (=> b!46735 (=> res!39429 e!31024)))

(assert (=> b!46735 (= res!39429 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!72277 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1804 BitStream!1804 (_ BitVec 64)) List!543)

(assert (=> b!46735 (= lt!72268 (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72279) lt!72277))))

(assert (=> b!46735 (= lt!72269 (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72267) (bvsub to!314 i!635)))))

(assert (=> b!46735 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277)))

(declare-fun lt!72276 () Unit!3309)

(assert (=> b!46735 (= lt!72276 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!72275)) lt!72277))))

(assert (=> b!46735 (= lt!72279 (reader!0 (_2!2355 lt!72283) (_2!2355 lt!72275)))))

(assert (=> b!46735 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72280 () Unit!3309)

(assert (=> b!46735 (= lt!72280 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1385 (_2!2355 lt!72275)) (bvsub to!314 i!635)))))

(assert (=> b!46735 (= lt!72267 (reader!0 thiss!1379 (_2!2355 lt!72275)))))

(declare-fun b!46736 () Bool)

(declare-fun res!39438 () Bool)

(assert (=> b!46736 (=> (not res!39438) (not e!31022))))

(assert (=> b!46736 (= res!39438 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46737 () Bool)

(assert (=> b!46737 (= e!31031 e!31027)))

(declare-fun res!39433 () Bool)

(assert (=> b!46737 (=> res!39433 e!31027)))

(assert (=> b!46737 (= res!39433 (not (isPrefixOf!0 thiss!1379 (_2!2355 lt!72283))))))

(assert (=> b!46737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277)))

(assert (=> b!46737 (= lt!72277 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72266 () Unit!3309)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1804 BitStream!1804 (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> b!46737 (= lt!72266 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2355 lt!72283) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1804 (_ BitVec 8) (_ BitVec 32)) tuple2!4524)

(assert (=> b!46737 (= lt!72283 (appendBitFromByte!0 thiss!1379 (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46738 () Bool)

(assert (=> b!46738 (= e!31034 e!31025)))

(declare-fun res!39434 () Bool)

(assert (=> b!46738 (=> res!39434 e!31025)))

(declare-fun bitAt!0 (array!2293 (_ BitVec 64)) Bool)

(assert (=> b!46738 (= res!39434 (not (= lt!72273 (bitAt!0 (buf!1385 (_1!2356 lt!72279)) lt!72274))))))

(assert (=> b!46738 (= lt!72273 (bitAt!0 (buf!1385 (_1!2356 lt!72267)) lt!72274))))

(declare-fun b!46739 () Bool)

(declare-fun lt!72278 () (_ BitVec 64))

(assert (=> b!46739 (= e!31032 (= lt!72278 (bvsub (bvsub (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46740 () Bool)

(declare-fun res!39436 () Bool)

(assert (=> b!46740 (=> res!39436 e!31026)))

(assert (=> b!46740 (= res!39436 (not (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))

(declare-fun b!46741 () Bool)

(declare-fun res!39435 () Bool)

(assert (=> b!46741 (=> res!39435 e!31029)))

(assert (=> b!46741 (= res!39435 (not (invariant!0 (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))

(declare-fun b!46742 () Bool)

(assert (=> b!46742 (= e!31028 e!31026)))

(declare-fun res!39432 () Bool)

(assert (=> b!46742 (=> res!39432 e!31026)))

(assert (=> b!46742 (= res!39432 (not (= lt!72278 (bvsub (bvadd lt!72274 to!314) i!635))))))

(assert (=> b!46742 (= lt!72278 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275))))))

(declare-fun b!46743 () Bool)

(declare-fun res!39443 () Bool)

(assert (=> b!46743 (=> res!39443 e!31026)))

(assert (=> b!46743 (= res!39443 (not (invariant!0 (currentBit!2885 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72275)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))

(declare-fun b!46744 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1804 array!2293 (_ BitVec 64) (_ BitVec 64)) List!543)

(assert (=> b!46744 (= e!31033 (= (head!362 (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!362 (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_1!2356 lt!72272) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!9404 res!39428) b!46736))

(assert (= (and b!46736 res!39438) b!46732))

(assert (= (and b!46732 (not res!39440)) b!46737))

(assert (= (and b!46737 (not res!39433)) b!46729))

(assert (= (and b!46729 res!39437) b!46744))

(assert (= (and b!46729 (not res!39441)) b!46742))

(assert (= (and b!46742 (not res!39432)) b!46743))

(assert (= (and b!46743 (not res!39443)) b!46740))

(assert (= (and b!46740 (not res!39436)) b!46733))

(assert (= (and b!46733 res!39431) b!46739))

(assert (= (and b!46733 (not res!39444)) b!46734))

(assert (= (and b!46734 (not res!39439)) b!46741))

(assert (= (and b!46741 (not res!39435)) b!46735))

(assert (= (and b!46735 (not res!39429)) b!46728))

(assert (= (and b!46728 (not res!39442)) b!46730))

(assert (= (and b!46730 (not res!39430)) b!46738))

(assert (= (and b!46738 (not res!39434)) b!46731))

(assert (= start!9404 b!46727))

(declare-fun m!71659 () Bool)

(assert (=> b!46735 m!71659))

(declare-fun m!71661 () Bool)

(assert (=> b!46735 m!71661))

(declare-fun m!71663 () Bool)

(assert (=> b!46735 m!71663))

(declare-fun m!71665 () Bool)

(assert (=> b!46735 m!71665))

(declare-fun m!71667 () Bool)

(assert (=> b!46735 m!71667))

(declare-fun m!71669 () Bool)

(assert (=> b!46735 m!71669))

(declare-fun m!71671 () Bool)

(assert (=> b!46735 m!71671))

(declare-fun m!71673 () Bool)

(assert (=> b!46735 m!71673))

(declare-fun m!71675 () Bool)

(assert (=> b!46741 m!71675))

(declare-fun m!71677 () Bool)

(assert (=> b!46737 m!71677))

(declare-fun m!71679 () Bool)

(assert (=> b!46737 m!71679))

(declare-fun m!71681 () Bool)

(assert (=> b!46737 m!71681))

(declare-fun m!71683 () Bool)

(assert (=> b!46737 m!71683))

(declare-fun m!71685 () Bool)

(assert (=> b!46737 m!71685))

(assert (=> b!46737 m!71681))

(declare-fun m!71687 () Bool)

(assert (=> b!46732 m!71687))

(declare-fun m!71689 () Bool)

(assert (=> b!46732 m!71689))

(declare-fun m!71691 () Bool)

(assert (=> b!46732 m!71691))

(declare-fun m!71693 () Bool)

(assert (=> b!46728 m!71693))

(declare-fun m!71695 () Bool)

(assert (=> b!46731 m!71695))

(declare-fun m!71697 () Bool)

(assert (=> b!46734 m!71697))

(declare-fun m!71699 () Bool)

(assert (=> b!46736 m!71699))

(declare-fun m!71701 () Bool)

(assert (=> b!46727 m!71701))

(declare-fun m!71703 () Bool)

(assert (=> b!46742 m!71703))

(declare-fun m!71705 () Bool)

(assert (=> start!9404 m!71705))

(declare-fun m!71707 () Bool)

(assert (=> start!9404 m!71707))

(declare-fun m!71709 () Bool)

(assert (=> b!46744 m!71709))

(assert (=> b!46744 m!71709))

(declare-fun m!71711 () Bool)

(assert (=> b!46744 m!71711))

(declare-fun m!71713 () Bool)

(assert (=> b!46744 m!71713))

(assert (=> b!46744 m!71713))

(declare-fun m!71715 () Bool)

(assert (=> b!46744 m!71715))

(declare-fun m!71717 () Bool)

(assert (=> b!46738 m!71717))

(declare-fun m!71719 () Bool)

(assert (=> b!46738 m!71719))

(declare-fun m!71721 () Bool)

(assert (=> b!46739 m!71721))

(declare-fun m!71723 () Bool)

(assert (=> b!46730 m!71723))

(declare-fun m!71725 () Bool)

(assert (=> b!46730 m!71725))

(declare-fun m!71727 () Bool)

(assert (=> b!46729 m!71727))

(declare-fun m!71729 () Bool)

(assert (=> b!46729 m!71729))

(declare-fun m!71731 () Bool)

(assert (=> b!46729 m!71731))

(declare-fun m!71733 () Bool)

(assert (=> b!46729 m!71733))

(declare-fun m!71735 () Bool)

(assert (=> b!46729 m!71735))

(declare-fun m!71737 () Bool)

(assert (=> b!46729 m!71737))

(declare-fun m!71739 () Bool)

(assert (=> b!46729 m!71739))

(declare-fun m!71741 () Bool)

(assert (=> b!46743 m!71741))

(push 1)

(assert (not b!46738))

(assert (not start!9404))

(assert (not b!46743))

(assert (not b!46735))

(assert (not b!46730))

(assert (not b!46727))

(assert (not b!46741))

(assert (not b!46729))

(assert (not b!46744))

(assert (not b!46734))

(assert (not b!46731))

(assert (not b!46739))

(assert (not b!46728))

(assert (not b!46736))

(assert (not b!46742))

(assert (not b!46737))

(assert (not b!46732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13762 () Bool)

(assert (=> d!13762 (= (invariant!0 (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72283)))) (and (bvsge (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (bvslt (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000001000) (bvsge (currentByte!2890 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72283)))) (and (= (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (= (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72283))))))))))

(assert (=> b!46734 d!13762))

(declare-fun d!13764 () Bool)

(assert (=> d!13764 (= (invariant!0 (currentBit!2885 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72275)) (size!1036 (buf!1385 (_2!2355 lt!72275)))) (and (bvsge (currentBit!2885 (_2!2355 lt!72275)) #b00000000000000000000000000000000) (bvslt (currentBit!2885 (_2!2355 lt!72275)) #b00000000000000000000000000001000) (bvsge (currentByte!2890 (_2!2355 lt!72275)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2890 (_2!2355 lt!72275)) (size!1036 (buf!1385 (_2!2355 lt!72275)))) (and (= (currentBit!2885 (_2!2355 lt!72275)) #b00000000000000000000000000000000) (= (currentByte!2890 (_2!2355 lt!72275)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))))

(assert (=> b!46743 d!13764))

(declare-fun d!13766 () Bool)

(assert (=> d!13766 (= (head!362 (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!658 (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46744 d!13766))

(declare-fun d!13768 () Bool)

(declare-fun c!3203 () Bool)

(assert (=> d!13768 (= c!3203 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31200 () List!543)

(assert (=> d!13768 (= (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!31200)))

(declare-fun b!47022 () Bool)

(assert (=> b!47022 (= e!31200 Nil!540)))

(declare-fun b!47023 () Bool)

(assert (=> b!47023 (= e!31200 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13768 c!3203) b!47022))

(assert (= (and d!13768 (not c!3203)) b!47023))

(assert (=> b!47023 m!71681))

(declare-fun m!72201 () Bool)

(assert (=> b!47023 m!72201))

(declare-fun m!72203 () Bool)

(assert (=> b!47023 m!72203))

(assert (=> b!46744 d!13768))

(declare-fun d!13770 () Bool)

(assert (=> d!13770 (= (head!362 (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_1!2356 lt!72272) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!658 (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_1!2356 lt!72272) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46744 d!13770))

(declare-fun b!47042 () Bool)

(declare-fun e!31209 () Bool)

(declare-fun lt!72931 () List!543)

(declare-fun isEmpty!139 (List!543) Bool)

(assert (=> b!47042 (= e!31209 (isEmpty!139 lt!72931))))

(declare-fun b!47040 () Bool)

(declare-datatypes ((tuple2!4552 0))(
  ( (tuple2!4553 (_1!2369 List!543) (_2!2369 BitStream!1804)) )
))
(declare-fun e!31208 () tuple2!4552)

(assert (=> b!47040 (= e!31208 (tuple2!4553 Nil!540 (_1!2356 lt!72272)))))

(declare-fun d!13772 () Bool)

(assert (=> d!13772 e!31209))

(declare-fun c!3209 () Bool)

(assert (=> d!13772 (= c!3209 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13772 (= lt!72931 (_1!2369 e!31208))))

(declare-fun c!3210 () Bool)

(assert (=> d!13772 (= c!3210 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13772 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13772 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_1!2356 lt!72272) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72931)))

(declare-fun b!47043 () Bool)

(assert (=> b!47043 (= e!31209 (> (length!238 lt!72931) 0))))

(declare-fun b!47041 () Bool)

(declare-datatypes ((tuple2!4554 0))(
  ( (tuple2!4555 (_1!2370 Bool) (_2!2370 BitStream!1804)) )
))
(declare-fun lt!72929 () tuple2!4554)

(declare-fun lt!72930 () (_ BitVec 64))

(assert (=> b!47041 (= e!31208 (tuple2!4553 (Cons!539 (_1!2370 lt!72929) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_2!2370 lt!72929) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930))) (_2!2370 lt!72929)))))

(declare-fun readBit!0 (BitStream!1804) tuple2!4554)

(assert (=> b!47041 (= lt!72929 (readBit!0 (_1!2356 lt!72272)))))

(assert (=> b!47041 (= lt!72930 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13772 c!3210) b!47040))

(assert (= (and d!13772 (not c!3210)) b!47041))

(assert (= (and d!13772 c!3209) b!47042))

(assert (= (and d!13772 (not c!3209)) b!47043))

(declare-fun m!72205 () Bool)

(assert (=> b!47042 m!72205))

(declare-fun m!72207 () Bool)

(assert (=> b!47043 m!72207))

(declare-fun m!72209 () Bool)

(assert (=> b!47041 m!72209))

(declare-fun m!72211 () Bool)

(assert (=> b!47041 m!72211))

(assert (=> b!46744 d!13772))

(declare-fun d!13774 () Bool)

(declare-fun e!31212 () Bool)

(assert (=> d!13774 e!31212))

(declare-fun res!39670 () Bool)

(assert (=> d!13774 (=> (not res!39670) (not e!31212))))

(declare-fun lt!72952 () (_ BitVec 64))

(declare-fun lt!72950 () (_ BitVec 64))

(declare-fun lt!72949 () (_ BitVec 64))

(assert (=> d!13774 (= res!39670 (= lt!72949 (bvsub lt!72952 lt!72950)))))

(assert (=> d!13774 (or (= (bvand lt!72952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72952 lt!72950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13774 (= lt!72950 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72275))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun lt!72948 () (_ BitVec 64))

(declare-fun lt!72951 () (_ BitVec 64))

(assert (=> d!13774 (= lt!72952 (bvmul lt!72948 lt!72951))))

(assert (=> d!13774 (or (= lt!72948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72951 (bvsdiv (bvmul lt!72948 lt!72951) lt!72948)))))

(assert (=> d!13774 (= lt!72951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13774 (= lt!72948 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!13774 (= lt!72949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72275)))))))

(assert (=> d!13774 (invariant!0 (currentBit!2885 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72275)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))

(assert (=> d!13774 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275))) lt!72949)))

(declare-fun b!47048 () Bool)

(declare-fun res!39669 () Bool)

(assert (=> b!47048 (=> (not res!39669) (not e!31212))))

(assert (=> b!47048 (= res!39669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72949))))

(declare-fun b!47049 () Bool)

(declare-fun lt!72947 () (_ BitVec 64))

(assert (=> b!47049 (= e!31212 (bvsle lt!72949 (bvmul lt!72947 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47049 (or (= lt!72947 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72947 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72947)))))

(assert (=> b!47049 (= lt!72947 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (= (and d!13774 res!39670) b!47048))

(assert (= (and b!47048 res!39669) b!47049))

(declare-fun m!72301 () Bool)

(assert (=> d!13774 m!72301))

(assert (=> d!13774 m!71741))

(assert (=> b!46742 d!13774))

(declare-fun d!13780 () Bool)

(assert (=> d!13780 (= (head!362 lt!72269) (h!658 lt!72269))))

(assert (=> b!46731 d!13780))

(declare-fun d!13782 () Bool)

(declare-fun res!39687 () Bool)

(declare-fun e!31224 () Bool)

(assert (=> d!13782 (=> (not res!39687) (not e!31224))))

(assert (=> d!13782 (= res!39687 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 thiss!1379))))))

(assert (=> d!13782 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!31224)))

(declare-fun b!47065 () Bool)

(declare-fun res!39686 () Bool)

(assert (=> b!47065 (=> (not res!39686) (not e!31224))))

(assert (=> b!47065 (= res!39686 (bvsle (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47066 () Bool)

(declare-fun e!31223 () Bool)

(assert (=> b!47066 (= e!31224 e!31223)))

(declare-fun res!39688 () Bool)

(assert (=> b!47066 (=> res!39688 e!31223)))

(assert (=> b!47066 (= res!39688 (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47067 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2293 array!2293 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!47067 (= e!31223 (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (= (and d!13782 res!39687) b!47065))

(assert (= (and b!47065 res!39686) b!47066))

(assert (= (and b!47066 (not res!39688)) b!47067))

(assert (=> b!47065 m!71691))

(assert (=> b!47065 m!71691))

(assert (=> b!47067 m!71691))

(assert (=> b!47067 m!71691))

(declare-fun m!72305 () Bool)

(assert (=> b!47067 m!72305))

(assert (=> b!46732 d!13782))

(declare-fun d!13786 () Bool)

(assert (=> d!13786 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72958 () Unit!3309)

(declare-fun choose!11 (BitStream!1804) Unit!3309)

(assert (=> d!13786 (= lt!72958 (choose!11 thiss!1379))))

(assert (=> d!13786 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!72958)))

(declare-fun bs!3617 () Bool)

(assert (= bs!3617 d!13786))

(assert (=> bs!3617 m!71687))

(declare-fun m!72311 () Bool)

(assert (=> bs!3617 m!72311))

(assert (=> b!46732 d!13786))

(declare-fun d!13792 () Bool)

(declare-fun e!31227 () Bool)

(assert (=> d!13792 e!31227))

(declare-fun res!39693 () Bool)

(assert (=> d!13792 (=> (not res!39693) (not e!31227))))

(declare-fun lt!72961 () (_ BitVec 64))

(declare-fun lt!72962 () (_ BitVec 64))

(declare-fun lt!72964 () (_ BitVec 64))

(assert (=> d!13792 (= res!39693 (= lt!72961 (bvsub lt!72964 lt!72962)))))

(assert (=> d!13792 (or (= (bvand lt!72964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72964 lt!72962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13792 (= lt!72962 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))))))

(declare-fun lt!72960 () (_ BitVec 64))

(declare-fun lt!72963 () (_ BitVec 64))

(assert (=> d!13792 (= lt!72964 (bvmul lt!72960 lt!72963))))

(assert (=> d!13792 (or (= lt!72960 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72963 (bvsdiv (bvmul lt!72960 lt!72963) lt!72960)))))

(assert (=> d!13792 (= lt!72963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13792 (= lt!72960 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))))))

(assert (=> d!13792 (= lt!72961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 thiss!1379))))))

(assert (=> d!13792 (invariant!0 (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379) (size!1036 (buf!1385 thiss!1379)))))

(assert (=> d!13792 (= (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) lt!72961)))

(declare-fun b!47071 () Bool)

(declare-fun res!39692 () Bool)

(assert (=> b!47071 (=> (not res!39692) (not e!31227))))

(assert (=> b!47071 (= res!39692 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72961))))

(declare-fun b!47072 () Bool)

(declare-fun lt!72959 () (_ BitVec 64))

(assert (=> b!47072 (= e!31227 (bvsle lt!72961 (bvmul lt!72959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47072 (or (= lt!72959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72959)))))

(assert (=> b!47072 (= lt!72959 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))))))

(assert (= (and d!13792 res!39693) b!47071))

(assert (= (and b!47071 res!39692) b!47072))

(declare-fun m!72313 () Bool)

(assert (=> d!13792 m!72313))

(declare-fun m!72315 () Bool)

(assert (=> d!13792 m!72315))

(assert (=> b!46732 d!13792))

(declare-fun d!13796 () Bool)

(assert (=> d!13796 (= (array_inv!955 srcBuffer!2) (bvsge (size!1036 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9404 d!13796))

(declare-fun d!13798 () Bool)

(assert (=> d!13798 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379) (size!1036 (buf!1385 thiss!1379))))))

(declare-fun bs!3618 () Bool)

(assert (= bs!3618 d!13798))

(assert (=> bs!3618 m!72315))

(assert (=> start!9404 d!13798))

(declare-fun d!13800 () Bool)

(assert (=> d!13800 (= (tail!229 lt!72269) (t!1293 lt!72269))))

(assert (=> b!46730 d!13800))

(declare-fun d!13802 () Bool)

(declare-fun e!31233 () Bool)

(assert (=> d!13802 e!31233))

(declare-fun res!39696 () Bool)

(assert (=> d!13802 (=> (not res!39696) (not e!31233))))

(declare-fun lt!72970 () (_ BitVec 64))

(assert (=> d!13802 (= res!39696 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!72970) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13802 (= lt!72970 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72969 () Unit!3309)

(declare-fun choose!42 (BitStream!1804 BitStream!1804 BitStream!1804 BitStream!1804 (_ BitVec 64) List!543) Unit!3309)

(assert (=> d!13802 (= lt!72969 (choose!42 (_2!2355 lt!72275) (_2!2355 lt!72275) (_1!2356 lt!72267) (_1!2356 lt!72279) (bvsub to!314 i!635) lt!72269))))

(assert (=> d!13802 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13802 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2355 lt!72275) (_2!2355 lt!72275) (_1!2356 lt!72267) (_1!2356 lt!72279) (bvsub to!314 i!635) lt!72269) lt!72969)))

(declare-fun b!47081 () Bool)

(assert (=> b!47081 (= e!31233 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72279) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!229 lt!72269)))))

(assert (= (and d!13802 res!39696) b!47081))

(declare-fun m!72321 () Bool)

(assert (=> d!13802 m!72321))

(declare-fun m!72323 () Bool)

(assert (=> b!47081 m!72323))

(assert (=> b!47081 m!71723))

(assert (=> b!46730 d!13802))

(declare-fun d!13808 () Bool)

(assert (=> d!13808 (= (invariant!0 (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72275)))) (and (bvsge (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (bvslt (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000001000) (bvsge (currentByte!2890 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72275)))) (and (= (currentBit!2885 (_2!2355 lt!72283)) #b00000000000000000000000000000000) (= (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72275))))))))))

(assert (=> b!46741 d!13808))

(declare-fun d!13810 () Bool)

(declare-fun e!31234 () Bool)

(assert (=> d!13810 e!31234))

(declare-fun res!39698 () Bool)

(assert (=> d!13810 (=> (not res!39698) (not e!31234))))

(declare-fun lt!72973 () (_ BitVec 64))

(declare-fun lt!72976 () (_ BitVec 64))

(declare-fun lt!72974 () (_ BitVec 64))

(assert (=> d!13810 (= res!39698 (= lt!72973 (bvsub lt!72976 lt!72974)))))

(assert (=> d!13810 (or (= (bvand lt!72976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72976 lt!72974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13810 (= lt!72974 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun lt!72972 () (_ BitVec 64))

(declare-fun lt!72975 () (_ BitVec 64))

(assert (=> d!13810 (= lt!72976 (bvmul lt!72972 lt!72975))))

(assert (=> d!13810 (or (= lt!72972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72975 (bvsdiv (bvmul lt!72972 lt!72975) lt!72972)))))

(assert (=> d!13810 (= lt!72975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13810 (= lt!72972 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!13810 (= lt!72973 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!13810 (invariant!0 (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)) (size!1036 (buf!1385 (_2!2355 lt!72283))))))

(assert (=> d!13810 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) lt!72973)))

(declare-fun b!47082 () Bool)

(declare-fun res!39697 () Bool)

(assert (=> b!47082 (=> (not res!39697) (not e!31234))))

(assert (=> b!47082 (= res!39697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72973))))

(declare-fun b!47083 () Bool)

(declare-fun lt!72971 () (_ BitVec 64))

(assert (=> b!47083 (= e!31234 (bvsle lt!72973 (bvmul lt!72971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47083 (or (= lt!72971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72971)))))

(assert (=> b!47083 (= lt!72971 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (= (and d!13810 res!39698) b!47082))

(assert (= (and b!47082 res!39697) b!47083))

(declare-fun m!72325 () Bool)

(assert (=> d!13810 m!72325))

(assert (=> d!13810 m!71697))

(assert (=> b!46739 d!13810))

(declare-fun d!13812 () Bool)

(declare-fun res!39700 () Bool)

(declare-fun e!31236 () Bool)

(assert (=> d!13812 (=> (not res!39700) (not e!31236))))

(assert (=> d!13812 (= res!39700 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!13812 (= (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72275)) e!31236)))

(declare-fun b!47084 () Bool)

(declare-fun res!39699 () Bool)

(assert (=> b!47084 (=> (not res!39699) (not e!31236))))

(assert (=> b!47084 (= res!39699 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47085 () Bool)

(declare-fun e!31235 () Bool)

(assert (=> b!47085 (= e!31236 e!31235)))

(declare-fun res!39701 () Bool)

(assert (=> b!47085 (=> res!39701 e!31235)))

(assert (=> b!47085 (= res!39701 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000))))

(declare-fun b!47086 () Bool)

(assert (=> b!47086 (= e!31235 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (= (and d!13812 res!39700) b!47084))

(assert (= (and b!47084 res!39699) b!47085))

(assert (= (and b!47085 (not res!39701)) b!47086))

(assert (=> b!47084 m!71721))

(assert (=> b!47084 m!71703))

(assert (=> b!47086 m!71721))

(assert (=> b!47086 m!71721))

(declare-fun m!72327 () Bool)

(assert (=> b!47086 m!72327))

(assert (=> b!46729 d!13812))

(declare-fun d!13814 () Bool)

(assert (=> d!13814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72979 () Unit!3309)

(declare-fun choose!9 (BitStream!1804 array!2293 (_ BitVec 64) BitStream!1804) Unit!3309)

(assert (=> d!13814 (= lt!72979 (choose!9 thiss!1379 (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1805 (buf!1385 (_2!2355 lt!72283)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (=> d!13814 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72979)))

(declare-fun bs!3619 () Bool)

(assert (= bs!3619 d!13814))

(assert (=> bs!3619 m!71729))

(declare-fun m!72329 () Bool)

(assert (=> bs!3619 m!72329))

(assert (=> b!46729 d!13814))

(declare-fun d!13816 () Bool)

(declare-fun res!39703 () Bool)

(declare-fun e!31238 () Bool)

(assert (=> d!13816 (=> (not res!39703) (not e!31238))))

(assert (=> d!13816 (= res!39703 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!13816 (= (isPrefixOf!0 thiss!1379 (_2!2355 lt!72275)) e!31238)))

(declare-fun b!47087 () Bool)

(declare-fun res!39702 () Bool)

(assert (=> b!47087 (=> (not res!39702) (not e!31238))))

(assert (=> b!47087 (= res!39702 (bvsle (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47088 () Bool)

(declare-fun e!31237 () Bool)

(assert (=> b!47088 (= e!31238 e!31237)))

(declare-fun res!39704 () Bool)

(assert (=> b!47088 (=> res!39704 e!31237)))

(assert (=> b!47088 (= res!39704 (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47089 () Bool)

(assert (=> b!47089 (= e!31237 (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (= (and d!13816 res!39703) b!47087))

(assert (= (and b!47087 res!39702) b!47088))

(assert (= (and b!47088 (not res!39704)) b!47089))

(assert (=> b!47087 m!71691))

(assert (=> b!47087 m!71703))

(assert (=> b!47089 m!71691))

(assert (=> b!47089 m!71691))

(declare-fun m!72331 () Bool)

(assert (=> b!47089 m!72331))

(assert (=> b!46729 d!13816))

(declare-fun b!47118 () Bool)

(declare-fun e!31254 () Unit!3309)

(declare-fun Unit!3335 () Unit!3309)

(assert (=> b!47118 (= e!31254 Unit!3335)))

(declare-fun b!47119 () Bool)

(declare-fun res!39719 () Bool)

(declare-fun e!31255 () Bool)

(assert (=> b!47119 (=> (not res!39719) (not e!31255))))

(declare-fun lt!73049 () tuple2!4526)

(assert (=> b!47119 (= res!39719 (isPrefixOf!0 (_2!2356 lt!73049) (_2!2355 lt!72283)))))

(declare-fun b!47120 () Bool)

(declare-fun res!39718 () Bool)

(assert (=> b!47120 (=> (not res!39718) (not e!31255))))

(assert (=> b!47120 (= res!39718 (isPrefixOf!0 (_1!2356 lt!73049) thiss!1379))))

(declare-fun b!47121 () Bool)

(declare-fun lt!73035 () Unit!3309)

(assert (=> b!47121 (= e!31254 lt!73035)))

(declare-fun lt!73037 () (_ BitVec 64))

(assert (=> b!47121 (= lt!73037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73046 () (_ BitVec 64))

(assert (=> b!47121 (= lt!73046 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2293 array!2293 (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> b!47121 (= lt!73035 (arrayBitRangesEqSymmetric!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) lt!73037 lt!73046))))

(assert (=> b!47121 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 thiss!1379) lt!73037 lt!73046)))

(declare-fun b!47122 () Bool)

(declare-fun lt!73042 () (_ BitVec 64))

(declare-fun lt!73033 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1804 (_ BitVec 64)) BitStream!1804)

(assert (=> b!47122 (= e!31255 (= (_1!2356 lt!73049) (withMovedBitIndex!0 (_2!2356 lt!73049) (bvsub lt!73042 lt!73033))))))

(assert (=> b!47122 (or (= (bvand lt!73042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73042 lt!73033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47122 (= lt!73033 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> b!47122 (= lt!73042 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun d!13818 () Bool)

(assert (=> d!13818 e!31255))

(declare-fun res!39717 () Bool)

(assert (=> d!13818 (=> (not res!39717) (not e!31255))))

(assert (=> d!13818 (= res!39717 (isPrefixOf!0 (_1!2356 lt!73049) (_2!2356 lt!73049)))))

(declare-fun lt!73048 () BitStream!1804)

(assert (=> d!13818 (= lt!73049 (tuple2!4527 lt!73048 (_2!2355 lt!72283)))))

(declare-fun lt!73041 () Unit!3309)

(declare-fun lt!73032 () Unit!3309)

(assert (=> d!13818 (= lt!73041 lt!73032)))

(assert (=> d!13818 (isPrefixOf!0 lt!73048 (_2!2355 lt!72283))))

(assert (=> d!13818 (= lt!73032 (lemmaIsPrefixTransitive!0 lt!73048 (_2!2355 lt!72283) (_2!2355 lt!72283)))))

(declare-fun lt!73047 () Unit!3309)

(declare-fun lt!73040 () Unit!3309)

(assert (=> d!13818 (= lt!73047 lt!73040)))

(assert (=> d!13818 (isPrefixOf!0 lt!73048 (_2!2355 lt!72283))))

(assert (=> d!13818 (= lt!73040 (lemmaIsPrefixTransitive!0 lt!73048 thiss!1379 (_2!2355 lt!72283)))))

(declare-fun lt!73050 () Unit!3309)

(assert (=> d!13818 (= lt!73050 e!31254)))

(declare-fun c!3222 () Bool)

(assert (=> d!13818 (= c!3222 (not (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!73045 () Unit!3309)

(declare-fun lt!73038 () Unit!3309)

(assert (=> d!13818 (= lt!73045 lt!73038)))

(assert (=> d!13818 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!13818 (= lt!73038 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(declare-fun lt!73043 () Unit!3309)

(declare-fun lt!73039 () Unit!3309)

(assert (=> d!13818 (= lt!73043 lt!73039)))

(assert (=> d!13818 (= lt!73039 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(declare-fun lt!73044 () Unit!3309)

(declare-fun lt!73036 () Unit!3309)

(assert (=> d!13818 (= lt!73044 lt!73036)))

(assert (=> d!13818 (isPrefixOf!0 lt!73048 lt!73048)))

(assert (=> d!13818 (= lt!73036 (lemmaIsPrefixRefl!0 lt!73048))))

(declare-fun lt!73051 () Unit!3309)

(declare-fun lt!73034 () Unit!3309)

(assert (=> d!13818 (= lt!73051 lt!73034)))

(assert (=> d!13818 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13818 (= lt!73034 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13818 (= lt!73048 (BitStream!1805 (buf!1385 (_2!2355 lt!72283)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(assert (=> d!13818 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72283))))

(assert (=> d!13818 (= (reader!0 thiss!1379 (_2!2355 lt!72283)) lt!73049)))

(assert (= (and d!13818 c!3222) b!47121))

(assert (= (and d!13818 (not c!3222)) b!47118))

(assert (= (and d!13818 res!39717) b!47120))

(assert (= (and b!47120 res!39718) b!47119))

(assert (= (and b!47119 res!39719) b!47122))

(declare-fun m!72351 () Bool)

(assert (=> b!47122 m!72351))

(assert (=> b!47122 m!71721))

(assert (=> b!47122 m!71691))

(assert (=> b!47121 m!71691))

(declare-fun m!72353 () Bool)

(assert (=> b!47121 m!72353))

(declare-fun m!72355 () Bool)

(assert (=> b!47121 m!72355))

(declare-fun m!72357 () Bool)

(assert (=> b!47120 m!72357))

(declare-fun m!72359 () Bool)

(assert (=> d!13818 m!72359))

(declare-fun m!72361 () Bool)

(assert (=> d!13818 m!72361))

(declare-fun m!72363 () Bool)

(assert (=> d!13818 m!72363))

(declare-fun m!72365 () Bool)

(assert (=> d!13818 m!72365))

(declare-fun m!72367 () Bool)

(assert (=> d!13818 m!72367))

(declare-fun m!72369 () Bool)

(assert (=> d!13818 m!72369))

(assert (=> d!13818 m!71687))

(declare-fun m!72371 () Bool)

(assert (=> d!13818 m!72371))

(declare-fun m!72373 () Bool)

(assert (=> d!13818 m!72373))

(assert (=> d!13818 m!71689))

(assert (=> d!13818 m!71685))

(declare-fun m!72375 () Bool)

(assert (=> b!47119 m!72375))

(assert (=> b!46729 d!13818))

(declare-fun b!47198 () Bool)

(declare-fun res!39779 () Bool)

(declare-fun e!31293 () Bool)

(assert (=> b!47198 (=> (not res!39779) (not e!31293))))

(declare-fun lt!73285 () tuple2!4524)

(assert (=> b!47198 (= res!39779 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!73285)))))))

(declare-fun d!13832 () Bool)

(assert (=> d!13832 e!31293))

(declare-fun res!39778 () Bool)

(assert (=> d!13832 (=> (not res!39778) (not e!31293))))

(declare-fun lt!73287 () (_ BitVec 64))

(assert (=> d!13832 (= res!39778 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73285))) (currentByte!2890 (_2!2355 lt!73285)) (currentBit!2885 (_2!2355 lt!73285))) (bvsub lt!73287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13832 (or (= (bvand lt!73287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73303 () (_ BitVec 64))

(assert (=> d!13832 (= lt!73287 (bvadd lt!73303 to!314))))

(assert (=> d!13832 (or (not (= (bvand lt!73303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73303 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13832 (= lt!73303 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun e!31294 () tuple2!4524)

(assert (=> d!13832 (= lt!73285 e!31294)))

(declare-fun c!3231 () Bool)

(assert (=> d!13832 (= c!3231 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!73277 () Unit!3309)

(declare-fun lt!73276 () Unit!3309)

(assert (=> d!13832 (= lt!73277 lt!73276)))

(assert (=> d!13832 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!13832 (= lt!73276 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(declare-fun lt!73279 () (_ BitVec 64))

(assert (=> d!13832 (= lt!73279 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> d!13832 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13832 (= (appendBitsMSBFirstLoop!0 (_2!2355 lt!72283) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!73285)))

(declare-fun b!47199 () Bool)

(declare-fun e!31292 () Bool)

(declare-fun lt!73300 () (_ BitVec 64))

(assert (=> b!47199 (= e!31292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73300))))

(declare-fun b!47200 () Bool)

(declare-fun res!39783 () Bool)

(assert (=> b!47200 (=> (not res!39783) (not e!31293))))

(assert (=> b!47200 (= res!39783 (= (size!1036 (buf!1385 (_2!2355 lt!73285))) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(declare-fun b!47201 () Bool)

(declare-fun res!39780 () Bool)

(assert (=> b!47201 (=> (not res!39780) (not e!31293))))

(assert (=> b!47201 (= res!39780 (invariant!0 (currentBit!2885 (_2!2355 lt!73285)) (currentByte!2890 (_2!2355 lt!73285)) (size!1036 (buf!1385 (_2!2355 lt!73285)))))))

(declare-fun b!47202 () Bool)

(declare-fun Unit!3336 () Unit!3309)

(assert (=> b!47202 (= e!31294 (tuple2!4525 Unit!3336 (_2!2355 lt!72283)))))

(assert (=> b!47202 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!72283))))))

(declare-fun lt!73302 () Unit!3309)

(declare-fun Unit!3337 () Unit!3309)

(assert (=> b!47202 (= lt!73302 Unit!3337)))

(declare-fun call!571 () tuple2!4526)

(declare-fun checkByteArrayBitContent!0 (BitStream!1804 array!2293 array!2293 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4556 0))(
  ( (tuple2!4557 (_1!2371 array!2293) (_2!2371 BitStream!1804)) )
))
(declare-fun readBits!0 (BitStream!1804 (_ BitVec 64)) tuple2!4556)

(assert (=> b!47202 (checkByteArrayBitContent!0 (_2!2355 lt!72283) srcBuffer!2 (_1!2371 (readBits!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!47203 () Bool)

(declare-fun lt!73264 () tuple2!4524)

(declare-fun Unit!3338 () Unit!3309)

(assert (=> b!47203 (= e!31294 (tuple2!4525 Unit!3338 (_2!2355 lt!73264)))))

(declare-fun lt!73293 () tuple2!4524)

(assert (=> b!47203 (= lt!73293 (appendBitFromByte!0 (_2!2355 lt!72283) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!73292 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73292 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!73298 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73298 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73274 () Unit!3309)

(assert (=> b!47203 (= lt!73274 (validateOffsetBitsIneqLemma!0 (_2!2355 lt!72283) (_2!2355 lt!73293) lt!73292 lt!73298))))

(assert (=> b!47203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) (bvsub lt!73292 lt!73298))))

(declare-fun lt!73284 () Unit!3309)

(assert (=> b!47203 (= lt!73284 lt!73274)))

(declare-fun lt!73280 () tuple2!4526)

(assert (=> b!47203 (= lt!73280 (reader!0 (_2!2355 lt!72283) (_2!2355 lt!73293)))))

(declare-fun lt!73304 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73294 () Unit!3309)

(assert (=> b!47203 (= lt!73294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73293)) lt!73304))))

(assert (=> b!47203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73304)))

(declare-fun lt!73297 () Unit!3309)

(assert (=> b!47203 (= lt!73297 lt!73294)))

(assert (=> b!47203 (= (head!362 (byteArrayBitContentToList!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!362 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73293) (_1!2356 lt!73280) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73271 () Unit!3309)

(declare-fun Unit!3339 () Unit!3309)

(assert (=> b!47203 (= lt!73271 Unit!3339)))

(assert (=> b!47203 (= lt!73264 (appendBitsMSBFirstLoop!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!73295 () Unit!3309)

(assert (=> b!47203 (= lt!73295 (lemmaIsPrefixTransitive!0 (_2!2355 lt!72283) (_2!2355 lt!73293) (_2!2355 lt!73264)))))

(assert (=> b!47203 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73264))))

(declare-fun lt!73286 () Unit!3309)

(assert (=> b!47203 (= lt!73286 lt!73295)))

(assert (=> b!47203 (= (size!1036 (buf!1385 (_2!2355 lt!73264))) (size!1036 (buf!1385 (_2!2355 lt!72283))))))

(declare-fun lt!73266 () Unit!3309)

(declare-fun Unit!3340 () Unit!3309)

(assert (=> b!47203 (= lt!73266 Unit!3340)))

(assert (=> b!47203 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73264))) (currentByte!2890 (_2!2355 lt!73264)) (currentBit!2885 (_2!2355 lt!73264))) (bvsub (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!73267 () Unit!3309)

(declare-fun Unit!3341 () Unit!3309)

(assert (=> b!47203 (= lt!73267 Unit!3341)))

(assert (=> b!47203 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73264))) (currentByte!2890 (_2!2355 lt!73264)) (currentBit!2885 (_2!2355 lt!73264))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73296 () Unit!3309)

(declare-fun Unit!3342 () Unit!3309)

(assert (=> b!47203 (= lt!73296 Unit!3342)))

(declare-fun lt!73306 () tuple2!4526)

(assert (=> b!47203 (= lt!73306 call!571)))

(declare-fun lt!73270 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73270 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!73278 () Unit!3309)

(assert (=> b!47203 (= lt!73278 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73264)) lt!73270))))

(assert (=> b!47203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73270)))

(declare-fun lt!73273 () Unit!3309)

(assert (=> b!47203 (= lt!73273 lt!73278)))

(declare-fun lt!73275 () tuple2!4526)

(assert (=> b!47203 (= lt!73275 (reader!0 (_2!2355 lt!73293) (_2!2355 lt!73264)))))

(declare-fun lt!73268 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73268 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73263 () Unit!3309)

(assert (=> b!47203 (= lt!73263 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73264)) lt!73268))))

(assert (=> b!47203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73268)))

(declare-fun lt!73288 () Unit!3309)

(assert (=> b!47203 (= lt!73288 lt!73263)))

(declare-fun lt!73281 () List!543)

(assert (=> b!47203 (= lt!73281 (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!73269 () List!543)

(assert (=> b!47203 (= lt!73269 (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73282 () List!543)

(assert (=> b!47203 (= lt!73282 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73306) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!73289 () List!543)

(assert (=> b!47203 (= lt!73289 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73275) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73265 () (_ BitVec 64))

(assert (=> b!47203 (= lt!73265 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!73272 () Unit!3309)

(assert (=> b!47203 (= lt!73272 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2355 lt!73264) (_2!2355 lt!73264) (_1!2356 lt!73306) (_1!2356 lt!73275) lt!73265 lt!73282))))

(assert (=> b!47203 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73275) (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!229 lt!73282))))

(declare-fun lt!73291 () Unit!3309)

(assert (=> b!47203 (= lt!73291 lt!73272)))

(declare-fun lt!73305 () Unit!3309)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2293 array!2293 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> b!47203 (= lt!73305 (arrayBitRangesEqImpliesEq!0 (buf!1385 (_2!2355 lt!73293)) (buf!1385 (_2!2355 lt!73264)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!73279 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293)))))))

(assert (=> b!47203 (= (bitAt!0 (buf!1385 (_2!2355 lt!73293)) lt!73279) (bitAt!0 (buf!1385 (_2!2355 lt!73264)) lt!73279))))

(declare-fun lt!73290 () Unit!3309)

(assert (=> b!47203 (= lt!73290 lt!73305)))

(declare-fun lt!73301 () tuple2!4526)

(declare-fun b!47204 () Bool)

(assert (=> b!47204 (= e!31293 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73285) (_1!2356 lt!73301) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2355 lt!73285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!47204 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47204 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73283 () Unit!3309)

(declare-fun lt!73299 () Unit!3309)

(assert (=> b!47204 (= lt!73283 lt!73299)))

(assert (=> b!47204 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73300)))

(assert (=> b!47204 (= lt!73299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73285)) lt!73300))))

(assert (=> b!47204 e!31292))

(declare-fun res!39782 () Bool)

(assert (=> b!47204 (=> (not res!39782) (not e!31292))))

(assert (=> b!47204 (= res!39782 (and (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!73285)))) (bvsge lt!73300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47204 (= lt!73300 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!47204 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47204 (= lt!73301 (reader!0 (_2!2355 lt!72283) (_2!2355 lt!73285)))))

(declare-fun b!47205 () Bool)

(declare-fun res!39781 () Bool)

(assert (=> b!47205 (=> (not res!39781) (not e!31293))))

(assert (=> b!47205 (= res!39781 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73285)))))

(declare-fun bm!568 () Bool)

(assert (=> bm!568 (= call!571 (reader!0 (_2!2355 lt!72283) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(assert (= (and d!13832 c!3231) b!47203))

(assert (= (and d!13832 (not c!3231)) b!47202))

(assert (= (or b!47203 b!47202) bm!568))

(assert (= (and d!13832 res!39778) b!47201))

(assert (= (and b!47201 res!39780) b!47198))

(assert (= (and b!47198 res!39779) b!47205))

(assert (= (and b!47205 res!39781) b!47200))

(assert (= (and b!47200 res!39783) b!47204))

(assert (= (and b!47204 res!39782) b!47199))

(declare-fun m!72495 () Bool)

(assert (=> b!47202 m!72495))

(declare-fun m!72497 () Bool)

(assert (=> b!47202 m!72497))

(declare-fun m!72499 () Bool)

(assert (=> b!47205 m!72499))

(declare-fun m!72501 () Bool)

(assert (=> bm!568 m!72501))

(declare-fun m!72503 () Bool)

(assert (=> b!47199 m!72503))

(declare-fun m!72505 () Bool)

(assert (=> b!47201 m!72505))

(declare-fun m!72507 () Bool)

(assert (=> d!13832 m!72507))

(assert (=> d!13832 m!71721))

(assert (=> d!13832 m!72361))

(assert (=> d!13832 m!72369))

(declare-fun m!72509 () Bool)

(assert (=> b!47203 m!72509))

(declare-fun m!72511 () Bool)

(assert (=> b!47203 m!72511))

(declare-fun m!72513 () Bool)

(assert (=> b!47203 m!72513))

(declare-fun m!72515 () Bool)

(assert (=> b!47203 m!72515))

(declare-fun m!72517 () Bool)

(assert (=> b!47203 m!72517))

(declare-fun m!72519 () Bool)

(assert (=> b!47203 m!72519))

(declare-fun m!72521 () Bool)

(assert (=> b!47203 m!72521))

(assert (=> b!47203 m!71721))

(assert (=> b!47203 m!72513))

(declare-fun m!72523 () Bool)

(assert (=> b!47203 m!72523))

(declare-fun m!72525 () Bool)

(assert (=> b!47203 m!72525))

(declare-fun m!72527 () Bool)

(assert (=> b!47203 m!72527))

(declare-fun m!72529 () Bool)

(assert (=> b!47203 m!72529))

(assert (=> b!47203 m!72515))

(declare-fun m!72531 () Bool)

(assert (=> b!47203 m!72531))

(declare-fun m!72533 () Bool)

(assert (=> b!47203 m!72533))

(declare-fun m!72535 () Bool)

(assert (=> b!47203 m!72535))

(declare-fun m!72537 () Bool)

(assert (=> b!47203 m!72537))

(assert (=> b!47203 m!72537))

(declare-fun m!72539 () Bool)

(assert (=> b!47203 m!72539))

(declare-fun m!72541 () Bool)

(assert (=> b!47203 m!72541))

(declare-fun m!72543 () Bool)

(assert (=> b!47203 m!72543))

(declare-fun m!72545 () Bool)

(assert (=> b!47203 m!72545))

(declare-fun m!72547 () Bool)

(assert (=> b!47203 m!72547))

(assert (=> b!47203 m!72525))

(declare-fun m!72549 () Bool)

(assert (=> b!47203 m!72549))

(declare-fun m!72551 () Bool)

(assert (=> b!47203 m!72551))

(declare-fun m!72553 () Bool)

(assert (=> b!47203 m!72553))

(declare-fun m!72555 () Bool)

(assert (=> b!47203 m!72555))

(declare-fun m!72557 () Bool)

(assert (=> b!47203 m!72557))

(declare-fun m!72559 () Bool)

(assert (=> b!47203 m!72559))

(declare-fun m!72561 () Bool)

(assert (=> b!47203 m!72561))

(declare-fun m!72563 () Bool)

(assert (=> b!47203 m!72563))

(declare-fun m!72565 () Bool)

(assert (=> b!47203 m!72565))

(declare-fun m!72567 () Bool)

(assert (=> b!47203 m!72567))

(declare-fun m!72569 () Bool)

(assert (=> b!47203 m!72569))

(declare-fun m!72571 () Bool)

(assert (=> b!47204 m!72571))

(declare-fun m!72573 () Bool)

(assert (=> b!47204 m!72573))

(declare-fun m!72575 () Bool)

(assert (=> b!47204 m!72575))

(declare-fun m!72577 () Bool)

(assert (=> b!47204 m!72577))

(declare-fun m!72579 () Bool)

(assert (=> b!47204 m!72579))

(assert (=> b!46729 d!13832))

(declare-fun d!13882 () Bool)

(assert (=> d!13882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3632 () Bool)

(assert (= bs!3632 d!13882))

(declare-fun m!72581 () Bool)

(assert (=> bs!3632 m!72581))

(assert (=> b!46729 d!13882))

(declare-fun d!13884 () Bool)

(assert (=> d!13884 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72275))))

(declare-fun lt!73309 () Unit!3309)

(declare-fun choose!30 (BitStream!1804 BitStream!1804 BitStream!1804) Unit!3309)

(assert (=> d!13884 (= lt!73309 (choose!30 thiss!1379 (_2!2355 lt!72283) (_2!2355 lt!72275)))))

(assert (=> d!13884 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72283))))

(assert (=> d!13884 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2355 lt!72283) (_2!2355 lt!72275)) lt!73309)))

(declare-fun bs!3633 () Bool)

(assert (= bs!3633 d!13884))

(assert (=> bs!3633 m!71737))

(declare-fun m!72583 () Bool)

(assert (=> bs!3633 m!72583))

(assert (=> bs!3633 m!71685))

(assert (=> b!46729 d!13884))

(declare-fun d!13886 () Bool)

(assert (=> d!13886 (= (bitAt!0 (buf!1385 (_1!2356 lt!72279)) lt!72274) (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) ((_ extract 31 0) (bvsdiv lt!72274 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72274 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3634 () Bool)

(assert (= bs!3634 d!13886))

(declare-fun m!72585 () Bool)

(assert (=> bs!3634 m!72585))

(declare-fun m!72587 () Bool)

(assert (=> bs!3634 m!72587))

(assert (=> b!46738 d!13886))

(declare-fun d!13888 () Bool)

(assert (=> d!13888 (= (bitAt!0 (buf!1385 (_1!2356 lt!72267)) lt!72274) (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) ((_ extract 31 0) (bvsdiv lt!72274 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72274 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3635 () Bool)

(assert (= bs!3635 d!13888))

(declare-fun m!72589 () Bool)

(assert (=> bs!3635 m!72589))

(assert (=> bs!3635 m!72587))

(assert (=> b!46738 d!13888))

(declare-fun d!13890 () Bool)

(assert (=> d!13890 (= (array_inv!955 (buf!1385 thiss!1379)) (bvsge (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46727 d!13890))

(declare-fun d!13892 () Bool)

(declare-fun size!1041 (List!543) Int)

(assert (=> d!13892 (= (length!238 lt!72269) (size!1041 lt!72269))))

(declare-fun bs!3636 () Bool)

(assert (= bs!3636 d!13892))

(declare-fun m!72591 () Bool)

(assert (=> bs!3636 m!72591))

(assert (=> b!46728 d!13892))

(declare-fun d!13894 () Bool)

(declare-fun res!39785 () Bool)

(declare-fun e!31296 () Bool)

(assert (=> d!13894 (=> (not res!39785) (not e!31296))))

(assert (=> d!13894 (= res!39785 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!13894 (= (isPrefixOf!0 thiss!1379 (_2!2355 lt!72283)) e!31296)))

(declare-fun b!47206 () Bool)

(declare-fun res!39784 () Bool)

(assert (=> b!47206 (=> (not res!39784) (not e!31296))))

(assert (=> b!47206 (= res!39784 (bvsle (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47207 () Bool)

(declare-fun e!31295 () Bool)

(assert (=> b!47207 (= e!31296 e!31295)))

(declare-fun res!39786 () Bool)

(assert (=> b!47207 (=> res!39786 e!31295)))

(assert (=> b!47207 (= res!39786 (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47208 () Bool)

(assert (=> b!47208 (= e!31295 (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (= (and d!13894 res!39785) b!47206))

(assert (= (and b!47206 res!39784) b!47207))

(assert (= (and b!47207 (not res!39786)) b!47208))

(assert (=> b!47206 m!71691))

(assert (=> b!47206 m!71721))

(assert (=> b!47208 m!71691))

(assert (=> b!47208 m!71691))

(declare-fun m!72593 () Bool)

(assert (=> b!47208 m!72593))

(assert (=> b!46737 d!13894))

(declare-fun d!13896 () Bool)

(assert (=> d!13896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!72277))))

(declare-fun bs!3637 () Bool)

(assert (= bs!3637 d!13896))

(assert (=> bs!3637 m!72325))

(assert (=> b!46737 d!13896))

(declare-fun d!13898 () Bool)

(declare-fun e!31299 () Bool)

(assert (=> d!13898 e!31299))

(declare-fun res!39789 () Bool)

(assert (=> d!13898 (=> (not res!39789) (not e!31299))))

(assert (=> d!13898 (= res!39789 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!73312 () Unit!3309)

(declare-fun choose!27 (BitStream!1804 BitStream!1804 (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> d!13898 (= lt!73312 (choose!27 thiss!1379 (_2!2355 lt!72283) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13898 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13898 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2355 lt!72283) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73312)))

(declare-fun b!47211 () Bool)

(assert (=> b!47211 (= e!31299 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13898 res!39789) b!47211))

(declare-fun m!72595 () Bool)

(assert (=> d!13898 m!72595))

(declare-fun m!72597 () Bool)

(assert (=> b!47211 m!72597))

(assert (=> b!46737 d!13898))

(declare-fun b!47229 () Bool)

(declare-fun res!39807 () Bool)

(declare-fun e!31308 () Bool)

(assert (=> b!47229 (=> (not res!39807) (not e!31308))))

(declare-fun lt!73340 () tuple2!4524)

(assert (=> b!47229 (= res!39807 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73340))) (currentByte!2890 (_2!2355 lt!73340)) (currentBit!2885 (_2!2355 lt!73340))) (bvadd (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47230 () Bool)

(declare-fun e!31309 () Bool)

(declare-fun e!31310 () Bool)

(assert (=> b!47230 (= e!31309 e!31310)))

(declare-fun res!39809 () Bool)

(assert (=> b!47230 (=> (not res!39809) (not e!31310))))

(declare-datatypes ((tuple2!4558 0))(
  ( (tuple2!4559 (_1!2372 BitStream!1804) (_2!2372 Bool)) )
))
(declare-fun lt!73345 () tuple2!4558)

(declare-fun lt!73346 () (_ BitVec 8))

(declare-fun lt!73344 () tuple2!4524)

(assert (=> b!47230 (= res!39809 (and (= (_2!2372 lt!73345) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!73346)) #b00000000000000000000000000000000))) (= (_1!2372 lt!73345) (_2!2355 lt!73344))))))

(declare-fun lt!73341 () tuple2!4556)

(declare-fun lt!73338 () BitStream!1804)

(assert (=> b!47230 (= lt!73341 (readBits!0 lt!73338 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1804) tuple2!4558)

(assert (=> b!47230 (= lt!73345 (readBitPure!0 lt!73338))))

(declare-fun readerFrom!0 (BitStream!1804 (_ BitVec 32) (_ BitVec 32)) BitStream!1804)

(assert (=> b!47230 (= lt!73338 (readerFrom!0 (_2!2355 lt!73344) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379)))))

(declare-fun b!47231 () Bool)

(assert (=> b!47231 (= e!31310 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73345))) (currentByte!2890 (_1!2372 lt!73345)) (currentBit!2885 (_1!2372 lt!73345))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73344))) (currentByte!2890 (_2!2355 lt!73344)) (currentBit!2885 (_2!2355 lt!73344)))))))

(declare-fun b!47232 () Bool)

(declare-fun res!39810 () Bool)

(assert (=> b!47232 (=> (not res!39810) (not e!31309))))

(declare-fun lt!73337 () (_ BitVec 64))

(declare-fun lt!73347 () (_ BitVec 64))

(assert (=> b!47232 (= res!39810 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73344))) (currentByte!2890 (_2!2355 lt!73344)) (currentBit!2885 (_2!2355 lt!73344))) (bvadd lt!73347 lt!73337)))))

(assert (=> b!47232 (or (not (= (bvand lt!73347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73337 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73347 lt!73337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47232 (= lt!73337 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47232 (= lt!73347 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun b!47233 () Bool)

(declare-fun e!31311 () Bool)

(declare-fun lt!73343 () tuple2!4558)

(assert (=> b!47233 (= e!31311 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73343))) (currentByte!2890 (_1!2372 lt!73343)) (currentBit!2885 (_1!2372 lt!73343))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73340))) (currentByte!2890 (_2!2355 lt!73340)) (currentBit!2885 (_2!2355 lt!73340)))))))

(declare-fun b!47234 () Bool)

(declare-fun res!39808 () Bool)

(assert (=> b!47234 (=> (not res!39808) (not e!31308))))

(assert (=> b!47234 (= res!39808 (isPrefixOf!0 thiss!1379 (_2!2355 lt!73340)))))

(declare-fun d!13900 () Bool)

(assert (=> d!13900 e!31309))

(declare-fun res!39806 () Bool)

(assert (=> d!13900 (=> (not res!39806) (not e!31309))))

(assert (=> d!13900 (= res!39806 (= (size!1036 (buf!1385 (_2!2355 lt!73344))) (size!1036 (buf!1385 thiss!1379))))))

(declare-fun lt!73339 () array!2293)

(assert (=> d!13900 (= lt!73346 (select (arr!1556 lt!73339) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13900 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1036 lt!73339)))))

(assert (=> d!13900 (= lt!73339 (array!2294 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!73348 () tuple2!4524)

(assert (=> d!13900 (= lt!73344 (tuple2!4525 (_1!2355 lt!73348) (_2!2355 lt!73348)))))

(assert (=> d!13900 (= lt!73348 lt!73340)))

(assert (=> d!13900 e!31308))

(declare-fun res!39813 () Bool)

(assert (=> d!13900 (=> (not res!39813) (not e!31308))))

(assert (=> d!13900 (= res!39813 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(declare-fun lt!73342 () Bool)

(declare-fun appendBit!0 (BitStream!1804 Bool) tuple2!4524)

(assert (=> d!13900 (= lt!73340 (appendBit!0 thiss!1379 lt!73342))))

(assert (=> d!13900 (= lt!73342 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13900 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13900 (= (appendBitFromByte!0 thiss!1379 (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!73344)))

(declare-fun b!47235 () Bool)

(declare-fun res!39811 () Bool)

(assert (=> b!47235 (=> (not res!39811) (not e!31309))))

(assert (=> b!47235 (= res!39811 (isPrefixOf!0 thiss!1379 (_2!2355 lt!73344)))))

(declare-fun b!47236 () Bool)

(assert (=> b!47236 (= e!31308 e!31311)))

(declare-fun res!39812 () Bool)

(assert (=> b!47236 (=> (not res!39812) (not e!31311))))

(assert (=> b!47236 (= res!39812 (and (= (_2!2372 lt!73343) lt!73342) (= (_1!2372 lt!73343) (_2!2355 lt!73340))))))

(assert (=> b!47236 (= lt!73343 (readBitPure!0 (readerFrom!0 (_2!2355 lt!73340) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379))))))

(assert (= (and d!13900 res!39813) b!47229))

(assert (= (and b!47229 res!39807) b!47234))

(assert (= (and b!47234 res!39808) b!47236))

(assert (= (and b!47236 res!39812) b!47233))

(assert (= (and d!13900 res!39806) b!47232))

(assert (= (and b!47232 res!39810) b!47235))

(assert (= (and b!47235 res!39811) b!47230))

(assert (= (and b!47230 res!39809) b!47231))

(declare-fun m!72599 () Bool)

(assert (=> b!47231 m!72599))

(declare-fun m!72601 () Bool)

(assert (=> b!47231 m!72601))

(declare-fun m!72603 () Bool)

(assert (=> b!47235 m!72603))

(declare-fun m!72605 () Bool)

(assert (=> d!13900 m!72605))

(declare-fun m!72607 () Bool)

(assert (=> d!13900 m!72607))

(assert (=> d!13900 m!72201))

(declare-fun m!72609 () Bool)

(assert (=> b!47234 m!72609))

(declare-fun m!72611 () Bool)

(assert (=> b!47236 m!72611))

(assert (=> b!47236 m!72611))

(declare-fun m!72613 () Bool)

(assert (=> b!47236 m!72613))

(declare-fun m!72615 () Bool)

(assert (=> b!47229 m!72615))

(assert (=> b!47229 m!71691))

(declare-fun m!72617 () Bool)

(assert (=> b!47230 m!72617))

(declare-fun m!72619 () Bool)

(assert (=> b!47230 m!72619))

(declare-fun m!72621 () Bool)

(assert (=> b!47230 m!72621))

(declare-fun m!72623 () Bool)

(assert (=> b!47233 m!72623))

(assert (=> b!47233 m!72615))

(assert (=> b!47232 m!72601))

(assert (=> b!47232 m!71691))

(assert (=> b!46737 d!13900))

(declare-fun b!47239 () Bool)

(declare-fun e!31313 () Bool)

(declare-fun lt!73351 () List!543)

(assert (=> b!47239 (= e!31313 (isEmpty!139 lt!73351))))

(declare-fun b!47237 () Bool)

(declare-fun e!31312 () tuple2!4552)

(assert (=> b!47237 (= e!31312 (tuple2!4553 Nil!540 (_1!2356 lt!72279)))))

(declare-fun d!13902 () Bool)

(assert (=> d!13902 e!31313))

(declare-fun c!3232 () Bool)

(assert (=> d!13902 (= c!3232 (= lt!72277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13902 (= lt!73351 (_1!2369 e!31312))))

(declare-fun c!3233 () Bool)

(assert (=> d!13902 (= c!3233 (= lt!72277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13902 (bvsge lt!72277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13902 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72279) lt!72277) lt!73351)))

(declare-fun b!47240 () Bool)

(assert (=> b!47240 (= e!31313 (> (length!238 lt!73351) 0))))

(declare-fun lt!73350 () (_ BitVec 64))

(declare-fun b!47238 () Bool)

(declare-fun lt!73349 () tuple2!4554)

(assert (=> b!47238 (= e!31312 (tuple2!4553 (Cons!539 (_1!2370 lt!73349) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!73349) (bvsub lt!72277 lt!73350))) (_2!2370 lt!73349)))))

(assert (=> b!47238 (= lt!73349 (readBit!0 (_1!2356 lt!72279)))))

(assert (=> b!47238 (= lt!73350 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13902 c!3233) b!47237))

(assert (= (and d!13902 (not c!3233)) b!47238))

(assert (= (and d!13902 c!3232) b!47239))

(assert (= (and d!13902 (not c!3232)) b!47240))

(declare-fun m!72625 () Bool)

(assert (=> b!47239 m!72625))

(declare-fun m!72627 () Bool)

(assert (=> b!47240 m!72627))

(declare-fun m!72629 () Bool)

(assert (=> b!47238 m!72629))

(declare-fun m!72631 () Bool)

(assert (=> b!47238 m!72631))

(assert (=> b!46735 d!13902))

(declare-fun b!47241 () Bool)

(declare-fun e!31314 () Unit!3309)

(declare-fun Unit!3343 () Unit!3309)

(assert (=> b!47241 (= e!31314 Unit!3343)))

(declare-fun b!47242 () Bool)

(declare-fun res!39816 () Bool)

(declare-fun e!31315 () Bool)

(assert (=> b!47242 (=> (not res!39816) (not e!31315))))

(declare-fun lt!73369 () tuple2!4526)

(assert (=> b!47242 (= res!39816 (isPrefixOf!0 (_2!2356 lt!73369) (_2!2355 lt!72275)))))

(declare-fun b!47243 () Bool)

(declare-fun res!39815 () Bool)

(assert (=> b!47243 (=> (not res!39815) (not e!31315))))

(assert (=> b!47243 (= res!39815 (isPrefixOf!0 (_1!2356 lt!73369) (_2!2355 lt!72283)))))

(declare-fun b!47244 () Bool)

(declare-fun lt!73355 () Unit!3309)

(assert (=> b!47244 (= e!31314 lt!73355)))

(declare-fun lt!73357 () (_ BitVec 64))

(assert (=> b!47244 (= lt!73357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73366 () (_ BitVec 64))

(assert (=> b!47244 (= lt!73366 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> b!47244 (= lt!73355 (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) lt!73357 lt!73366))))

(assert (=> b!47244 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 (_2!2355 lt!72283)) lt!73357 lt!73366)))

(declare-fun lt!73362 () (_ BitVec 64))

(declare-fun b!47245 () Bool)

(declare-fun lt!73353 () (_ BitVec 64))

(assert (=> b!47245 (= e!31315 (= (_1!2356 lt!73369) (withMovedBitIndex!0 (_2!2356 lt!73369) (bvsub lt!73362 lt!73353))))))

(assert (=> b!47245 (or (= (bvand lt!73362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73362 lt!73353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47245 (= lt!73353 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275))))))

(assert (=> b!47245 (= lt!73362 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun d!13904 () Bool)

(assert (=> d!13904 e!31315))

(declare-fun res!39814 () Bool)

(assert (=> d!13904 (=> (not res!39814) (not e!31315))))

(assert (=> d!13904 (= res!39814 (isPrefixOf!0 (_1!2356 lt!73369) (_2!2356 lt!73369)))))

(declare-fun lt!73368 () BitStream!1804)

(assert (=> d!13904 (= lt!73369 (tuple2!4527 lt!73368 (_2!2355 lt!72275)))))

(declare-fun lt!73361 () Unit!3309)

(declare-fun lt!73352 () Unit!3309)

(assert (=> d!13904 (= lt!73361 lt!73352)))

(assert (=> d!13904 (isPrefixOf!0 lt!73368 (_2!2355 lt!72275))))

(assert (=> d!13904 (= lt!73352 (lemmaIsPrefixTransitive!0 lt!73368 (_2!2355 lt!72275) (_2!2355 lt!72275)))))

(declare-fun lt!73367 () Unit!3309)

(declare-fun lt!73360 () Unit!3309)

(assert (=> d!13904 (= lt!73367 lt!73360)))

(assert (=> d!13904 (isPrefixOf!0 lt!73368 (_2!2355 lt!72275))))

(assert (=> d!13904 (= lt!73360 (lemmaIsPrefixTransitive!0 lt!73368 (_2!2355 lt!72283) (_2!2355 lt!72275)))))

(declare-fun lt!73370 () Unit!3309)

(assert (=> d!13904 (= lt!73370 e!31314)))

(declare-fun c!3234 () Bool)

(assert (=> d!13904 (= c!3234 (not (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000)))))

(declare-fun lt!73365 () Unit!3309)

(declare-fun lt!73358 () Unit!3309)

(assert (=> d!13904 (= lt!73365 lt!73358)))

(assert (=> d!13904 (isPrefixOf!0 (_2!2355 lt!72275) (_2!2355 lt!72275))))

(assert (=> d!13904 (= lt!73358 (lemmaIsPrefixRefl!0 (_2!2355 lt!72275)))))

(declare-fun lt!73363 () Unit!3309)

(declare-fun lt!73359 () Unit!3309)

(assert (=> d!13904 (= lt!73363 lt!73359)))

(assert (=> d!13904 (= lt!73359 (lemmaIsPrefixRefl!0 (_2!2355 lt!72275)))))

(declare-fun lt!73364 () Unit!3309)

(declare-fun lt!73356 () Unit!3309)

(assert (=> d!13904 (= lt!73364 lt!73356)))

(assert (=> d!13904 (isPrefixOf!0 lt!73368 lt!73368)))

(assert (=> d!13904 (= lt!73356 (lemmaIsPrefixRefl!0 lt!73368))))

(declare-fun lt!73371 () Unit!3309)

(declare-fun lt!73354 () Unit!3309)

(assert (=> d!13904 (= lt!73371 lt!73354)))

(assert (=> d!13904 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!13904 (= lt!73354 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(assert (=> d!13904 (= lt!73368 (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> d!13904 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72275))))

(assert (=> d!13904 (= (reader!0 (_2!2355 lt!72283) (_2!2355 lt!72275)) lt!73369)))

(assert (= (and d!13904 c!3234) b!47244))

(assert (= (and d!13904 (not c!3234)) b!47241))

(assert (= (and d!13904 res!39814) b!47243))

(assert (= (and b!47243 res!39815) b!47242))

(assert (= (and b!47242 res!39816) b!47245))

(declare-fun m!72633 () Bool)

(assert (=> b!47245 m!72633))

(assert (=> b!47245 m!71703))

(assert (=> b!47245 m!71721))

(assert (=> b!47244 m!71721))

(declare-fun m!72635 () Bool)

(assert (=> b!47244 m!72635))

(declare-fun m!72637 () Bool)

(assert (=> b!47244 m!72637))

(declare-fun m!72639 () Bool)

(assert (=> b!47243 m!72639))

(declare-fun m!72641 () Bool)

(assert (=> d!13904 m!72641))

(declare-fun m!72643 () Bool)

(assert (=> d!13904 m!72643))

(declare-fun m!72645 () Bool)

(assert (=> d!13904 m!72645))

(declare-fun m!72647 () Bool)

(assert (=> d!13904 m!72647))

(declare-fun m!72649 () Bool)

(assert (=> d!13904 m!72649))

(declare-fun m!72651 () Bool)

(assert (=> d!13904 m!72651))

(assert (=> d!13904 m!72361))

(declare-fun m!72653 () Bool)

(assert (=> d!13904 m!72653))

(declare-fun m!72655 () Bool)

(assert (=> d!13904 m!72655))

(assert (=> d!13904 m!72369))

(assert (=> d!13904 m!71735))

(declare-fun m!72657 () Bool)

(assert (=> b!47242 m!72657))

(assert (=> b!46735 d!13904))

(declare-fun d!13906 () Bool)

(assert (=> d!13906 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277)))

(declare-fun lt!73372 () Unit!3309)

(assert (=> d!13906 (= lt!73372 (choose!9 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!72275)) lt!72277 (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!13906 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!72275)) lt!72277) lt!73372)))

(declare-fun bs!3638 () Bool)

(assert (= bs!3638 d!13906))

(assert (=> bs!3638 m!71665))

(declare-fun m!72659 () Bool)

(assert (=> bs!3638 m!72659))

(assert (=> b!46735 d!13906))

(declare-fun b!47248 () Bool)

(declare-fun e!31317 () Bool)

(declare-fun lt!73375 () List!543)

(assert (=> b!47248 (= e!31317 (isEmpty!139 lt!73375))))

(declare-fun b!47246 () Bool)

(declare-fun e!31316 () tuple2!4552)

(assert (=> b!47246 (= e!31316 (tuple2!4553 Nil!540 (_1!2356 lt!72267)))))

(declare-fun d!13908 () Bool)

(assert (=> d!13908 e!31317))

(declare-fun c!3235 () Bool)

(assert (=> d!13908 (= c!3235 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13908 (= lt!73375 (_1!2369 e!31316))))

(declare-fun c!3236 () Bool)

(assert (=> d!13908 (= c!3236 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13908 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13908 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72267) (bvsub to!314 i!635)) lt!73375)))

(declare-fun b!47249 () Bool)

(assert (=> b!47249 (= e!31317 (> (length!238 lt!73375) 0))))

(declare-fun lt!73374 () (_ BitVec 64))

(declare-fun lt!73373 () tuple2!4554)

(declare-fun b!47247 () Bool)

(assert (=> b!47247 (= e!31316 (tuple2!4553 (Cons!539 (_1!2370 lt!73373) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!73373) (bvsub (bvsub to!314 i!635) lt!73374))) (_2!2370 lt!73373)))))

(assert (=> b!47247 (= lt!73373 (readBit!0 (_1!2356 lt!72267)))))

(assert (=> b!47247 (= lt!73374 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13908 c!3236) b!47246))

(assert (= (and d!13908 (not c!3236)) b!47247))

(assert (= (and d!13908 c!3235) b!47248))

(assert (= (and d!13908 (not c!3235)) b!47249))

(declare-fun m!72661 () Bool)

(assert (=> b!47248 m!72661))

(declare-fun m!72663 () Bool)

(assert (=> b!47249 m!72663))

(declare-fun m!72665 () Bool)

(assert (=> b!47247 m!72665))

(declare-fun m!72667 () Bool)

(assert (=> b!47247 m!72667))

(assert (=> b!46735 d!13908))

(declare-fun d!13910 () Bool)

(assert (=> d!13910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!72277))))

(declare-fun bs!3639 () Bool)

(assert (= bs!3639 d!13910))

(declare-fun m!72669 () Bool)

(assert (=> bs!3639 m!72669))

(assert (=> b!46735 d!13910))

(declare-fun d!13912 () Bool)

(assert (=> d!13912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3640 () Bool)

(assert (= bs!3640 d!13912))

(declare-fun m!72671 () Bool)

(assert (=> bs!3640 m!72671))

(assert (=> b!46735 d!13912))

(declare-fun b!47250 () Bool)

(declare-fun e!31318 () Unit!3309)

(declare-fun Unit!3344 () Unit!3309)

(assert (=> b!47250 (= e!31318 Unit!3344)))

(declare-fun b!47251 () Bool)

(declare-fun res!39819 () Bool)

(declare-fun e!31319 () Bool)

(assert (=> b!47251 (=> (not res!39819) (not e!31319))))

(declare-fun lt!73393 () tuple2!4526)

(assert (=> b!47251 (= res!39819 (isPrefixOf!0 (_2!2356 lt!73393) (_2!2355 lt!72275)))))

(declare-fun b!47252 () Bool)

(declare-fun res!39818 () Bool)

(assert (=> b!47252 (=> (not res!39818) (not e!31319))))

(assert (=> b!47252 (= res!39818 (isPrefixOf!0 (_1!2356 lt!73393) thiss!1379))))

(declare-fun b!47253 () Bool)

(declare-fun lt!73379 () Unit!3309)

(assert (=> b!47253 (= e!31318 lt!73379)))

(declare-fun lt!73381 () (_ BitVec 64))

(assert (=> b!47253 (= lt!73381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73390 () (_ BitVec 64))

(assert (=> b!47253 (= lt!73390 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(assert (=> b!47253 (= lt!73379 (arrayBitRangesEqSymmetric!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) lt!73381 lt!73390))))

(assert (=> b!47253 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 thiss!1379) lt!73381 lt!73390)))

(declare-fun lt!73377 () (_ BitVec 64))

(declare-fun b!47254 () Bool)

(declare-fun lt!73386 () (_ BitVec 64))

(assert (=> b!47254 (= e!31319 (= (_1!2356 lt!73393) (withMovedBitIndex!0 (_2!2356 lt!73393) (bvsub lt!73386 lt!73377))))))

(assert (=> b!47254 (or (= (bvand lt!73386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73386 lt!73377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47254 (= lt!73377 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275))))))

(assert (=> b!47254 (= lt!73386 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun d!13914 () Bool)

(assert (=> d!13914 e!31319))

(declare-fun res!39817 () Bool)

(assert (=> d!13914 (=> (not res!39817) (not e!31319))))

(assert (=> d!13914 (= res!39817 (isPrefixOf!0 (_1!2356 lt!73393) (_2!2356 lt!73393)))))

(declare-fun lt!73392 () BitStream!1804)

(assert (=> d!13914 (= lt!73393 (tuple2!4527 lt!73392 (_2!2355 lt!72275)))))

(declare-fun lt!73385 () Unit!3309)

(declare-fun lt!73376 () Unit!3309)

(assert (=> d!13914 (= lt!73385 lt!73376)))

(assert (=> d!13914 (isPrefixOf!0 lt!73392 (_2!2355 lt!72275))))

(assert (=> d!13914 (= lt!73376 (lemmaIsPrefixTransitive!0 lt!73392 (_2!2355 lt!72275) (_2!2355 lt!72275)))))

(declare-fun lt!73391 () Unit!3309)

(declare-fun lt!73384 () Unit!3309)

(assert (=> d!13914 (= lt!73391 lt!73384)))

(assert (=> d!13914 (isPrefixOf!0 lt!73392 (_2!2355 lt!72275))))

(assert (=> d!13914 (= lt!73384 (lemmaIsPrefixTransitive!0 lt!73392 thiss!1379 (_2!2355 lt!72275)))))

(declare-fun lt!73394 () Unit!3309)

(assert (=> d!13914 (= lt!73394 e!31318)))

(declare-fun c!3237 () Bool)

(assert (=> d!13914 (= c!3237 (not (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!73389 () Unit!3309)

(declare-fun lt!73382 () Unit!3309)

(assert (=> d!13914 (= lt!73389 lt!73382)))

(assert (=> d!13914 (isPrefixOf!0 (_2!2355 lt!72275) (_2!2355 lt!72275))))

(assert (=> d!13914 (= lt!73382 (lemmaIsPrefixRefl!0 (_2!2355 lt!72275)))))

(declare-fun lt!73387 () Unit!3309)

(declare-fun lt!73383 () Unit!3309)

(assert (=> d!13914 (= lt!73387 lt!73383)))

(assert (=> d!13914 (= lt!73383 (lemmaIsPrefixRefl!0 (_2!2355 lt!72275)))))

(declare-fun lt!73388 () Unit!3309)

(declare-fun lt!73380 () Unit!3309)

(assert (=> d!13914 (= lt!73388 lt!73380)))

(assert (=> d!13914 (isPrefixOf!0 lt!73392 lt!73392)))

(assert (=> d!13914 (= lt!73380 (lemmaIsPrefixRefl!0 lt!73392))))

(declare-fun lt!73395 () Unit!3309)

(declare-fun lt!73378 () Unit!3309)

(assert (=> d!13914 (= lt!73395 lt!73378)))

(assert (=> d!13914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13914 (= lt!73378 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13914 (= lt!73392 (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(assert (=> d!13914 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72275))))

(assert (=> d!13914 (= (reader!0 thiss!1379 (_2!2355 lt!72275)) lt!73393)))

(assert (= (and d!13914 c!3237) b!47253))

(assert (= (and d!13914 (not c!3237)) b!47250))

(assert (= (and d!13914 res!39817) b!47252))

(assert (= (and b!47252 res!39818) b!47251))

(assert (= (and b!47251 res!39819) b!47254))

(declare-fun m!72673 () Bool)

(assert (=> b!47254 m!72673))

(assert (=> b!47254 m!71703))

(assert (=> b!47254 m!71691))

(assert (=> b!47253 m!71691))

(declare-fun m!72675 () Bool)

(assert (=> b!47253 m!72675))

(declare-fun m!72677 () Bool)

(assert (=> b!47253 m!72677))

(declare-fun m!72679 () Bool)

(assert (=> b!47252 m!72679))

(declare-fun m!72681 () Bool)

(assert (=> d!13914 m!72681))

(assert (=> d!13914 m!72643))

(declare-fun m!72683 () Bool)

(assert (=> d!13914 m!72683))

(declare-fun m!72685 () Bool)

(assert (=> d!13914 m!72685))

(declare-fun m!72687 () Bool)

(assert (=> d!13914 m!72687))

(assert (=> d!13914 m!72651))

(assert (=> d!13914 m!71687))

(declare-fun m!72689 () Bool)

(assert (=> d!13914 m!72689))

(declare-fun m!72691 () Bool)

(assert (=> d!13914 m!72691))

(assert (=> d!13914 m!71689))

(assert (=> d!13914 m!71737))

(declare-fun m!72693 () Bool)

(assert (=> b!47251 m!72693))

(assert (=> b!46735 d!13914))

(declare-fun d!13916 () Bool)

(assert (=> d!13916 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!73396 () Unit!3309)

(assert (=> d!13916 (= lt!73396 (choose!9 thiss!1379 (buf!1385 (_2!2355 lt!72275)) (bvsub to!314 i!635) (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (=> d!13916 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1385 (_2!2355 lt!72275)) (bvsub to!314 i!635)) lt!73396)))

(declare-fun bs!3641 () Bool)

(assert (= bs!3641 d!13916))

(assert (=> bs!3641 m!71671))

(declare-fun m!72695 () Bool)

(assert (=> bs!3641 m!72695))

(assert (=> b!46735 d!13916))

(declare-fun d!13918 () Bool)

(assert (=> d!13918 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3642 () Bool)

(assert (= bs!3642 d!13918))

(assert (=> bs!3642 m!72313))

(assert (=> b!46736 d!13918))

(push 1)

(assert (not d!13904))

(assert (not b!47231))

(assert (not d!13792))

(assert (not b!47086))

(assert (not b!47087))

(assert (not d!13798))

(assert (not d!13914))

(assert (not b!47254))

(assert (not d!13892))

(assert (not b!47233))

(assert (not d!13910))

(assert (not b!47235))

(assert (not b!47199))

(assert (not d!13900))

(assert (not b!47205))

(assert (not b!47236))

(assert (not b!47067))

(assert (not b!47234))

(assert (not d!13832))

(assert (not b!47252))

(assert (not b!47232))

(assert (not b!47251))

(assert (not b!47202))

(assert (not b!47121))

(assert (not d!13774))

(assert (not b!47065))

(assert (not b!47239))

(assert (not b!47120))

(assert (not b!47229))

(assert (not b!47211))

(assert (not b!47243))

(assert (not b!47242))

(assert (not d!13898))

(assert (not b!47043))

(assert (not b!47249))

(assert (not b!47238))

(assert (not b!47253))

(assert (not b!47122))

(assert (not b!47206))

(assert (not b!47084))

(assert (not b!47247))

(assert (not b!47041))

(assert (not b!47119))

(assert (not b!47244))

(assert (not b!47089))

(assert (not d!13918))

(assert (not b!47023))

(assert (not b!47230))

(assert (not b!47245))

(assert (not d!13896))

(assert (not d!13810))

(assert (not d!13786))

(assert (not b!47042))

(assert (not d!13814))

(assert (not d!13882))

(assert (not d!13912))

(assert (not d!13802))

(assert (not b!47201))

(assert (not d!13916))

(assert (not b!47248))

(assert (not d!13884))

(assert (not b!47203))

(assert (not d!13818))

(assert (not d!13906))

(assert (not bm!568))

(assert (not b!47208))

(assert (not b!47240))

(assert (not b!47204))

(assert (not b!47081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!14170 () Bool)

(declare-fun lt!73758 () tuple2!4554)

(assert (=> d!14170 (= lt!73758 (readBit!0 (readerFrom!0 (_2!2355 lt!73340) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379))))))

(assert (=> d!14170 (= (readBitPure!0 (readerFrom!0 (_2!2355 lt!73340) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379))) (tuple2!4559 (_2!2370 lt!73758) (_1!2370 lt!73758)))))

(declare-fun bs!3685 () Bool)

(assert (= bs!3685 d!14170))

(assert (=> bs!3685 m!72611))

(declare-fun m!73377 () Bool)

(assert (=> bs!3685 m!73377))

(assert (=> b!47236 d!14170))

(declare-fun d!14172 () Bool)

(declare-fun e!31502 () Bool)

(assert (=> d!14172 e!31502))

(declare-fun res!40026 () Bool)

(assert (=> d!14172 (=> (not res!40026) (not e!31502))))

(assert (=> d!14172 (= res!40026 (invariant!0 (currentBit!2885 (_2!2355 lt!73340)) (currentByte!2890 (_2!2355 lt!73340)) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(assert (=> d!14172 (= (readerFrom!0 (_2!2355 lt!73340) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379)) (BitStream!1805 (buf!1385 (_2!2355 lt!73340)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun b!47540 () Bool)

(assert (=> b!47540 (= e!31502 (invariant!0 (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(assert (= (and d!14172 res!40026) b!47540))

(declare-fun m!73379 () Bool)

(assert (=> d!14172 m!73379))

(declare-fun m!73381 () Bool)

(assert (=> b!47540 m!73381))

(assert (=> b!47236 d!14172))

(declare-fun d!14174 () Bool)

(assert (=> d!14174 (= (isEmpty!139 lt!73375) (is-Nil!540 lt!73375))))

(assert (=> b!47248 d!14174))

(declare-fun d!14176 () Bool)

(declare-fun e!31503 () Bool)

(assert (=> d!14176 e!31503))

(declare-fun res!40028 () Bool)

(assert (=> d!14176 (=> (not res!40028) (not e!31503))))

(declare-fun lt!73762 () (_ BitVec 64))

(declare-fun lt!73761 () (_ BitVec 64))

(declare-fun lt!73764 () (_ BitVec 64))

(assert (=> d!14176 (= res!40028 (= lt!73761 (bvsub lt!73764 lt!73762)))))

(assert (=> d!14176 (or (= (bvand lt!73764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73764 lt!73762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14176 (= lt!73762 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73344)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73344))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73344)))))))

(declare-fun lt!73760 () (_ BitVec 64))

(declare-fun lt!73763 () (_ BitVec 64))

(assert (=> d!14176 (= lt!73764 (bvmul lt!73760 lt!73763))))

(assert (=> d!14176 (or (= lt!73760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73763 (bvsdiv (bvmul lt!73760 lt!73763) lt!73760)))))

(assert (=> d!14176 (= lt!73763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14176 (= lt!73760 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73344)))))))

(assert (=> d!14176 (= lt!73761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73344)))))))

(assert (=> d!14176 (invariant!0 (currentBit!2885 (_2!2355 lt!73344)) (currentByte!2890 (_2!2355 lt!73344)) (size!1036 (buf!1385 (_2!2355 lt!73344))))))

(assert (=> d!14176 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73344))) (currentByte!2890 (_2!2355 lt!73344)) (currentBit!2885 (_2!2355 lt!73344))) lt!73761)))

(declare-fun b!47541 () Bool)

(declare-fun res!40027 () Bool)

(assert (=> b!47541 (=> (not res!40027) (not e!31503))))

(assert (=> b!47541 (= res!40027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73761))))

(declare-fun b!47542 () Bool)

(declare-fun lt!73759 () (_ BitVec 64))

(assert (=> b!47542 (= e!31503 (bvsle lt!73761 (bvmul lt!73759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47542 (or (= lt!73759 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73759 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73759)))))

(assert (=> b!47542 (= lt!73759 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73344)))))))

(assert (= (and d!14176 res!40028) b!47541))

(assert (= (and b!47541 res!40027) b!47542))

(declare-fun m!73383 () Bool)

(assert (=> d!14176 m!73383))

(declare-fun m!73385 () Bool)

(assert (=> d!14176 m!73385))

(assert (=> b!47232 d!14176))

(assert (=> b!47232 d!13792))

(declare-fun d!14178 () Bool)

(declare-fun res!40030 () Bool)

(declare-fun e!31505 () Bool)

(assert (=> d!14178 (=> (not res!40030) (not e!31505))))

(assert (=> d!14178 (= res!40030 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(assert (=> d!14178 (= (isPrefixOf!0 thiss!1379 (_2!2355 lt!73340)) e!31505)))

(declare-fun b!47543 () Bool)

(declare-fun res!40029 () Bool)

(assert (=> b!47543 (=> (not res!40029) (not e!31505))))

(assert (=> b!47543 (= res!40029 (bvsle (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73340))) (currentByte!2890 (_2!2355 lt!73340)) (currentBit!2885 (_2!2355 lt!73340)))))))

(declare-fun b!47544 () Bool)

(declare-fun e!31504 () Bool)

(assert (=> b!47544 (= e!31505 e!31504)))

(declare-fun res!40031 () Bool)

(assert (=> b!47544 (=> res!40031 e!31504)))

(assert (=> b!47544 (= res!40031 (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47545 () Bool)

(assert (=> b!47545 (= e!31504 (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!73340)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (= (and d!14178 res!40030) b!47543))

(assert (= (and b!47543 res!40029) b!47544))

(assert (= (and b!47544 (not res!40031)) b!47545))

(assert (=> b!47543 m!71691))

(assert (=> b!47543 m!72615))

(assert (=> b!47545 m!71691))

(assert (=> b!47545 m!71691))

(declare-fun m!73387 () Bool)

(assert (=> b!47545 m!73387))

(assert (=> b!47234 d!14178))

(declare-fun d!14180 () Bool)

(assert (=> d!14180 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))))))))

(assert (=> d!13896 d!14180))

(declare-fun d!14182 () Bool)

(assert (=> d!14182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3686 () Bool)

(assert (= bs!3686 d!14182))

(assert (=> bs!3686 m!72325))

(assert (=> b!47211 d!14182))

(declare-fun b!47556 () Bool)

(declare-fun res!40046 () Bool)

(declare-fun e!31508 () Bool)

(assert (=> b!47556 (=> (not res!40046) (not e!31508))))

(declare-fun lt!73789 () tuple2!4556)

(assert (=> b!47556 (= res!40046 (bvsle (currentByte!2890 lt!73338) (currentByte!2890 (_2!2371 lt!73789))))))

(declare-fun b!47557 () Bool)

(assert (=> b!47557 (= e!31508 (= (byteArrayBitContentToList!0 (_2!2371 lt!73789) (_1!2371 lt!73789) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2371 lt!73789) lt!73338 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47558 () Bool)

(declare-fun res!40043 () Bool)

(assert (=> b!47558 (=> (not res!40043) (not e!31508))))

(declare-fun lt!73788 () (_ BitVec 64))

(assert (=> b!47558 (= res!40043 (= (bvadd lt!73788 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1036 (buf!1385 (_2!2371 lt!73789))) (currentByte!2890 (_2!2371 lt!73789)) (currentBit!2885 (_2!2371 lt!73789)))))))

(assert (=> b!47558 (or (not (= (bvand lt!73788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73788 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47558 (= lt!73788 (bitIndex!0 (size!1036 (buf!1385 lt!73338)) (currentByte!2890 lt!73338) (currentBit!2885 lt!73338)))))

(declare-fun d!14184 () Bool)

(assert (=> d!14184 e!31508))

(declare-fun res!40042 () Bool)

(assert (=> d!14184 (=> (not res!40042) (not e!31508))))

(assert (=> d!14184 (= res!40042 (= (buf!1385 (_2!2371 lt!73789)) (buf!1385 lt!73338)))))

(declare-datatypes ((tuple3!174 0))(
  ( (tuple3!175 (_1!2375 Unit!3309) (_2!2375 BitStream!1804) (_3!95 array!2293)) )
))
(declare-fun lt!73784 () tuple3!174)

(assert (=> d!14184 (= lt!73789 (tuple2!4557 (_3!95 lt!73784) (_2!2375 lt!73784)))))

(declare-fun readBitsLoop!0 (BitStream!1804 (_ BitVec 64) array!2293 (_ BitVec 64) (_ BitVec 64)) tuple3!174)

(assert (=> d!14184 (= lt!73784 (readBitsLoop!0 lt!73338 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2294 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!14184 (= (readBits!0 lt!73338 #b0000000000000000000000000000000000000000000000000000000000000001) lt!73789)))

(declare-fun b!47559 () Bool)

(declare-fun res!40045 () Bool)

(assert (=> b!47559 (=> (not res!40045) (not e!31508))))

(assert (=> b!47559 (= res!40045 (invariant!0 (currentBit!2885 (_2!2371 lt!73789)) (currentByte!2890 (_2!2371 lt!73789)) (size!1036 (buf!1385 (_2!2371 lt!73789)))))))

(declare-fun b!47560 () Bool)

(declare-fun res!40044 () Bool)

(assert (=> b!47560 (=> (not res!40044) (not e!31508))))

(declare-fun lt!73791 () (_ BitVec 64))

(assert (=> b!47560 (= res!40044 (= (size!1036 (_1!2371 lt!73789)) ((_ extract 31 0) lt!73791)))))

(assert (=> b!47560 (and (bvslt lt!73791 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!73791 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!73787 () (_ BitVec 64))

(declare-fun lt!73786 () (_ BitVec 64))

(assert (=> b!47560 (= lt!73791 (bvsdiv lt!73787 lt!73786))))

(assert (=> b!47560 (and (not (= lt!73786 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!73787 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!73786 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!47560 (= lt!73786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!73790 () (_ BitVec 64))

(declare-fun lt!73783 () (_ BitVec 64))

(assert (=> b!47560 (= lt!73787 (bvsub lt!73790 lt!73783))))

(assert (=> b!47560 (or (= (bvand lt!73790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73790 lt!73783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47560 (= lt!73783 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73785 () (_ BitVec 64))

(assert (=> b!47560 (= lt!73790 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!73785))))

(assert (=> b!47560 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73785 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!73785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47560 (= lt!73785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!14184 res!40042) b!47558))

(assert (= (and b!47558 res!40043) b!47559))

(assert (= (and b!47559 res!40045) b!47560))

(assert (= (and b!47560 res!40044) b!47556))

(assert (= (and b!47556 res!40046) b!47557))

(declare-fun m!73389 () Bool)

(assert (=> b!47557 m!73389))

(declare-fun m!73391 () Bool)

(assert (=> b!47557 m!73391))

(declare-fun m!73393 () Bool)

(assert (=> b!47558 m!73393))

(declare-fun m!73395 () Bool)

(assert (=> b!47558 m!73395))

(declare-fun m!73397 () Bool)

(assert (=> d!14184 m!73397))

(declare-fun m!73399 () Bool)

(assert (=> b!47559 m!73399))

(assert (=> b!47230 d!14184))

(declare-fun d!14186 () Bool)

(declare-fun lt!73792 () tuple2!4554)

(assert (=> d!14186 (= lt!73792 (readBit!0 lt!73338))))

(assert (=> d!14186 (= (readBitPure!0 lt!73338) (tuple2!4559 (_2!2370 lt!73792) (_1!2370 lt!73792)))))

(declare-fun bs!3687 () Bool)

(assert (= bs!3687 d!14186))

(declare-fun m!73401 () Bool)

(assert (=> bs!3687 m!73401))

(assert (=> b!47230 d!14186))

(declare-fun d!14188 () Bool)

(declare-fun e!31509 () Bool)

(assert (=> d!14188 e!31509))

(declare-fun res!40047 () Bool)

(assert (=> d!14188 (=> (not res!40047) (not e!31509))))

(assert (=> d!14188 (= res!40047 (invariant!0 (currentBit!2885 (_2!2355 lt!73344)) (currentByte!2890 (_2!2355 lt!73344)) (size!1036 (buf!1385 (_2!2355 lt!73344)))))))

(assert (=> d!14188 (= (readerFrom!0 (_2!2355 lt!73344) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379)) (BitStream!1805 (buf!1385 (_2!2355 lt!73344)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun b!47561 () Bool)

(assert (=> b!47561 (= e!31509 (invariant!0 (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379) (size!1036 (buf!1385 (_2!2355 lt!73344)))))))

(assert (= (and d!14188 res!40047) b!47561))

(assert (=> d!14188 m!73385))

(declare-fun m!73403 () Bool)

(assert (=> b!47561 m!73403))

(assert (=> b!47230 d!14188))

(declare-fun c!3280 () Bool)

(declare-fun lt!73799 () (_ BitVec 32))

(declare-datatypes ((tuple4!16 0))(
  ( (tuple4!17 (_1!2376 (_ BitVec 32)) (_2!2376 (_ BitVec 32)) (_3!96 (_ BitVec 32)) (_4!8 (_ BitVec 32))) )
))
(declare-fun lt!73800 () tuple4!16)

(declare-fun call!584 () Bool)

(declare-fun bm!581 () Bool)

(declare-fun lt!73801 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!581 (= call!584 (byteRangesEq!0 (ite c!3280 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73800)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!73800))) (ite c!3280 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73800)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_4!8 lt!73800))) (ite c!3280 lt!73801 #b00000000000000000000000000000000) lt!73799))))

(declare-fun b!47576 () Bool)

(declare-fun e!31525 () Bool)

(assert (=> b!47576 (= e!31525 call!584)))

(declare-fun b!47577 () Bool)

(declare-fun res!40059 () Bool)

(assert (=> b!47577 (= res!40059 (= lt!73799 #b00000000000000000000000000000000))))

(assert (=> b!47577 (=> res!40059 e!31525)))

(declare-fun e!31526 () Bool)

(assert (=> b!47577 (= e!31526 e!31525)))

(declare-fun b!47578 () Bool)

(declare-fun e!31523 () Bool)

(declare-fun arrayRangesEq!9 (array!2293 array!2293 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!47578 (= e!31523 (arrayRangesEq!9 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) (_1!2376 lt!73800) (_2!2376 lt!73800)))))

(declare-fun b!47579 () Bool)

(declare-fun e!31522 () Bool)

(declare-fun e!31527 () Bool)

(assert (=> b!47579 (= e!31522 e!31527)))

(assert (=> b!47579 (= c!3280 (= (_3!96 lt!73800) (_4!8 lt!73800)))))

(declare-fun d!14190 () Bool)

(declare-fun res!40061 () Bool)

(declare-fun e!31524 () Bool)

(assert (=> d!14190 (=> res!40061 e!31524)))

(assert (=> d!14190 (= res!40061 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (=> d!14190 (= (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))) e!31524)))

(declare-fun b!47580 () Bool)

(assert (=> b!47580 (= e!31527 e!31526)))

(declare-fun res!40062 () Bool)

(assert (=> b!47580 (= res!40062 (byteRangesEq!0 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73800)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73800)) lt!73801 #b00000000000000000000000000001000))))

(assert (=> b!47580 (=> (not res!40062) (not e!31526))))

(declare-fun b!47581 () Bool)

(assert (=> b!47581 (= e!31524 e!31522)))

(declare-fun res!40058 () Bool)

(assert (=> b!47581 (=> (not res!40058) (not e!31522))))

(assert (=> b!47581 (= res!40058 e!31523)))

(declare-fun res!40060 () Bool)

(assert (=> b!47581 (=> res!40060 e!31523)))

(assert (=> b!47581 (= res!40060 (bvsge (_1!2376 lt!73800) (_2!2376 lt!73800)))))

(assert (=> b!47581 (= lt!73799 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47581 (= lt!73801 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!16)

(assert (=> b!47581 (= lt!73800 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47582 () Bool)

(assert (=> b!47582 (= e!31527 call!584)))

(assert (= (and d!14190 (not res!40061)) b!47581))

(assert (= (and b!47581 (not res!40060)) b!47578))

(assert (= (and b!47581 res!40058) b!47579))

(assert (= (and b!47579 c!3280) b!47582))

(assert (= (and b!47579 (not c!3280)) b!47580))

(assert (= (and b!47580 res!40062) b!47577))

(assert (= (and b!47577 (not res!40059)) b!47576))

(assert (= (or b!47582 b!47576) bm!581))

(declare-fun m!73405 () Bool)

(assert (=> bm!581 m!73405))

(declare-fun m!73407 () Bool)

(assert (=> bm!581 m!73407))

(declare-fun m!73409 () Bool)

(assert (=> bm!581 m!73409))

(declare-fun m!73411 () Bool)

(assert (=> bm!581 m!73411))

(declare-fun m!73413 () Bool)

(assert (=> bm!581 m!73413))

(declare-fun m!73415 () Bool)

(assert (=> b!47578 m!73415))

(assert (=> b!47580 m!73413))

(assert (=> b!47580 m!73409))

(assert (=> b!47580 m!73413))

(assert (=> b!47580 m!73409))

(declare-fun m!73417 () Bool)

(assert (=> b!47580 m!73417))

(assert (=> b!47581 m!71691))

(declare-fun m!73419 () Bool)

(assert (=> b!47581 m!73419))

(assert (=> b!47208 d!14190))

(assert (=> b!47208 d!13792))

(declare-fun d!14192 () Bool)

(declare-fun res!40064 () Bool)

(declare-fun e!31529 () Bool)

(assert (=> d!14192 (=> (not res!40064) (not e!31529))))

(assert (=> d!14192 (= res!40064 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!73285)))))))

(assert (=> d!14192 (= (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73285)) e!31529)))

(declare-fun b!47583 () Bool)

(declare-fun res!40063 () Bool)

(assert (=> b!47583 (=> (not res!40063) (not e!31529))))

(assert (=> b!47583 (= res!40063 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73285))) (currentByte!2890 (_2!2355 lt!73285)) (currentBit!2885 (_2!2355 lt!73285)))))))

(declare-fun b!47584 () Bool)

(declare-fun e!31528 () Bool)

(assert (=> b!47584 (= e!31529 e!31528)))

(declare-fun res!40065 () Bool)

(assert (=> b!47584 (=> res!40065 e!31528)))

(assert (=> b!47584 (= res!40065 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000))))

(declare-fun b!47585 () Bool)

(assert (=> b!47585 (= e!31528 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!73285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (= (and d!14192 res!40064) b!47583))

(assert (= (and b!47583 res!40063) b!47584))

(assert (= (and b!47584 (not res!40065)) b!47585))

(assert (=> b!47583 m!71721))

(assert (=> b!47583 m!72507))

(assert (=> b!47585 m!71721))

(assert (=> b!47585 m!71721))

(declare-fun m!73421 () Bool)

(assert (=> b!47585 m!73421))

(assert (=> b!47205 d!14192))

(declare-fun d!14194 () Bool)

(assert (=> d!14194 (= (isEmpty!139 lt!73351) (is-Nil!540 lt!73351))))

(assert (=> b!47239 d!14194))

(declare-fun d!14196 () Bool)

(declare-fun e!31532 () Bool)

(assert (=> d!14196 e!31532))

(declare-fun res!40068 () Bool)

(assert (=> d!14196 (=> (not res!40068) (not e!31532))))

(declare-fun lt!73806 () BitStream!1804)

(declare-fun lt!73807 () (_ BitVec 64))

(assert (=> d!14196 (= res!40068 (= (bvadd lt!73807 (bvsub lt!73362 lt!73353)) (bitIndex!0 (size!1036 (buf!1385 lt!73806)) (currentByte!2890 lt!73806) (currentBit!2885 lt!73806))))))

(assert (=> d!14196 (or (not (= (bvand lt!73807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73362 lt!73353) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73807 (bvsub lt!73362 lt!73353)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14196 (= lt!73807 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73369))) (currentByte!2890 (_2!2356 lt!73369)) (currentBit!2885 (_2!2356 lt!73369))))))

(declare-fun moveBitIndex!0 (BitStream!1804 (_ BitVec 64)) tuple2!4524)

(assert (=> d!14196 (= lt!73806 (_2!2355 (moveBitIndex!0 (_2!2356 lt!73369) (bvsub lt!73362 lt!73353))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1804 (_ BitVec 64)) Bool)

(assert (=> d!14196 (moveBitIndexPrecond!0 (_2!2356 lt!73369) (bvsub lt!73362 lt!73353))))

(assert (=> d!14196 (= (withMovedBitIndex!0 (_2!2356 lt!73369) (bvsub lt!73362 lt!73353)) lt!73806)))

(declare-fun b!47588 () Bool)

(assert (=> b!47588 (= e!31532 (= (size!1036 (buf!1385 (_2!2356 lt!73369))) (size!1036 (buf!1385 lt!73806))))))

(assert (= (and d!14196 res!40068) b!47588))

(declare-fun m!73423 () Bool)

(assert (=> d!14196 m!73423))

(declare-fun m!73425 () Bool)

(assert (=> d!14196 m!73425))

(declare-fun m!73427 () Bool)

(assert (=> d!14196 m!73427))

(declare-fun m!73429 () Bool)

(assert (=> d!14196 m!73429))

(assert (=> b!47245 d!14196))

(assert (=> b!47245 d!13774))

(assert (=> b!47245 d!13810))

(declare-fun d!14198 () Bool)

(assert (=> d!14198 (isPrefixOf!0 (_2!2355 lt!72275) (_2!2355 lt!72275))))

(declare-fun lt!73808 () Unit!3309)

(assert (=> d!14198 (= lt!73808 (choose!11 (_2!2355 lt!72275)))))

(assert (=> d!14198 (= (lemmaIsPrefixRefl!0 (_2!2355 lt!72275)) lt!73808)))

(declare-fun bs!3688 () Bool)

(assert (= bs!3688 d!14198))

(assert (=> bs!3688 m!72643))

(declare-fun m!73431 () Bool)

(assert (=> bs!3688 m!73431))

(assert (=> d!13914 d!14198))

(assert (=> d!13914 d!13782))

(declare-fun d!14200 () Bool)

(assert (=> d!14200 (isPrefixOf!0 lt!73392 (_2!2355 lt!72275))))

(declare-fun lt!73809 () Unit!3309)

(assert (=> d!14200 (= lt!73809 (choose!30 lt!73392 (_2!2355 lt!72275) (_2!2355 lt!72275)))))

(assert (=> d!14200 (isPrefixOf!0 lt!73392 (_2!2355 lt!72275))))

(assert (=> d!14200 (= (lemmaIsPrefixTransitive!0 lt!73392 (_2!2355 lt!72275) (_2!2355 lt!72275)) lt!73809)))

(declare-fun bs!3689 () Bool)

(assert (= bs!3689 d!14200))

(assert (=> bs!3689 m!72683))

(declare-fun m!73433 () Bool)

(assert (=> bs!3689 m!73433))

(assert (=> bs!3689 m!72683))

(assert (=> d!13914 d!14200))

(declare-fun d!14202 () Bool)

(declare-fun res!40070 () Bool)

(declare-fun e!31534 () Bool)

(assert (=> d!14202 (=> (not res!40070) (not e!31534))))

(assert (=> d!14202 (= res!40070 (= (size!1036 (buf!1385 (_2!2355 lt!72275))) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!14202 (= (isPrefixOf!0 (_2!2355 lt!72275) (_2!2355 lt!72275)) e!31534)))

(declare-fun b!47589 () Bool)

(declare-fun res!40069 () Bool)

(assert (=> b!47589 (=> (not res!40069) (not e!31534))))

(assert (=> b!47589 (= res!40069 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47590 () Bool)

(declare-fun e!31533 () Bool)

(assert (=> b!47590 (= e!31534 e!31533)))

(declare-fun res!40071 () Bool)

(assert (=> b!47590 (=> res!40071 e!31533)))

(assert (=> b!47590 (= res!40071 (= (size!1036 (buf!1385 (_2!2355 lt!72275))) #b00000000000000000000000000000000))))

(declare-fun b!47591 () Bool)

(assert (=> b!47591 (= e!31533 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(assert (= (and d!14202 res!40070) b!47589))

(assert (= (and b!47589 res!40069) b!47590))

(assert (= (and b!47590 (not res!40071)) b!47591))

(assert (=> b!47589 m!71703))

(assert (=> b!47589 m!71703))

(assert (=> b!47591 m!71703))

(assert (=> b!47591 m!71703))

(declare-fun m!73435 () Bool)

(assert (=> b!47591 m!73435))

(assert (=> d!13914 d!14202))

(assert (=> d!13914 d!13786))

(declare-fun d!14204 () Bool)

(declare-fun res!40073 () Bool)

(declare-fun e!31536 () Bool)

(assert (=> d!14204 (=> (not res!40073) (not e!31536))))

(assert (=> d!14204 (= res!40073 (= (size!1036 (buf!1385 lt!73392)) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!14204 (= (isPrefixOf!0 lt!73392 (_2!2355 lt!72275)) e!31536)))

(declare-fun b!47592 () Bool)

(declare-fun res!40072 () Bool)

(assert (=> b!47592 (=> (not res!40072) (not e!31536))))

(assert (=> b!47592 (= res!40072 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73392)) (currentByte!2890 lt!73392) (currentBit!2885 lt!73392)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47593 () Bool)

(declare-fun e!31535 () Bool)

(assert (=> b!47593 (= e!31536 e!31535)))

(declare-fun res!40074 () Bool)

(assert (=> b!47593 (=> res!40074 e!31535)))

(assert (=> b!47593 (= res!40074 (= (size!1036 (buf!1385 lt!73392)) #b00000000000000000000000000000000))))

(declare-fun b!47594 () Bool)

(assert (=> b!47594 (= e!31535 (arrayBitRangesEq!0 (buf!1385 lt!73392) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73392)) (currentByte!2890 lt!73392) (currentBit!2885 lt!73392))))))

(assert (= (and d!14204 res!40073) b!47592))

(assert (= (and b!47592 res!40072) b!47593))

(assert (= (and b!47593 (not res!40074)) b!47594))

(declare-fun m!73437 () Bool)

(assert (=> b!47592 m!73437))

(assert (=> b!47592 m!71703))

(assert (=> b!47594 m!73437))

(assert (=> b!47594 m!73437))

(declare-fun m!73439 () Bool)

(assert (=> b!47594 m!73439))

(assert (=> d!13914 d!14204))

(declare-fun d!14206 () Bool)

(assert (=> d!14206 (isPrefixOf!0 lt!73392 lt!73392)))

(declare-fun lt!73810 () Unit!3309)

(assert (=> d!14206 (= lt!73810 (choose!11 lt!73392))))

(assert (=> d!14206 (= (lemmaIsPrefixRefl!0 lt!73392) lt!73810)))

(declare-fun bs!3690 () Bool)

(assert (= bs!3690 d!14206))

(assert (=> bs!3690 m!72681))

(declare-fun m!73441 () Bool)

(assert (=> bs!3690 m!73441))

(assert (=> d!13914 d!14206))

(declare-fun d!14208 () Bool)

(assert (=> d!14208 (isPrefixOf!0 lt!73392 (_2!2355 lt!72275))))

(declare-fun lt!73811 () Unit!3309)

(assert (=> d!14208 (= lt!73811 (choose!30 lt!73392 thiss!1379 (_2!2355 lt!72275)))))

(assert (=> d!14208 (isPrefixOf!0 lt!73392 thiss!1379)))

(assert (=> d!14208 (= (lemmaIsPrefixTransitive!0 lt!73392 thiss!1379 (_2!2355 lt!72275)) lt!73811)))

(declare-fun bs!3691 () Bool)

(assert (= bs!3691 d!14208))

(assert (=> bs!3691 m!72683))

(declare-fun m!73443 () Bool)

(assert (=> bs!3691 m!73443))

(declare-fun m!73445 () Bool)

(assert (=> bs!3691 m!73445))

(assert (=> d!13914 d!14208))

(declare-fun d!14210 () Bool)

(declare-fun res!40076 () Bool)

(declare-fun e!31538 () Bool)

(assert (=> d!14210 (=> (not res!40076) (not e!31538))))

(assert (=> d!14210 (= res!40076 (= (size!1036 (buf!1385 (_1!2356 lt!73393))) (size!1036 (buf!1385 (_2!2356 lt!73393)))))))

(assert (=> d!14210 (= (isPrefixOf!0 (_1!2356 lt!73393) (_2!2356 lt!73393)) e!31538)))

(declare-fun b!47595 () Bool)

(declare-fun res!40075 () Bool)

(assert (=> b!47595 (=> (not res!40075) (not e!31538))))

(assert (=> b!47595 (= res!40075 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73393))) (currentByte!2890 (_1!2356 lt!73393)) (currentBit!2885 (_1!2356 lt!73393))) (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73393))) (currentByte!2890 (_2!2356 lt!73393)) (currentBit!2885 (_2!2356 lt!73393)))))))

(declare-fun b!47596 () Bool)

(declare-fun e!31537 () Bool)

(assert (=> b!47596 (= e!31538 e!31537)))

(declare-fun res!40077 () Bool)

(assert (=> b!47596 (=> res!40077 e!31537)))

(assert (=> b!47596 (= res!40077 (= (size!1036 (buf!1385 (_1!2356 lt!73393))) #b00000000000000000000000000000000))))

(declare-fun b!47597 () Bool)

(assert (=> b!47597 (= e!31537 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73393)) (buf!1385 (_2!2356 lt!73393)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73393))) (currentByte!2890 (_1!2356 lt!73393)) (currentBit!2885 (_1!2356 lt!73393)))))))

(assert (= (and d!14210 res!40076) b!47595))

(assert (= (and b!47595 res!40075) b!47596))

(assert (= (and b!47596 (not res!40077)) b!47597))

(declare-fun m!73447 () Bool)

(assert (=> b!47595 m!73447))

(declare-fun m!73449 () Bool)

(assert (=> b!47595 m!73449))

(assert (=> b!47597 m!73447))

(assert (=> b!47597 m!73447))

(declare-fun m!73451 () Bool)

(assert (=> b!47597 m!73451))

(assert (=> d!13914 d!14210))

(assert (=> d!13914 d!13816))

(declare-fun d!14212 () Bool)

(declare-fun res!40079 () Bool)

(declare-fun e!31540 () Bool)

(assert (=> d!14212 (=> (not res!40079) (not e!31540))))

(assert (=> d!14212 (= res!40079 (= (size!1036 (buf!1385 lt!73392)) (size!1036 (buf!1385 lt!73392))))))

(assert (=> d!14212 (= (isPrefixOf!0 lt!73392 lt!73392) e!31540)))

(declare-fun b!47598 () Bool)

(declare-fun res!40078 () Bool)

(assert (=> b!47598 (=> (not res!40078) (not e!31540))))

(assert (=> b!47598 (= res!40078 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73392)) (currentByte!2890 lt!73392) (currentBit!2885 lt!73392)) (bitIndex!0 (size!1036 (buf!1385 lt!73392)) (currentByte!2890 lt!73392) (currentBit!2885 lt!73392))))))

(declare-fun b!47599 () Bool)

(declare-fun e!31539 () Bool)

(assert (=> b!47599 (= e!31540 e!31539)))

(declare-fun res!40080 () Bool)

(assert (=> b!47599 (=> res!40080 e!31539)))

(assert (=> b!47599 (= res!40080 (= (size!1036 (buf!1385 lt!73392)) #b00000000000000000000000000000000))))

(declare-fun b!47600 () Bool)

(assert (=> b!47600 (= e!31539 (arrayBitRangesEq!0 (buf!1385 lt!73392) (buf!1385 lt!73392) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73392)) (currentByte!2890 lt!73392) (currentBit!2885 lt!73392))))))

(assert (= (and d!14212 res!40079) b!47598))

(assert (= (and b!47598 res!40078) b!47599))

(assert (= (and b!47599 (not res!40080)) b!47600))

(assert (=> b!47598 m!73437))

(assert (=> b!47598 m!73437))

(assert (=> b!47600 m!73437))

(assert (=> b!47600 m!73437))

(declare-fun m!73453 () Bool)

(assert (=> b!47600 m!73453))

(assert (=> d!13914 d!14212))

(declare-fun d!14214 () Bool)

(declare-fun e!31541 () Bool)

(assert (=> d!14214 e!31541))

(declare-fun res!40081 () Bool)

(assert (=> d!14214 (=> (not res!40081) (not e!31541))))

(declare-fun lt!73812 () BitStream!1804)

(declare-fun lt!73813 () (_ BitVec 64))

(assert (=> d!14214 (= res!40081 (= (bvadd lt!73813 (bvsub lt!73042 lt!73033)) (bitIndex!0 (size!1036 (buf!1385 lt!73812)) (currentByte!2890 lt!73812) (currentBit!2885 lt!73812))))))

(assert (=> d!14214 (or (not (= (bvand lt!73813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73042 lt!73033) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73813 (bvsub lt!73042 lt!73033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14214 (= lt!73813 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73049))) (currentByte!2890 (_2!2356 lt!73049)) (currentBit!2885 (_2!2356 lt!73049))))))

(assert (=> d!14214 (= lt!73812 (_2!2355 (moveBitIndex!0 (_2!2356 lt!73049) (bvsub lt!73042 lt!73033))))))

(assert (=> d!14214 (moveBitIndexPrecond!0 (_2!2356 lt!73049) (bvsub lt!73042 lt!73033))))

(assert (=> d!14214 (= (withMovedBitIndex!0 (_2!2356 lt!73049) (bvsub lt!73042 lt!73033)) lt!73812)))

(declare-fun b!47601 () Bool)

(assert (=> b!47601 (= e!31541 (= (size!1036 (buf!1385 (_2!2356 lt!73049))) (size!1036 (buf!1385 lt!73812))))))

(assert (= (and d!14214 res!40081) b!47601))

(declare-fun m!73455 () Bool)

(assert (=> d!14214 m!73455))

(declare-fun m!73457 () Bool)

(assert (=> d!14214 m!73457))

(declare-fun m!73459 () Bool)

(assert (=> d!14214 m!73459))

(declare-fun m!73461 () Bool)

(assert (=> d!14214 m!73461))

(assert (=> b!47122 d!14214))

(assert (=> b!47122 d!13810))

(assert (=> b!47122 d!13792))

(assert (=> b!47206 d!13792))

(assert (=> b!47206 d!13810))

(declare-fun d!14216 () Bool)

(assert (=> d!14216 (= (bitAt!0 (buf!1385 (_2!2355 lt!73293)) lt!73279) (bitAt!0 (buf!1385 (_2!2355 lt!73264)) lt!73279))))

(declare-fun lt!73816 () Unit!3309)

(declare-fun choose!31 (array!2293 array!2293 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> d!14216 (= lt!73816 (choose!31 (buf!1385 (_2!2355 lt!73293)) (buf!1385 (_2!2355 lt!73264)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!73279 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293)))))))

(assert (=> d!14216 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293)))))))

(assert (=> d!14216 (= (arrayBitRangesEqImpliesEq!0 (buf!1385 (_2!2355 lt!73293)) (buf!1385 (_2!2355 lt!73264)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!73279 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293)))) lt!73816)))

(declare-fun bs!3692 () Bool)

(assert (= bs!3692 d!14216))

(assert (=> bs!3692 m!72547))

(assert (=> bs!3692 m!72517))

(assert (=> bs!3692 m!72525))

(declare-fun m!73463 () Bool)

(assert (=> bs!3692 m!73463))

(assert (=> b!47203 d!14216))

(declare-fun d!14218 () Bool)

(declare-fun e!31542 () Bool)

(assert (=> d!14218 e!31542))

(declare-fun res!40082 () Bool)

(assert (=> d!14218 (=> (not res!40082) (not e!31542))))

(assert (=> d!14218 (= res!40082 (or (= (bvand lt!73292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73292 lt!73298) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!73817 () Unit!3309)

(assert (=> d!14218 (= lt!73817 (choose!27 (_2!2355 lt!72283) (_2!2355 lt!73293) lt!73292 lt!73298))))

(assert (=> d!14218 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73298) (bvsle lt!73298 lt!73292))))

(assert (=> d!14218 (= (validateOffsetBitsIneqLemma!0 (_2!2355 lt!72283) (_2!2355 lt!73293) lt!73292 lt!73298) lt!73817)))

(declare-fun b!47602 () Bool)

(assert (=> b!47602 (= e!31542 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) (bvsub lt!73292 lt!73298)))))

(assert (= (and d!14218 res!40082) b!47602))

(declare-fun m!73465 () Bool)

(assert (=> d!14218 m!73465))

(assert (=> b!47602 m!72549))

(assert (=> b!47203 d!14218))

(declare-fun d!14220 () Bool)

(assert (=> d!14220 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73304) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!73304))))

(declare-fun bs!3693 () Bool)

(assert (= bs!3693 d!14220))

(declare-fun m!73467 () Bool)

(assert (=> bs!3693 m!73467))

(assert (=> b!47203 d!14220))

(declare-fun d!14222 () Bool)

(assert (=> d!14222 (= (head!362 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73293) (_1!2356 lt!73280) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!658 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73293) (_1!2356 lt!73280) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47203 d!14222))

(declare-fun d!14224 () Bool)

(assert (=> d!14224 (= (bitAt!0 (buf!1385 (_2!2355 lt!73264)) lt!73279) (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_2!2355 lt!73264))) ((_ extract 31 0) (bvsdiv lt!73279 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!73279 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3694 () Bool)

(assert (= bs!3694 d!14224))

(declare-fun m!73469 () Bool)

(assert (=> bs!3694 m!73469))

(declare-fun m!73471 () Bool)

(assert (=> bs!3694 m!73471))

(assert (=> b!47203 d!14224))

(declare-fun b!47605 () Bool)

(declare-fun e!31544 () Bool)

(declare-fun lt!73820 () List!543)

(assert (=> b!47605 (= e!31544 (isEmpty!139 lt!73820))))

(declare-fun b!47603 () Bool)

(declare-fun e!31543 () tuple2!4552)

(assert (=> b!47603 (= e!31543 (tuple2!4553 Nil!540 (_1!2356 lt!73275)))))

(declare-fun d!14226 () Bool)

(assert (=> d!14226 e!31544))

(declare-fun c!3281 () Bool)

(assert (=> d!14226 (= c!3281 (= (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14226 (= lt!73820 (_1!2369 e!31543))))

(declare-fun c!3282 () Bool)

(assert (=> d!14226 (= c!3282 (= (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14226 (bvsge (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14226 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73275) (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!73820)))

(declare-fun b!47606 () Bool)

(assert (=> b!47606 (= e!31544 (> (length!238 lt!73820) 0))))

(declare-fun b!47604 () Bool)

(declare-fun lt!73819 () (_ BitVec 64))

(declare-fun lt!73818 () tuple2!4554)

(assert (=> b!47604 (= e!31543 (tuple2!4553 (Cons!539 (_1!2370 lt!73818) (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_2!2370 lt!73818) (bvsub (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001) lt!73819))) (_2!2370 lt!73818)))))

(assert (=> b!47604 (= lt!73818 (readBit!0 (_1!2356 lt!73275)))))

(assert (=> b!47604 (= lt!73819 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14226 c!3282) b!47603))

(assert (= (and d!14226 (not c!3282)) b!47604))

(assert (= (and d!14226 c!3281) b!47605))

(assert (= (and d!14226 (not c!3281)) b!47606))

(declare-fun m!73473 () Bool)

(assert (=> b!47605 m!73473))

(declare-fun m!73475 () Bool)

(assert (=> b!47606 m!73475))

(declare-fun m!73477 () Bool)

(assert (=> b!47604 m!73477))

(declare-fun m!73479 () Bool)

(assert (=> b!47604 m!73479))

(assert (=> b!47203 d!14226))

(declare-fun d!14228 () Bool)

(assert (=> d!14228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73270)))

(declare-fun lt!73821 () Unit!3309)

(assert (=> d!14228 (= lt!73821 (choose!9 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73264)) lt!73270 (BitStream!1805 (buf!1385 (_2!2355 lt!73264)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!14228 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73264)) lt!73270) lt!73821)))

(declare-fun bs!3695 () Bool)

(assert (= bs!3695 d!14228))

(assert (=> bs!3695 m!72565))

(declare-fun m!73481 () Bool)

(assert (=> bs!3695 m!73481))

(assert (=> b!47203 d!14228))

(declare-fun d!14230 () Bool)

(declare-fun c!3283 () Bool)

(assert (=> d!14230 (= c!3283 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31545 () List!543)

(assert (=> d!14230 (= (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!31545)))

(declare-fun b!47607 () Bool)

(assert (=> b!47607 (= e!31545 Nil!540)))

(declare-fun b!47608 () Bool)

(assert (=> b!47608 (= e!31545 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14230 c!3283) b!47607))

(assert (= (and d!14230 (not c!3283)) b!47608))

(declare-fun m!73483 () Bool)

(assert (=> b!47608 m!73483))

(declare-fun m!73485 () Bool)

(assert (=> b!47608 m!73485))

(declare-fun m!73487 () Bool)

(assert (=> b!47608 m!73487))

(assert (=> b!47203 d!14230))

(declare-fun d!14232 () Bool)

(declare-fun c!3284 () Bool)

(assert (=> d!14232 (= c!3284 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31546 () List!543)

(assert (=> d!14232 (= (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31546)))

(declare-fun b!47609 () Bool)

(assert (=> b!47609 (= e!31546 Nil!540)))

(declare-fun b!47610 () Bool)

(assert (=> b!47610 (= e!31546 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!73264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14232 c!3284) b!47609))

(assert (= (and d!14232 (not c!3284)) b!47610))

(assert (=> b!47610 m!72513))

(declare-fun m!73489 () Bool)

(assert (=> b!47610 m!73489))

(assert (=> b!47610 m!72559))

(assert (=> b!47203 d!14232))

(declare-fun b!47611 () Bool)

(declare-fun res!40084 () Bool)

(declare-fun e!31547 () Bool)

(assert (=> b!47611 (=> (not res!40084) (not e!31547))))

(declare-fun lt!73825 () tuple2!4524)

(assert (=> b!47611 (= res!40084 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73825))) (currentByte!2890 (_2!2355 lt!73825)) (currentBit!2885 (_2!2355 lt!73825))) (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47612 () Bool)

(declare-fun e!31548 () Bool)

(declare-fun e!31549 () Bool)

(assert (=> b!47612 (= e!31548 e!31549)))

(declare-fun res!40086 () Bool)

(assert (=> b!47612 (=> (not res!40086) (not e!31549))))

(declare-fun lt!73830 () tuple2!4558)

(declare-fun lt!73829 () tuple2!4524)

(declare-fun lt!73831 () (_ BitVec 8))

(assert (=> b!47612 (= res!40086 (and (= (_2!2372 lt!73830) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!73831)) #b00000000000000000000000000000000))) (= (_1!2372 lt!73830) (_2!2355 lt!73829))))))

(declare-fun lt!73826 () tuple2!4556)

(declare-fun lt!73823 () BitStream!1804)

(assert (=> b!47612 (= lt!73826 (readBits!0 lt!73823 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!47612 (= lt!73830 (readBitPure!0 lt!73823))))

(assert (=> b!47612 (= lt!73823 (readerFrom!0 (_2!2355 lt!73829) (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283))))))

(declare-fun b!47613 () Bool)

(assert (=> b!47613 (= e!31549 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73830))) (currentByte!2890 (_1!2372 lt!73830)) (currentBit!2885 (_1!2372 lt!73830))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73829))) (currentByte!2890 (_2!2355 lt!73829)) (currentBit!2885 (_2!2355 lt!73829)))))))

(declare-fun b!47614 () Bool)

(declare-fun res!40087 () Bool)

(assert (=> b!47614 (=> (not res!40087) (not e!31548))))

(declare-fun lt!73832 () (_ BitVec 64))

(declare-fun lt!73822 () (_ BitVec 64))

(assert (=> b!47614 (= res!40087 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73829))) (currentByte!2890 (_2!2355 lt!73829)) (currentBit!2885 (_2!2355 lt!73829))) (bvadd lt!73832 lt!73822)))))

(assert (=> b!47614 (or (not (= (bvand lt!73832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73822 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73832 lt!73822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47614 (= lt!73822 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47614 (= lt!73832 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun b!47615 () Bool)

(declare-fun e!31550 () Bool)

(declare-fun lt!73828 () tuple2!4558)

(assert (=> b!47615 (= e!31550 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73828))) (currentByte!2890 (_1!2372 lt!73828)) (currentBit!2885 (_1!2372 lt!73828))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73825))) (currentByte!2890 (_2!2355 lt!73825)) (currentBit!2885 (_2!2355 lt!73825)))))))

(declare-fun b!47616 () Bool)

(declare-fun res!40085 () Bool)

(assert (=> b!47616 (=> (not res!40085) (not e!31547))))

(assert (=> b!47616 (= res!40085 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73825)))))

(declare-fun d!14234 () Bool)

(assert (=> d!14234 e!31548))

(declare-fun res!40083 () Bool)

(assert (=> d!14234 (=> (not res!40083) (not e!31548))))

(assert (=> d!14234 (= res!40083 (= (size!1036 (buf!1385 (_2!2355 lt!73829))) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(declare-fun lt!73824 () array!2293)

(assert (=> d!14234 (= lt!73831 (select (arr!1556 lt!73824) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14234 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1036 lt!73824)))))

(assert (=> d!14234 (= lt!73824 (array!2294 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!73833 () tuple2!4524)

(assert (=> d!14234 (= lt!73829 (tuple2!4525 (_1!2355 lt!73833) (_2!2355 lt!73833)))))

(assert (=> d!14234 (= lt!73833 lt!73825)))

(assert (=> d!14234 e!31547))

(declare-fun res!40090 () Bool)

(assert (=> d!14234 (=> (not res!40090) (not e!31547))))

(assert (=> d!14234 (= res!40090 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!73825)))))))

(declare-fun lt!73827 () Bool)

(assert (=> d!14234 (= lt!73825 (appendBit!0 (_2!2355 lt!72283) lt!73827))))

(assert (=> d!14234 (= lt!73827 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14234 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14234 (= (appendBitFromByte!0 (_2!2355 lt!72283) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!73829)))

(declare-fun b!47617 () Bool)

(declare-fun res!40088 () Bool)

(assert (=> b!47617 (=> (not res!40088) (not e!31548))))

(assert (=> b!47617 (= res!40088 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73829)))))

(declare-fun b!47618 () Bool)

(assert (=> b!47618 (= e!31547 e!31550)))

(declare-fun res!40089 () Bool)

(assert (=> b!47618 (=> (not res!40089) (not e!31550))))

(assert (=> b!47618 (= res!40089 (and (= (_2!2372 lt!73828) lt!73827) (= (_1!2372 lt!73828) (_2!2355 lt!73825))))))

(assert (=> b!47618 (= lt!73828 (readBitPure!0 (readerFrom!0 (_2!2355 lt!73825) (currentBit!2885 (_2!2355 lt!72283)) (currentByte!2890 (_2!2355 lt!72283)))))))

(assert (= (and d!14234 res!40090) b!47611))

(assert (= (and b!47611 res!40084) b!47616))

(assert (= (and b!47616 res!40085) b!47618))

(assert (= (and b!47618 res!40089) b!47615))

(assert (= (and d!14234 res!40083) b!47614))

(assert (= (and b!47614 res!40087) b!47617))

(assert (= (and b!47617 res!40088) b!47612))

(assert (= (and b!47612 res!40086) b!47613))

(declare-fun m!73491 () Bool)

(assert (=> b!47613 m!73491))

(declare-fun m!73493 () Bool)

(assert (=> b!47613 m!73493))

(declare-fun m!73495 () Bool)

(assert (=> b!47617 m!73495))

(declare-fun m!73497 () Bool)

(assert (=> d!14234 m!73497))

(declare-fun m!73499 () Bool)

(assert (=> d!14234 m!73499))

(assert (=> d!14234 m!73489))

(declare-fun m!73501 () Bool)

(assert (=> b!47616 m!73501))

(declare-fun m!73503 () Bool)

(assert (=> b!47618 m!73503))

(assert (=> b!47618 m!73503))

(declare-fun m!73505 () Bool)

(assert (=> b!47618 m!73505))

(declare-fun m!73507 () Bool)

(assert (=> b!47611 m!73507))

(assert (=> b!47611 m!71721))

(declare-fun m!73509 () Bool)

(assert (=> b!47612 m!73509))

(declare-fun m!73511 () Bool)

(assert (=> b!47612 m!73511))

(declare-fun m!73513 () Bool)

(assert (=> b!47612 m!73513))

(declare-fun m!73515 () Bool)

(assert (=> b!47615 m!73515))

(assert (=> b!47615 m!73507))

(assert (=> b!47614 m!73493))

(assert (=> b!47614 m!71721))

(assert (=> b!47203 d!14234))

(declare-fun d!14236 () Bool)

(assert (=> d!14236 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73270) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!73270))))

(declare-fun bs!3696 () Bool)

(assert (= bs!3696 d!14236))

(declare-fun m!73517 () Bool)

(assert (=> bs!3696 m!73517))

(assert (=> b!47203 d!14236))

(declare-fun d!14238 () Bool)

(declare-fun e!31551 () Bool)

(assert (=> d!14238 e!31551))

(declare-fun res!40092 () Bool)

(assert (=> d!14238 (=> (not res!40092) (not e!31551))))

(declare-fun lt!73839 () (_ BitVec 64))

(declare-fun lt!73837 () (_ BitVec 64))

(declare-fun lt!73836 () (_ BitVec 64))

(assert (=> d!14238 (= res!40092 (= lt!73836 (bvsub lt!73839 lt!73837)))))

(assert (=> d!14238 (or (= (bvand lt!73839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73839 lt!73837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14238 (= lt!73837 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293)))))))

(declare-fun lt!73835 () (_ BitVec 64))

(declare-fun lt!73838 () (_ BitVec 64))

(assert (=> d!14238 (= lt!73839 (bvmul lt!73835 lt!73838))))

(assert (=> d!14238 (or (= lt!73835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73838 (bvsdiv (bvmul lt!73835 lt!73838) lt!73835)))))

(assert (=> d!14238 (= lt!73838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14238 (= lt!73835 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))))))

(assert (=> d!14238 (= lt!73836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293)))))))

(assert (=> d!14238 (invariant!0 (currentBit!2885 (_2!2355 lt!73293)) (currentByte!2890 (_2!2355 lt!73293)) (size!1036 (buf!1385 (_2!2355 lt!73293))))))

(assert (=> d!14238 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))) lt!73836)))

(declare-fun b!47619 () Bool)

(declare-fun res!40091 () Bool)

(assert (=> b!47619 (=> (not res!40091) (not e!31551))))

(assert (=> b!47619 (= res!40091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73836))))

(declare-fun b!47620 () Bool)

(declare-fun lt!73834 () (_ BitVec 64))

(assert (=> b!47620 (= e!31551 (bvsle lt!73836 (bvmul lt!73834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47620 (or (= lt!73834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73834)))))

(assert (=> b!47620 (= lt!73834 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))))))

(assert (= (and d!14238 res!40092) b!47619))

(assert (= (and b!47619 res!40091) b!47620))

(declare-fun m!73519 () Bool)

(assert (=> d!14238 m!73519))

(declare-fun m!73521 () Bool)

(assert (=> d!14238 m!73521))

(assert (=> b!47203 d!14238))

(declare-fun b!47621 () Bool)

(declare-fun res!40094 () Bool)

(declare-fun e!31553 () Bool)

(assert (=> b!47621 (=> (not res!40094) (not e!31553))))

(declare-fun lt!73862 () tuple2!4524)

(assert (=> b!47621 (= res!40094 (= (size!1036 (buf!1385 (_2!2355 lt!73293))) (size!1036 (buf!1385 (_2!2355 lt!73862)))))))

(declare-fun d!14240 () Bool)

(assert (=> d!14240 e!31553))

(declare-fun res!40093 () Bool)

(assert (=> d!14240 (=> (not res!40093) (not e!31553))))

(declare-fun lt!73864 () (_ BitVec 64))

(assert (=> d!14240 (= res!40093 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73862))) (currentByte!2890 (_2!2355 lt!73862)) (currentBit!2885 (_2!2355 lt!73862))) (bvsub lt!73864 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!14240 (or (= (bvand lt!73864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73864 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73880 () (_ BitVec 64))

(assert (=> d!14240 (= lt!73864 (bvadd lt!73880 to!314))))

(assert (=> d!14240 (or (not (= (bvand lt!73880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73880 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14240 (= lt!73880 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(declare-fun e!31554 () tuple2!4524)

(assert (=> d!14240 (= lt!73862 e!31554)))

(declare-fun c!3285 () Bool)

(assert (=> d!14240 (= c!3285 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!73854 () Unit!3309)

(declare-fun lt!73853 () Unit!3309)

(assert (=> d!14240 (= lt!73854 lt!73853)))

(assert (=> d!14240 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73293))))

(assert (=> d!14240 (= lt!73853 (lemmaIsPrefixRefl!0 (_2!2355 lt!73293)))))

(declare-fun lt!73856 () (_ BitVec 64))

(assert (=> d!14240 (= lt!73856 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(assert (=> d!14240 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14240 (= (appendBitsMSBFirstLoop!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!73862)))

(declare-fun b!47622 () Bool)

(declare-fun e!31552 () Bool)

(declare-fun lt!73877 () (_ BitVec 64))

(assert (=> b!47622 (= e!31552 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73877))))

(declare-fun b!47623 () Bool)

(declare-fun res!40098 () Bool)

(assert (=> b!47623 (=> (not res!40098) (not e!31553))))

(assert (=> b!47623 (= res!40098 (= (size!1036 (buf!1385 (_2!2355 lt!73862))) (size!1036 (buf!1385 (_2!2355 lt!73293)))))))

(declare-fun b!47624 () Bool)

(declare-fun res!40095 () Bool)

(assert (=> b!47624 (=> (not res!40095) (not e!31553))))

(assert (=> b!47624 (= res!40095 (invariant!0 (currentBit!2885 (_2!2355 lt!73862)) (currentByte!2890 (_2!2355 lt!73862)) (size!1036 (buf!1385 (_2!2355 lt!73862)))))))

(declare-fun b!47625 () Bool)

(declare-fun Unit!3356 () Unit!3309)

(assert (=> b!47625 (= e!31554 (tuple2!4525 Unit!3356 (_2!2355 lt!73293)))))

(assert (=> b!47625 (= (size!1036 (buf!1385 (_2!2355 lt!73293))) (size!1036 (buf!1385 (_2!2355 lt!73293))))))

(declare-fun lt!73879 () Unit!3309)

(declare-fun Unit!3357 () Unit!3309)

(assert (=> b!47625 (= lt!73879 Unit!3357)))

(declare-fun call!585 () tuple2!4526)

(assert (=> b!47625 (checkByteArrayBitContent!0 (_2!2355 lt!73293) srcBuffer!2 (_1!2371 (readBits!0 (_1!2356 call!585) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47626 () Bool)

(declare-fun lt!73841 () tuple2!4524)

(declare-fun Unit!3358 () Unit!3309)

(assert (=> b!47626 (= e!31554 (tuple2!4525 Unit!3358 (_2!2355 lt!73841)))))

(declare-fun lt!73870 () tuple2!4524)

(assert (=> b!47626 (= lt!73870 (appendBitFromByte!0 (_2!2355 lt!73293) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!73869 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73869 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73875 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73875 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73851 () Unit!3309)

(assert (=> b!47626 (= lt!73851 (validateOffsetBitsIneqLemma!0 (_2!2355 lt!73293) (_2!2355 lt!73870) lt!73869 lt!73875))))

(assert (=> b!47626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73870)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73870))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73870))) (bvsub lt!73869 lt!73875))))

(declare-fun lt!73861 () Unit!3309)

(assert (=> b!47626 (= lt!73861 lt!73851)))

(declare-fun lt!73857 () tuple2!4526)

(assert (=> b!47626 (= lt!73857 (reader!0 (_2!2355 lt!73293) (_2!2355 lt!73870)))))

(declare-fun lt!73881 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73871 () Unit!3309)

(assert (=> b!47626 (= lt!73871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73870)) lt!73881))))

(assert (=> b!47626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73870)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73881)))

(declare-fun lt!73874 () Unit!3309)

(assert (=> b!47626 (= lt!73874 lt!73871)))

(assert (=> b!47626 (= (head!362 (byteArrayBitContentToList!0 (_2!2355 lt!73870) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!362 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73870) (_1!2356 lt!73857) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73848 () Unit!3309)

(declare-fun Unit!3359 () Unit!3309)

(assert (=> b!47626 (= lt!73848 Unit!3359)))

(assert (=> b!47626 (= lt!73841 (appendBitsMSBFirstLoop!0 (_2!2355 lt!73870) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!73872 () Unit!3309)

(assert (=> b!47626 (= lt!73872 (lemmaIsPrefixTransitive!0 (_2!2355 lt!73293) (_2!2355 lt!73870) (_2!2355 lt!73841)))))

(assert (=> b!47626 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73841))))

(declare-fun lt!73863 () Unit!3309)

(assert (=> b!47626 (= lt!73863 lt!73872)))

(assert (=> b!47626 (= (size!1036 (buf!1385 (_2!2355 lt!73841))) (size!1036 (buf!1385 (_2!2355 lt!73293))))))

(declare-fun lt!73843 () Unit!3309)

(declare-fun Unit!3360 () Unit!3309)

(assert (=> b!47626 (= lt!73843 Unit!3360)))

(assert (=> b!47626 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73841))) (currentByte!2890 (_2!2355 lt!73841)) (currentBit!2885 (_2!2355 lt!73841))) (bvsub (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73844 () Unit!3309)

(declare-fun Unit!3361 () Unit!3309)

(assert (=> b!47626 (= lt!73844 Unit!3361)))

(assert (=> b!47626 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73841))) (currentByte!2890 (_2!2355 lt!73841)) (currentBit!2885 (_2!2355 lt!73841))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73870))) (currentByte!2890 (_2!2355 lt!73870)) (currentBit!2885 (_2!2355 lt!73870))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73873 () Unit!3309)

(declare-fun Unit!3362 () Unit!3309)

(assert (=> b!47626 (= lt!73873 Unit!3362)))

(declare-fun lt!73883 () tuple2!4526)

(assert (=> b!47626 (= lt!73883 call!585)))

(declare-fun lt!73847 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73847 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73855 () Unit!3309)

(assert (=> b!47626 (= lt!73855 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73841)) lt!73847))))

(assert (=> b!47626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73841)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73847)))

(declare-fun lt!73850 () Unit!3309)

(assert (=> b!47626 (= lt!73850 lt!73855)))

(declare-fun lt!73852 () tuple2!4526)

(assert (=> b!47626 (= lt!73852 (reader!0 (_2!2355 lt!73870) (_2!2355 lt!73841)))))

(declare-fun lt!73845 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73845 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73840 () Unit!3309)

(assert (=> b!47626 (= lt!73840 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73870) (buf!1385 (_2!2355 lt!73841)) lt!73845))))

(assert (=> b!47626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73841)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73870))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73870))) lt!73845)))

(declare-fun lt!73865 () Unit!3309)

(assert (=> b!47626 (= lt!73865 lt!73840)))

(declare-fun lt!73858 () List!543)

(assert (=> b!47626 (= lt!73858 (byteArrayBitContentToList!0 (_2!2355 lt!73841) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!73846 () List!543)

(assert (=> b!47626 (= lt!73846 (byteArrayBitContentToList!0 (_2!2355 lt!73841) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73859 () List!543)

(assert (=> b!47626 (= lt!73859 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73841) (_1!2356 lt!73883) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!73866 () List!543)

(assert (=> b!47626 (= lt!73866 (bitStreamReadBitsIntoList!0 (_2!2355 lt!73841) (_1!2356 lt!73852) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73842 () (_ BitVec 64))

(assert (=> b!47626 (= lt!73842 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73849 () Unit!3309)

(assert (=> b!47626 (= lt!73849 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2355 lt!73841) (_2!2355 lt!73841) (_1!2356 lt!73883) (_1!2356 lt!73852) lt!73842 lt!73859))))

(assert (=> b!47626 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73841) (_1!2356 lt!73852) (bvsub lt!73842 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!229 lt!73859))))

(declare-fun lt!73868 () Unit!3309)

(assert (=> b!47626 (= lt!73868 lt!73849)))

(declare-fun lt!73882 () Unit!3309)

(assert (=> b!47626 (= lt!73882 (arrayBitRangesEqImpliesEq!0 (buf!1385 (_2!2355 lt!73870)) (buf!1385 (_2!2355 lt!73841)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!73856 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73870))) (currentByte!2890 (_2!2355 lt!73870)) (currentBit!2885 (_2!2355 lt!73870)))))))

(assert (=> b!47626 (= (bitAt!0 (buf!1385 (_2!2355 lt!73870)) lt!73856) (bitAt!0 (buf!1385 (_2!2355 lt!73841)) lt!73856))))

(declare-fun lt!73867 () Unit!3309)

(assert (=> b!47626 (= lt!73867 lt!73882)))

(declare-fun b!47627 () Bool)

(declare-fun lt!73878 () tuple2!4526)

(assert (=> b!47627 (= e!31553 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73862) (_1!2356 lt!73878) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2355 lt!73862) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!47627 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47627 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73860 () Unit!3309)

(declare-fun lt!73876 () Unit!3309)

(assert (=> b!47627 (= lt!73860 lt!73876)))

(assert (=> b!47627 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73862)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73877)))

(assert (=> b!47627 (= lt!73876 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73862)) lt!73877))))

(assert (=> b!47627 e!31552))

(declare-fun res!40097 () Bool)

(assert (=> b!47627 (=> (not res!40097) (not e!31552))))

(assert (=> b!47627 (= res!40097 (and (= (size!1036 (buf!1385 (_2!2355 lt!73293))) (size!1036 (buf!1385 (_2!2355 lt!73862)))) (bvsge lt!73877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47627 (= lt!73877 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47627 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47627 (= lt!73878 (reader!0 (_2!2355 lt!73293) (_2!2355 lt!73862)))))

(declare-fun b!47628 () Bool)

(declare-fun res!40096 () Bool)

(assert (=> b!47628 (=> (not res!40096) (not e!31553))))

(assert (=> b!47628 (= res!40096 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73862)))))

(declare-fun bm!582 () Bool)

(assert (=> bm!582 (= call!585 (reader!0 (_2!2355 lt!73293) (ite c!3285 (_2!2355 lt!73841) (_2!2355 lt!73293))))))

(assert (= (and d!14240 c!3285) b!47626))

(assert (= (and d!14240 (not c!3285)) b!47625))

(assert (= (or b!47626 b!47625) bm!582))

(assert (= (and d!14240 res!40093) b!47624))

(assert (= (and b!47624 res!40095) b!47621))

(assert (= (and b!47621 res!40094) b!47628))

(assert (= (and b!47628 res!40096) b!47623))

(assert (= (and b!47623 res!40098) b!47627))

(assert (= (and b!47627 res!40097) b!47622))

(declare-fun m!73523 () Bool)

(assert (=> b!47625 m!73523))

(declare-fun m!73525 () Bool)

(assert (=> b!47625 m!73525))

(declare-fun m!73527 () Bool)

(assert (=> b!47628 m!73527))

(declare-fun m!73529 () Bool)

(assert (=> bm!582 m!73529))

(declare-fun m!73531 () Bool)

(assert (=> b!47622 m!73531))

(declare-fun m!73533 () Bool)

(assert (=> b!47624 m!73533))

(declare-fun m!73535 () Bool)

(assert (=> d!14240 m!73535))

(assert (=> d!14240 m!72525))

(declare-fun m!73537 () Bool)

(assert (=> d!14240 m!73537))

(declare-fun m!73539 () Bool)

(assert (=> d!14240 m!73539))

(declare-fun m!73541 () Bool)

(assert (=> b!47626 m!73541))

(declare-fun m!73543 () Bool)

(assert (=> b!47626 m!73543))

(assert (=> b!47626 m!73483))

(declare-fun m!73545 () Bool)

(assert (=> b!47626 m!73545))

(declare-fun m!73547 () Bool)

(assert (=> b!47626 m!73547))

(declare-fun m!73549 () Bool)

(assert (=> b!47626 m!73549))

(declare-fun m!73551 () Bool)

(assert (=> b!47626 m!73551))

(assert (=> b!47626 m!72525))

(assert (=> b!47626 m!73483))

(declare-fun m!73553 () Bool)

(assert (=> b!47626 m!73553))

(declare-fun m!73555 () Bool)

(assert (=> b!47626 m!73555))

(declare-fun m!73557 () Bool)

(assert (=> b!47626 m!73557))

(declare-fun m!73559 () Bool)

(assert (=> b!47626 m!73559))

(assert (=> b!47626 m!73545))

(declare-fun m!73561 () Bool)

(assert (=> b!47626 m!73561))

(declare-fun m!73563 () Bool)

(assert (=> b!47626 m!73563))

(declare-fun m!73565 () Bool)

(assert (=> b!47626 m!73565))

(declare-fun m!73567 () Bool)

(assert (=> b!47626 m!73567))

(assert (=> b!47626 m!73567))

(declare-fun m!73569 () Bool)

(assert (=> b!47626 m!73569))

(declare-fun m!73571 () Bool)

(assert (=> b!47626 m!73571))

(declare-fun m!73573 () Bool)

(assert (=> b!47626 m!73573))

(declare-fun m!73575 () Bool)

(assert (=> b!47626 m!73575))

(declare-fun m!73577 () Bool)

(assert (=> b!47626 m!73577))

(assert (=> b!47626 m!73555))

(declare-fun m!73579 () Bool)

(assert (=> b!47626 m!73579))

(declare-fun m!73581 () Bool)

(assert (=> b!47626 m!73581))

(declare-fun m!73583 () Bool)

(assert (=> b!47626 m!73583))

(declare-fun m!73585 () Bool)

(assert (=> b!47626 m!73585))

(declare-fun m!73587 () Bool)

(assert (=> b!47626 m!73587))

(declare-fun m!73589 () Bool)

(assert (=> b!47626 m!73589))

(declare-fun m!73591 () Bool)

(assert (=> b!47626 m!73591))

(declare-fun m!73593 () Bool)

(assert (=> b!47626 m!73593))

(declare-fun m!73595 () Bool)

(assert (=> b!47626 m!73595))

(declare-fun m!73597 () Bool)

(assert (=> b!47626 m!73597))

(declare-fun m!73599 () Bool)

(assert (=> b!47626 m!73599))

(declare-fun m!73601 () Bool)

(assert (=> b!47627 m!73601))

(declare-fun m!73603 () Bool)

(assert (=> b!47627 m!73603))

(declare-fun m!73605 () Bool)

(assert (=> b!47627 m!73605))

(declare-fun m!73607 () Bool)

(assert (=> b!47627 m!73607))

(declare-fun m!73609 () Bool)

(assert (=> b!47627 m!73609))

(assert (=> b!47203 d!14240))

(declare-fun d!14242 () Bool)

(assert (=> d!14242 (= (tail!229 lt!73282) (t!1293 lt!73282))))

(assert (=> b!47203 d!14242))

(declare-fun d!14244 () Bool)

(assert (=> d!14244 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73268)))

(declare-fun lt!73884 () Unit!3309)

(assert (=> d!14244 (= lt!73884 (choose!9 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73264)) lt!73268 (BitStream!1805 (buf!1385 (_2!2355 lt!73264)) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293)))))))

(assert (=> d!14244 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!73293) (buf!1385 (_2!2355 lt!73264)) lt!73268) lt!73884)))

(declare-fun bs!3697 () Bool)

(assert (= bs!3697 d!14244))

(assert (=> bs!3697 m!72511))

(declare-fun m!73611 () Bool)

(assert (=> bs!3697 m!73611))

(assert (=> b!47203 d!14244))

(declare-fun d!14246 () Bool)

(assert (=> d!14246 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73264))))

(declare-fun lt!73885 () Unit!3309)

(assert (=> d!14246 (= lt!73885 (choose!30 (_2!2355 lt!72283) (_2!2355 lt!73293) (_2!2355 lt!73264)))))

(assert (=> d!14246 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73293))))

(assert (=> d!14246 (= (lemmaIsPrefixTransitive!0 (_2!2355 lt!72283) (_2!2355 lt!73293) (_2!2355 lt!73264)) lt!73885)))

(declare-fun bs!3698 () Bool)

(assert (= bs!3698 d!14246))

(assert (=> bs!3698 m!72543))

(declare-fun m!73613 () Bool)

(assert (=> bs!3698 m!73613))

(declare-fun m!73615 () Bool)

(assert (=> bs!3698 m!73615))

(assert (=> b!47203 d!14246))

(declare-fun d!14248 () Bool)

(declare-fun c!3286 () Bool)

(assert (=> d!14248 (= c!3286 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31555 () List!543)

(assert (=> d!14248 (= (byteArrayBitContentToList!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!31555)))

(declare-fun b!47629 () Bool)

(assert (=> b!47629 (= e!31555 Nil!540)))

(declare-fun b!47630 () Bool)

(assert (=> b!47630 (= e!31555 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14248 c!3286) b!47629))

(assert (= (and d!14248 (not c!3286)) b!47630))

(assert (=> b!47630 m!72513))

(assert (=> b!47630 m!73489))

(declare-fun m!73617 () Bool)

(assert (=> b!47630 m!73617))

(assert (=> b!47203 d!14248))

(declare-fun d!14250 () Bool)

(declare-fun res!40100 () Bool)

(declare-fun e!31557 () Bool)

(assert (=> d!14250 (=> (not res!40100) (not e!31557))))

(assert (=> d!14250 (= res!40100 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!73264)))))))

(assert (=> d!14250 (= (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73264)) e!31557)))

(declare-fun b!47631 () Bool)

(declare-fun res!40099 () Bool)

(assert (=> b!47631 (=> (not res!40099) (not e!31557))))

(assert (=> b!47631 (= res!40099 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73264))) (currentByte!2890 (_2!2355 lt!73264)) (currentBit!2885 (_2!2355 lt!73264)))))))

(declare-fun b!47632 () Bool)

(declare-fun e!31556 () Bool)

(assert (=> b!47632 (= e!31557 e!31556)))

(declare-fun res!40101 () Bool)

(assert (=> b!47632 (=> res!40101 e!31556)))

(assert (=> b!47632 (= res!40101 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000))))

(declare-fun b!47633 () Bool)

(assert (=> b!47633 (= e!31556 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!73264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (= (and d!14250 res!40100) b!47631))

(assert (= (and b!47631 res!40099) b!47632))

(assert (= (and b!47632 (not res!40101)) b!47633))

(assert (=> b!47631 m!71721))

(assert (=> b!47631 m!72529))

(assert (=> b!47633 m!71721))

(assert (=> b!47633 m!71721))

(declare-fun m!73619 () Bool)

(assert (=> b!47633 m!73619))

(assert (=> b!47203 d!14250))

(declare-fun d!14252 () Bool)

(assert (=> d!14252 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) (bvsub lt!73292 lt!73298)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293)))) (bvsub lt!73292 lt!73298)))))

(declare-fun bs!3699 () Bool)

(assert (= bs!3699 d!14252))

(assert (=> bs!3699 m!73519))

(assert (=> b!47203 d!14252))

(declare-fun d!14254 () Bool)

(declare-fun e!31558 () Bool)

(assert (=> d!14254 e!31558))

(declare-fun res!40102 () Bool)

(assert (=> d!14254 (=> (not res!40102) (not e!31558))))

(declare-fun lt!73887 () (_ BitVec 64))

(assert (=> d!14254 (= res!40102 (or (= (bvand lt!73265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73887 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73265 lt!73887) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14254 (= lt!73887 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73886 () Unit!3309)

(assert (=> d!14254 (= lt!73886 (choose!42 (_2!2355 lt!73264) (_2!2355 lt!73264) (_1!2356 lt!73306) (_1!2356 lt!73275) lt!73265 lt!73282))))

(assert (=> d!14254 (bvsgt lt!73265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14254 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2355 lt!73264) (_2!2355 lt!73264) (_1!2356 lt!73306) (_1!2356 lt!73275) lt!73265 lt!73282) lt!73886)))

(declare-fun b!47634 () Bool)

(assert (=> b!47634 (= e!31558 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73275) (bvsub lt!73265 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!229 lt!73282)))))

(assert (= (and d!14254 res!40102) b!47634))

(declare-fun m!73621 () Bool)

(assert (=> d!14254 m!73621))

(assert (=> b!47634 m!72569))

(assert (=> b!47634 m!72545))

(assert (=> b!47203 d!14254))

(declare-fun b!47635 () Bool)

(declare-fun e!31559 () Unit!3309)

(declare-fun Unit!3363 () Unit!3309)

(assert (=> b!47635 (= e!31559 Unit!3363)))

(declare-fun b!47636 () Bool)

(declare-fun res!40105 () Bool)

(declare-fun e!31560 () Bool)

(assert (=> b!47636 (=> (not res!40105) (not e!31560))))

(declare-fun lt!73905 () tuple2!4526)

(assert (=> b!47636 (= res!40105 (isPrefixOf!0 (_2!2356 lt!73905) (_2!2355 lt!73293)))))

(declare-fun b!47637 () Bool)

(declare-fun res!40104 () Bool)

(assert (=> b!47637 (=> (not res!40104) (not e!31560))))

(assert (=> b!47637 (= res!40104 (isPrefixOf!0 (_1!2356 lt!73905) (_2!2355 lt!72283)))))

(declare-fun b!47638 () Bool)

(declare-fun lt!73891 () Unit!3309)

(assert (=> b!47638 (= e!31559 lt!73891)))

(declare-fun lt!73893 () (_ BitVec 64))

(assert (=> b!47638 (= lt!73893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73902 () (_ BitVec 64))

(assert (=> b!47638 (= lt!73902 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> b!47638 (= lt!73891 (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!73293)) lt!73893 lt!73902))))

(assert (=> b!47638 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!73293)) (buf!1385 (_2!2355 lt!72283)) lt!73893 lt!73902)))

(declare-fun lt!73889 () (_ BitVec 64))

(declare-fun b!47639 () Bool)

(declare-fun lt!73898 () (_ BitVec 64))

(assert (=> b!47639 (= e!31560 (= (_1!2356 lt!73905) (withMovedBitIndex!0 (_2!2356 lt!73905) (bvsub lt!73898 lt!73889))))))

(assert (=> b!47639 (or (= (bvand lt!73898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73889 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73898 lt!73889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47639 (= lt!73889 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(assert (=> b!47639 (= lt!73898 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun d!14256 () Bool)

(assert (=> d!14256 e!31560))

(declare-fun res!40103 () Bool)

(assert (=> d!14256 (=> (not res!40103) (not e!31560))))

(assert (=> d!14256 (= res!40103 (isPrefixOf!0 (_1!2356 lt!73905) (_2!2356 lt!73905)))))

(declare-fun lt!73904 () BitStream!1804)

(assert (=> d!14256 (= lt!73905 (tuple2!4527 lt!73904 (_2!2355 lt!73293)))))

(declare-fun lt!73897 () Unit!3309)

(declare-fun lt!73888 () Unit!3309)

(assert (=> d!14256 (= lt!73897 lt!73888)))

(assert (=> d!14256 (isPrefixOf!0 lt!73904 (_2!2355 lt!73293))))

(assert (=> d!14256 (= lt!73888 (lemmaIsPrefixTransitive!0 lt!73904 (_2!2355 lt!73293) (_2!2355 lt!73293)))))

(declare-fun lt!73903 () Unit!3309)

(declare-fun lt!73896 () Unit!3309)

(assert (=> d!14256 (= lt!73903 lt!73896)))

(assert (=> d!14256 (isPrefixOf!0 lt!73904 (_2!2355 lt!73293))))

(assert (=> d!14256 (= lt!73896 (lemmaIsPrefixTransitive!0 lt!73904 (_2!2355 lt!72283) (_2!2355 lt!73293)))))

(declare-fun lt!73906 () Unit!3309)

(assert (=> d!14256 (= lt!73906 e!31559)))

(declare-fun c!3287 () Bool)

(assert (=> d!14256 (= c!3287 (not (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000)))))

(declare-fun lt!73901 () Unit!3309)

(declare-fun lt!73894 () Unit!3309)

(assert (=> d!14256 (= lt!73901 lt!73894)))

(assert (=> d!14256 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73293))))

(assert (=> d!14256 (= lt!73894 (lemmaIsPrefixRefl!0 (_2!2355 lt!73293)))))

(declare-fun lt!73899 () Unit!3309)

(declare-fun lt!73895 () Unit!3309)

(assert (=> d!14256 (= lt!73899 lt!73895)))

(assert (=> d!14256 (= lt!73895 (lemmaIsPrefixRefl!0 (_2!2355 lt!73293)))))

(declare-fun lt!73900 () Unit!3309)

(declare-fun lt!73892 () Unit!3309)

(assert (=> d!14256 (= lt!73900 lt!73892)))

(assert (=> d!14256 (isPrefixOf!0 lt!73904 lt!73904)))

(assert (=> d!14256 (= lt!73892 (lemmaIsPrefixRefl!0 lt!73904))))

(declare-fun lt!73907 () Unit!3309)

(declare-fun lt!73890 () Unit!3309)

(assert (=> d!14256 (= lt!73907 lt!73890)))

(assert (=> d!14256 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!14256 (= lt!73890 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(assert (=> d!14256 (= lt!73904 (BitStream!1805 (buf!1385 (_2!2355 lt!73293)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> d!14256 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73293))))

(assert (=> d!14256 (= (reader!0 (_2!2355 lt!72283) (_2!2355 lt!73293)) lt!73905)))

(assert (= (and d!14256 c!3287) b!47638))

(assert (= (and d!14256 (not c!3287)) b!47635))

(assert (= (and d!14256 res!40103) b!47637))

(assert (= (and b!47637 res!40104) b!47636))

(assert (= (and b!47636 res!40105) b!47639))

(declare-fun m!73623 () Bool)

(assert (=> b!47639 m!73623))

(assert (=> b!47639 m!72525))

(assert (=> b!47639 m!71721))

(assert (=> b!47638 m!71721))

(declare-fun m!73625 () Bool)

(assert (=> b!47638 m!73625))

(declare-fun m!73627 () Bool)

(assert (=> b!47638 m!73627))

(declare-fun m!73629 () Bool)

(assert (=> b!47637 m!73629))

(declare-fun m!73631 () Bool)

(assert (=> d!14256 m!73631))

(assert (=> d!14256 m!73537))

(declare-fun m!73633 () Bool)

(assert (=> d!14256 m!73633))

(declare-fun m!73635 () Bool)

(assert (=> d!14256 m!73635))

(declare-fun m!73637 () Bool)

(assert (=> d!14256 m!73637))

(assert (=> d!14256 m!73539))

(assert (=> d!14256 m!72361))

(declare-fun m!73639 () Bool)

(assert (=> d!14256 m!73639))

(declare-fun m!73641 () Bool)

(assert (=> d!14256 m!73641))

(assert (=> d!14256 m!72369))

(assert (=> d!14256 m!73615))

(declare-fun m!73643 () Bool)

(assert (=> b!47636 m!73643))

(assert (=> b!47203 d!14256))

(declare-fun b!47642 () Bool)

(declare-fun e!31562 () Bool)

(declare-fun lt!73910 () List!543)

(assert (=> b!47642 (= e!31562 (isEmpty!139 lt!73910))))

(declare-fun b!47640 () Bool)

(declare-fun e!31561 () tuple2!4552)

(assert (=> b!47640 (= e!31561 (tuple2!4553 Nil!540 (_1!2356 lt!73280)))))

(declare-fun d!14258 () Bool)

(assert (=> d!14258 e!31562))

(declare-fun c!3288 () Bool)

(assert (=> d!14258 (= c!3288 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14258 (= lt!73910 (_1!2369 e!31561))))

(declare-fun c!3289 () Bool)

(assert (=> d!14258 (= c!3289 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14258 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14258 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73293) (_1!2356 lt!73280) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73910)))

(declare-fun b!47643 () Bool)

(assert (=> b!47643 (= e!31562 (> (length!238 lt!73910) 0))))

(declare-fun lt!73909 () (_ BitVec 64))

(declare-fun lt!73908 () tuple2!4554)

(declare-fun b!47641 () Bool)

(assert (=> b!47641 (= e!31561 (tuple2!4553 (Cons!539 (_1!2370 lt!73908) (bitStreamReadBitsIntoList!0 (_2!2355 lt!73293) (_2!2370 lt!73908) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!73909))) (_2!2370 lt!73908)))))

(assert (=> b!47641 (= lt!73908 (readBit!0 (_1!2356 lt!73280)))))

(assert (=> b!47641 (= lt!73909 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14258 c!3289) b!47640))

(assert (= (and d!14258 (not c!3289)) b!47641))

(assert (= (and d!14258 c!3288) b!47642))

(assert (= (and d!14258 (not c!3288)) b!47643))

(declare-fun m!73645 () Bool)

(assert (=> b!47642 m!73645))

(declare-fun m!73647 () Bool)

(assert (=> b!47643 m!73647))

(declare-fun m!73649 () Bool)

(assert (=> b!47641 m!73649))

(declare-fun m!73651 () Bool)

(assert (=> b!47641 m!73651))

(assert (=> b!47203 d!14258))

(assert (=> b!47203 d!13810))

(declare-fun d!14260 () Bool)

(assert (=> d!14260 (= (head!362 (byteArrayBitContentToList!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!658 (byteArrayBitContentToList!0 (_2!2355 lt!73293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47203 d!14260))

(declare-fun b!47646 () Bool)

(declare-fun e!31564 () Bool)

(declare-fun lt!73913 () List!543)

(assert (=> b!47646 (= e!31564 (isEmpty!139 lt!73913))))

(declare-fun b!47644 () Bool)

(declare-fun e!31563 () tuple2!4552)

(assert (=> b!47644 (= e!31563 (tuple2!4553 Nil!540 (_1!2356 lt!73275)))))

(declare-fun d!14262 () Bool)

(assert (=> d!14262 e!31564))

(declare-fun c!3290 () Bool)

(assert (=> d!14262 (= c!3290 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14262 (= lt!73913 (_1!2369 e!31563))))

(declare-fun c!3291 () Bool)

(assert (=> d!14262 (= c!3291 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14262 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14262 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73275) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!73913)))

(declare-fun b!47647 () Bool)

(assert (=> b!47647 (= e!31564 (> (length!238 lt!73913) 0))))

(declare-fun lt!73911 () tuple2!4554)

(declare-fun b!47645 () Bool)

(declare-fun lt!73912 () (_ BitVec 64))

(assert (=> b!47645 (= e!31563 (tuple2!4553 (Cons!539 (_1!2370 lt!73911) (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_2!2370 lt!73911) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73912))) (_2!2370 lt!73911)))))

(assert (=> b!47645 (= lt!73911 (readBit!0 (_1!2356 lt!73275)))))

(assert (=> b!47645 (= lt!73912 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14262 c!3291) b!47644))

(assert (= (and d!14262 (not c!3291)) b!47645))

(assert (= (and d!14262 c!3290) b!47646))

(assert (= (and d!14262 (not c!3290)) b!47647))

(declare-fun m!73653 () Bool)

(assert (=> b!47646 m!73653))

(declare-fun m!73655 () Bool)

(assert (=> b!47647 m!73655))

(declare-fun m!73657 () Bool)

(assert (=> b!47645 m!73657))

(assert (=> b!47645 m!73479))

(assert (=> b!47203 d!14262))

(declare-fun d!14264 () Bool)

(declare-fun e!31565 () Bool)

(assert (=> d!14264 e!31565))

(declare-fun res!40107 () Bool)

(assert (=> d!14264 (=> (not res!40107) (not e!31565))))

(declare-fun lt!73916 () (_ BitVec 64))

(declare-fun lt!73919 () (_ BitVec 64))

(declare-fun lt!73917 () (_ BitVec 64))

(assert (=> d!14264 (= res!40107 (= lt!73916 (bvsub lt!73919 lt!73917)))))

(assert (=> d!14264 (or (= (bvand lt!73919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73919 lt!73917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14264 (= lt!73917 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73264))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73264)))))))

(declare-fun lt!73915 () (_ BitVec 64))

(declare-fun lt!73918 () (_ BitVec 64))

(assert (=> d!14264 (= lt!73919 (bvmul lt!73915 lt!73918))))

(assert (=> d!14264 (or (= lt!73915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73918 (bvsdiv (bvmul lt!73915 lt!73918) lt!73915)))))

(assert (=> d!14264 (= lt!73918 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14264 (= lt!73915 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))))))

(assert (=> d!14264 (= lt!73916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73264)))))))

(assert (=> d!14264 (invariant!0 (currentBit!2885 (_2!2355 lt!73264)) (currentByte!2890 (_2!2355 lt!73264)) (size!1036 (buf!1385 (_2!2355 lt!73264))))))

(assert (=> d!14264 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73264))) (currentByte!2890 (_2!2355 lt!73264)) (currentBit!2885 (_2!2355 lt!73264))) lt!73916)))

(declare-fun b!47648 () Bool)

(declare-fun res!40106 () Bool)

(assert (=> b!47648 (=> (not res!40106) (not e!31565))))

(assert (=> b!47648 (= res!40106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73916))))

(declare-fun b!47649 () Bool)

(declare-fun lt!73914 () (_ BitVec 64))

(assert (=> b!47649 (= e!31565 (bvsle lt!73916 (bvmul lt!73914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47649 (or (= lt!73914 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73914 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73914)))))

(assert (=> b!47649 (= lt!73914 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))))))

(assert (= (and d!14264 res!40107) b!47648))

(assert (= (and b!47648 res!40106) b!47649))

(declare-fun m!73659 () Bool)

(assert (=> d!14264 m!73659))

(declare-fun m!73661 () Bool)

(assert (=> d!14264 m!73661))

(assert (=> b!47203 d!14264))

(declare-fun d!14266 () Bool)

(assert (=> d!14266 (= (bitAt!0 (buf!1385 (_2!2355 lt!73293)) lt!73279) (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_2!2355 lt!73293))) ((_ extract 31 0) (bvsdiv lt!73279 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!73279 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3700 () Bool)

(assert (= bs!3700 d!14266))

(declare-fun m!73663 () Bool)

(assert (=> bs!3700 m!73663))

(assert (=> bs!3700 m!73471))

(assert (=> b!47203 d!14266))

(declare-fun b!47650 () Bool)

(declare-fun e!31566 () Unit!3309)

(declare-fun Unit!3364 () Unit!3309)

(assert (=> b!47650 (= e!31566 Unit!3364)))

(declare-fun b!47651 () Bool)

(declare-fun res!40110 () Bool)

(declare-fun e!31567 () Bool)

(assert (=> b!47651 (=> (not res!40110) (not e!31567))))

(declare-fun lt!73937 () tuple2!4526)

(assert (=> b!47651 (= res!40110 (isPrefixOf!0 (_2!2356 lt!73937) (_2!2355 lt!73264)))))

(declare-fun b!47652 () Bool)

(declare-fun res!40109 () Bool)

(assert (=> b!47652 (=> (not res!40109) (not e!31567))))

(assert (=> b!47652 (= res!40109 (isPrefixOf!0 (_1!2356 lt!73937) (_2!2355 lt!73293)))))

(declare-fun b!47653 () Bool)

(declare-fun lt!73923 () Unit!3309)

(assert (=> b!47653 (= e!31566 lt!73923)))

(declare-fun lt!73925 () (_ BitVec 64))

(assert (=> b!47653 (= lt!73925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73934 () (_ BitVec 64))

(assert (=> b!47653 (= lt!73934 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(assert (=> b!47653 (= lt!73923 (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!73293)) (buf!1385 (_2!2355 lt!73264)) lt!73925 lt!73934))))

(assert (=> b!47653 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!73264)) (buf!1385 (_2!2355 lt!73293)) lt!73925 lt!73934)))

(declare-fun lt!73930 () (_ BitVec 64))

(declare-fun lt!73921 () (_ BitVec 64))

(declare-fun b!47654 () Bool)

(assert (=> b!47654 (= e!31567 (= (_1!2356 lt!73937) (withMovedBitIndex!0 (_2!2356 lt!73937) (bvsub lt!73930 lt!73921))))))

(assert (=> b!47654 (or (= (bvand lt!73930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73921 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73930 lt!73921) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47654 (= lt!73921 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73264))) (currentByte!2890 (_2!2355 lt!73264)) (currentBit!2885 (_2!2355 lt!73264))))))

(assert (=> b!47654 (= lt!73930 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73293))) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(declare-fun d!14268 () Bool)

(assert (=> d!14268 e!31567))

(declare-fun res!40108 () Bool)

(assert (=> d!14268 (=> (not res!40108) (not e!31567))))

(assert (=> d!14268 (= res!40108 (isPrefixOf!0 (_1!2356 lt!73937) (_2!2356 lt!73937)))))

(declare-fun lt!73936 () BitStream!1804)

(assert (=> d!14268 (= lt!73937 (tuple2!4527 lt!73936 (_2!2355 lt!73264)))))

(declare-fun lt!73929 () Unit!3309)

(declare-fun lt!73920 () Unit!3309)

(assert (=> d!14268 (= lt!73929 lt!73920)))

(assert (=> d!14268 (isPrefixOf!0 lt!73936 (_2!2355 lt!73264))))

(assert (=> d!14268 (= lt!73920 (lemmaIsPrefixTransitive!0 lt!73936 (_2!2355 lt!73264) (_2!2355 lt!73264)))))

(declare-fun lt!73935 () Unit!3309)

(declare-fun lt!73928 () Unit!3309)

(assert (=> d!14268 (= lt!73935 lt!73928)))

(assert (=> d!14268 (isPrefixOf!0 lt!73936 (_2!2355 lt!73264))))

(assert (=> d!14268 (= lt!73928 (lemmaIsPrefixTransitive!0 lt!73936 (_2!2355 lt!73293) (_2!2355 lt!73264)))))

(declare-fun lt!73938 () Unit!3309)

(assert (=> d!14268 (= lt!73938 e!31566)))

(declare-fun c!3292 () Bool)

(assert (=> d!14268 (= c!3292 (not (= (size!1036 (buf!1385 (_2!2355 lt!73293))) #b00000000000000000000000000000000)))))

(declare-fun lt!73933 () Unit!3309)

(declare-fun lt!73926 () Unit!3309)

(assert (=> d!14268 (= lt!73933 lt!73926)))

(assert (=> d!14268 (isPrefixOf!0 (_2!2355 lt!73264) (_2!2355 lt!73264))))

(assert (=> d!14268 (= lt!73926 (lemmaIsPrefixRefl!0 (_2!2355 lt!73264)))))

(declare-fun lt!73931 () Unit!3309)

(declare-fun lt!73927 () Unit!3309)

(assert (=> d!14268 (= lt!73931 lt!73927)))

(assert (=> d!14268 (= lt!73927 (lemmaIsPrefixRefl!0 (_2!2355 lt!73264)))))

(declare-fun lt!73932 () Unit!3309)

(declare-fun lt!73924 () Unit!3309)

(assert (=> d!14268 (= lt!73932 lt!73924)))

(assert (=> d!14268 (isPrefixOf!0 lt!73936 lt!73936)))

(assert (=> d!14268 (= lt!73924 (lemmaIsPrefixRefl!0 lt!73936))))

(declare-fun lt!73939 () Unit!3309)

(declare-fun lt!73922 () Unit!3309)

(assert (=> d!14268 (= lt!73939 lt!73922)))

(assert (=> d!14268 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73293))))

(assert (=> d!14268 (= lt!73922 (lemmaIsPrefixRefl!0 (_2!2355 lt!73293)))))

(assert (=> d!14268 (= lt!73936 (BitStream!1805 (buf!1385 (_2!2355 lt!73264)) (currentByte!2890 (_2!2355 lt!73293)) (currentBit!2885 (_2!2355 lt!73293))))))

(assert (=> d!14268 (isPrefixOf!0 (_2!2355 lt!73293) (_2!2355 lt!73264))))

(assert (=> d!14268 (= (reader!0 (_2!2355 lt!73293) (_2!2355 lt!73264)) lt!73937)))

(assert (= (and d!14268 c!3292) b!47653))

(assert (= (and d!14268 (not c!3292)) b!47650))

(assert (= (and d!14268 res!40108) b!47652))

(assert (= (and b!47652 res!40109) b!47651))

(assert (= (and b!47651 res!40110) b!47654))

(declare-fun m!73665 () Bool)

(assert (=> b!47654 m!73665))

(assert (=> b!47654 m!72529))

(assert (=> b!47654 m!72525))

(assert (=> b!47653 m!72525))

(declare-fun m!73667 () Bool)

(assert (=> b!47653 m!73667))

(declare-fun m!73669 () Bool)

(assert (=> b!47653 m!73669))

(declare-fun m!73671 () Bool)

(assert (=> b!47652 m!73671))

(declare-fun m!73673 () Bool)

(assert (=> d!14268 m!73673))

(declare-fun m!73675 () Bool)

(assert (=> d!14268 m!73675))

(declare-fun m!73677 () Bool)

(assert (=> d!14268 m!73677))

(declare-fun m!73679 () Bool)

(assert (=> d!14268 m!73679))

(declare-fun m!73681 () Bool)

(assert (=> d!14268 m!73681))

(declare-fun m!73683 () Bool)

(assert (=> d!14268 m!73683))

(assert (=> d!14268 m!73537))

(declare-fun m!73685 () Bool)

(assert (=> d!14268 m!73685))

(declare-fun m!73687 () Bool)

(assert (=> d!14268 m!73687))

(assert (=> d!14268 m!73539))

(declare-fun m!73689 () Bool)

(assert (=> d!14268 m!73689))

(declare-fun m!73691 () Bool)

(assert (=> b!47651 m!73691))

(assert (=> b!47203 d!14268))

(declare-fun d!14270 () Bool)

(assert (=> d!14270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293))) lt!73268) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73264)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73293))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73293)))) lt!73268))))

(declare-fun bs!3701 () Bool)

(assert (= bs!3701 d!14270))

(declare-fun m!73693 () Bool)

(assert (=> bs!3701 m!73693))

(assert (=> b!47203 d!14270))

(declare-fun b!47657 () Bool)

(declare-fun e!31569 () Bool)

(declare-fun lt!73942 () List!543)

(assert (=> b!47657 (= e!31569 (isEmpty!139 lt!73942))))

(declare-fun b!47655 () Bool)

(declare-fun e!31568 () tuple2!4552)

(assert (=> b!47655 (= e!31568 (tuple2!4553 Nil!540 (_1!2356 lt!73306)))))

(declare-fun d!14272 () Bool)

(assert (=> d!14272 e!31569))

(declare-fun c!3293 () Bool)

(assert (=> d!14272 (= c!3293 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14272 (= lt!73942 (_1!2369 e!31568))))

(declare-fun c!3294 () Bool)

(assert (=> d!14272 (= c!3294 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14272 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14272 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_1!2356 lt!73306) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!73942)))

(declare-fun b!47658 () Bool)

(assert (=> b!47658 (= e!31569 (> (length!238 lt!73942) 0))))

(declare-fun b!47656 () Bool)

(declare-fun lt!73941 () (_ BitVec 64))

(declare-fun lt!73940 () tuple2!4554)

(assert (=> b!47656 (= e!31568 (tuple2!4553 (Cons!539 (_1!2370 lt!73940) (bitStreamReadBitsIntoList!0 (_2!2355 lt!73264) (_2!2370 lt!73940) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!73941))) (_2!2370 lt!73940)))))

(assert (=> b!47656 (= lt!73940 (readBit!0 (_1!2356 lt!73306)))))

(assert (=> b!47656 (= lt!73941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14272 c!3294) b!47655))

(assert (= (and d!14272 (not c!3294)) b!47656))

(assert (= (and d!14272 c!3293) b!47657))

(assert (= (and d!14272 (not c!3293)) b!47658))

(declare-fun m!73695 () Bool)

(assert (=> b!47657 m!73695))

(declare-fun m!73697 () Bool)

(assert (=> b!47658 m!73697))

(declare-fun m!73699 () Bool)

(assert (=> b!47656 m!73699))

(declare-fun m!73701 () Bool)

(assert (=> b!47656 m!73701))

(assert (=> b!47203 d!14272))

(declare-fun d!14274 () Bool)

(assert (=> d!14274 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73293)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73304)))

(declare-fun lt!73943 () Unit!3309)

(assert (=> d!14274 (= lt!73943 (choose!9 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73293)) lt!73304 (BitStream!1805 (buf!1385 (_2!2355 lt!73293)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!14274 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73293)) lt!73304) lt!73943)))

(declare-fun bs!3702 () Bool)

(assert (= bs!3702 d!14274))

(assert (=> bs!3702 m!72563))

(declare-fun m!73703 () Bool)

(assert (=> bs!3702 m!73703))

(assert (=> b!47203 d!14274))

(declare-fun d!14276 () Bool)

(assert (=> d!14276 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 thiss!1379)))))))

(assert (=> d!13918 d!14276))

(declare-fun d!14278 () Bool)

(declare-fun res!40112 () Bool)

(declare-fun e!31571 () Bool)

(assert (=> d!14278 (=> (not res!40112) (not e!31571))))

(assert (=> d!14278 (= res!40112 (= (size!1036 (buf!1385 (_1!2356 lt!73369))) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!14278 (= (isPrefixOf!0 (_1!2356 lt!73369) (_2!2355 lt!72283)) e!31571)))

(declare-fun b!47659 () Bool)

(declare-fun res!40111 () Bool)

(assert (=> b!47659 (=> (not res!40111) (not e!31571))))

(assert (=> b!47659 (= res!40111 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73369))) (currentByte!2890 (_1!2356 lt!73369)) (currentBit!2885 (_1!2356 lt!73369))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47660 () Bool)

(declare-fun e!31570 () Bool)

(assert (=> b!47660 (= e!31571 e!31570)))

(declare-fun res!40113 () Bool)

(assert (=> b!47660 (=> res!40113 e!31570)))

(assert (=> b!47660 (= res!40113 (= (size!1036 (buf!1385 (_1!2356 lt!73369))) #b00000000000000000000000000000000))))

(declare-fun b!47661 () Bool)

(assert (=> b!47661 (= e!31570 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73369)) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73369))) (currentByte!2890 (_1!2356 lt!73369)) (currentBit!2885 (_1!2356 lt!73369)))))))

(assert (= (and d!14278 res!40112) b!47659))

(assert (= (and b!47659 res!40111) b!47660))

(assert (= (and b!47660 (not res!40113)) b!47661))

(declare-fun m!73705 () Bool)

(assert (=> b!47659 m!73705))

(assert (=> b!47659 m!71721))

(assert (=> b!47661 m!73705))

(assert (=> b!47661 m!73705))

(declare-fun m!73707 () Bool)

(assert (=> b!47661 m!73707))

(assert (=> b!47243 d!14278))

(declare-fun d!14280 () Bool)

(assert (=> d!14280 (= (invariant!0 (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379) (size!1036 (buf!1385 thiss!1379))) (and (bvsge (currentBit!2885 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2885 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2890 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2890 thiss!1379) (size!1036 (buf!1385 thiss!1379))) (and (= (currentBit!2885 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2890 thiss!1379) (size!1036 (buf!1385 thiss!1379)))))))))

(assert (=> d!13798 d!14280))

(declare-fun d!14282 () Bool)

(assert (=> d!14282 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73300) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!73300))))

(declare-fun bs!3703 () Bool)

(assert (= bs!3703 d!14282))

(assert (=> bs!3703 m!72325))

(assert (=> b!47199 d!14282))

(declare-fun d!14284 () Bool)

(assert (=> d!14284 (= (invariant!0 (currentBit!2885 (_2!2355 lt!73285)) (currentByte!2890 (_2!2355 lt!73285)) (size!1036 (buf!1385 (_2!2355 lt!73285)))) (and (bvsge (currentBit!2885 (_2!2355 lt!73285)) #b00000000000000000000000000000000) (bvslt (currentBit!2885 (_2!2355 lt!73285)) #b00000000000000000000000000001000) (bvsge (currentByte!2890 (_2!2355 lt!73285)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2890 (_2!2355 lt!73285)) (size!1036 (buf!1385 (_2!2355 lt!73285)))) (and (= (currentBit!2885 (_2!2355 lt!73285)) #b00000000000000000000000000000000) (= (currentByte!2890 (_2!2355 lt!73285)) (size!1036 (buf!1385 (_2!2355 lt!73285))))))))))

(assert (=> b!47201 d!14284))

(declare-fun d!14286 () Bool)

(declare-fun res!40115 () Bool)

(declare-fun e!31573 () Bool)

(assert (=> d!14286 (=> (not res!40115) (not e!31573))))

(assert (=> d!14286 (= res!40115 (= (size!1036 (buf!1385 (_1!2356 lt!73049))) (size!1036 (buf!1385 thiss!1379))))))

(assert (=> d!14286 (= (isPrefixOf!0 (_1!2356 lt!73049) thiss!1379) e!31573)))

(declare-fun b!47662 () Bool)

(declare-fun res!40114 () Bool)

(assert (=> b!47662 (=> (not res!40114) (not e!31573))))

(assert (=> b!47662 (= res!40114 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73049))) (currentByte!2890 (_1!2356 lt!73049)) (currentBit!2885 (_1!2356 lt!73049))) (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47663 () Bool)

(declare-fun e!31572 () Bool)

(assert (=> b!47663 (= e!31573 e!31572)))

(declare-fun res!40116 () Bool)

(assert (=> b!47663 (=> res!40116 e!31572)))

(assert (=> b!47663 (= res!40116 (= (size!1036 (buf!1385 (_1!2356 lt!73049))) #b00000000000000000000000000000000))))

(declare-fun b!47664 () Bool)

(assert (=> b!47664 (= e!31572 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73049)) (buf!1385 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73049))) (currentByte!2890 (_1!2356 lt!73049)) (currentBit!2885 (_1!2356 lt!73049)))))))

(assert (= (and d!14286 res!40115) b!47662))

(assert (= (and b!47662 res!40114) b!47663))

(assert (= (and b!47663 (not res!40116)) b!47664))

(declare-fun m!73709 () Bool)

(assert (=> b!47662 m!73709))

(assert (=> b!47662 m!71691))

(assert (=> b!47664 m!73709))

(assert (=> b!47664 m!73709))

(declare-fun m!73711 () Bool)

(assert (=> b!47664 m!73711))

(assert (=> b!47120 d!14286))

(declare-fun d!14288 () Bool)

(assert (=> d!14288 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))))))))

(assert (=> d!13910 d!14288))

(declare-fun lt!73944 () (_ BitVec 32))

(declare-fun bm!583 () Bool)

(declare-fun call!586 () Bool)

(declare-fun lt!73946 () (_ BitVec 32))

(declare-fun c!3295 () Bool)

(declare-fun lt!73945 () tuple4!16)

(assert (=> bm!583 (= call!586 (byteRangesEq!0 (ite c!3295 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73945)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!73945))) (ite c!3295 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73945)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!73945))) (ite c!3295 lt!73946 #b00000000000000000000000000000000) lt!73944))))

(declare-fun b!47665 () Bool)

(declare-fun e!31577 () Bool)

(assert (=> b!47665 (= e!31577 call!586)))

(declare-fun b!47666 () Bool)

(declare-fun res!40118 () Bool)

(assert (=> b!47666 (= res!40118 (= lt!73944 #b00000000000000000000000000000000))))

(assert (=> b!47666 (=> res!40118 e!31577)))

(declare-fun e!31578 () Bool)

(assert (=> b!47666 (= e!31578 e!31577)))

(declare-fun b!47667 () Bool)

(declare-fun e!31575 () Bool)

(assert (=> b!47667 (= e!31575 (arrayRangesEq!9 (buf!1385 thiss!1379) (buf!1385 thiss!1379) (_1!2376 lt!73945) (_2!2376 lt!73945)))))

(declare-fun b!47668 () Bool)

(declare-fun e!31574 () Bool)

(declare-fun e!31579 () Bool)

(assert (=> b!47668 (= e!31574 e!31579)))

(assert (=> b!47668 (= c!3295 (= (_3!96 lt!73945) (_4!8 lt!73945)))))

(declare-fun d!14290 () Bool)

(declare-fun res!40120 () Bool)

(declare-fun e!31576 () Bool)

(assert (=> d!14290 (=> res!40120 e!31576)))

(assert (=> d!14290 (= res!40120 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (=> d!14290 (= (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))) e!31576)))

(declare-fun b!47669 () Bool)

(assert (=> b!47669 (= e!31579 e!31578)))

(declare-fun res!40121 () Bool)

(assert (=> b!47669 (= res!40121 (byteRangesEq!0 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73945)) (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73945)) lt!73946 #b00000000000000000000000000001000))))

(assert (=> b!47669 (=> (not res!40121) (not e!31578))))

(declare-fun b!47670 () Bool)

(assert (=> b!47670 (= e!31576 e!31574)))

(declare-fun res!40117 () Bool)

(assert (=> b!47670 (=> (not res!40117) (not e!31574))))

(assert (=> b!47670 (= res!40117 e!31575)))

(declare-fun res!40119 () Bool)

(assert (=> b!47670 (=> res!40119 e!31575)))

(assert (=> b!47670 (= res!40119 (bvsge (_1!2376 lt!73945) (_2!2376 lt!73945)))))

(assert (=> b!47670 (= lt!73944 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47670 (= lt!73946 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47670 (= lt!73945 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47671 () Bool)

(assert (=> b!47671 (= e!31579 call!586)))

(assert (= (and d!14290 (not res!40120)) b!47670))

(assert (= (and b!47670 (not res!40119)) b!47667))

(assert (= (and b!47670 res!40117) b!47668))

(assert (= (and b!47668 c!3295) b!47671))

(assert (= (and b!47668 (not c!3295)) b!47669))

(assert (= (and b!47669 res!40121) b!47666))

(assert (= (and b!47666 (not res!40118)) b!47665))

(assert (= (or b!47671 b!47665) bm!583))

(declare-fun m!73713 () Bool)

(assert (=> bm!583 m!73713))

(assert (=> bm!583 m!73713))

(declare-fun m!73715 () Bool)

(assert (=> bm!583 m!73715))

(declare-fun m!73717 () Bool)

(assert (=> bm!583 m!73717))

(assert (=> bm!583 m!73715))

(declare-fun m!73719 () Bool)

(assert (=> b!47667 m!73719))

(assert (=> b!47669 m!73715))

(assert (=> b!47669 m!73715))

(assert (=> b!47669 m!73715))

(assert (=> b!47669 m!73715))

(declare-fun m!73721 () Bool)

(assert (=> b!47669 m!73721))

(assert (=> b!47670 m!71691))

(assert (=> b!47670 m!73419))

(assert (=> b!47067 d!14290))

(assert (=> b!47067 d!13792))

(assert (=> d!13916 d!13912))

(declare-fun d!14292 () Bool)

(assert (=> d!14292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!14292 true))

(declare-fun _$6!185 () Unit!3309)

(assert (=> d!14292 (= (choose!9 thiss!1379 (buf!1385 (_2!2355 lt!72275)) (bvsub to!314 i!635) (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))) _$6!185)))

(declare-fun bs!3704 () Bool)

(assert (= bs!3704 d!14292))

(assert (=> bs!3704 m!71671))

(assert (=> d!13916 d!14292))

(assert (=> b!47065 d!13792))

(assert (=> b!47253 d!13792))

(declare-fun d!14294 () Bool)

(assert (=> d!14294 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 thiss!1379) lt!73381 lt!73390)))

(declare-fun lt!73949 () Unit!3309)

(declare-fun choose!8 (array!2293 array!2293 (_ BitVec 64) (_ BitVec 64)) Unit!3309)

(assert (=> d!14294 (= lt!73949 (choose!8 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) lt!73381 lt!73390))))

(assert (=> d!14294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73381) (bvsle lt!73381 lt!73390))))

(assert (=> d!14294 (= (arrayBitRangesEqSymmetric!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) lt!73381 lt!73390) lt!73949)))

(declare-fun bs!3705 () Bool)

(assert (= bs!3705 d!14294))

(assert (=> bs!3705 m!72677))

(declare-fun m!73723 () Bool)

(assert (=> bs!3705 m!73723))

(assert (=> b!47253 d!14294))

(declare-fun lt!73950 () (_ BitVec 32))

(declare-fun c!3296 () Bool)

(declare-fun lt!73952 () (_ BitVec 32))

(declare-fun bm!584 () Bool)

(declare-fun call!587 () Bool)

(declare-fun lt!73951 () tuple4!16)

(assert (=> bm!584 (= call!587 (byteRangesEq!0 (ite c!3296 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73951)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_4!8 lt!73951))) (ite c!3296 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73951)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!73951))) (ite c!3296 lt!73952 #b00000000000000000000000000000000) lt!73950))))

(declare-fun b!47672 () Bool)

(declare-fun e!31583 () Bool)

(assert (=> b!47672 (= e!31583 call!587)))

(declare-fun b!47673 () Bool)

(declare-fun res!40123 () Bool)

(assert (=> b!47673 (= res!40123 (= lt!73950 #b00000000000000000000000000000000))))

(assert (=> b!47673 (=> res!40123 e!31583)))

(declare-fun e!31584 () Bool)

(assert (=> b!47673 (= e!31584 e!31583)))

(declare-fun e!31581 () Bool)

(declare-fun b!47674 () Bool)

(assert (=> b!47674 (= e!31581 (arrayRangesEq!9 (buf!1385 (_2!2355 lt!72275)) (buf!1385 thiss!1379) (_1!2376 lt!73951) (_2!2376 lt!73951)))))

(declare-fun b!47675 () Bool)

(declare-fun e!31580 () Bool)

(declare-fun e!31585 () Bool)

(assert (=> b!47675 (= e!31580 e!31585)))

(assert (=> b!47675 (= c!3296 (= (_3!96 lt!73951) (_4!8 lt!73951)))))

(declare-fun d!14296 () Bool)

(declare-fun res!40125 () Bool)

(declare-fun e!31582 () Bool)

(assert (=> d!14296 (=> res!40125 e!31582)))

(assert (=> d!14296 (= res!40125 (bvsge lt!73381 lt!73390))))

(assert (=> d!14296 (= (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 thiss!1379) lt!73381 lt!73390) e!31582)))

(declare-fun b!47676 () Bool)

(assert (=> b!47676 (= e!31585 e!31584)))

(declare-fun res!40126 () Bool)

(assert (=> b!47676 (= res!40126 (byteRangesEq!0 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73951)) (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73951)) lt!73952 #b00000000000000000000000000001000))))

(assert (=> b!47676 (=> (not res!40126) (not e!31584))))

(declare-fun b!47677 () Bool)

(assert (=> b!47677 (= e!31582 e!31580)))

(declare-fun res!40122 () Bool)

(assert (=> b!47677 (=> (not res!40122) (not e!31580))))

(assert (=> b!47677 (= res!40122 e!31581)))

(declare-fun res!40124 () Bool)

(assert (=> b!47677 (=> res!40124 e!31581)))

(assert (=> b!47677 (= res!40124 (bvsge (_1!2376 lt!73951) (_2!2376 lt!73951)))))

(assert (=> b!47677 (= lt!73950 ((_ extract 31 0) (bvsrem lt!73390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47677 (= lt!73952 ((_ extract 31 0) (bvsrem lt!73381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47677 (= lt!73951 (arrayBitIndices!0 lt!73381 lt!73390))))

(declare-fun b!47678 () Bool)

(assert (=> b!47678 (= e!31585 call!587)))

(assert (= (and d!14296 (not res!40125)) b!47677))

(assert (= (and b!47677 (not res!40124)) b!47674))

(assert (= (and b!47677 res!40122) b!47675))

(assert (= (and b!47675 c!3296) b!47678))

(assert (= (and b!47675 (not c!3296)) b!47676))

(assert (= (and b!47676 res!40126) b!47673))

(assert (= (and b!47673 (not res!40123)) b!47672))

(assert (= (or b!47678 b!47672) bm!584))

(declare-fun m!73725 () Bool)

(assert (=> bm!584 m!73725))

(declare-fun m!73727 () Bool)

(assert (=> bm!584 m!73727))

(declare-fun m!73729 () Bool)

(assert (=> bm!584 m!73729))

(declare-fun m!73731 () Bool)

(assert (=> bm!584 m!73731))

(declare-fun m!73733 () Bool)

(assert (=> bm!584 m!73733))

(declare-fun m!73735 () Bool)

(assert (=> b!47674 m!73735))

(assert (=> b!47676 m!73733))

(assert (=> b!47676 m!73729))

(assert (=> b!47676 m!73733))

(assert (=> b!47676 m!73729))

(declare-fun m!73737 () Bool)

(assert (=> b!47676 m!73737))

(declare-fun m!73739 () Bool)

(assert (=> b!47677 m!73739))

(assert (=> b!47253 d!14296))

(declare-fun d!14298 () Bool)

(assert (=> d!14298 (= (isEmpty!139 lt!72931) (is-Nil!540 lt!72931))))

(assert (=> b!47042 d!14298))

(assert (=> d!13818 d!13782))

(declare-fun d!14300 () Bool)

(assert (=> d!14300 (isPrefixOf!0 lt!73048 (_2!2355 lt!72283))))

(declare-fun lt!73953 () Unit!3309)

(assert (=> d!14300 (= lt!73953 (choose!30 lt!73048 thiss!1379 (_2!2355 lt!72283)))))

(assert (=> d!14300 (isPrefixOf!0 lt!73048 thiss!1379)))

(assert (=> d!14300 (= (lemmaIsPrefixTransitive!0 lt!73048 thiss!1379 (_2!2355 lt!72283)) lt!73953)))

(declare-fun bs!3706 () Bool)

(assert (= bs!3706 d!14300))

(assert (=> bs!3706 m!72363))

(declare-fun m!73741 () Bool)

(assert (=> bs!3706 m!73741))

(declare-fun m!73743 () Bool)

(assert (=> bs!3706 m!73743))

(assert (=> d!13818 d!14300))

(declare-fun d!14302 () Bool)

(assert (=> d!14302 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(declare-fun lt!73954 () Unit!3309)

(assert (=> d!14302 (= lt!73954 (choose!11 (_2!2355 lt!72283)))))

(assert (=> d!14302 (= (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)) lt!73954)))

(declare-fun bs!3707 () Bool)

(assert (= bs!3707 d!14302))

(assert (=> bs!3707 m!72361))

(declare-fun m!73745 () Bool)

(assert (=> bs!3707 m!73745))

(assert (=> d!13818 d!14302))

(assert (=> d!13818 d!13894))

(declare-fun d!14304 () Bool)

(declare-fun res!40128 () Bool)

(declare-fun e!31587 () Bool)

(assert (=> d!14304 (=> (not res!40128) (not e!31587))))

(assert (=> d!14304 (= res!40128 (= (size!1036 (buf!1385 lt!73048)) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!14304 (= (isPrefixOf!0 lt!73048 (_2!2355 lt!72283)) e!31587)))

(declare-fun b!47679 () Bool)

(declare-fun res!40127 () Bool)

(assert (=> b!47679 (=> (not res!40127) (not e!31587))))

(assert (=> b!47679 (= res!40127 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73048)) (currentByte!2890 lt!73048) (currentBit!2885 lt!73048)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47680 () Bool)

(declare-fun e!31586 () Bool)

(assert (=> b!47680 (= e!31587 e!31586)))

(declare-fun res!40129 () Bool)

(assert (=> b!47680 (=> res!40129 e!31586)))

(assert (=> b!47680 (= res!40129 (= (size!1036 (buf!1385 lt!73048)) #b00000000000000000000000000000000))))

(declare-fun b!47681 () Bool)

(assert (=> b!47681 (= e!31586 (arrayBitRangesEq!0 (buf!1385 lt!73048) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73048)) (currentByte!2890 lt!73048) (currentBit!2885 lt!73048))))))

(assert (= (and d!14304 res!40128) b!47679))

(assert (= (and b!47679 res!40127) b!47680))

(assert (= (and b!47680 (not res!40129)) b!47681))

(declare-fun m!73747 () Bool)

(assert (=> b!47679 m!73747))

(assert (=> b!47679 m!71721))

(assert (=> b!47681 m!73747))

(assert (=> b!47681 m!73747))

(declare-fun m!73749 () Bool)

(assert (=> b!47681 m!73749))

(assert (=> d!13818 d!14304))

(declare-fun d!14306 () Bool)

(assert (=> d!14306 (isPrefixOf!0 lt!73048 (_2!2355 lt!72283))))

(declare-fun lt!73955 () Unit!3309)

(assert (=> d!14306 (= lt!73955 (choose!30 lt!73048 (_2!2355 lt!72283) (_2!2355 lt!72283)))))

(assert (=> d!14306 (isPrefixOf!0 lt!73048 (_2!2355 lt!72283))))

(assert (=> d!14306 (= (lemmaIsPrefixTransitive!0 lt!73048 (_2!2355 lt!72283) (_2!2355 lt!72283)) lt!73955)))

(declare-fun bs!3708 () Bool)

(assert (= bs!3708 d!14306))

(assert (=> bs!3708 m!72363))

(declare-fun m!73751 () Bool)

(assert (=> bs!3708 m!73751))

(assert (=> bs!3708 m!72363))

(assert (=> d!13818 d!14306))

(declare-fun d!14308 () Bool)

(declare-fun res!40131 () Bool)

(declare-fun e!31589 () Bool)

(assert (=> d!14308 (=> (not res!40131) (not e!31589))))

(assert (=> d!14308 (= res!40131 (= (size!1036 (buf!1385 lt!73048)) (size!1036 (buf!1385 lt!73048))))))

(assert (=> d!14308 (= (isPrefixOf!0 lt!73048 lt!73048) e!31589)))

(declare-fun b!47682 () Bool)

(declare-fun res!40130 () Bool)

(assert (=> b!47682 (=> (not res!40130) (not e!31589))))

(assert (=> b!47682 (= res!40130 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73048)) (currentByte!2890 lt!73048) (currentBit!2885 lt!73048)) (bitIndex!0 (size!1036 (buf!1385 lt!73048)) (currentByte!2890 lt!73048) (currentBit!2885 lt!73048))))))

(declare-fun b!47683 () Bool)

(declare-fun e!31588 () Bool)

(assert (=> b!47683 (= e!31589 e!31588)))

(declare-fun res!40132 () Bool)

(assert (=> b!47683 (=> res!40132 e!31588)))

(assert (=> b!47683 (= res!40132 (= (size!1036 (buf!1385 lt!73048)) #b00000000000000000000000000000000))))

(declare-fun b!47684 () Bool)

(assert (=> b!47684 (= e!31588 (arrayBitRangesEq!0 (buf!1385 lt!73048) (buf!1385 lt!73048) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73048)) (currentByte!2890 lt!73048) (currentBit!2885 lt!73048))))))

(assert (= (and d!14308 res!40131) b!47682))

(assert (= (and b!47682 res!40130) b!47683))

(assert (= (and b!47683 (not res!40132)) b!47684))

(assert (=> b!47682 m!73747))

(assert (=> b!47682 m!73747))

(assert (=> b!47684 m!73747))

(assert (=> b!47684 m!73747))

(declare-fun m!73753 () Bool)

(assert (=> b!47684 m!73753))

(assert (=> d!13818 d!14308))

(declare-fun d!14310 () Bool)

(assert (=> d!14310 (isPrefixOf!0 lt!73048 lt!73048)))

(declare-fun lt!73956 () Unit!3309)

(assert (=> d!14310 (= lt!73956 (choose!11 lt!73048))))

(assert (=> d!14310 (= (lemmaIsPrefixRefl!0 lt!73048) lt!73956)))

(declare-fun bs!3709 () Bool)

(assert (= bs!3709 d!14310))

(assert (=> bs!3709 m!72359))

(declare-fun m!73755 () Bool)

(assert (=> bs!3709 m!73755))

(assert (=> d!13818 d!14310))

(declare-fun d!14312 () Bool)

(declare-fun res!40134 () Bool)

(declare-fun e!31591 () Bool)

(assert (=> d!14312 (=> (not res!40134) (not e!31591))))

(assert (=> d!14312 (= res!40134 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!14312 (= (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283)) e!31591)))

(declare-fun b!47685 () Bool)

(declare-fun res!40133 () Bool)

(assert (=> b!47685 (=> (not res!40133) (not e!31591))))

(assert (=> b!47685 (= res!40133 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47686 () Bool)

(declare-fun e!31590 () Bool)

(assert (=> b!47686 (= e!31591 e!31590)))

(declare-fun res!40135 () Bool)

(assert (=> b!47686 (=> res!40135 e!31590)))

(assert (=> b!47686 (= res!40135 (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000))))

(declare-fun b!47687 () Bool)

(assert (=> b!47687 (= e!31590 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (= (and d!14312 res!40134) b!47685))

(assert (= (and b!47685 res!40133) b!47686))

(assert (= (and b!47686 (not res!40135)) b!47687))

(assert (=> b!47685 m!71721))

(assert (=> b!47685 m!71721))

(assert (=> b!47687 m!71721))

(assert (=> b!47687 m!71721))

(declare-fun m!73757 () Bool)

(assert (=> b!47687 m!73757))

(assert (=> d!13818 d!14312))

(assert (=> d!13818 d!13786))

(declare-fun d!14314 () Bool)

(declare-fun res!40137 () Bool)

(declare-fun e!31593 () Bool)

(assert (=> d!14314 (=> (not res!40137) (not e!31593))))

(assert (=> d!14314 (= res!40137 (= (size!1036 (buf!1385 (_1!2356 lt!73049))) (size!1036 (buf!1385 (_2!2356 lt!73049)))))))

(assert (=> d!14314 (= (isPrefixOf!0 (_1!2356 lt!73049) (_2!2356 lt!73049)) e!31593)))

(declare-fun b!47688 () Bool)

(declare-fun res!40136 () Bool)

(assert (=> b!47688 (=> (not res!40136) (not e!31593))))

(assert (=> b!47688 (= res!40136 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73049))) (currentByte!2890 (_1!2356 lt!73049)) (currentBit!2885 (_1!2356 lt!73049))) (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73049))) (currentByte!2890 (_2!2356 lt!73049)) (currentBit!2885 (_2!2356 lt!73049)))))))

(declare-fun b!47689 () Bool)

(declare-fun e!31592 () Bool)

(assert (=> b!47689 (= e!31593 e!31592)))

(declare-fun res!40138 () Bool)

(assert (=> b!47689 (=> res!40138 e!31592)))

(assert (=> b!47689 (= res!40138 (= (size!1036 (buf!1385 (_1!2356 lt!73049))) #b00000000000000000000000000000000))))

(declare-fun b!47690 () Bool)

(assert (=> b!47690 (= e!31592 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73049)) (buf!1385 (_2!2356 lt!73049)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73049))) (currentByte!2890 (_1!2356 lt!73049)) (currentBit!2885 (_1!2356 lt!73049)))))))

(assert (= (and d!14314 res!40137) b!47688))

(assert (= (and b!47688 res!40136) b!47689))

(assert (= (and b!47689 (not res!40138)) b!47690))

(assert (=> b!47688 m!73709))

(assert (=> b!47688 m!73457))

(assert (=> b!47690 m!73709))

(assert (=> b!47690 m!73709))

(declare-fun m!73759 () Bool)

(assert (=> b!47690 m!73759))

(assert (=> d!13818 d!14314))

(declare-fun d!14316 () Bool)

(assert (=> d!14316 (isPrefixOf!0 lt!73368 (_2!2355 lt!72275))))

(declare-fun lt!73957 () Unit!3309)

(assert (=> d!14316 (= lt!73957 (choose!30 lt!73368 (_2!2355 lt!72283) (_2!2355 lt!72275)))))

(assert (=> d!14316 (isPrefixOf!0 lt!73368 (_2!2355 lt!72283))))

(assert (=> d!14316 (= (lemmaIsPrefixTransitive!0 lt!73368 (_2!2355 lt!72283) (_2!2355 lt!72275)) lt!73957)))

(declare-fun bs!3710 () Bool)

(assert (= bs!3710 d!14316))

(assert (=> bs!3710 m!72645))

(declare-fun m!73761 () Bool)

(assert (=> bs!3710 m!73761))

(declare-fun m!73763 () Bool)

(assert (=> bs!3710 m!73763))

(assert (=> d!13904 d!14316))

(assert (=> d!13904 d!14312))

(declare-fun d!14318 () Bool)

(declare-fun res!40140 () Bool)

(declare-fun e!31595 () Bool)

(assert (=> d!14318 (=> (not res!40140) (not e!31595))))

(assert (=> d!14318 (= res!40140 (= (size!1036 (buf!1385 (_1!2356 lt!73369))) (size!1036 (buf!1385 (_2!2356 lt!73369)))))))

(assert (=> d!14318 (= (isPrefixOf!0 (_1!2356 lt!73369) (_2!2356 lt!73369)) e!31595)))

(declare-fun b!47691 () Bool)

(declare-fun res!40139 () Bool)

(assert (=> b!47691 (=> (not res!40139) (not e!31595))))

(assert (=> b!47691 (= res!40139 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73369))) (currentByte!2890 (_1!2356 lt!73369)) (currentBit!2885 (_1!2356 lt!73369))) (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73369))) (currentByte!2890 (_2!2356 lt!73369)) (currentBit!2885 (_2!2356 lt!73369)))))))

(declare-fun b!47692 () Bool)

(declare-fun e!31594 () Bool)

(assert (=> b!47692 (= e!31595 e!31594)))

(declare-fun res!40141 () Bool)

(assert (=> b!47692 (=> res!40141 e!31594)))

(assert (=> b!47692 (= res!40141 (= (size!1036 (buf!1385 (_1!2356 lt!73369))) #b00000000000000000000000000000000))))

(declare-fun b!47693 () Bool)

(assert (=> b!47693 (= e!31594 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73369)) (buf!1385 (_2!2356 lt!73369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73369))) (currentByte!2890 (_1!2356 lt!73369)) (currentBit!2885 (_1!2356 lt!73369)))))))

(assert (= (and d!14318 res!40140) b!47691))

(assert (= (and b!47691 res!40139) b!47692))

(assert (= (and b!47692 (not res!40141)) b!47693))

(assert (=> b!47691 m!73705))

(assert (=> b!47691 m!73425))

(assert (=> b!47693 m!73705))

(assert (=> b!47693 m!73705))

(declare-fun m!73765 () Bool)

(assert (=> b!47693 m!73765))

(assert (=> d!13904 d!14318))

(assert (=> d!13904 d!14202))

(declare-fun d!14320 () Bool)

(declare-fun res!40143 () Bool)

(declare-fun e!31597 () Bool)

(assert (=> d!14320 (=> (not res!40143) (not e!31597))))

(assert (=> d!14320 (= res!40143 (= (size!1036 (buf!1385 lt!73368)) (size!1036 (buf!1385 lt!73368))))))

(assert (=> d!14320 (= (isPrefixOf!0 lt!73368 lt!73368) e!31597)))

(declare-fun b!47694 () Bool)

(declare-fun res!40142 () Bool)

(assert (=> b!47694 (=> (not res!40142) (not e!31597))))

(assert (=> b!47694 (= res!40142 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73368)) (currentByte!2890 lt!73368) (currentBit!2885 lt!73368)) (bitIndex!0 (size!1036 (buf!1385 lt!73368)) (currentByte!2890 lt!73368) (currentBit!2885 lt!73368))))))

(declare-fun b!47695 () Bool)

(declare-fun e!31596 () Bool)

(assert (=> b!47695 (= e!31597 e!31596)))

(declare-fun res!40144 () Bool)

(assert (=> b!47695 (=> res!40144 e!31596)))

(assert (=> b!47695 (= res!40144 (= (size!1036 (buf!1385 lt!73368)) #b00000000000000000000000000000000))))

(declare-fun b!47696 () Bool)

(assert (=> b!47696 (= e!31596 (arrayBitRangesEq!0 (buf!1385 lt!73368) (buf!1385 lt!73368) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73368)) (currentByte!2890 lt!73368) (currentBit!2885 lt!73368))))))

(assert (= (and d!14320 res!40143) b!47694))

(assert (= (and b!47694 res!40142) b!47695))

(assert (= (and b!47695 (not res!40144)) b!47696))

(declare-fun m!73767 () Bool)

(assert (=> b!47694 m!73767))

(assert (=> b!47694 m!73767))

(assert (=> b!47696 m!73767))

(assert (=> b!47696 m!73767))

(declare-fun m!73769 () Bool)

(assert (=> b!47696 m!73769))

(assert (=> d!13904 d!14320))

(declare-fun d!14322 () Bool)

(assert (=> d!14322 (isPrefixOf!0 lt!73368 (_2!2355 lt!72275))))

(declare-fun lt!73958 () Unit!3309)

(assert (=> d!14322 (= lt!73958 (choose!30 lt!73368 (_2!2355 lt!72275) (_2!2355 lt!72275)))))

(assert (=> d!14322 (isPrefixOf!0 lt!73368 (_2!2355 lt!72275))))

(assert (=> d!14322 (= (lemmaIsPrefixTransitive!0 lt!73368 (_2!2355 lt!72275) (_2!2355 lt!72275)) lt!73958)))

(declare-fun bs!3711 () Bool)

(assert (= bs!3711 d!14322))

(assert (=> bs!3711 m!72645))

(declare-fun m!73771 () Bool)

(assert (=> bs!3711 m!73771))

(assert (=> bs!3711 m!72645))

(assert (=> d!13904 d!14322))

(declare-fun d!14324 () Bool)

(assert (=> d!14324 (isPrefixOf!0 lt!73368 lt!73368)))

(declare-fun lt!73959 () Unit!3309)

(assert (=> d!14324 (= lt!73959 (choose!11 lt!73368))))

(assert (=> d!14324 (= (lemmaIsPrefixRefl!0 lt!73368) lt!73959)))

(declare-fun bs!3712 () Bool)

(assert (= bs!3712 d!14324))

(assert (=> bs!3712 m!72641))

(declare-fun m!73773 () Bool)

(assert (=> bs!3712 m!73773))

(assert (=> d!13904 d!14324))

(assert (=> d!13904 d!14198))

(assert (=> d!13904 d!13812))

(assert (=> d!13904 d!14302))

(declare-fun d!14326 () Bool)

(declare-fun res!40146 () Bool)

(declare-fun e!31599 () Bool)

(assert (=> d!14326 (=> (not res!40146) (not e!31599))))

(assert (=> d!14326 (= res!40146 (= (size!1036 (buf!1385 lt!73368)) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!14326 (= (isPrefixOf!0 lt!73368 (_2!2355 lt!72275)) e!31599)))

(declare-fun b!47697 () Bool)

(declare-fun res!40145 () Bool)

(assert (=> b!47697 (=> (not res!40145) (not e!31599))))

(assert (=> b!47697 (= res!40145 (bvsle (bitIndex!0 (size!1036 (buf!1385 lt!73368)) (currentByte!2890 lt!73368) (currentBit!2885 lt!73368)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47698 () Bool)

(declare-fun e!31598 () Bool)

(assert (=> b!47698 (= e!31599 e!31598)))

(declare-fun res!40147 () Bool)

(assert (=> b!47698 (=> res!40147 e!31598)))

(assert (=> b!47698 (= res!40147 (= (size!1036 (buf!1385 lt!73368)) #b00000000000000000000000000000000))))

(declare-fun b!47699 () Bool)

(assert (=> b!47699 (= e!31598 (arrayBitRangesEq!0 (buf!1385 lt!73368) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 lt!73368)) (currentByte!2890 lt!73368) (currentBit!2885 lt!73368))))))

(assert (= (and d!14326 res!40146) b!47697))

(assert (= (and b!47697 res!40145) b!47698))

(assert (= (and b!47698 (not res!40147)) b!47699))

(assert (=> b!47697 m!73767))

(assert (=> b!47697 m!71703))

(assert (=> b!47699 m!73767))

(assert (=> b!47699 m!73767))

(declare-fun m!73775 () Bool)

(assert (=> b!47699 m!73775))

(assert (=> d!13904 d!14326))

(declare-fun d!14328 () Bool)

(declare-fun c!3297 () Bool)

(assert (=> d!14328 (= c!3297 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31600 () List!543)

(assert (=> d!14328 (= (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!31600)))

(declare-fun b!47700 () Bool)

(assert (=> b!47700 (= e!31600 Nil!540)))

(declare-fun b!47701 () Bool)

(assert (=> b!47701 (= e!31600 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!72283) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14328 c!3297) b!47700))

(assert (= (and d!14328 (not c!3297)) b!47701))

(declare-fun m!73777 () Bool)

(assert (=> b!47701 m!73777))

(declare-fun m!73779 () Bool)

(assert (=> b!47701 m!73779))

(declare-fun m!73781 () Bool)

(assert (=> b!47701 m!73781))

(assert (=> b!47023 d!14328))

(assert (=> d!13906 d!13910))

(declare-fun d!14330 () Bool)

(assert (=> d!14330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!72277)))

(assert (=> d!14330 true))

(declare-fun _$6!186 () Unit!3309)

(assert (=> d!14330 (= (choose!9 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!72275)) lt!72277 (BitStream!1805 (buf!1385 (_2!2355 lt!72275)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))) _$6!186)))

(declare-fun bs!3713 () Bool)

(assert (= bs!3713 d!14330))

(assert (=> bs!3713 m!71665))

(assert (=> d!13906 d!14330))

(declare-fun d!14332 () Bool)

(declare-fun res!40149 () Bool)

(declare-fun e!31602 () Bool)

(assert (=> d!14332 (=> (not res!40149) (not e!31602))))

(assert (=> d!14332 (= res!40149 (= (size!1036 (buf!1385 (_2!2356 lt!73393))) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!14332 (= (isPrefixOf!0 (_2!2356 lt!73393) (_2!2355 lt!72275)) e!31602)))

(declare-fun b!47702 () Bool)

(declare-fun res!40148 () Bool)

(assert (=> b!47702 (=> (not res!40148) (not e!31602))))

(assert (=> b!47702 (= res!40148 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73393))) (currentByte!2890 (_2!2356 lt!73393)) (currentBit!2885 (_2!2356 lt!73393))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47703 () Bool)

(declare-fun e!31601 () Bool)

(assert (=> b!47703 (= e!31602 e!31601)))

(declare-fun res!40150 () Bool)

(assert (=> b!47703 (=> res!40150 e!31601)))

(assert (=> b!47703 (= res!40150 (= (size!1036 (buf!1385 (_2!2356 lt!73393))) #b00000000000000000000000000000000))))

(declare-fun b!47704 () Bool)

(assert (=> b!47704 (= e!31601 (arrayBitRangesEq!0 (buf!1385 (_2!2356 lt!73393)) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73393))) (currentByte!2890 (_2!2356 lt!73393)) (currentBit!2885 (_2!2356 lt!73393)))))))

(assert (= (and d!14332 res!40149) b!47702))

(assert (= (and b!47702 res!40148) b!47703))

(assert (= (and b!47703 (not res!40150)) b!47704))

(assert (=> b!47702 m!73449))

(assert (=> b!47702 m!71703))

(assert (=> b!47704 m!73449))

(assert (=> b!47704 m!73449))

(declare-fun m!73783 () Bool)

(assert (=> b!47704 m!73783))

(assert (=> b!47251 d!14332))

(declare-fun d!14334 () Bool)

(assert (=> d!14334 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72279) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!229 lt!72269))))

(assert (=> d!14334 true))

(declare-fun _$34!35 () Unit!3309)

(assert (=> d!14334 (= (choose!42 (_2!2355 lt!72275) (_2!2355 lt!72275) (_1!2356 lt!72267) (_1!2356 lt!72279) (bvsub to!314 i!635) lt!72269) _$34!35)))

(declare-fun bs!3714 () Bool)

(assert (= bs!3714 d!14334))

(assert (=> bs!3714 m!72323))

(assert (=> bs!3714 m!71723))

(assert (=> d!13802 d!14334))

(declare-fun d!14336 () Bool)

(declare-fun lt!73962 () Int)

(assert (=> d!14336 (>= lt!73962 0)))

(declare-fun e!31605 () Int)

(assert (=> d!14336 (= lt!73962 e!31605)))

(declare-fun c!3300 () Bool)

(assert (=> d!14336 (= c!3300 (is-Nil!540 lt!72269))))

(assert (=> d!14336 (= (size!1041 lt!72269) lt!73962)))

(declare-fun b!47709 () Bool)

(assert (=> b!47709 (= e!31605 0)))

(declare-fun b!47710 () Bool)

(assert (=> b!47710 (= e!31605 (+ 1 (size!1041 (t!1293 lt!72269))))))

(assert (= (and d!14336 c!3300) b!47709))

(assert (= (and d!14336 (not c!3300)) b!47710))

(declare-fun m!73785 () Bool)

(assert (=> b!47710 m!73785))

(assert (=> d!13892 d!14336))

(declare-fun d!14338 () Bool)

(declare-fun res!40152 () Bool)

(declare-fun e!31607 () Bool)

(assert (=> d!14338 (=> (not res!40152) (not e!31607))))

(assert (=> d!14338 (= res!40152 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!73344)))))))

(assert (=> d!14338 (= (isPrefixOf!0 thiss!1379 (_2!2355 lt!73344)) e!31607)))

(declare-fun b!47711 () Bool)

(declare-fun res!40151 () Bool)

(assert (=> b!47711 (=> (not res!40151) (not e!31607))))

(assert (=> b!47711 (= res!40151 (bvsle (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73344))) (currentByte!2890 (_2!2355 lt!73344)) (currentBit!2885 (_2!2355 lt!73344)))))))

(declare-fun b!47712 () Bool)

(declare-fun e!31606 () Bool)

(assert (=> b!47712 (= e!31607 e!31606)))

(declare-fun res!40153 () Bool)

(assert (=> b!47712 (=> res!40153 e!31606)))

(assert (=> b!47712 (= res!40153 (= (size!1036 (buf!1385 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47713 () Bool)

(assert (=> b!47713 (= e!31606 (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!73344)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (= (and d!14338 res!40152) b!47711))

(assert (= (and b!47711 res!40151) b!47712))

(assert (= (and b!47712 (not res!40153)) b!47713))

(assert (=> b!47711 m!71691))

(assert (=> b!47711 m!72601))

(assert (=> b!47713 m!71691))

(assert (=> b!47713 m!71691))

(declare-fun m!73787 () Bool)

(assert (=> b!47713 m!73787))

(assert (=> b!47235 d!14338))

(declare-fun d!14340 () Bool)

(assert (=> d!14340 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14340 true))

(declare-fun _$1!294 () Unit!3309)

(assert (=> d!14340 (= (choose!27 thiss!1379 (_2!2355 lt!72283) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!294)))

(declare-fun bs!3715 () Bool)

(assert (= bs!3715 d!14340))

(assert (=> bs!3715 m!72597))

(assert (=> d!13898 d!14340))

(assert (=> d!13814 d!13882))

(declare-fun d!14342 () Bool)

(assert (=> d!14342 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!14342 true))

(declare-fun _$6!187 () Unit!3309)

(assert (=> d!14342 (= (choose!9 thiss!1379 (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1805 (buf!1385 (_2!2355 lt!72283)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))) _$6!187)))

(declare-fun bs!3716 () Bool)

(assert (= bs!3716 d!14342))

(assert (=> bs!3716 m!71729))

(assert (=> d!13814 d!14342))

(declare-fun lt!73963 () (_ BitVec 32))

(declare-fun bm!585 () Bool)

(declare-fun lt!73965 () (_ BitVec 32))

(declare-fun c!3301 () Bool)

(declare-fun lt!73964 () tuple4!16)

(declare-fun call!588 () Bool)

(assert (=> bm!585 (= call!588 (byteRangesEq!0 (ite c!3301 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73964)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!73964))) (ite c!3301 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73964)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_4!8 lt!73964))) (ite c!3301 lt!73965 #b00000000000000000000000000000000) lt!73963))))

(declare-fun b!47714 () Bool)

(declare-fun e!31611 () Bool)

(assert (=> b!47714 (= e!31611 call!588)))

(declare-fun b!47715 () Bool)

(declare-fun res!40155 () Bool)

(assert (=> b!47715 (= res!40155 (= lt!73963 #b00000000000000000000000000000000))))

(assert (=> b!47715 (=> res!40155 e!31611)))

(declare-fun e!31612 () Bool)

(assert (=> b!47715 (= e!31612 e!31611)))

(declare-fun e!31609 () Bool)

(declare-fun b!47716 () Bool)

(assert (=> b!47716 (= e!31609 (arrayRangesEq!9 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) (_1!2376 lt!73964) (_2!2376 lt!73964)))))

(declare-fun b!47717 () Bool)

(declare-fun e!31608 () Bool)

(declare-fun e!31613 () Bool)

(assert (=> b!47717 (= e!31608 e!31613)))

(assert (=> b!47717 (= c!3301 (= (_3!96 lt!73964) (_4!8 lt!73964)))))

(declare-fun d!14344 () Bool)

(declare-fun res!40157 () Bool)

(declare-fun e!31610 () Bool)

(assert (=> d!14344 (=> res!40157 e!31610)))

(assert (=> d!14344 (= res!40157 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(assert (=> d!14344 (= (arrayBitRangesEq!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))) e!31610)))

(declare-fun b!47718 () Bool)

(assert (=> b!47718 (= e!31613 e!31612)))

(declare-fun res!40158 () Bool)

(assert (=> b!47718 (= res!40158 (byteRangesEq!0 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!73964)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73964)) lt!73965 #b00000000000000000000000000001000))))

(assert (=> b!47718 (=> (not res!40158) (not e!31612))))

(declare-fun b!47719 () Bool)

(assert (=> b!47719 (= e!31610 e!31608)))

(declare-fun res!40154 () Bool)

(assert (=> b!47719 (=> (not res!40154) (not e!31608))))

(assert (=> b!47719 (= res!40154 e!31609)))

(declare-fun res!40156 () Bool)

(assert (=> b!47719 (=> res!40156 e!31609)))

(assert (=> b!47719 (= res!40156 (bvsge (_1!2376 lt!73964) (_2!2376 lt!73964)))))

(assert (=> b!47719 (= lt!73963 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47719 (= lt!73965 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47719 (= lt!73964 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47720 () Bool)

(assert (=> b!47720 (= e!31613 call!588)))

(assert (= (and d!14344 (not res!40157)) b!47719))

(assert (= (and b!47719 (not res!40156)) b!47716))

(assert (= (and b!47719 res!40154) b!47717))

(assert (= (and b!47717 c!3301) b!47720))

(assert (= (and b!47717 (not c!3301)) b!47718))

(assert (= (and b!47718 res!40158) b!47715))

(assert (= (and b!47715 (not res!40155)) b!47714))

(assert (= (or b!47720 b!47714) bm!585))

(declare-fun m!73789 () Bool)

(assert (=> bm!585 m!73789))

(declare-fun m!73791 () Bool)

(assert (=> bm!585 m!73791))

(declare-fun m!73793 () Bool)

(assert (=> bm!585 m!73793))

(declare-fun m!73795 () Bool)

(assert (=> bm!585 m!73795))

(declare-fun m!73797 () Bool)

(assert (=> bm!585 m!73797))

(declare-fun m!73799 () Bool)

(assert (=> b!47716 m!73799))

(assert (=> b!47718 m!73797))

(assert (=> b!47718 m!73793))

(assert (=> b!47718 m!73797))

(assert (=> b!47718 m!73793))

(declare-fun m!73801 () Bool)

(assert (=> b!47718 m!73801))

(assert (=> b!47719 m!71691))

(assert (=> b!47719 m!73419))

(assert (=> b!47089 d!14344))

(assert (=> b!47089 d!13792))

(assert (=> d!13786 d!13782))

(declare-fun d!14346 () Bool)

(assert (=> d!14346 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14346 true))

(declare-fun _$14!232 () Unit!3309)

(assert (=> d!14346 (= (choose!11 thiss!1379) _$14!232)))

(declare-fun bs!3718 () Bool)

(assert (= bs!3718 d!14346))

(assert (=> bs!3718 m!71687))

(assert (=> d!13786 d!14346))

(declare-fun d!14348 () Bool)

(declare-fun e!31614 () Bool)

(assert (=> d!14348 e!31614))

(declare-fun res!40160 () Bool)

(assert (=> d!14348 (=> (not res!40160) (not e!31614))))

(declare-fun lt!73971 () (_ BitVec 64))

(declare-fun lt!73969 () (_ BitVec 64))

(declare-fun lt!73968 () (_ BitVec 64))

(assert (=> d!14348 (= res!40160 (= lt!73968 (bvsub lt!73971 lt!73969)))))

(assert (=> d!14348 (or (= (bvand lt!73971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73971 lt!73969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14348 (= lt!73969 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73343)))) ((_ sign_extend 32) (currentByte!2890 (_1!2372 lt!73343))) ((_ sign_extend 32) (currentBit!2885 (_1!2372 lt!73343)))))))

(declare-fun lt!73967 () (_ BitVec 64))

(declare-fun lt!73970 () (_ BitVec 64))

(assert (=> d!14348 (= lt!73971 (bvmul lt!73967 lt!73970))))

(assert (=> d!14348 (or (= lt!73967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73970 (bvsdiv (bvmul lt!73967 lt!73970) lt!73967)))))

(assert (=> d!14348 (= lt!73970 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14348 (= lt!73967 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73343)))))))

(assert (=> d!14348 (= lt!73968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_1!2372 lt!73343))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_1!2372 lt!73343)))))))

(assert (=> d!14348 (invariant!0 (currentBit!2885 (_1!2372 lt!73343)) (currentByte!2890 (_1!2372 lt!73343)) (size!1036 (buf!1385 (_1!2372 lt!73343))))))

(assert (=> d!14348 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73343))) (currentByte!2890 (_1!2372 lt!73343)) (currentBit!2885 (_1!2372 lt!73343))) lt!73968)))

(declare-fun b!47721 () Bool)

(declare-fun res!40159 () Bool)

(assert (=> b!47721 (=> (not res!40159) (not e!31614))))

(assert (=> b!47721 (= res!40159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73968))))

(declare-fun b!47722 () Bool)

(declare-fun lt!73966 () (_ BitVec 64))

(assert (=> b!47722 (= e!31614 (bvsle lt!73968 (bvmul lt!73966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47722 (or (= lt!73966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73966)))))

(assert (=> b!47722 (= lt!73966 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73343)))))))

(assert (= (and d!14348 res!40160) b!47721))

(assert (= (and b!47721 res!40159) b!47722))

(declare-fun m!73803 () Bool)

(assert (=> d!14348 m!73803))

(declare-fun m!73805 () Bool)

(assert (=> d!14348 m!73805))

(assert (=> b!47233 d!14348))

(declare-fun d!14350 () Bool)

(declare-fun e!31615 () Bool)

(assert (=> d!14350 e!31615))

(declare-fun res!40162 () Bool)

(assert (=> d!14350 (=> (not res!40162) (not e!31615))))

(declare-fun lt!73975 () (_ BitVec 64))

(declare-fun lt!73977 () (_ BitVec 64))

(declare-fun lt!73974 () (_ BitVec 64))

(assert (=> d!14350 (= res!40162 (= lt!73974 (bvsub lt!73977 lt!73975)))))

(assert (=> d!14350 (or (= (bvand lt!73977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73977 lt!73975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14350 (= lt!73975 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73340)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73340))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73340)))))))

(declare-fun lt!73973 () (_ BitVec 64))

(declare-fun lt!73976 () (_ BitVec 64))

(assert (=> d!14350 (= lt!73977 (bvmul lt!73973 lt!73976))))

(assert (=> d!14350 (or (= lt!73973 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73976 (bvsdiv (bvmul lt!73973 lt!73976) lt!73973)))))

(assert (=> d!14350 (= lt!73976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14350 (= lt!73973 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(assert (=> d!14350 (= lt!73974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73340))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73340)))))))

(assert (=> d!14350 (invariant!0 (currentBit!2885 (_2!2355 lt!73340)) (currentByte!2890 (_2!2355 lt!73340)) (size!1036 (buf!1385 (_2!2355 lt!73340))))))

(assert (=> d!14350 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73340))) (currentByte!2890 (_2!2355 lt!73340)) (currentBit!2885 (_2!2355 lt!73340))) lt!73974)))

(declare-fun b!47723 () Bool)

(declare-fun res!40161 () Bool)

(assert (=> b!47723 (=> (not res!40161) (not e!31615))))

(assert (=> b!47723 (= res!40161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73974))))

(declare-fun b!47724 () Bool)

(declare-fun lt!73972 () (_ BitVec 64))

(assert (=> b!47724 (= e!31615 (bvsle lt!73974 (bvmul lt!73972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47724 (or (= lt!73972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73972)))))

(assert (=> b!47724 (= lt!73972 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73340)))))))

(assert (= (and d!14350 res!40162) b!47723))

(assert (= (and b!47723 res!40161) b!47724))

(declare-fun m!73807 () Bool)

(assert (=> d!14350 m!73807))

(assert (=> d!14350 m!73379))

(assert (=> b!47233 d!14350))

(declare-fun lt!73979 () tuple4!16)

(declare-fun lt!73980 () (_ BitVec 32))

(declare-fun call!589 () Bool)

(declare-fun c!3302 () Bool)

(declare-fun lt!73978 () (_ BitVec 32))

(declare-fun bm!586 () Bool)

(assert (=> bm!586 (= call!589 (byteRangesEq!0 (ite c!3302 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73979)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_4!8 lt!73979))) (ite c!3302 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73979)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_4!8 lt!73979))) (ite c!3302 lt!73980 #b00000000000000000000000000000000) lt!73978))))

(declare-fun b!47725 () Bool)

(declare-fun e!31619 () Bool)

(assert (=> b!47725 (= e!31619 call!589)))

(declare-fun b!47726 () Bool)

(declare-fun res!40164 () Bool)

(assert (=> b!47726 (= res!40164 (= lt!73978 #b00000000000000000000000000000000))))

(assert (=> b!47726 (=> res!40164 e!31619)))

(declare-fun e!31620 () Bool)

(assert (=> b!47726 (= e!31620 e!31619)))

(declare-fun e!31617 () Bool)

(declare-fun b!47727 () Bool)

(assert (=> b!47727 (= e!31617 (arrayRangesEq!9 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) (_1!2376 lt!73979) (_2!2376 lt!73979)))))

(declare-fun b!47728 () Bool)

(declare-fun e!31616 () Bool)

(declare-fun e!31621 () Bool)

(assert (=> b!47728 (= e!31616 e!31621)))

(assert (=> b!47728 (= c!3302 (= (_3!96 lt!73979) (_4!8 lt!73979)))))

(declare-fun d!14352 () Bool)

(declare-fun res!40166 () Bool)

(declare-fun e!31618 () Bool)

(assert (=> d!14352 (=> res!40166 e!31618)))

(assert (=> d!14352 (= res!40166 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!14352 (= (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))) e!31618)))

(declare-fun b!47729 () Bool)

(assert (=> b!47729 (= e!31621 e!31620)))

(declare-fun res!40167 () Bool)

(assert (=> b!47729 (= res!40167 (byteRangesEq!0 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73979)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73979)) lt!73980 #b00000000000000000000000000001000))))

(assert (=> b!47729 (=> (not res!40167) (not e!31620))))

(declare-fun b!47730 () Bool)

(assert (=> b!47730 (= e!31618 e!31616)))

(declare-fun res!40163 () Bool)

(assert (=> b!47730 (=> (not res!40163) (not e!31616))))

(assert (=> b!47730 (= res!40163 e!31617)))

(declare-fun res!40165 () Bool)

(assert (=> b!47730 (=> res!40165 e!31617)))

(assert (=> b!47730 (= res!40165 (bvsge (_1!2376 lt!73979) (_2!2376 lt!73979)))))

(assert (=> b!47730 (= lt!73978 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47730 (= lt!73980 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47730 (= lt!73979 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47731 () Bool)

(assert (=> b!47731 (= e!31621 call!589)))

(assert (= (and d!14352 (not res!40166)) b!47730))

(assert (= (and b!47730 (not res!40165)) b!47727))

(assert (= (and b!47730 res!40163) b!47728))

(assert (= (and b!47728 c!3302) b!47731))

(assert (= (and b!47728 (not c!3302)) b!47729))

(assert (= (and b!47729 res!40167) b!47726))

(assert (= (and b!47726 (not res!40164)) b!47725))

(assert (= (or b!47731 b!47725) bm!586))

(declare-fun m!73809 () Bool)

(assert (=> bm!586 m!73809))

(declare-fun m!73811 () Bool)

(assert (=> bm!586 m!73811))

(declare-fun m!73813 () Bool)

(assert (=> bm!586 m!73813))

(declare-fun m!73815 () Bool)

(assert (=> bm!586 m!73815))

(declare-fun m!73817 () Bool)

(assert (=> bm!586 m!73817))

(declare-fun m!73819 () Bool)

(assert (=> b!47727 m!73819))

(assert (=> b!47729 m!73817))

(assert (=> b!47729 m!73813))

(assert (=> b!47729 m!73817))

(assert (=> b!47729 m!73813))

(declare-fun m!73821 () Bool)

(assert (=> b!47729 m!73821))

(assert (=> b!47730 m!71721))

(declare-fun m!73823 () Bool)

(assert (=> b!47730 m!73823))

(assert (=> b!47086 d!14352))

(assert (=> b!47086 d!13810))

(declare-fun d!14354 () Bool)

(assert (=> d!14354 (= (length!238 lt!73375) (size!1041 lt!73375))))

(declare-fun bs!3719 () Bool)

(assert (= bs!3719 d!14354))

(declare-fun m!73825 () Bool)

(assert (=> bs!3719 m!73825))

(assert (=> b!47249 d!14354))

(declare-fun d!14356 () Bool)

(assert (=> d!14356 (= (length!238 lt!73351) (size!1041 lt!73351))))

(declare-fun bs!3720 () Bool)

(assert (= bs!3720 d!14356))

(declare-fun m!73827 () Bool)

(assert (=> bs!3720 m!73827))

(assert (=> b!47240 d!14356))

(declare-fun d!14358 () Bool)

(assert (=> d!14358 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72283)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 thiss!1379)))))))

(assert (=> d!13882 d!14358))

(assert (=> b!47087 d!13792))

(assert (=> b!47087 d!13774))

(declare-fun d!14360 () Bool)

(declare-fun e!31622 () Bool)

(assert (=> d!14360 e!31622))

(declare-fun res!40169 () Bool)

(assert (=> d!14360 (=> (not res!40169) (not e!31622))))

(declare-fun lt!73984 () (_ BitVec 64))

(declare-fun lt!73986 () (_ BitVec 64))

(declare-fun lt!73983 () (_ BitVec 64))

(assert (=> d!14360 (= res!40169 (= lt!73983 (bvsub lt!73986 lt!73984)))))

(assert (=> d!14360 (or (= (bvand lt!73986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73986 lt!73984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14360 (= lt!73984 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73285))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73285)))))))

(declare-fun lt!73982 () (_ BitVec 64))

(declare-fun lt!73985 () (_ BitVec 64))

(assert (=> d!14360 (= lt!73986 (bvmul lt!73982 lt!73985))))

(assert (=> d!14360 (or (= lt!73982 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73985 (bvsdiv (bvmul lt!73982 lt!73985) lt!73982)))))

(assert (=> d!14360 (= lt!73985 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14360 (= lt!73982 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))))))

(assert (=> d!14360 (= lt!73983 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!73285))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!73285)))))))

(assert (=> d!14360 (invariant!0 (currentBit!2885 (_2!2355 lt!73285)) (currentByte!2890 (_2!2355 lt!73285)) (size!1036 (buf!1385 (_2!2355 lt!73285))))))

(assert (=> d!14360 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73285))) (currentByte!2890 (_2!2355 lt!73285)) (currentBit!2885 (_2!2355 lt!73285))) lt!73983)))

(declare-fun b!47732 () Bool)

(declare-fun res!40168 () Bool)

(assert (=> b!47732 (=> (not res!40168) (not e!31622))))

(assert (=> b!47732 (= res!40168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73983))))

(declare-fun b!47733 () Bool)

(declare-fun lt!73981 () (_ BitVec 64))

(assert (=> b!47733 (= e!31622 (bvsle lt!73983 (bvmul lt!73981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47733 (or (= lt!73981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73981)))))

(assert (=> b!47733 (= lt!73981 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))))))

(assert (= (and d!14360 res!40169) b!47732))

(assert (= (and b!47732 res!40168) b!47733))

(declare-fun m!73829 () Bool)

(assert (=> d!14360 m!73829))

(assert (=> d!14360 m!72505))

(assert (=> d!13832 d!14360))

(assert (=> d!13832 d!13810))

(assert (=> d!13832 d!14312))

(assert (=> d!13832 d!14302))

(assert (=> b!47084 d!13810))

(assert (=> b!47084 d!13774))

(assert (=> b!47244 d!13810))

(declare-fun d!14362 () Bool)

(assert (=> d!14362 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 (_2!2355 lt!72283)) lt!73357 lt!73366)))

(declare-fun lt!73987 () Unit!3309)

(assert (=> d!14362 (= lt!73987 (choose!8 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) lt!73357 lt!73366))))

(assert (=> d!14362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73357) (bvsle lt!73357 lt!73366))))

(assert (=> d!14362 (= (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!72275)) lt!73357 lt!73366) lt!73987)))

(declare-fun bs!3721 () Bool)

(assert (= bs!3721 d!14362))

(assert (=> bs!3721 m!72637))

(declare-fun m!73831 () Bool)

(assert (=> bs!3721 m!73831))

(assert (=> b!47244 d!14362))

(declare-fun call!590 () Bool)

(declare-fun lt!73988 () (_ BitVec 32))

(declare-fun lt!73990 () (_ BitVec 32))

(declare-fun c!3303 () Bool)

(declare-fun bm!587 () Bool)

(declare-fun lt!73989 () tuple4!16)

(assert (=> bm!587 (= call!590 (byteRangesEq!0 (ite c!3303 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73989)) (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_4!8 lt!73989))) (ite c!3303 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73989)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_4!8 lt!73989))) (ite c!3303 lt!73990 #b00000000000000000000000000000000) lt!73988))))

(declare-fun b!47734 () Bool)

(declare-fun e!31626 () Bool)

(assert (=> b!47734 (= e!31626 call!590)))

(declare-fun b!47735 () Bool)

(declare-fun res!40171 () Bool)

(assert (=> b!47735 (= res!40171 (= lt!73988 #b00000000000000000000000000000000))))

(assert (=> b!47735 (=> res!40171 e!31626)))

(declare-fun e!31627 () Bool)

(assert (=> b!47735 (= e!31627 e!31626)))

(declare-fun b!47736 () Bool)

(declare-fun e!31624 () Bool)

(assert (=> b!47736 (= e!31624 (arrayRangesEq!9 (buf!1385 (_2!2355 lt!72275)) (buf!1385 (_2!2355 lt!72283)) (_1!2376 lt!73989) (_2!2376 lt!73989)))))

(declare-fun b!47737 () Bool)

(declare-fun e!31623 () Bool)

(declare-fun e!31628 () Bool)

(assert (=> b!47737 (= e!31623 e!31628)))

(assert (=> b!47737 (= c!3303 (= (_3!96 lt!73989) (_4!8 lt!73989)))))

(declare-fun d!14364 () Bool)

(declare-fun res!40173 () Bool)

(declare-fun e!31625 () Bool)

(assert (=> d!14364 (=> res!40173 e!31625)))

(assert (=> d!14364 (= res!40173 (bvsge lt!73357 lt!73366))))

(assert (=> d!14364 (= (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72275)) (buf!1385 (_2!2355 lt!72283)) lt!73357 lt!73366) e!31625)))

(declare-fun b!47738 () Bool)

(assert (=> b!47738 (= e!31628 e!31627)))

(declare-fun res!40174 () Bool)

(assert (=> b!47738 (= res!40174 (byteRangesEq!0 (select (arr!1556 (buf!1385 (_2!2355 lt!72275))) (_3!96 lt!73989)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!73989)) lt!73990 #b00000000000000000000000000001000))))

(assert (=> b!47738 (=> (not res!40174) (not e!31627))))

(declare-fun b!47739 () Bool)

(assert (=> b!47739 (= e!31625 e!31623)))

(declare-fun res!40170 () Bool)

(assert (=> b!47739 (=> (not res!40170) (not e!31623))))

(assert (=> b!47739 (= res!40170 e!31624)))

(declare-fun res!40172 () Bool)

(assert (=> b!47739 (=> res!40172 e!31624)))

(assert (=> b!47739 (= res!40172 (bvsge (_1!2376 lt!73989) (_2!2376 lt!73989)))))

(assert (=> b!47739 (= lt!73988 ((_ extract 31 0) (bvsrem lt!73366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47739 (= lt!73990 ((_ extract 31 0) (bvsrem lt!73357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47739 (= lt!73989 (arrayBitIndices!0 lt!73357 lt!73366))))

(declare-fun b!47740 () Bool)

(assert (=> b!47740 (= e!31628 call!590)))

(assert (= (and d!14364 (not res!40173)) b!47739))

(assert (= (and b!47739 (not res!40172)) b!47736))

(assert (= (and b!47739 res!40170) b!47737))

(assert (= (and b!47737 c!3303) b!47740))

(assert (= (and b!47737 (not c!3303)) b!47738))

(assert (= (and b!47738 res!40174) b!47735))

(assert (= (and b!47735 (not res!40171)) b!47734))

(assert (= (or b!47740 b!47734) bm!587))

(declare-fun m!73833 () Bool)

(assert (=> bm!587 m!73833))

(declare-fun m!73835 () Bool)

(assert (=> bm!587 m!73835))

(declare-fun m!73837 () Bool)

(assert (=> bm!587 m!73837))

(declare-fun m!73839 () Bool)

(assert (=> bm!587 m!73839))

(declare-fun m!73841 () Bool)

(assert (=> bm!587 m!73841))

(declare-fun m!73843 () Bool)

(assert (=> b!47736 m!73843))

(assert (=> b!47738 m!73841))

(assert (=> b!47738 m!73837))

(assert (=> b!47738 m!73841))

(assert (=> b!47738 m!73837))

(declare-fun m!73845 () Bool)

(assert (=> b!47738 m!73845))

(declare-fun m!73847 () Bool)

(assert (=> b!47739 m!73847))

(assert (=> b!47244 d!14364))

(declare-fun d!14366 () Bool)

(assert (=> d!14366 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72275))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72275)))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72275))))))))

(assert (=> d!13774 d!14366))

(assert (=> d!13774 d!13764))

(declare-fun b!47743 () Bool)

(declare-fun e!31630 () Bool)

(declare-fun lt!73993 () List!543)

(assert (=> b!47743 (= e!31630 (isEmpty!139 lt!73993))))

(declare-fun b!47741 () Bool)

(declare-fun e!31629 () tuple2!4552)

(assert (=> b!47741 (= e!31629 (tuple2!4553 Nil!540 (_2!2370 lt!73349)))))

(declare-fun d!14368 () Bool)

(assert (=> d!14368 e!31630))

(declare-fun c!3304 () Bool)

(assert (=> d!14368 (= c!3304 (= (bvsub lt!72277 lt!73350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14368 (= lt!73993 (_1!2369 e!31629))))

(declare-fun c!3305 () Bool)

(assert (=> d!14368 (= c!3305 (= (bvsub lt!72277 lt!73350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14368 (bvsge (bvsub lt!72277 lt!73350) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14368 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!73349) (bvsub lt!72277 lt!73350)) lt!73993)))

(declare-fun b!47744 () Bool)

(assert (=> b!47744 (= e!31630 (> (length!238 lt!73993) 0))))

(declare-fun lt!73992 () (_ BitVec 64))

(declare-fun lt!73991 () tuple2!4554)

(declare-fun b!47742 () Bool)

(assert (=> b!47742 (= e!31629 (tuple2!4553 (Cons!539 (_1!2370 lt!73991) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!73991) (bvsub (bvsub lt!72277 lt!73350) lt!73992))) (_2!2370 lt!73991)))))

(assert (=> b!47742 (= lt!73991 (readBit!0 (_2!2370 lt!73349)))))

(assert (=> b!47742 (= lt!73992 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14368 c!3305) b!47741))

(assert (= (and d!14368 (not c!3305)) b!47742))

(assert (= (and d!14368 c!3304) b!47743))

(assert (= (and d!14368 (not c!3304)) b!47744))

(declare-fun m!73849 () Bool)

(assert (=> b!47743 m!73849))

(declare-fun m!73851 () Bool)

(assert (=> b!47744 m!73851))

(declare-fun m!73853 () Bool)

(assert (=> b!47742 m!73853))

(declare-fun m!73855 () Bool)

(assert (=> b!47742 m!73855))

(assert (=> b!47238 d!14368))

(declare-fun d!14370 () Bool)

(declare-fun e!31637 () Bool)

(assert (=> d!14370 e!31637))

(declare-fun res!40177 () Bool)

(assert (=> d!14370 (=> (not res!40177) (not e!31637))))

(declare-fun increaseBitIndex!0 (BitStream!1804) tuple2!4524)

(assert (=> d!14370 (= res!40177 (= (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72279)))) (buf!1385 (_1!2356 lt!72279))))))

(declare-fun lt!74008 () Bool)

(assert (=> d!14370 (= lt!74008 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72279))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74011 () tuple2!4554)

(assert (=> d!14370 (= lt!74011 (tuple2!4555 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72279))))) #b00000000000000000000000000000000)) (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72279)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!14370 (validate_offset_bit!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2356 lt!72279)))) ((_ sign_extend 32) (currentByte!2890 (_1!2356 lt!72279))) ((_ sign_extend 32) (currentBit!2885 (_1!2356 lt!72279))))))

(assert (=> d!14370 (= (readBit!0 (_1!2356 lt!72279)) lt!74011)))

(declare-fun lt!74010 () (_ BitVec 64))

(declare-fun b!47747 () Bool)

(declare-fun lt!74012 () (_ BitVec 64))

(assert (=> b!47747 (= e!31637 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72279))))) (currentByte!2890 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72279)))) (currentBit!2885 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72279))))) (bvadd lt!74010 lt!74012)))))

(assert (=> b!47747 (or (not (= (bvand lt!74010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74012 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74010 lt!74012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47747 (= lt!74012 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47747 (= lt!74010 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)) (currentBit!2885 (_1!2356 lt!72279))))))

(declare-fun lt!74014 () Bool)

(assert (=> b!47747 (= lt!74014 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72279))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74009 () Bool)

(assert (=> b!47747 (= lt!74009 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72279))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74013 () Bool)

(assert (=> b!47747 (= lt!74013 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72279))) (currentByte!2890 (_1!2356 lt!72279)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72279))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14370 res!40177) b!47747))

(declare-fun m!73857 () Bool)

(assert (=> d!14370 m!73857))

(declare-fun m!73859 () Bool)

(assert (=> d!14370 m!73859))

(declare-fun m!73861 () Bool)

(assert (=> d!14370 m!73861))

(declare-fun m!73863 () Bool)

(assert (=> d!14370 m!73863))

(assert (=> b!47747 m!73857))

(assert (=> b!47747 m!73859))

(assert (=> b!47747 m!73861))

(declare-fun m!73865 () Bool)

(assert (=> b!47747 m!73865))

(declare-fun m!73867 () Bool)

(assert (=> b!47747 m!73867))

(assert (=> b!47238 d!14370))

(declare-fun d!14372 () Bool)

(assert (=> d!14372 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73300) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283)))) lt!73300))))

(declare-fun bs!3722 () Bool)

(assert (= bs!3722 d!14372))

(declare-fun m!73869 () Bool)

(assert (=> bs!3722 m!73869))

(assert (=> b!47204 d!14372))

(declare-fun d!14374 () Bool)

(assert (=> d!14374 (validate_offset_bits!1 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!73285)))) ((_ sign_extend 32) (currentByte!2890 (_2!2355 lt!72283))) ((_ sign_extend 32) (currentBit!2885 (_2!2355 lt!72283))) lt!73300)))

(declare-fun lt!74015 () Unit!3309)

(assert (=> d!14374 (= lt!74015 (choose!9 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73285)) lt!73300 (BitStream!1805 (buf!1385 (_2!2355 lt!73285)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(assert (=> d!14374 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2355 lt!72283) (buf!1385 (_2!2355 lt!73285)) lt!73300) lt!74015)))

(declare-fun bs!3723 () Bool)

(assert (= bs!3723 d!14374))

(assert (=> bs!3723 m!72573))

(declare-fun m!73871 () Bool)

(assert (=> bs!3723 m!73871))

(assert (=> b!47204 d!14374))

(declare-fun d!14376 () Bool)

(declare-fun c!3306 () Bool)

(assert (=> d!14376 (= c!3306 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31638 () List!543)

(assert (=> d!14376 (= (byteArrayBitContentToList!0 (_2!2355 lt!73285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31638)))

(declare-fun b!47748 () Bool)

(assert (=> b!47748 (= e!31638 Nil!540)))

(declare-fun b!47749 () Bool)

(assert (=> b!47749 (= e!31638 (Cons!539 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2355 lt!73285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14376 c!3306) b!47748))

(assert (= (and d!14376 (not c!3306)) b!47749))

(assert (=> b!47749 m!72513))

(assert (=> b!47749 m!73489))

(declare-fun m!73873 () Bool)

(assert (=> b!47749 m!73873))

(assert (=> b!47204 d!14376))

(declare-fun b!47752 () Bool)

(declare-fun e!31640 () Bool)

(declare-fun lt!74018 () List!543)

(assert (=> b!47752 (= e!31640 (isEmpty!139 lt!74018))))

(declare-fun b!47750 () Bool)

(declare-fun e!31639 () tuple2!4552)

(assert (=> b!47750 (= e!31639 (tuple2!4553 Nil!540 (_1!2356 lt!73301)))))

(declare-fun d!14378 () Bool)

(assert (=> d!14378 e!31640))

(declare-fun c!3307 () Bool)

(assert (=> d!14378 (= c!3307 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14378 (= lt!74018 (_1!2369 e!31639))))

(declare-fun c!3308 () Bool)

(assert (=> d!14378 (= c!3308 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14378 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14378 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!73285) (_1!2356 lt!73301) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!74018)))

(declare-fun b!47753 () Bool)

(assert (=> b!47753 (= e!31640 (> (length!238 lt!74018) 0))))

(declare-fun lt!74016 () tuple2!4554)

(declare-fun b!47751 () Bool)

(declare-fun lt!74017 () (_ BitVec 64))

(assert (=> b!47751 (= e!31639 (tuple2!4553 (Cons!539 (_1!2370 lt!74016) (bitStreamReadBitsIntoList!0 (_2!2355 lt!73285) (_2!2370 lt!74016) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74017))) (_2!2370 lt!74016)))))

(assert (=> b!47751 (= lt!74016 (readBit!0 (_1!2356 lt!73301)))))

(assert (=> b!47751 (= lt!74017 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14378 c!3308) b!47750))

(assert (= (and d!14378 (not c!3308)) b!47751))

(assert (= (and d!14378 c!3307) b!47752))

(assert (= (and d!14378 (not c!3307)) b!47753))

(declare-fun m!73875 () Bool)

(assert (=> b!47752 m!73875))

(declare-fun m!73877 () Bool)

(assert (=> b!47753 m!73877))

(declare-fun m!73879 () Bool)

(assert (=> b!47751 m!73879))

(declare-fun m!73881 () Bool)

(assert (=> b!47751 m!73881))

(assert (=> b!47204 d!14378))

(declare-fun b!47754 () Bool)

(declare-fun e!31641 () Unit!3309)

(declare-fun Unit!3365 () Unit!3309)

(assert (=> b!47754 (= e!31641 Unit!3365)))

(declare-fun b!47755 () Bool)

(declare-fun res!40180 () Bool)

(declare-fun e!31642 () Bool)

(assert (=> b!47755 (=> (not res!40180) (not e!31642))))

(declare-fun lt!74036 () tuple2!4526)

(assert (=> b!47755 (= res!40180 (isPrefixOf!0 (_2!2356 lt!74036) (_2!2355 lt!73285)))))

(declare-fun b!47756 () Bool)

(declare-fun res!40179 () Bool)

(assert (=> b!47756 (=> (not res!40179) (not e!31642))))

(assert (=> b!47756 (= res!40179 (isPrefixOf!0 (_1!2356 lt!74036) (_2!2355 lt!72283)))))

(declare-fun b!47757 () Bool)

(declare-fun lt!74022 () Unit!3309)

(assert (=> b!47757 (= e!31641 lt!74022)))

(declare-fun lt!74024 () (_ BitVec 64))

(assert (=> b!47757 (= lt!74024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74033 () (_ BitVec 64))

(assert (=> b!47757 (= lt!74033 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> b!47757 (= lt!74022 (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (_2!2355 lt!73285)) lt!74024 lt!74033))))

(assert (=> b!47757 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!73285)) (buf!1385 (_2!2355 lt!72283)) lt!74024 lt!74033)))

(declare-fun lt!74029 () (_ BitVec 64))

(declare-fun lt!74020 () (_ BitVec 64))

(declare-fun b!47758 () Bool)

(assert (=> b!47758 (= e!31642 (= (_1!2356 lt!74036) (withMovedBitIndex!0 (_2!2356 lt!74036) (bvsub lt!74029 lt!74020))))))

(assert (=> b!47758 (or (= (bvand lt!74029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74029 lt!74020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47758 (= lt!74020 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!73285))) (currentByte!2890 (_2!2355 lt!73285)) (currentBit!2885 (_2!2355 lt!73285))))))

(assert (=> b!47758 (= lt!74029 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun d!14380 () Bool)

(assert (=> d!14380 e!31642))

(declare-fun res!40178 () Bool)

(assert (=> d!14380 (=> (not res!40178) (not e!31642))))

(assert (=> d!14380 (= res!40178 (isPrefixOf!0 (_1!2356 lt!74036) (_2!2356 lt!74036)))))

(declare-fun lt!74035 () BitStream!1804)

(assert (=> d!14380 (= lt!74036 (tuple2!4527 lt!74035 (_2!2355 lt!73285)))))

(declare-fun lt!74028 () Unit!3309)

(declare-fun lt!74019 () Unit!3309)

(assert (=> d!14380 (= lt!74028 lt!74019)))

(assert (=> d!14380 (isPrefixOf!0 lt!74035 (_2!2355 lt!73285))))

(assert (=> d!14380 (= lt!74019 (lemmaIsPrefixTransitive!0 lt!74035 (_2!2355 lt!73285) (_2!2355 lt!73285)))))

(declare-fun lt!74034 () Unit!3309)

(declare-fun lt!74027 () Unit!3309)

(assert (=> d!14380 (= lt!74034 lt!74027)))

(assert (=> d!14380 (isPrefixOf!0 lt!74035 (_2!2355 lt!73285))))

(assert (=> d!14380 (= lt!74027 (lemmaIsPrefixTransitive!0 lt!74035 (_2!2355 lt!72283) (_2!2355 lt!73285)))))

(declare-fun lt!74037 () Unit!3309)

(assert (=> d!14380 (= lt!74037 e!31641)))

(declare-fun c!3309 () Bool)

(assert (=> d!14380 (= c!3309 (not (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000)))))

(declare-fun lt!74032 () Unit!3309)

(declare-fun lt!74025 () Unit!3309)

(assert (=> d!14380 (= lt!74032 lt!74025)))

(assert (=> d!14380 (isPrefixOf!0 (_2!2355 lt!73285) (_2!2355 lt!73285))))

(assert (=> d!14380 (= lt!74025 (lemmaIsPrefixRefl!0 (_2!2355 lt!73285)))))

(declare-fun lt!74030 () Unit!3309)

(declare-fun lt!74026 () Unit!3309)

(assert (=> d!14380 (= lt!74030 lt!74026)))

(assert (=> d!14380 (= lt!74026 (lemmaIsPrefixRefl!0 (_2!2355 lt!73285)))))

(declare-fun lt!74031 () Unit!3309)

(declare-fun lt!74023 () Unit!3309)

(assert (=> d!14380 (= lt!74031 lt!74023)))

(assert (=> d!14380 (isPrefixOf!0 lt!74035 lt!74035)))

(assert (=> d!14380 (= lt!74023 (lemmaIsPrefixRefl!0 lt!74035))))

(declare-fun lt!74038 () Unit!3309)

(declare-fun lt!74021 () Unit!3309)

(assert (=> d!14380 (= lt!74038 lt!74021)))

(assert (=> d!14380 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!14380 (= lt!74021 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(assert (=> d!14380 (= lt!74035 (BitStream!1805 (buf!1385 (_2!2355 lt!73285)) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> d!14380 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!73285))))

(assert (=> d!14380 (= (reader!0 (_2!2355 lt!72283) (_2!2355 lt!73285)) lt!74036)))

(assert (= (and d!14380 c!3309) b!47757))

(assert (= (and d!14380 (not c!3309)) b!47754))

(assert (= (and d!14380 res!40178) b!47756))

(assert (= (and b!47756 res!40179) b!47755))

(assert (= (and b!47755 res!40180) b!47758))

(declare-fun m!73883 () Bool)

(assert (=> b!47758 m!73883))

(assert (=> b!47758 m!72507))

(assert (=> b!47758 m!71721))

(assert (=> b!47757 m!71721))

(declare-fun m!73885 () Bool)

(assert (=> b!47757 m!73885))

(declare-fun m!73887 () Bool)

(assert (=> b!47757 m!73887))

(declare-fun m!73889 () Bool)

(assert (=> b!47756 m!73889))

(declare-fun m!73891 () Bool)

(assert (=> d!14380 m!73891))

(declare-fun m!73893 () Bool)

(assert (=> d!14380 m!73893))

(declare-fun m!73895 () Bool)

(assert (=> d!14380 m!73895))

(declare-fun m!73897 () Bool)

(assert (=> d!14380 m!73897))

(declare-fun m!73899 () Bool)

(assert (=> d!14380 m!73899))

(declare-fun m!73901 () Bool)

(assert (=> d!14380 m!73901))

(assert (=> d!14380 m!72361))

(declare-fun m!73903 () Bool)

(assert (=> d!14380 m!73903))

(declare-fun m!73905 () Bool)

(assert (=> d!14380 m!73905))

(assert (=> d!14380 m!72369))

(assert (=> d!14380 m!72499))

(declare-fun m!73907 () Bool)

(assert (=> b!47755 m!73907))

(assert (=> b!47204 d!14380))

(declare-fun b!47759 () Bool)

(declare-fun e!31643 () Unit!3309)

(declare-fun Unit!3366 () Unit!3309)

(assert (=> b!47759 (= e!31643 Unit!3366)))

(declare-fun b!47760 () Bool)

(declare-fun res!40183 () Bool)

(declare-fun e!31644 () Bool)

(assert (=> b!47760 (=> (not res!40183) (not e!31644))))

(declare-fun lt!74056 () tuple2!4526)

(assert (=> b!47760 (= res!40183 (isPrefixOf!0 (_2!2356 lt!74056) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun b!47761 () Bool)

(declare-fun res!40182 () Bool)

(assert (=> b!47761 (=> (not res!40182) (not e!31644))))

(assert (=> b!47761 (= res!40182 (isPrefixOf!0 (_1!2356 lt!74056) (_2!2355 lt!72283)))))

(declare-fun b!47762 () Bool)

(declare-fun lt!74042 () Unit!3309)

(assert (=> b!47762 (= e!31643 lt!74042)))

(declare-fun lt!74044 () (_ BitVec 64))

(assert (=> b!47762 (= lt!74044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74053 () (_ BitVec 64))

(assert (=> b!47762 (= lt!74053 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> b!47762 (= lt!74042 (arrayBitRangesEqSymmetric!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))) lt!74044 lt!74053))))

(assert (=> b!47762 (arrayBitRangesEq!0 (buf!1385 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))) (buf!1385 (_2!2355 lt!72283)) lt!74044 lt!74053)))

(declare-fun lt!74040 () (_ BitVec 64))

(declare-fun lt!74049 () (_ BitVec 64))

(declare-fun b!47763 () Bool)

(assert (=> b!47763 (= e!31644 (= (_1!2356 lt!74056) (withMovedBitIndex!0 (_2!2356 lt!74056) (bvsub lt!74049 lt!74040))))))

(assert (=> b!47763 (or (= (bvand lt!74049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74049 lt!74040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47763 (= lt!74040 (bitIndex!0 (size!1036 (buf!1385 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))) (currentByte!2890 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))) (currentBit!2885 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))))))

(assert (=> b!47763 (= lt!74049 (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(declare-fun d!14382 () Bool)

(assert (=> d!14382 e!31644))

(declare-fun res!40181 () Bool)

(assert (=> d!14382 (=> (not res!40181) (not e!31644))))

(assert (=> d!14382 (= res!40181 (isPrefixOf!0 (_1!2356 lt!74056) (_2!2356 lt!74056)))))

(declare-fun lt!74055 () BitStream!1804)

(assert (=> d!14382 (= lt!74056 (tuple2!4527 lt!74055 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun lt!74048 () Unit!3309)

(declare-fun lt!74039 () Unit!3309)

(assert (=> d!14382 (= lt!74048 lt!74039)))

(assert (=> d!14382 (isPrefixOf!0 lt!74055 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))))

(assert (=> d!14382 (= lt!74039 (lemmaIsPrefixTransitive!0 lt!74055 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun lt!74054 () Unit!3309)

(declare-fun lt!74047 () Unit!3309)

(assert (=> d!14382 (= lt!74054 lt!74047)))

(assert (=> d!14382 (isPrefixOf!0 lt!74055 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))))

(assert (=> d!14382 (= lt!74047 (lemmaIsPrefixTransitive!0 lt!74055 (_2!2355 lt!72283) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun lt!74057 () Unit!3309)

(assert (=> d!14382 (= lt!74057 e!31643)))

(declare-fun c!3310 () Bool)

(assert (=> d!14382 (= c!3310 (not (= (size!1036 (buf!1385 (_2!2355 lt!72283))) #b00000000000000000000000000000000)))))

(declare-fun lt!74052 () Unit!3309)

(declare-fun lt!74045 () Unit!3309)

(assert (=> d!14382 (= lt!74052 lt!74045)))

(assert (=> d!14382 (isPrefixOf!0 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))))

(assert (=> d!14382 (= lt!74045 (lemmaIsPrefixRefl!0 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun lt!74050 () Unit!3309)

(declare-fun lt!74046 () Unit!3309)

(assert (=> d!14382 (= lt!74050 lt!74046)))

(assert (=> d!14382 (= lt!74046 (lemmaIsPrefixRefl!0 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))))))

(declare-fun lt!74051 () Unit!3309)

(declare-fun lt!74043 () Unit!3309)

(assert (=> d!14382 (= lt!74051 lt!74043)))

(assert (=> d!14382 (isPrefixOf!0 lt!74055 lt!74055)))

(assert (=> d!14382 (= lt!74043 (lemmaIsPrefixRefl!0 lt!74055))))

(declare-fun lt!74058 () Unit!3309)

(declare-fun lt!74041 () Unit!3309)

(assert (=> d!14382 (= lt!74058 lt!74041)))

(assert (=> d!14382 (isPrefixOf!0 (_2!2355 lt!72283) (_2!2355 lt!72283))))

(assert (=> d!14382 (= lt!74041 (lemmaIsPrefixRefl!0 (_2!2355 lt!72283)))))

(assert (=> d!14382 (= lt!74055 (BitStream!1805 (buf!1385 (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283))))))

(assert (=> d!14382 (isPrefixOf!0 (_2!2355 lt!72283) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283)))))

(assert (=> d!14382 (= (reader!0 (_2!2355 lt!72283) (ite c!3231 (_2!2355 lt!73264) (_2!2355 lt!72283))) lt!74056)))

(assert (= (and d!14382 c!3310) b!47762))

(assert (= (and d!14382 (not c!3310)) b!47759))

(assert (= (and d!14382 res!40181) b!47761))

(assert (= (and b!47761 res!40182) b!47760))

(assert (= (and b!47760 res!40183) b!47763))

(declare-fun m!73909 () Bool)

(assert (=> b!47763 m!73909))

(declare-fun m!73911 () Bool)

(assert (=> b!47763 m!73911))

(assert (=> b!47763 m!71721))

(assert (=> b!47762 m!71721))

(declare-fun m!73913 () Bool)

(assert (=> b!47762 m!73913))

(declare-fun m!73915 () Bool)

(assert (=> b!47762 m!73915))

(declare-fun m!73917 () Bool)

(assert (=> b!47761 m!73917))

(declare-fun m!73919 () Bool)

(assert (=> d!14382 m!73919))

(declare-fun m!73921 () Bool)

(assert (=> d!14382 m!73921))

(declare-fun m!73923 () Bool)

(assert (=> d!14382 m!73923))

(declare-fun m!73925 () Bool)

(assert (=> d!14382 m!73925))

(declare-fun m!73927 () Bool)

(assert (=> d!14382 m!73927))

(declare-fun m!73929 () Bool)

(assert (=> d!14382 m!73929))

(assert (=> d!14382 m!72361))

(declare-fun m!73931 () Bool)

(assert (=> d!14382 m!73931))

(declare-fun m!73933 () Bool)

(assert (=> d!14382 m!73933))

(assert (=> d!14382 m!72369))

(declare-fun m!73935 () Bool)

(assert (=> d!14382 m!73935))

(declare-fun m!73937 () Bool)

(assert (=> b!47760 m!73937))

(assert (=> bm!568 d!14382))

(declare-fun b!47766 () Bool)

(declare-fun e!31646 () Bool)

(declare-fun lt!74061 () List!543)

(assert (=> b!47766 (= e!31646 (isEmpty!139 lt!74061))))

(declare-fun b!47764 () Bool)

(declare-fun e!31645 () tuple2!4552)

(assert (=> b!47764 (= e!31645 (tuple2!4553 Nil!540 (_2!2370 lt!73373)))))

(declare-fun d!14384 () Bool)

(assert (=> d!14384 e!31646))

(declare-fun c!3311 () Bool)

(assert (=> d!14384 (= c!3311 (= (bvsub (bvsub to!314 i!635) lt!73374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14384 (= lt!74061 (_1!2369 e!31645))))

(declare-fun c!3312 () Bool)

(assert (=> d!14384 (= c!3312 (= (bvsub (bvsub to!314 i!635) lt!73374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14384 (bvsge (bvsub (bvsub to!314 i!635) lt!73374) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14384 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!73373) (bvsub (bvsub to!314 i!635) lt!73374)) lt!74061)))

(declare-fun b!47767 () Bool)

(assert (=> b!47767 (= e!31646 (> (length!238 lt!74061) 0))))

(declare-fun lt!74059 () tuple2!4554)

(declare-fun b!47765 () Bool)

(declare-fun lt!74060 () (_ BitVec 64))

(assert (=> b!47765 (= e!31645 (tuple2!4553 (Cons!539 (_1!2370 lt!74059) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!74059) (bvsub (bvsub (bvsub to!314 i!635) lt!73374) lt!74060))) (_2!2370 lt!74059)))))

(assert (=> b!47765 (= lt!74059 (readBit!0 (_2!2370 lt!73373)))))

(assert (=> b!47765 (= lt!74060 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14384 c!3312) b!47764))

(assert (= (and d!14384 (not c!3312)) b!47765))

(assert (= (and d!14384 c!3311) b!47766))

(assert (= (and d!14384 (not c!3311)) b!47767))

(declare-fun m!73939 () Bool)

(assert (=> b!47766 m!73939))

(declare-fun m!73941 () Bool)

(assert (=> b!47767 m!73941))

(declare-fun m!73943 () Bool)

(assert (=> b!47765 m!73943))

(declare-fun m!73945 () Bool)

(assert (=> b!47765 m!73945))

(assert (=> b!47247 d!14384))

(declare-fun d!14386 () Bool)

(declare-fun e!31647 () Bool)

(assert (=> d!14386 e!31647))

(declare-fun res!40184 () Bool)

(assert (=> d!14386 (=> (not res!40184) (not e!31647))))

(assert (=> d!14386 (= res!40184 (= (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72267)))) (buf!1385 (_1!2356 lt!72267))))))

(declare-fun lt!74062 () Bool)

(assert (=> d!14386 (= lt!74062 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72267))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74065 () tuple2!4554)

(assert (=> d!14386 (= lt!74065 (tuple2!4555 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72267))))) #b00000000000000000000000000000000)) (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72267)))))))

(assert (=> d!14386 (validate_offset_bit!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2356 lt!72267)))) ((_ sign_extend 32) (currentByte!2890 (_1!2356 lt!72267))) ((_ sign_extend 32) (currentBit!2885 (_1!2356 lt!72267))))))

(assert (=> d!14386 (= (readBit!0 (_1!2356 lt!72267)) lt!74065)))

(declare-fun lt!74066 () (_ BitVec 64))

(declare-fun b!47768 () Bool)

(declare-fun lt!74064 () (_ BitVec 64))

(assert (=> b!47768 (= e!31647 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72267))))) (currentByte!2890 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72267)))) (currentBit!2885 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72267))))) (bvadd lt!74064 lt!74066)))))

(assert (=> b!47768 (or (not (= (bvand lt!74064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74066 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74064 lt!74066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47768 (= lt!74066 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47768 (= lt!74064 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)) (currentBit!2885 (_1!2356 lt!72267))))))

(declare-fun lt!74068 () Bool)

(assert (=> b!47768 (= lt!74068 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72267))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74063 () Bool)

(assert (=> b!47768 (= lt!74063 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72267))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74067 () Bool)

(assert (=> b!47768 (= lt!74067 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72267))) (currentByte!2890 (_1!2356 lt!72267)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72267))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14386 res!40184) b!47768))

(declare-fun m!73947 () Bool)

(assert (=> d!14386 m!73947))

(declare-fun m!73949 () Bool)

(assert (=> d!14386 m!73949))

(declare-fun m!73951 () Bool)

(assert (=> d!14386 m!73951))

(declare-fun m!73953 () Bool)

(assert (=> d!14386 m!73953))

(assert (=> b!47768 m!73947))

(assert (=> b!47768 m!73949))

(assert (=> b!47768 m!73951))

(declare-fun m!73955 () Bool)

(assert (=> b!47768 m!73955))

(declare-fun m!73957 () Bool)

(assert (=> b!47768 m!73957))

(assert (=> b!47247 d!14386))

(assert (=> d!13810 d!14180))

(assert (=> d!13810 d!13762))

(declare-fun d!14388 () Bool)

(declare-fun e!31648 () Bool)

(assert (=> d!14388 e!31648))

(declare-fun res!40186 () Bool)

(assert (=> d!14388 (=> (not res!40186) (not e!31648))))

(declare-fun lt!74072 () (_ BitVec 64))

(declare-fun lt!74074 () (_ BitVec 64))

(declare-fun lt!74071 () (_ BitVec 64))

(assert (=> d!14388 (= res!40186 (= lt!74071 (bvsub lt!74074 lt!74072)))))

(assert (=> d!14388 (or (= (bvand lt!74074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74072 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74074 lt!74072) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14388 (= lt!74072 (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73345)))) ((_ sign_extend 32) (currentByte!2890 (_1!2372 lt!73345))) ((_ sign_extend 32) (currentBit!2885 (_1!2372 lt!73345)))))))

(declare-fun lt!74070 () (_ BitVec 64))

(declare-fun lt!74073 () (_ BitVec 64))

(assert (=> d!14388 (= lt!74074 (bvmul lt!74070 lt!74073))))

(assert (=> d!14388 (or (= lt!74070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74073 (bvsdiv (bvmul lt!74070 lt!74073) lt!74070)))))

(assert (=> d!14388 (= lt!74073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14388 (= lt!74070 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73345)))))))

(assert (=> d!14388 (= lt!74071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 (_1!2372 lt!73345))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 (_1!2372 lt!73345)))))))

(assert (=> d!14388 (invariant!0 (currentBit!2885 (_1!2372 lt!73345)) (currentByte!2890 (_1!2372 lt!73345)) (size!1036 (buf!1385 (_1!2372 lt!73345))))))

(assert (=> d!14388 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!73345))) (currentByte!2890 (_1!2372 lt!73345)) (currentBit!2885 (_1!2372 lt!73345))) lt!74071)))

(declare-fun b!47769 () Bool)

(declare-fun res!40185 () Bool)

(assert (=> b!47769 (=> (not res!40185) (not e!31648))))

(assert (=> b!47769 (= res!40185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74071))))

(declare-fun b!47770 () Bool)

(declare-fun lt!74069 () (_ BitVec 64))

(assert (=> b!47770 (= e!31648 (bvsle lt!74071 (bvmul lt!74069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47770 (or (= lt!74069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74069)))))

(assert (=> b!47770 (= lt!74069 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2372 lt!73345)))))))

(assert (= (and d!14388 res!40186) b!47769))

(assert (= (and b!47769 res!40185) b!47770))

(declare-fun m!73959 () Bool)

(assert (=> d!14388 m!73959))

(declare-fun m!73961 () Bool)

(assert (=> d!14388 m!73961))

(assert (=> b!47231 d!14388))

(assert (=> b!47231 d!14176))

(declare-fun d!14390 () Bool)

(declare-fun res!40191 () Bool)

(declare-fun e!31653 () Bool)

(assert (=> d!14390 (=> res!40191 e!31653)))

(assert (=> d!14390 (= res!40191 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14390 (= (checkByteArrayBitContent!0 (_2!2355 lt!72283) srcBuffer!2 (_1!2371 (readBits!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31653)))

(declare-fun b!47775 () Bool)

(declare-fun e!31654 () Bool)

(assert (=> b!47775 (= e!31653 e!31654)))

(declare-fun res!40192 () Bool)

(assert (=> b!47775 (=> (not res!40192) (not e!31654))))

(assert (=> b!47775 (= res!40192 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1556 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (_1!2371 (readBits!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!47776 () Bool)

(assert (=> b!47776 (= e!31654 (checkByteArrayBitContent!0 (_2!2355 lt!72283) srcBuffer!2 (_1!2371 (readBits!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14390 (not res!40191)) b!47775))

(assert (= (and b!47775 res!40192) b!47776))

(assert (=> b!47775 m!72513))

(assert (=> b!47775 m!73489))

(declare-fun m!73963 () Bool)

(assert (=> b!47775 m!73963))

(declare-fun m!73965 () Bool)

(assert (=> b!47775 m!73965))

(declare-fun m!73967 () Bool)

(assert (=> b!47776 m!73967))

(assert (=> b!47202 d!14390))

(declare-fun b!47777 () Bool)

(declare-fun res!40197 () Bool)

(declare-fun e!31655 () Bool)

(assert (=> b!47777 (=> (not res!40197) (not e!31655))))

(declare-fun lt!74081 () tuple2!4556)

(assert (=> b!47777 (= res!40197 (bvsle (currentByte!2890 (_1!2356 call!571)) (currentByte!2890 (_2!2371 lt!74081))))))

(declare-fun b!47778 () Bool)

(assert (=> b!47778 (= e!31655 (= (byteArrayBitContentToList!0 (_2!2371 lt!74081) (_1!2371 lt!74081) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2371 lt!74081) (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!47779 () Bool)

(declare-fun res!40194 () Bool)

(assert (=> b!47779 (=> (not res!40194) (not e!31655))))

(declare-fun lt!74080 () (_ BitVec 64))

(assert (=> b!47779 (= res!40194 (= (bvadd lt!74080 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1036 (buf!1385 (_2!2371 lt!74081))) (currentByte!2890 (_2!2371 lt!74081)) (currentBit!2885 (_2!2371 lt!74081)))))))

(assert (=> b!47779 (or (not (= (bvand lt!74080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74080 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47779 (= lt!74080 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 call!571))) (currentByte!2890 (_1!2356 call!571)) (currentBit!2885 (_1!2356 call!571))))))

(declare-fun d!14392 () Bool)

(assert (=> d!14392 e!31655))

(declare-fun res!40193 () Bool)

(assert (=> d!14392 (=> (not res!40193) (not e!31655))))

(assert (=> d!14392 (= res!40193 (= (buf!1385 (_2!2371 lt!74081)) (buf!1385 (_1!2356 call!571))))))

(declare-fun lt!74076 () tuple3!174)

(assert (=> d!14392 (= lt!74081 (tuple2!4557 (_3!95 lt!74076) (_2!2375 lt!74076)))))

(assert (=> d!14392 (= lt!74076 (readBitsLoop!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2294 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!14392 (= (readBits!0 (_1!2356 call!571) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!74081)))

(declare-fun b!47780 () Bool)

(declare-fun res!40196 () Bool)

(assert (=> b!47780 (=> (not res!40196) (not e!31655))))

(assert (=> b!47780 (= res!40196 (invariant!0 (currentBit!2885 (_2!2371 lt!74081)) (currentByte!2890 (_2!2371 lt!74081)) (size!1036 (buf!1385 (_2!2371 lt!74081)))))))

(declare-fun b!47781 () Bool)

(declare-fun res!40195 () Bool)

(assert (=> b!47781 (=> (not res!40195) (not e!31655))))

(declare-fun lt!74083 () (_ BitVec 64))

(assert (=> b!47781 (= res!40195 (= (size!1036 (_1!2371 lt!74081)) ((_ extract 31 0) lt!74083)))))

(assert (=> b!47781 (and (bvslt lt!74083 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!74083 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!74079 () (_ BitVec 64))

(declare-fun lt!74078 () (_ BitVec 64))

(assert (=> b!47781 (= lt!74083 (bvsdiv lt!74079 lt!74078))))

(assert (=> b!47781 (and (not (= lt!74078 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!74079 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!74078 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!47781 (= lt!74078 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!74082 () (_ BitVec 64))

(declare-fun lt!74075 () (_ BitVec 64))

(assert (=> b!47781 (= lt!74079 (bvsub lt!74082 lt!74075))))

(assert (=> b!47781 (or (= (bvand lt!74082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74082 lt!74075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47781 (= lt!74075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74077 () (_ BitVec 64))

(assert (=> b!47781 (= lt!74082 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74077))))

(assert (=> b!47781 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74077 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47781 (= lt!74077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!14392 res!40193) b!47779))

(assert (= (and b!47779 res!40194) b!47780))

(assert (= (and b!47780 res!40196) b!47781))

(assert (= (and b!47781 res!40195) b!47777))

(assert (= (and b!47777 res!40197) b!47778))

(declare-fun m!73969 () Bool)

(assert (=> b!47778 m!73969))

(declare-fun m!73971 () Bool)

(assert (=> b!47778 m!73971))

(declare-fun m!73973 () Bool)

(assert (=> b!47779 m!73973))

(declare-fun m!73975 () Bool)

(assert (=> b!47779 m!73975))

(declare-fun m!73977 () Bool)

(assert (=> d!14392 m!73977))

(declare-fun m!73979 () Bool)

(assert (=> b!47780 m!73979))

(assert (=> b!47202 d!14392))

(declare-fun d!14394 () Bool)

(assert (=> d!14394 (= (remainingBits!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1036 (buf!1385 (_2!2355 lt!72275)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2890 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2885 thiss!1379)))))))

(assert (=> d!13912 d!14394))

(assert (=> b!47121 d!13792))

(declare-fun d!14396 () Bool)

(assert (=> d!14396 (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 thiss!1379) lt!73037 lt!73046)))

(declare-fun lt!74084 () Unit!3309)

(assert (=> d!14396 (= lt!74084 (choose!8 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) lt!73037 lt!73046))))

(assert (=> d!14396 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73037) (bvsle lt!73037 lt!73046))))

(assert (=> d!14396 (= (arrayBitRangesEqSymmetric!0 (buf!1385 thiss!1379) (buf!1385 (_2!2355 lt!72283)) lt!73037 lt!73046) lt!74084)))

(declare-fun bs!3724 () Bool)

(assert (= bs!3724 d!14396))

(assert (=> bs!3724 m!72355))

(declare-fun m!73981 () Bool)

(assert (=> bs!3724 m!73981))

(assert (=> b!47121 d!14396))

(declare-fun lt!74087 () (_ BitVec 32))

(declare-fun lt!74086 () tuple4!16)

(declare-fun bm!588 () Bool)

(declare-fun call!591 () Bool)

(declare-fun lt!74085 () (_ BitVec 32))

(declare-fun c!3313 () Bool)

(assert (=> bm!588 (= call!591 (byteRangesEq!0 (ite c!3313 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!74086)) (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_4!8 lt!74086))) (ite c!3313 (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!74086)) (select (arr!1556 (buf!1385 thiss!1379)) (_4!8 lt!74086))) (ite c!3313 lt!74087 #b00000000000000000000000000000000) lt!74085))))

(declare-fun b!47782 () Bool)

(declare-fun e!31659 () Bool)

(assert (=> b!47782 (= e!31659 call!591)))

(declare-fun b!47783 () Bool)

(declare-fun res!40199 () Bool)

(assert (=> b!47783 (= res!40199 (= lt!74085 #b00000000000000000000000000000000))))

(assert (=> b!47783 (=> res!40199 e!31659)))

(declare-fun e!31660 () Bool)

(assert (=> b!47783 (= e!31660 e!31659)))

(declare-fun e!31657 () Bool)

(declare-fun b!47784 () Bool)

(assert (=> b!47784 (= e!31657 (arrayRangesEq!9 (buf!1385 (_2!2355 lt!72283)) (buf!1385 thiss!1379) (_1!2376 lt!74086) (_2!2376 lt!74086)))))

(declare-fun b!47785 () Bool)

(declare-fun e!31656 () Bool)

(declare-fun e!31661 () Bool)

(assert (=> b!47785 (= e!31656 e!31661)))

(assert (=> b!47785 (= c!3313 (= (_3!96 lt!74086) (_4!8 lt!74086)))))

(declare-fun d!14398 () Bool)

(declare-fun res!40201 () Bool)

(declare-fun e!31658 () Bool)

(assert (=> d!14398 (=> res!40201 e!31658)))

(assert (=> d!14398 (= res!40201 (bvsge lt!73037 lt!73046))))

(assert (=> d!14398 (= (arrayBitRangesEq!0 (buf!1385 (_2!2355 lt!72283)) (buf!1385 thiss!1379) lt!73037 lt!73046) e!31658)))

(declare-fun b!47786 () Bool)

(assert (=> b!47786 (= e!31661 e!31660)))

(declare-fun res!40202 () Bool)

(assert (=> b!47786 (= res!40202 (byteRangesEq!0 (select (arr!1556 (buf!1385 (_2!2355 lt!72283))) (_3!96 lt!74086)) (select (arr!1556 (buf!1385 thiss!1379)) (_3!96 lt!74086)) lt!74087 #b00000000000000000000000000001000))))

(assert (=> b!47786 (=> (not res!40202) (not e!31660))))

(declare-fun b!47787 () Bool)

(assert (=> b!47787 (= e!31658 e!31656)))

(declare-fun res!40198 () Bool)

(assert (=> b!47787 (=> (not res!40198) (not e!31656))))

(assert (=> b!47787 (= res!40198 e!31657)))

(declare-fun res!40200 () Bool)

(assert (=> b!47787 (=> res!40200 e!31657)))

(assert (=> b!47787 (= res!40200 (bvsge (_1!2376 lt!74086) (_2!2376 lt!74086)))))

(assert (=> b!47787 (= lt!74085 ((_ extract 31 0) (bvsrem lt!73046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47787 (= lt!74087 ((_ extract 31 0) (bvsrem lt!73037 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47787 (= lt!74086 (arrayBitIndices!0 lt!73037 lt!73046))))

(declare-fun b!47788 () Bool)

(assert (=> b!47788 (= e!31661 call!591)))

(assert (= (and d!14398 (not res!40201)) b!47787))

(assert (= (and b!47787 (not res!40200)) b!47784))

(assert (= (and b!47787 res!40198) b!47785))

(assert (= (and b!47785 c!3313) b!47788))

(assert (= (and b!47785 (not c!3313)) b!47786))

(assert (= (and b!47786 res!40202) b!47783))

(assert (= (and b!47783 (not res!40199)) b!47782))

(assert (= (or b!47788 b!47782) bm!588))

(declare-fun m!73983 () Bool)

(assert (=> bm!588 m!73983))

(declare-fun m!73985 () Bool)

(assert (=> bm!588 m!73985))

(declare-fun m!73987 () Bool)

(assert (=> bm!588 m!73987))

(declare-fun m!73989 () Bool)

(assert (=> bm!588 m!73989))

(declare-fun m!73991 () Bool)

(assert (=> bm!588 m!73991))

(declare-fun m!73993 () Bool)

(assert (=> b!47784 m!73993))

(assert (=> b!47786 m!73991))

(assert (=> b!47786 m!73987))

(assert (=> b!47786 m!73991))

(assert (=> b!47786 m!73987))

(declare-fun m!73995 () Bool)

(assert (=> b!47786 m!73995))

(declare-fun m!73997 () Bool)

(assert (=> b!47787 m!73997))

(assert (=> b!47121 d!14398))

(declare-fun d!14400 () Bool)

(declare-fun res!40204 () Bool)

(declare-fun e!31663 () Bool)

(assert (=> d!14400 (=> (not res!40204) (not e!31663))))

(assert (=> d!14400 (= res!40204 (= (size!1036 (buf!1385 (_2!2356 lt!73369))) (size!1036 (buf!1385 (_2!2355 lt!72275)))))))

(assert (=> d!14400 (= (isPrefixOf!0 (_2!2356 lt!73369) (_2!2355 lt!72275)) e!31663)))

(declare-fun b!47789 () Bool)

(declare-fun res!40203 () Bool)

(assert (=> b!47789 (=> (not res!40203) (not e!31663))))

(assert (=> b!47789 (= res!40203 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73369))) (currentByte!2890 (_2!2356 lt!73369)) (currentBit!2885 (_2!2356 lt!73369))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72275))) (currentByte!2890 (_2!2355 lt!72275)) (currentBit!2885 (_2!2355 lt!72275)))))))

(declare-fun b!47790 () Bool)

(declare-fun e!31662 () Bool)

(assert (=> b!47790 (= e!31663 e!31662)))

(declare-fun res!40205 () Bool)

(assert (=> b!47790 (=> res!40205 e!31662)))

(assert (=> b!47790 (= res!40205 (= (size!1036 (buf!1385 (_2!2356 lt!73369))) #b00000000000000000000000000000000))))

(declare-fun b!47791 () Bool)

(assert (=> b!47791 (= e!31662 (arrayBitRangesEq!0 (buf!1385 (_2!2356 lt!73369)) (buf!1385 (_2!2355 lt!72275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73369))) (currentByte!2890 (_2!2356 lt!73369)) (currentBit!2885 (_2!2356 lt!73369)))))))

(assert (= (and d!14400 res!40204) b!47789))

(assert (= (and b!47789 res!40203) b!47790))

(assert (= (and b!47790 (not res!40205)) b!47791))

(assert (=> b!47789 m!73425))

(assert (=> b!47789 m!71703))

(assert (=> b!47791 m!73425))

(assert (=> b!47791 m!73425))

(declare-fun m!73999 () Bool)

(assert (=> b!47791 m!73999))

(assert (=> b!47242 d!14400))

(assert (=> b!47229 d!14350))

(assert (=> b!47229 d!13792))

(declare-fun d!14402 () Bool)

(declare-fun res!40207 () Bool)

(declare-fun e!31665 () Bool)

(assert (=> d!14402 (=> (not res!40207) (not e!31665))))

(assert (=> d!14402 (= res!40207 (= (size!1036 (buf!1385 (_2!2356 lt!73049))) (size!1036 (buf!1385 (_2!2355 lt!72283)))))))

(assert (=> d!14402 (= (isPrefixOf!0 (_2!2356 lt!73049) (_2!2355 lt!72283)) e!31665)))

(declare-fun b!47792 () Bool)

(declare-fun res!40206 () Bool)

(assert (=> b!47792 (=> (not res!40206) (not e!31665))))

(assert (=> b!47792 (= res!40206 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73049))) (currentByte!2890 (_2!2356 lt!73049)) (currentBit!2885 (_2!2356 lt!73049))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!72283))) (currentByte!2890 (_2!2355 lt!72283)) (currentBit!2885 (_2!2355 lt!72283)))))))

(declare-fun b!47793 () Bool)

(declare-fun e!31664 () Bool)

(assert (=> b!47793 (= e!31665 e!31664)))

(declare-fun res!40208 () Bool)

(assert (=> b!47793 (=> res!40208 e!31664)))

(assert (=> b!47793 (= res!40208 (= (size!1036 (buf!1385 (_2!2356 lt!73049))) #b00000000000000000000000000000000))))

(declare-fun b!47794 () Bool)

(assert (=> b!47794 (= e!31664 (arrayBitRangesEq!0 (buf!1385 (_2!2356 lt!73049)) (buf!1385 (_2!2355 lt!72283)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73049))) (currentByte!2890 (_2!2356 lt!73049)) (currentBit!2885 (_2!2356 lt!73049)))))))

(assert (= (and d!14402 res!40207) b!47792))

(assert (= (and b!47792 res!40206) b!47793))

(assert (= (and b!47793 (not res!40208)) b!47794))

(assert (=> b!47792 m!73457))

(assert (=> b!47792 m!71721))

(assert (=> b!47794 m!73457))

(assert (=> b!47794 m!73457))

(declare-fun m!74001 () Bool)

(assert (=> b!47794 m!74001))

(assert (=> b!47119 d!14402))

(assert (=> d!13792 d!14276))

(assert (=> d!13792 d!14280))

(assert (=> d!13884 d!13816))

(declare-fun d!14404 () Bool)

(assert (=> d!14404 (isPrefixOf!0 thiss!1379 (_2!2355 lt!72275))))

(assert (=> d!14404 true))

(declare-fun _$15!150 () Unit!3309)

(assert (=> d!14404 (= (choose!30 thiss!1379 (_2!2355 lt!72283) (_2!2355 lt!72275)) _$15!150)))

(declare-fun bs!3725 () Bool)

(assert (= bs!3725 d!14404))

(assert (=> bs!3725 m!71737))

(assert (=> d!13884 d!14404))

(assert (=> d!13884 d!13894))

(declare-fun b!47797 () Bool)

(declare-fun e!31667 () Bool)

(declare-fun lt!74090 () List!543)

(assert (=> b!47797 (= e!31667 (isEmpty!139 lt!74090))))

(declare-fun b!47795 () Bool)

(declare-fun e!31666 () tuple2!4552)

(assert (=> b!47795 (= e!31666 (tuple2!4553 Nil!540 (_1!2356 lt!72279)))))

(declare-fun d!14406 () Bool)

(assert (=> d!14406 e!31667))

(declare-fun c!3314 () Bool)

(assert (=> d!14406 (= c!3314 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14406 (= lt!74090 (_1!2369 e!31666))))

(declare-fun c!3315 () Bool)

(assert (=> d!14406 (= c!3315 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14406 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14406 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_1!2356 lt!72279) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!74090)))

(declare-fun b!47798 () Bool)

(assert (=> b!47798 (= e!31667 (> (length!238 lt!74090) 0))))

(declare-fun lt!74089 () (_ BitVec 64))

(declare-fun lt!74088 () tuple2!4554)

(declare-fun b!47796 () Bool)

(assert (=> b!47796 (= e!31666 (tuple2!4553 (Cons!539 (_1!2370 lt!74088) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72275) (_2!2370 lt!74088) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74089))) (_2!2370 lt!74088)))))

(assert (=> b!47796 (= lt!74088 (readBit!0 (_1!2356 lt!72279)))))

(assert (=> b!47796 (= lt!74089 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14406 c!3315) b!47795))

(assert (= (and d!14406 (not c!3315)) b!47796))

(assert (= (and d!14406 c!3314) b!47797))

(assert (= (and d!14406 (not c!3314)) b!47798))

(declare-fun m!74003 () Bool)

(assert (=> b!47797 m!74003))

(declare-fun m!74005 () Bool)

(assert (=> b!47798 m!74005))

(declare-fun m!74007 () Bool)

(assert (=> b!47796 m!74007))

(assert (=> b!47796 m!72631))

(assert (=> b!47081 d!14406))

(assert (=> b!47081 d!13800))

(declare-fun d!14408 () Bool)

(declare-fun e!31668 () Bool)

(assert (=> d!14408 e!31668))

(declare-fun res!40209 () Bool)

(assert (=> d!14408 (=> (not res!40209) (not e!31668))))

(declare-fun lt!74092 () (_ BitVec 64))

(declare-fun lt!74091 () BitStream!1804)

(assert (=> d!14408 (= res!40209 (= (bvadd lt!74092 (bvsub lt!73386 lt!73377)) (bitIndex!0 (size!1036 (buf!1385 lt!74091)) (currentByte!2890 lt!74091) (currentBit!2885 lt!74091))))))

(assert (=> d!14408 (or (not (= (bvand lt!74092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73386 lt!73377) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74092 (bvsub lt!73386 lt!73377)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14408 (= lt!74092 (bitIndex!0 (size!1036 (buf!1385 (_2!2356 lt!73393))) (currentByte!2890 (_2!2356 lt!73393)) (currentBit!2885 (_2!2356 lt!73393))))))

(assert (=> d!14408 (= lt!74091 (_2!2355 (moveBitIndex!0 (_2!2356 lt!73393) (bvsub lt!73386 lt!73377))))))

(assert (=> d!14408 (moveBitIndexPrecond!0 (_2!2356 lt!73393) (bvsub lt!73386 lt!73377))))

(assert (=> d!14408 (= (withMovedBitIndex!0 (_2!2356 lt!73393) (bvsub lt!73386 lt!73377)) lt!74091)))

(declare-fun b!47799 () Bool)

(assert (=> b!47799 (= e!31668 (= (size!1036 (buf!1385 (_2!2356 lt!73393))) (size!1036 (buf!1385 lt!74091))))))

(assert (= (and d!14408 res!40209) b!47799))

(declare-fun m!74009 () Bool)

(assert (=> d!14408 m!74009))

(assert (=> d!14408 m!73449))

(declare-fun m!74011 () Bool)

(assert (=> d!14408 m!74011))

(declare-fun m!74013 () Bool)

(assert (=> d!14408 m!74013))

(assert (=> b!47254 d!14408))

(assert (=> b!47254 d!13774))

(assert (=> b!47254 d!13792))

(declare-fun d!14410 () Bool)

(assert (=> d!14410 (= (length!238 lt!72931) (size!1041 lt!72931))))

(declare-fun bs!3726 () Bool)

(assert (= bs!3726 d!14410))

(declare-fun m!74015 () Bool)

(assert (=> bs!3726 m!74015))

(assert (=> b!47043 d!14410))

(declare-fun b!47802 () Bool)

(declare-fun e!31670 () Bool)

(declare-fun lt!74095 () List!543)

(assert (=> b!47802 (= e!31670 (isEmpty!139 lt!74095))))

(declare-fun b!47800 () Bool)

(declare-fun e!31669 () tuple2!4552)

(assert (=> b!47800 (= e!31669 (tuple2!4553 Nil!540 (_2!2370 lt!72929)))))

(declare-fun d!14412 () Bool)

(assert (=> d!14412 e!31670))

(declare-fun c!3316 () Bool)

(assert (=> d!14412 (= c!3316 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14412 (= lt!74095 (_1!2369 e!31669))))

(declare-fun c!3317 () Bool)

(assert (=> d!14412 (= c!3317 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14412 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14412 (= (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_2!2370 lt!72929) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930)) lt!74095)))

(declare-fun b!47803 () Bool)

(assert (=> b!47803 (= e!31670 (> (length!238 lt!74095) 0))))

(declare-fun lt!74093 () tuple2!4554)

(declare-fun lt!74094 () (_ BitVec 64))

(declare-fun b!47801 () Bool)

(assert (=> b!47801 (= e!31669 (tuple2!4553 (Cons!539 (_1!2370 lt!74093) (bitStreamReadBitsIntoList!0 (_2!2355 lt!72283) (_2!2370 lt!74093) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72930) lt!74094))) (_2!2370 lt!74093)))))

(assert (=> b!47801 (= lt!74093 (readBit!0 (_2!2370 lt!72929)))))

(assert (=> b!47801 (= lt!74094 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!14412 c!3317) b!47800))

(assert (= (and d!14412 (not c!3317)) b!47801))

(assert (= (and d!14412 c!3316) b!47802))

(assert (= (and d!14412 (not c!3316)) b!47803))

(declare-fun m!74017 () Bool)

(assert (=> b!47802 m!74017))

(declare-fun m!74019 () Bool)

(assert (=> b!47803 m!74019))

(declare-fun m!74021 () Bool)

(assert (=> b!47801 m!74021))

(declare-fun m!74023 () Bool)

(assert (=> b!47801 m!74023))

(assert (=> b!47041 d!14412))

(declare-fun d!14414 () Bool)

(declare-fun e!31671 () Bool)

(assert (=> d!14414 e!31671))

(declare-fun res!40210 () Bool)

(assert (=> d!14414 (=> (not res!40210) (not e!31671))))

(assert (=> d!14414 (= res!40210 (= (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72272)))) (buf!1385 (_1!2356 lt!72272))))))

(declare-fun lt!74096 () Bool)

(assert (=> d!14414 (= lt!74096 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72272))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74099 () tuple2!4554)

(assert (=> d!14414 (= lt!74099 (tuple2!4555 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72272))))) #b00000000000000000000000000000000)) (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72272)))))))

(assert (=> d!14414 (validate_offset_bit!0 ((_ sign_extend 32) (size!1036 (buf!1385 (_1!2356 lt!72272)))) ((_ sign_extend 32) (currentByte!2890 (_1!2356 lt!72272))) ((_ sign_extend 32) (currentBit!2885 (_1!2356 lt!72272))))))

(assert (=> d!14414 (= (readBit!0 (_1!2356 lt!72272)) lt!74099)))

(declare-fun lt!74098 () (_ BitVec 64))

(declare-fun b!47804 () Bool)

(declare-fun lt!74100 () (_ BitVec 64))

(assert (=> b!47804 (= e!31671 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72272))))) (currentByte!2890 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72272)))) (currentBit!2885 (_2!2355 (increaseBitIndex!0 (_1!2356 lt!72272))))) (bvadd lt!74098 lt!74100)))))

(assert (=> b!47804 (or (not (= (bvand lt!74098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74100 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74098 lt!74100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47804 (= lt!74100 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47804 (= lt!74098 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)) (currentBit!2885 (_1!2356 lt!72272))))))

(declare-fun lt!74102 () Bool)

(assert (=> b!47804 (= lt!74102 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72272))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74097 () Bool)

(assert (=> b!47804 (= lt!74097 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72272))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74101 () Bool)

(assert (=> b!47804 (= lt!74101 (not (= (bvand ((_ sign_extend 24) (select (arr!1556 (buf!1385 (_1!2356 lt!72272))) (currentByte!2890 (_1!2356 lt!72272)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2885 (_1!2356 lt!72272))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14414 res!40210) b!47804))

(declare-fun m!74025 () Bool)

(assert (=> d!14414 m!74025))

(declare-fun m!74027 () Bool)

(assert (=> d!14414 m!74027))

(declare-fun m!74029 () Bool)

(assert (=> d!14414 m!74029))

(declare-fun m!74031 () Bool)

(assert (=> d!14414 m!74031))

(assert (=> b!47804 m!74025))

(assert (=> b!47804 m!74027))

(assert (=> b!47804 m!74029))

(declare-fun m!74033 () Bool)

(assert (=> b!47804 m!74033))

(declare-fun m!74035 () Bool)

(assert (=> b!47804 m!74035))

(assert (=> b!47041 d!14414))

(declare-fun b!47815 () Bool)

(declare-fun res!40220 () Bool)

(declare-fun e!31677 () Bool)

(assert (=> b!47815 (=> (not res!40220) (not e!31677))))

(declare-fun lt!74113 () tuple2!4524)

(assert (=> b!47815 (= res!40220 (isPrefixOf!0 thiss!1379 (_2!2355 lt!74113)))))

(declare-fun d!14416 () Bool)

(assert (=> d!14416 e!31677))

(declare-fun res!40219 () Bool)

(assert (=> d!14416 (=> (not res!40219) (not e!31677))))

(assert (=> d!14416 (= res!40219 (= (size!1036 (buf!1385 thiss!1379)) (size!1036 (buf!1385 (_2!2355 lt!74113)))))))

(declare-fun choose!16 (BitStream!1804 Bool) tuple2!4524)

(assert (=> d!14416 (= lt!74113 (choose!16 thiss!1379 lt!73342))))

(assert (=> d!14416 (validate_offset_bit!0 ((_ sign_extend 32) (size!1036 (buf!1385 thiss!1379))) ((_ sign_extend 32) (currentByte!2890 thiss!1379)) ((_ sign_extend 32) (currentBit!2885 thiss!1379)))))

(assert (=> d!14416 (= (appendBit!0 thiss!1379 lt!73342) lt!74113)))

(declare-fun b!47817 () Bool)

(declare-fun e!31676 () Bool)

(declare-fun lt!74114 () tuple2!4558)

(assert (=> b!47817 (= e!31676 (= (bitIndex!0 (size!1036 (buf!1385 (_1!2372 lt!74114))) (currentByte!2890 (_1!2372 lt!74114)) (currentBit!2885 (_1!2372 lt!74114))) (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!74113))) (currentByte!2890 (_2!2355 lt!74113)) (currentBit!2885 (_2!2355 lt!74113)))))))

(declare-fun b!47814 () Bool)

(declare-fun res!40221 () Bool)

(assert (=> b!47814 (=> (not res!40221) (not e!31677))))

(declare-fun lt!74112 () (_ BitVec 64))

(declare-fun lt!74111 () (_ BitVec 64))

(assert (=> b!47814 (= res!40221 (= (bitIndex!0 (size!1036 (buf!1385 (_2!2355 lt!74113))) (currentByte!2890 (_2!2355 lt!74113)) (currentBit!2885 (_2!2355 lt!74113))) (bvadd lt!74112 lt!74111)))))

(assert (=> b!47814 (or (not (= (bvand lt!74112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74111 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74112 lt!74111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47814 (= lt!74111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47814 (= lt!74112 (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379)))))

(declare-fun b!47816 () Bool)

(assert (=> b!47816 (= e!31677 e!31676)))

(declare-fun res!40222 () Bool)

(assert (=> b!47816 (=> (not res!40222) (not e!31676))))

(assert (=> b!47816 (= res!40222 (and (= (_2!2372 lt!74114) lt!73342) (= (_1!2372 lt!74114) (_2!2355 lt!74113))))))

(assert (=> b!47816 (= lt!74114 (readBitPure!0 (readerFrom!0 (_2!2355 lt!74113) (currentBit!2885 thiss!1379) (currentByte!2890 thiss!1379))))))

(assert (= (and d!14416 res!40219) b!47814))

(assert (= (and b!47814 res!40221) b!47815))

(assert (= (and b!47815 res!40220) b!47816))

(assert (= (and b!47816 res!40222) b!47817))

(declare-fun m!74037 () Bool)

(assert (=> b!47814 m!74037))

(assert (=> b!47814 m!71691))

(declare-fun m!74039 () Bool)

(assert (=> b!47815 m!74039))

(declare-fun m!74041 () Bool)

(assert (=> b!47816 m!74041))

(assert (=> b!47816 m!74041))

(declare-fun m!74043 () Bool)

(assert (=> b!47816 m!74043))

(declare-fun m!74045 () Bool)

(assert (=> d!14416 m!74045))

(declare-fun m!74047 () Bool)

(assert (=> d!14416 m!74047))

(declare-fun m!74049 () Bool)

(assert (=> b!47817 m!74049))

(assert (=> b!47817 m!74037))

(assert (=> d!13900 d!14416))

(declare-fun d!14418 () Bool)

(declare-fun res!40224 () Bool)

(declare-fun e!31679 () Bool)

(assert (=> d!14418 (=> (not res!40224) (not e!31679))))

(assert (=> d!14418 (= res!40224 (= (size!1036 (buf!1385 (_1!2356 lt!73393))) (size!1036 (buf!1385 thiss!1379))))))

(assert (=> d!14418 (= (isPrefixOf!0 (_1!2356 lt!73393) thiss!1379) e!31679)))

(declare-fun b!47818 () Bool)

(declare-fun res!40223 () Bool)

(assert (=> b!47818 (=> (not res!40223) (not e!31679))))

(assert (=> b!47818 (= res!40223 (bvsle (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73393))) (currentByte!2890 (_1!2356 lt!73393)) (currentBit!2885 (_1!2356 lt!73393))) (bitIndex!0 (size!1036 (buf!1385 thiss!1379)) (currentByte!2890 thiss!1379) (currentBit!2885 thiss!1379))))))

(declare-fun b!47819 () Bool)

(declare-fun e!31678 () Bool)

(assert (=> b!47819 (= e!31679 e!31678)))

(declare-fun res!40225 () Bool)

(assert (=> b!47819 (=> res!40225 e!31678)))

(assert (=> b!47819 (= res!40225 (= (size!1036 (buf!1385 (_1!2356 lt!73393))) #b00000000000000000000000000000000))))

(declare-fun b!47820 () Bool)

(assert (=> b!47820 (= e!31678 (arrayBitRangesEq!0 (buf!1385 (_1!2356 lt!73393)) (buf!1385 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1036 (buf!1385 (_1!2356 lt!73393))) (currentByte!2890 (_1!2356 lt!73393)) (currentBit!2885 (_1!2356 lt!73393)))))))

(assert (= (and d!14418 res!40224) b!47818))

(assert (= (and b!47818 res!40223) b!47819))

(assert (= (and b!47819 (not res!40225)) b!47820))

(assert (=> b!47818 m!73447))

(assert (=> b!47818 m!71691))

(assert (=> b!47820 m!73447))

(assert (=> b!47820 m!73447))

(declare-fun m!74051 () Bool)

(assert (=> b!47820 m!74051))

(assert (=> b!47252 d!14418))

(push 1)

(assert (not d!14388))

(assert (not b!47687))

(assert (not b!47761))

(assert (not b!47713))

(assert (not b!47688))

(assert (not d!14330))

(assert (not b!47654))

(assert (not b!47585))

(assert (not d!14316))

(assert (not b!47659))

(assert (not b!47561))

(assert (not b!47693))

(assert (not b!47626))

(assert (not d!14322))

(assert (not b!47641))

(assert (not b!47743))

(assert (not b!47602))

(assert (not b!47760))

(assert (not bm!586))

(assert (not b!47589))

(assert (not b!47758))

(assert (not d!14348))

(assert (not b!47595))

(assert (not b!47719))

(assert (not b!47755))

(assert (not b!47751))

(assert (not b!47597))

(assert (not b!47637))

(assert (not b!47711))

(assert (not d!14354))

(assert (not d!14362))

(assert (not b!47776))

(assert (not b!47543))

(assert (not b!47778))

(assert (not bm!585))

(assert (not b!47797))

(assert (not d!14244))

(assert (not b!47749))

(assert (not b!47710))

(assert (not d!14360))

(assert (not b!47633))

(assert (not b!47815))

(assert (not d!14220))

(assert (not b!47662))

(assert (not b!47611))

(assert (not b!47767))

(assert (not d!14382))

(assert (not d!14282))

(assert (not b!47694))

(assert (not b!47796))

(assert (not b!47697))

(assert (not b!47718))

(assert (not b!47656))

(assert (not d!14228))

(assert (not b!47628))

(assert (not d!14346))

(assert (not d!14172))

(assert (not b!47679))

(assert (not b!47676))

(assert (not d!14238))

(assert (not b!47613))

(assert (not b!47789))

(assert (not b!47690))

(assert (not b!47636))

(assert (not bm!584))

(assert (not d!14404))

(assert (not b!47581))

(assert (not b!47674))

(assert (not b!47730))

(assert (not d!14198))

(assert (not b!47558))

(assert (not d!14218))

(assert (not b!47794))

(assert (not b!47606))

(assert (not b!47742))

(assert (not d!14214))

(assert (not d!14264))

(assert (not b!47677))

(assert (not b!47820))

(assert (not b!47736))

(assert (not b!47652))

(assert (not b!47653))

(assert (not d!14340))

(assert (not b!47591))

(assert (not bm!582))

(assert (not d!14246))

(assert (not d!14176))

(assert (not b!47804))

(assert (not b!47594))

(assert (not b!47818))

(assert (not b!47744))

(assert (not b!47817))

(assert (not b!47801))

(assert (not b!47738))

(assert (not d!14292))

(assert (not d!14252))

(assert (not b!47605))

(assert (not b!47583))

(assert (not d!14206))

(assert (not b!47802))

(assert (not d!14274))

(assert (not b!47545))

(assert (not b!47814))

(assert (not b!47784))

(assert (not b!47684))

(assert (not b!47631))

(assert (not d!14380))

(assert (not d!14342))

(assert (not b!47762))

(assert (not b!47803))

(assert (not b!47600))

(assert (not b!47763))

(assert (not d!14270))

(assert (not b!47643))

(assert (not b!47630))

(assert (not b!47699))

(assert (not d!14184))

(assert (not b!47702))

(assert (not b!47642))

(assert (not b!47634))

(assert (not d!14306))

(assert (not b!47765))

(assert (not b!47646))

(assert (not b!47540))

(assert (not d!14294))

(assert (not b!47757))

(assert (not b!47701))

(assert (not b!47791))

(assert (not d!14268))

(assert (not b!47614))

(assert (not b!47592))

(assert (not b!47624))

(assert (not b!47792))

(assert (not bm!587))

(assert (not b!47618))

(assert (not d!14196))

(assert (not b!47604))

(assert (not b!47559))

(assert (not d!14186))

(assert (not d!14396))

(assert (not b!47798))

(assert (not b!47766))

(assert (not b!47645))

(assert (not d!14386))

(assert (not b!47580))

(assert (not b!47787))

(assert (not d!14356))

(assert (not d!14216))

(assert (not d!14188))

(assert (not bm!588))

(assert (not b!47617))

(assert (not b!47681))

(assert (not b!47627))

(assert (not b!47639))

(assert (not d!14392))

(assert (not d!14300))

(assert (not d!14324))

(assert (not b!47661))

(assert (not b!47612))

(assert (not d!14200))

(assert (not b!47779))

(assert (not d!14334))

(assert (not b!47578))

(assert (not b!47625))

(assert (not d!14234))

(assert (not b!47685))

(assert (not b!47753))

(assert (not b!47780))

(assert (not d!14256))

(assert (not b!47622))

(assert (not b!47768))

(assert (not d!14254))

(assert (not b!47651))

(assert (not b!47647))

(assert (not b!47739))

(assert (not d!14350))

(assert (not b!47716))

(assert (not b!47670))

(assert (not b!47704))

(assert (not b!47598))

(assert (not b!47638))

(assert (not b!47816))

(assert (not d!14208))

(assert (not d!14416))

(assert (not b!47696))

(assert (not b!47747))

(assert (not d!14182))

(assert (not b!47727))

(assert (not d!14370))

(assert (not b!47756))

(assert (not b!47786))

(assert (not d!14310))

(assert (not d!14236))

(assert (not b!47657))

(assert (not d!14414))

(assert (not b!47664))

(assert (not d!14302))

(assert (not b!47682))

(assert (not d!14240))

(assert (not b!47691))

(assert (not d!14170))

(assert (not bm!581))

(assert (not d!14374))

(assert (not d!14372))

(assert (not b!47667))

(assert (not d!14410))

(assert (not b!47608))

(assert (not b!47669))

(assert (not b!47615))

(assert (not b!47616))

(assert (not d!14408))

(assert (not b!47557))

(assert (not b!47610))

(assert (not b!47729))

(assert (not b!47658))

(assert (not bm!583))

(assert (not b!47752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

