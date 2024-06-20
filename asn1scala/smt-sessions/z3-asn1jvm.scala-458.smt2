; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12554 () Bool)

(assert start!12554)

(declare-fun b!64161 () Bool)

(declare-fun res!53279 () Bool)

(declare-fun e!42406 () Bool)

(assert (=> b!64161 (=> res!53279 e!42406)))

(declare-datatypes ((array!2817 0))(
  ( (array!2818 (arr!1857 (Array (_ BitVec 32) (_ BitVec 8))) (size!1293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2238 0))(
  ( (BitStream!2239 (buf!1674 array!2817) (currentByte!3328 (_ BitVec 32)) (currentBit!3323 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4351 0))(
  ( (Unit!4352) )
))
(declare-datatypes ((tuple2!5740 0))(
  ( (tuple2!5741 (_1!2981 Unit!4351) (_2!2981 BitStream!2238)) )
))
(declare-fun lt!101319 () tuple2!5740)

(declare-fun lt!101315 () tuple2!5740)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64161 (= res!53279 (not (invariant!0 (currentBit!3323 (_2!2981 lt!101319)) (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))

(declare-fun b!64162 () Bool)

(declare-fun res!53288 () Bool)

(declare-fun e!42413 () Bool)

(assert (=> b!64162 (=> res!53288 e!42413)))

(declare-datatypes ((tuple2!5742 0))(
  ( (tuple2!5743 (_1!2982 BitStream!2238) (_2!2982 BitStream!2238)) )
))
(declare-fun lt!101313 () tuple2!5742)

(declare-fun isPrefixOf!0 (BitStream!2238 BitStream!2238) Bool)

(assert (=> b!64162 (= res!53288 (not (isPrefixOf!0 (_1!2982 lt!101313) (_2!2981 lt!101315))))))

(declare-fun b!64163 () Bool)

(declare-fun e!42405 () Bool)

(declare-fun e!42407 () Bool)

(assert (=> b!64163 (= e!42405 e!42407)))

(declare-fun res!53287 () Bool)

(assert (=> b!64163 (=> res!53287 e!42407)))

(declare-fun thiss!1379 () BitStream!2238)

(assert (=> b!64163 (= res!53287 (not (isPrefixOf!0 thiss!1379 (_2!2981 lt!101319))))))

(declare-fun lt!101318 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64163 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101318)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!64163 (= lt!101318 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101324 () Unit!4351)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2238 BitStream!2238 (_ BitVec 64) (_ BitVec 64)) Unit!4351)

(assert (=> b!64163 (= lt!101324 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2981 lt!101319) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2817)

(declare-fun appendBitFromByte!0 (BitStream!2238 (_ BitVec 8) (_ BitVec 32)) tuple2!5740)

(assert (=> b!64163 (= lt!101319 (appendBitFromByte!0 thiss!1379 (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64164 () Bool)

(declare-fun res!53282 () Bool)

(assert (=> b!64164 (=> res!53282 e!42413)))

(declare-datatypes ((List!694 0))(
  ( (Nil!691) (Cons!690 (h!809 Bool) (t!1444 List!694)) )
))
(declare-fun lt!101312 () List!694)

(declare-fun length!322 (List!694) Int)

(assert (=> b!64164 (= res!53282 (<= (length!322 lt!101312) 0))))

(declare-fun b!64165 () Bool)

(declare-fun res!53281 () Bool)

(declare-fun e!42403 () Bool)

(assert (=> b!64165 (=> (not res!53281) (not e!42403))))

(assert (=> b!64165 (= res!53281 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!53283 () Bool)

(assert (=> start!12554 (=> (not res!53283) (not e!42403))))

(assert (=> start!12554 (= res!53283 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1293 srcBuffer!2))))))))

(assert (=> start!12554 e!42403))

(assert (=> start!12554 true))

(declare-fun array_inv!1178 (array!2817) Bool)

(assert (=> start!12554 (array_inv!1178 srcBuffer!2)))

(declare-fun e!42410 () Bool)

(declare-fun inv!12 (BitStream!2238) Bool)

(assert (=> start!12554 (and (inv!12 thiss!1379) e!42410)))

(declare-fun b!64166 () Bool)

(declare-fun lt!101322 () tuple2!5742)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64166 (= e!42413 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322)))) (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101313))) (currentByte!3328 (_1!2982 lt!101313)) (currentBit!3323 (_1!2982 lt!101313)))))))

(declare-fun b!64167 () Bool)

(assert (=> b!64167 (= e!42410 (array_inv!1178 (buf!1674 thiss!1379)))))

(declare-fun e!42411 () Bool)

(declare-fun lt!101317 () (_ BitVec 64))

(declare-fun b!64168 () Bool)

(assert (=> b!64168 (= e!42411 (= lt!101317 (bvsub (bvsub (bvadd (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64169 () Bool)

(declare-fun res!53275 () Bool)

(declare-fun e!42412 () Bool)

(assert (=> b!64169 (=> res!53275 e!42412)))

(assert (=> b!64169 (= res!53275 (not (= (size!1293 (buf!1674 thiss!1379)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))

(declare-fun b!64170 () Bool)

(assert (=> b!64170 (= e!42403 (not e!42405))))

(declare-fun res!53285 () Bool)

(assert (=> b!64170 (=> res!53285 e!42405)))

(assert (=> b!64170 (= res!53285 (bvsge i!635 to!314))))

(assert (=> b!64170 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101326 () Unit!4351)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2238) Unit!4351)

(assert (=> b!64170 (= lt!101326 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!101320 () (_ BitVec 64))

(assert (=> b!64170 (= lt!101320 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(declare-fun b!64171 () Bool)

(declare-fun res!53278 () Bool)

(assert (=> b!64171 (=> res!53278 e!42413)))

(assert (=> b!64171 (= res!53278 (not (isPrefixOf!0 (_1!2982 lt!101322) (_2!2981 lt!101315))))))

(declare-fun b!64172 () Bool)

(declare-fun e!42408 () Bool)

(assert (=> b!64172 (= e!42407 e!42408)))

(declare-fun res!53276 () Bool)

(assert (=> b!64172 (=> res!53276 e!42408)))

(assert (=> b!64172 (= res!53276 (not (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101315))))))

(assert (=> b!64172 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101315))))

(declare-fun lt!101314 () Unit!4351)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2238 BitStream!2238 BitStream!2238) Unit!4351)

(assert (=> b!64172 (= lt!101314 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2981 lt!101319) (_2!2981 lt!101315)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2238 array!2817 (_ BitVec 64) (_ BitVec 64)) tuple2!5740)

(assert (=> b!64172 (= lt!101315 (appendBitsMSBFirstLoop!0 (_2!2981 lt!101319) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42402 () Bool)

(assert (=> b!64172 e!42402))

(declare-fun res!53290 () Bool)

(assert (=> b!64172 (=> (not res!53290) (not e!42402))))

(assert (=> b!64172 (= res!53290 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101311 () Unit!4351)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2238 array!2817 (_ BitVec 64)) Unit!4351)

(assert (=> b!64172 (= lt!101311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1674 (_2!2981 lt!101319)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101321 () tuple2!5742)

(declare-fun reader!0 (BitStream!2238 BitStream!2238) tuple2!5742)

(assert (=> b!64172 (= lt!101321 (reader!0 thiss!1379 (_2!2981 lt!101319)))))

(declare-fun b!64173 () Bool)

(assert (=> b!64173 (= e!42408 e!42412)))

(declare-fun res!53284 () Bool)

(assert (=> b!64173 (=> res!53284 e!42412)))

(assert (=> b!64173 (= res!53284 (not (= lt!101317 (bvsub (bvadd lt!101320 to!314) i!635))))))

(assert (=> b!64173 (= lt!101317 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315))))))

(declare-fun b!64174 () Bool)

(declare-fun res!53292 () Bool)

(assert (=> b!64174 (=> res!53292 e!42412)))

(assert (=> b!64174 (= res!53292 (not (invariant!0 (currentBit!3323 (_2!2981 lt!101315)) (currentByte!3328 (_2!2981 lt!101315)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))

(declare-fun b!64175 () Bool)

(declare-fun res!53277 () Bool)

(assert (=> b!64175 (=> res!53277 e!42413)))

(assert (=> b!64175 (= res!53277 (not (isPrefixOf!0 (_1!2982 lt!101322) (_1!2982 lt!101313))))))

(declare-fun b!64176 () Bool)

(assert (=> b!64176 (= e!42412 e!42406)))

(declare-fun res!53291 () Bool)

(assert (=> b!64176 (=> res!53291 e!42406)))

(assert (=> b!64176 (= res!53291 (not (= (size!1293 (buf!1674 (_2!2981 lt!101319))) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))

(assert (=> b!64176 e!42411))

(declare-fun res!53289 () Bool)

(assert (=> b!64176 (=> (not res!53289) (not e!42411))))

(assert (=> b!64176 (= res!53289 (= (size!1293 (buf!1674 (_2!2981 lt!101315))) (size!1293 (buf!1674 thiss!1379))))))

(declare-fun b!64177 () Bool)

(declare-fun res!53274 () Bool)

(assert (=> b!64177 (=> res!53274 e!42406)))

(assert (=> b!64177 (= res!53274 (not (invariant!0 (currentBit!3323 (_2!2981 lt!101319)) (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101319))))))))

(declare-fun b!64178 () Bool)

(declare-fun head!513 (List!694) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2238 array!2817 (_ BitVec 64) (_ BitVec 64)) List!694)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2238 BitStream!2238 (_ BitVec 64)) List!694)

(assert (=> b!64178 (= e!42402 (= (head!513 (byteArrayBitContentToList!0 (_2!2981 lt!101319) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!513 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101319) (_1!2982 lt!101321) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!64179 () Bool)

(declare-fun res!53280 () Bool)

(assert (=> b!64179 (=> res!53280 e!42413)))

(assert (=> b!64179 (= res!53280 (or (not (= (buf!1674 (_1!2982 lt!101322)) (buf!1674 (_1!2982 lt!101313)))) (not (= (buf!1674 (_1!2982 lt!101322)) (buf!1674 (_2!2981 lt!101315)))) (bvsge lt!101317 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!64180 () Bool)

(assert (=> b!64180 (= e!42406 e!42413)))

(declare-fun res!53286 () Bool)

(assert (=> b!64180 (=> res!53286 e!42413)))

(assert (=> b!64180 (= res!53286 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101325 () List!694)

(assert (=> b!64180 (= lt!101325 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_1!2982 lt!101313) lt!101318))))

(assert (=> b!64180 (= lt!101312 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_1!2982 lt!101322) (bvsub to!314 i!635)))))

(assert (=> b!64180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101318)))

(declare-fun lt!101316 () Unit!4351)

(assert (=> b!64180 (= lt!101316 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101315)) lt!101318))))

(assert (=> b!64180 (= lt!101313 (reader!0 (_2!2981 lt!101319) (_2!2981 lt!101315)))))

(assert (=> b!64180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101323 () Unit!4351)

(assert (=> b!64180 (= lt!101323 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1674 (_2!2981 lt!101315)) (bvsub to!314 i!635)))))

(assert (=> b!64180 (= lt!101322 (reader!0 thiss!1379 (_2!2981 lt!101315)))))

(assert (= (and start!12554 res!53283) b!64165))

(assert (= (and b!64165 res!53281) b!64170))

(assert (= (and b!64170 (not res!53285)) b!64163))

(assert (= (and b!64163 (not res!53287)) b!64172))

(assert (= (and b!64172 res!53290) b!64178))

(assert (= (and b!64172 (not res!53276)) b!64173))

(assert (= (and b!64173 (not res!53284)) b!64174))

(assert (= (and b!64174 (not res!53292)) b!64169))

(assert (= (and b!64169 (not res!53275)) b!64176))

(assert (= (and b!64176 res!53289) b!64168))

(assert (= (and b!64176 (not res!53291)) b!64177))

(assert (= (and b!64177 (not res!53274)) b!64161))

(assert (= (and b!64161 (not res!53279)) b!64180))

(assert (= (and b!64180 (not res!53286)) b!64164))

(assert (= (and b!64164 (not res!53282)) b!64171))

(assert (= (and b!64171 (not res!53278)) b!64162))

(assert (= (and b!64162 (not res!53288)) b!64175))

(assert (= (and b!64175 (not res!53277)) b!64179))

(assert (= (and b!64179 (not res!53280)) b!64166))

(assert (= start!12554 b!64167))

(declare-fun m!101737 () Bool)

(assert (=> b!64170 m!101737))

(declare-fun m!101739 () Bool)

(assert (=> b!64170 m!101739))

(declare-fun m!101741 () Bool)

(assert (=> b!64170 m!101741))

(declare-fun m!101743 () Bool)

(assert (=> b!64161 m!101743))

(declare-fun m!101745 () Bool)

(assert (=> b!64168 m!101745))

(declare-fun m!101747 () Bool)

(assert (=> b!64178 m!101747))

(assert (=> b!64178 m!101747))

(declare-fun m!101749 () Bool)

(assert (=> b!64178 m!101749))

(declare-fun m!101751 () Bool)

(assert (=> b!64178 m!101751))

(assert (=> b!64178 m!101751))

(declare-fun m!101753 () Bool)

(assert (=> b!64178 m!101753))

(declare-fun m!101755 () Bool)

(assert (=> b!64166 m!101755))

(declare-fun m!101757 () Bool)

(assert (=> b!64166 m!101757))

(declare-fun m!101759 () Bool)

(assert (=> b!64167 m!101759))

(declare-fun m!101761 () Bool)

(assert (=> b!64164 m!101761))

(declare-fun m!101763 () Bool)

(assert (=> b!64172 m!101763))

(declare-fun m!101765 () Bool)

(assert (=> b!64172 m!101765))

(declare-fun m!101767 () Bool)

(assert (=> b!64172 m!101767))

(declare-fun m!101769 () Bool)

(assert (=> b!64172 m!101769))

(declare-fun m!101771 () Bool)

(assert (=> b!64172 m!101771))

(declare-fun m!101773 () Bool)

(assert (=> b!64172 m!101773))

(declare-fun m!101775 () Bool)

(assert (=> b!64172 m!101775))

(declare-fun m!101777 () Bool)

(assert (=> b!64165 m!101777))

(declare-fun m!101779 () Bool)

(assert (=> b!64175 m!101779))

(declare-fun m!101781 () Bool)

(assert (=> start!12554 m!101781))

(declare-fun m!101783 () Bool)

(assert (=> start!12554 m!101783))

(declare-fun m!101785 () Bool)

(assert (=> b!64163 m!101785))

(declare-fun m!101787 () Bool)

(assert (=> b!64163 m!101787))

(declare-fun m!101789 () Bool)

(assert (=> b!64163 m!101789))

(declare-fun m!101791 () Bool)

(assert (=> b!64163 m!101791))

(assert (=> b!64163 m!101787))

(declare-fun m!101793 () Bool)

(assert (=> b!64163 m!101793))

(declare-fun m!101795 () Bool)

(assert (=> b!64173 m!101795))

(declare-fun m!101797 () Bool)

(assert (=> b!64180 m!101797))

(declare-fun m!101799 () Bool)

(assert (=> b!64180 m!101799))

(declare-fun m!101801 () Bool)

(assert (=> b!64180 m!101801))

(declare-fun m!101803 () Bool)

(assert (=> b!64180 m!101803))

(declare-fun m!101805 () Bool)

(assert (=> b!64180 m!101805))

(declare-fun m!101807 () Bool)

(assert (=> b!64180 m!101807))

(declare-fun m!101809 () Bool)

(assert (=> b!64180 m!101809))

(declare-fun m!101811 () Bool)

(assert (=> b!64180 m!101811))

(declare-fun m!101813 () Bool)

(assert (=> b!64171 m!101813))

(declare-fun m!101815 () Bool)

(assert (=> b!64174 m!101815))

(declare-fun m!101817 () Bool)

(assert (=> b!64177 m!101817))

(declare-fun m!101819 () Bool)

(assert (=> b!64162 m!101819))

(check-sat (not b!64175) (not b!64162) (not b!64168) (not b!64161) (not b!64174) (not b!64178) (not b!64171) (not b!64172) (not b!64167) (not b!64164) (not b!64165) (not b!64177) (not b!64170) (not start!12554) (not b!64163) (not b!64180) (not b!64166) (not b!64173))
(check-sat)
(get-model)

(declare-fun d!19990 () Bool)

(assert (=> d!19990 (= (invariant!0 (currentBit!3323 (_2!2981 lt!101315)) (currentByte!3328 (_2!2981 lt!101315)) (size!1293 (buf!1674 (_2!2981 lt!101315)))) (and (bvsge (currentBit!3323 (_2!2981 lt!101315)) #b00000000000000000000000000000000) (bvslt (currentBit!3323 (_2!2981 lt!101315)) #b00000000000000000000000000001000) (bvsge (currentByte!3328 (_2!2981 lt!101315)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3328 (_2!2981 lt!101315)) (size!1293 (buf!1674 (_2!2981 lt!101315)))) (and (= (currentBit!3323 (_2!2981 lt!101315)) #b00000000000000000000000000000000) (= (currentByte!3328 (_2!2981 lt!101315)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))))

(assert (=> b!64174 d!19990))

(declare-fun d!19992 () Bool)

(declare-fun res!53357 () Bool)

(declare-fun e!42454 () Bool)

(assert (=> d!19992 (=> (not res!53357) (not e!42454))))

(assert (=> d!19992 (= res!53357 (= (size!1293 (buf!1674 thiss!1379)) (size!1293 (buf!1674 (_2!2981 lt!101319)))))))

(assert (=> d!19992 (= (isPrefixOf!0 thiss!1379 (_2!2981 lt!101319)) e!42454)))

(declare-fun b!64247 () Bool)

(declare-fun res!53356 () Bool)

(assert (=> b!64247 (=> (not res!53356) (not e!42454))))

(assert (=> b!64247 (= res!53356 (bvsle (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319)))))))

(declare-fun b!64248 () Bool)

(declare-fun e!42455 () Bool)

(assert (=> b!64248 (= e!42454 e!42455)))

(declare-fun res!53358 () Bool)

(assert (=> b!64248 (=> res!53358 e!42455)))

(assert (=> b!64248 (= res!53358 (= (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64249 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2817 array!2817 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64249 (= e!42455 (arrayBitRangesEq!0 (buf!1674 thiss!1379) (buf!1674 (_2!2981 lt!101319)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(assert (= (and d!19992 res!53357) b!64247))

(assert (= (and b!64247 res!53356) b!64248))

(assert (= (and b!64248 (not res!53358)) b!64249))

(assert (=> b!64247 m!101741))

(assert (=> b!64247 m!101745))

(assert (=> b!64249 m!101741))

(assert (=> b!64249 m!101741))

(declare-fun m!101905 () Bool)

(assert (=> b!64249 m!101905))

(assert (=> b!64163 d!19992))

(declare-fun d!19994 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101318) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319)))) lt!101318))))

(declare-fun bs!4917 () Bool)

(assert (= bs!4917 d!19994))

(declare-fun m!101907 () Bool)

(assert (=> bs!4917 m!101907))

(assert (=> b!64163 d!19994))

(declare-fun d!19996 () Bool)

(declare-fun e!42458 () Bool)

(assert (=> d!19996 e!42458))

(declare-fun res!53361 () Bool)

(assert (=> d!19996 (=> (not res!53361) (not e!42458))))

(assert (=> d!19996 (= res!53361 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!101377 () Unit!4351)

(declare-fun choose!27 (BitStream!2238 BitStream!2238 (_ BitVec 64) (_ BitVec 64)) Unit!4351)

(assert (=> d!19996 (= lt!101377 (choose!27 thiss!1379 (_2!2981 lt!101319) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19996 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2981 lt!101319) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101377)))

(declare-fun b!64252 () Bool)

(assert (=> b!64252 (= e!42458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19996 res!53361) b!64252))

(declare-fun m!101909 () Bool)

(assert (=> d!19996 m!101909))

(declare-fun m!101911 () Bool)

(assert (=> b!64252 m!101911))

(assert (=> b!64163 d!19996))

(declare-fun b!64270 () Bool)

(declare-fun res!53385 () Bool)

(declare-fun e!42470 () Bool)

(assert (=> b!64270 (=> (not res!53385) (not e!42470))))

(declare-fun lt!101413 () tuple2!5740)

(assert (=> b!64270 (= res!53385 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101413))) (currentByte!3328 (_2!2981 lt!101413)) (currentBit!3323 (_2!2981 lt!101413))) (bvadd (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64271 () Bool)

(declare-fun res!53382 () Bool)

(assert (=> b!64271 (=> (not res!53382) (not e!42470))))

(assert (=> b!64271 (= res!53382 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101413)))))

(declare-fun b!64272 () Bool)

(declare-fun e!42467 () Bool)

(declare-datatypes ((tuple2!5748 0))(
  ( (tuple2!5749 (_1!2985 BitStream!2238) (_2!2985 Bool)) )
))
(declare-fun lt!101411 () tuple2!5748)

(declare-fun lt!101406 () tuple2!5740)

(assert (=> b!64272 (= e!42467 (= (bitIndex!0 (size!1293 (buf!1674 (_1!2985 lt!101411))) (currentByte!3328 (_1!2985 lt!101411)) (currentBit!3323 (_1!2985 lt!101411))) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101406))) (currentByte!3328 (_2!2981 lt!101406)) (currentBit!3323 (_2!2981 lt!101406)))))))

(declare-fun b!64273 () Bool)

(declare-fun res!53380 () Bool)

(declare-fun e!42469 () Bool)

(assert (=> b!64273 (=> (not res!53380) (not e!42469))))

(assert (=> b!64273 (= res!53380 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101406)))))

(declare-fun b!64274 () Bool)

(assert (=> b!64274 (= e!42469 e!42467)))

(declare-fun res!53383 () Bool)

(assert (=> b!64274 (=> (not res!53383) (not e!42467))))

(declare-fun lt!101408 () (_ BitVec 8))

(assert (=> b!64274 (= res!53383 (and (= (_2!2985 lt!101411) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!101408)) #b00000000000000000000000000000000))) (= (_1!2985 lt!101411) (_2!2981 lt!101406))))))

(declare-datatypes ((tuple2!5750 0))(
  ( (tuple2!5751 (_1!2986 array!2817) (_2!2986 BitStream!2238)) )
))
(declare-fun lt!101410 () tuple2!5750)

(declare-fun lt!101404 () BitStream!2238)

(declare-fun readBits!0 (BitStream!2238 (_ BitVec 64)) tuple2!5750)

(assert (=> b!64274 (= lt!101410 (readBits!0 lt!101404 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2238) tuple2!5748)

(assert (=> b!64274 (= lt!101411 (readBitPure!0 lt!101404))))

(declare-fun readerFrom!0 (BitStream!2238 (_ BitVec 32) (_ BitVec 32)) BitStream!2238)

(assert (=> b!64274 (= lt!101404 (readerFrom!0 (_2!2981 lt!101406) (currentBit!3323 thiss!1379) (currentByte!3328 thiss!1379)))))

(declare-fun b!64275 () Bool)

(declare-fun e!42468 () Bool)

(declare-fun lt!101407 () tuple2!5748)

(assert (=> b!64275 (= e!42468 (= (bitIndex!0 (size!1293 (buf!1674 (_1!2985 lt!101407))) (currentByte!3328 (_1!2985 lt!101407)) (currentBit!3323 (_1!2985 lt!101407))) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101413))) (currentByte!3328 (_2!2981 lt!101413)) (currentBit!3323 (_2!2981 lt!101413)))))))

(declare-fun b!64276 () Bool)

(declare-fun res!53384 () Bool)

(assert (=> b!64276 (=> (not res!53384) (not e!42469))))

(declare-fun lt!101402 () (_ BitVec 64))

(declare-fun lt!101405 () (_ BitVec 64))

(assert (=> b!64276 (= res!53384 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101406))) (currentByte!3328 (_2!2981 lt!101406)) (currentBit!3323 (_2!2981 lt!101406))) (bvadd lt!101402 lt!101405)))))

(assert (=> b!64276 (or (not (= (bvand lt!101402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101405 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!101402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!101402 lt!101405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64276 (= lt!101405 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!64276 (= lt!101402 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(declare-fun d!19998 () Bool)

(assert (=> d!19998 e!42469))

(declare-fun res!53381 () Bool)

(assert (=> d!19998 (=> (not res!53381) (not e!42469))))

(assert (=> d!19998 (= res!53381 (= (size!1293 (buf!1674 (_2!2981 lt!101406))) (size!1293 (buf!1674 thiss!1379))))))

(declare-fun lt!101412 () array!2817)

(assert (=> d!19998 (= lt!101408 (select (arr!1857 lt!101412) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19998 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1293 lt!101412)))))

(assert (=> d!19998 (= lt!101412 (array!2818 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!101403 () tuple2!5740)

(assert (=> d!19998 (= lt!101406 (tuple2!5741 (_1!2981 lt!101403) (_2!2981 lt!101403)))))

(assert (=> d!19998 (= lt!101403 lt!101413)))

(assert (=> d!19998 e!42470))

(declare-fun res!53379 () Bool)

(assert (=> d!19998 (=> (not res!53379) (not e!42470))))

(assert (=> d!19998 (= res!53379 (= (size!1293 (buf!1674 thiss!1379)) (size!1293 (buf!1674 (_2!2981 lt!101413)))))))

(declare-fun lt!101409 () Bool)

(declare-fun appendBit!0 (BitStream!2238 Bool) tuple2!5740)

(assert (=> d!19998 (= lt!101413 (appendBit!0 thiss!1379 lt!101409))))

(assert (=> d!19998 (= lt!101409 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19998 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19998 (= (appendBitFromByte!0 thiss!1379 (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!101406)))

(declare-fun b!64277 () Bool)

(assert (=> b!64277 (= e!42470 e!42468)))

(declare-fun res!53378 () Bool)

(assert (=> b!64277 (=> (not res!53378) (not e!42468))))

(assert (=> b!64277 (= res!53378 (and (= (_2!2985 lt!101407) lt!101409) (= (_1!2985 lt!101407) (_2!2981 lt!101413))))))

(assert (=> b!64277 (= lt!101407 (readBitPure!0 (readerFrom!0 (_2!2981 lt!101413) (currentBit!3323 thiss!1379) (currentByte!3328 thiss!1379))))))

(assert (= (and d!19998 res!53379) b!64270))

(assert (= (and b!64270 res!53385) b!64271))

(assert (= (and b!64271 res!53382) b!64277))

(assert (= (and b!64277 res!53378) b!64275))

(assert (= (and d!19998 res!53381) b!64276))

(assert (= (and b!64276 res!53384) b!64273))

(assert (= (and b!64273 res!53380) b!64274))

(assert (= (and b!64274 res!53383) b!64272))

(declare-fun m!101913 () Bool)

(assert (=> b!64273 m!101913))

(declare-fun m!101915 () Bool)

(assert (=> b!64271 m!101915))

(declare-fun m!101917 () Bool)

(assert (=> b!64272 m!101917))

(declare-fun m!101919 () Bool)

(assert (=> b!64272 m!101919))

(declare-fun m!101921 () Bool)

(assert (=> b!64277 m!101921))

(assert (=> b!64277 m!101921))

(declare-fun m!101923 () Bool)

(assert (=> b!64277 m!101923))

(declare-fun m!101925 () Bool)

(assert (=> b!64274 m!101925))

(declare-fun m!101927 () Bool)

(assert (=> b!64274 m!101927))

(declare-fun m!101929 () Bool)

(assert (=> b!64274 m!101929))

(declare-fun m!101931 () Bool)

(assert (=> d!19998 m!101931))

(declare-fun m!101933 () Bool)

(assert (=> d!19998 m!101933))

(declare-fun m!101935 () Bool)

(assert (=> d!19998 m!101935))

(declare-fun m!101937 () Bool)

(assert (=> b!64270 m!101937))

(assert (=> b!64270 m!101741))

(assert (=> b!64276 m!101919))

(assert (=> b!64276 m!101741))

(declare-fun m!101939 () Bool)

(assert (=> b!64275 m!101939))

(assert (=> b!64275 m!101937))

(assert (=> b!64163 d!19998))

(declare-fun d!20000 () Bool)

(declare-fun e!42473 () Bool)

(assert (=> d!20000 e!42473))

(declare-fun res!53391 () Bool)

(assert (=> d!20000 (=> (not res!53391) (not e!42473))))

(declare-fun lt!101429 () (_ BitVec 64))

(declare-fun lt!101427 () (_ BitVec 64))

(declare-fun lt!101426 () (_ BitVec 64))

(assert (=> d!20000 (= res!53391 (= lt!101427 (bvsub lt!101426 lt!101429)))))

(assert (=> d!20000 (or (= (bvand lt!101426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101426 lt!101429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20000 (= lt!101429 (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101315))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101315)))))))

(declare-fun lt!101430 () (_ BitVec 64))

(declare-fun lt!101431 () (_ BitVec 64))

(assert (=> d!20000 (= lt!101426 (bvmul lt!101430 lt!101431))))

(assert (=> d!20000 (or (= lt!101430 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101431 (bvsdiv (bvmul lt!101430 lt!101431) lt!101430)))))

(assert (=> d!20000 (= lt!101431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20000 (= lt!101430 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (=> d!20000 (= lt!101427 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101315))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101315)))))))

(assert (=> d!20000 (invariant!0 (currentBit!3323 (_2!2981 lt!101315)) (currentByte!3328 (_2!2981 lt!101315)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))

(assert (=> d!20000 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315))) lt!101427)))

(declare-fun b!64282 () Bool)

(declare-fun res!53390 () Bool)

(assert (=> b!64282 (=> (not res!53390) (not e!42473))))

(assert (=> b!64282 (= res!53390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101427))))

(declare-fun b!64283 () Bool)

(declare-fun lt!101428 () (_ BitVec 64))

(assert (=> b!64283 (= e!42473 (bvsle lt!101427 (bvmul lt!101428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64283 (or (= lt!101428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101428)))))

(assert (=> b!64283 (= lt!101428 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (= (and d!20000 res!53391) b!64282))

(assert (= (and b!64282 res!53390) b!64283))

(declare-fun m!101941 () Bool)

(assert (=> d!20000 m!101941))

(assert (=> d!20000 m!101815))

(assert (=> b!64173 d!20000))

(declare-fun d!20002 () Bool)

(declare-fun res!53393 () Bool)

(declare-fun e!42474 () Bool)

(assert (=> d!20002 (=> (not res!53393) (not e!42474))))

(assert (=> d!20002 (= res!53393 (= (size!1293 (buf!1674 (_1!2982 lt!101313))) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (=> d!20002 (= (isPrefixOf!0 (_1!2982 lt!101313) (_2!2981 lt!101315)) e!42474)))

(declare-fun b!64284 () Bool)

(declare-fun res!53392 () Bool)

(assert (=> b!64284 (=> (not res!53392) (not e!42474))))

(assert (=> b!64284 (= res!53392 (bvsle (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101313))) (currentByte!3328 (_1!2982 lt!101313)) (currentBit!3323 (_1!2982 lt!101313))) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315)))))))

(declare-fun b!64285 () Bool)

(declare-fun e!42475 () Bool)

(assert (=> b!64285 (= e!42474 e!42475)))

(declare-fun res!53394 () Bool)

(assert (=> b!64285 (=> res!53394 e!42475)))

(assert (=> b!64285 (= res!53394 (= (size!1293 (buf!1674 (_1!2982 lt!101313))) #b00000000000000000000000000000000))))

(declare-fun b!64286 () Bool)

(assert (=> b!64286 (= e!42475 (arrayBitRangesEq!0 (buf!1674 (_1!2982 lt!101313)) (buf!1674 (_2!2981 lt!101315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101313))) (currentByte!3328 (_1!2982 lt!101313)) (currentBit!3323 (_1!2982 lt!101313)))))))

(assert (= (and d!20002 res!53393) b!64284))

(assert (= (and b!64284 res!53392) b!64285))

(assert (= (and b!64285 (not res!53394)) b!64286))

(assert (=> b!64284 m!101757))

(assert (=> b!64284 m!101795))

(assert (=> b!64286 m!101757))

(assert (=> b!64286 m!101757))

(declare-fun m!101943 () Bool)

(assert (=> b!64286 m!101943))

(assert (=> b!64162 d!20002))

(declare-fun d!20004 () Bool)

(declare-fun res!53396 () Bool)

(declare-fun e!42476 () Bool)

(assert (=> d!20004 (=> (not res!53396) (not e!42476))))

(assert (=> d!20004 (= res!53396 (= (size!1293 (buf!1674 thiss!1379)) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (=> d!20004 (= (isPrefixOf!0 thiss!1379 (_2!2981 lt!101315)) e!42476)))

(declare-fun b!64287 () Bool)

(declare-fun res!53395 () Bool)

(assert (=> b!64287 (=> (not res!53395) (not e!42476))))

(assert (=> b!64287 (= res!53395 (bvsle (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315)))))))

(declare-fun b!64288 () Bool)

(declare-fun e!42477 () Bool)

(assert (=> b!64288 (= e!42476 e!42477)))

(declare-fun res!53397 () Bool)

(assert (=> b!64288 (=> res!53397 e!42477)))

(assert (=> b!64288 (= res!53397 (= (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64289 () Bool)

(assert (=> b!64289 (= e!42477 (arrayBitRangesEq!0 (buf!1674 thiss!1379) (buf!1674 (_2!2981 lt!101315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(assert (= (and d!20004 res!53396) b!64287))

(assert (= (and b!64287 res!53395) b!64288))

(assert (= (and b!64288 (not res!53397)) b!64289))

(assert (=> b!64287 m!101741))

(assert (=> b!64287 m!101795))

(assert (=> b!64289 m!101741))

(assert (=> b!64289 m!101741))

(declare-fun m!101945 () Bool)

(assert (=> b!64289 m!101945))

(assert (=> b!64172 d!20004))

(declare-fun e!42541 () Bool)

(declare-fun lt!101768 () tuple2!5740)

(declare-fun b!64411 () Bool)

(declare-fun lt!101763 () tuple2!5742)

(assert (=> b!64411 (= e!42541 (= (bitStreamReadBitsIntoList!0 (_2!2981 lt!101768) (_1!2982 lt!101763) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2981 lt!101768) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!64411 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64411 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!101747 () Unit!4351)

(declare-fun lt!101740 () Unit!4351)

(assert (=> b!64411 (= lt!101747 lt!101740)))

(declare-fun lt!101775 () (_ BitVec 64))

(assert (=> b!64411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101768)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101775)))

(assert (=> b!64411 (= lt!101740 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101768)) lt!101775))))

(declare-fun e!42540 () Bool)

(assert (=> b!64411 e!42540))

(declare-fun res!53484 () Bool)

(assert (=> b!64411 (=> (not res!53484) (not e!42540))))

(assert (=> b!64411 (= res!53484 (and (= (size!1293 (buf!1674 (_2!2981 lt!101319))) (size!1293 (buf!1674 (_2!2981 lt!101768)))) (bvsge lt!101775 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64411 (= lt!101775 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!64411 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64411 (= lt!101763 (reader!0 (_2!2981 lt!101319) (_2!2981 lt!101768)))))

(declare-fun b!64413 () Bool)

(declare-fun e!42539 () tuple2!5740)

(declare-fun Unit!4355 () Unit!4351)

(assert (=> b!64413 (= e!42539 (tuple2!5741 Unit!4355 (_2!2981 lt!101319)))))

(assert (=> b!64413 (= (size!1293 (buf!1674 (_2!2981 lt!101319))) (size!1293 (buf!1674 (_2!2981 lt!101319))))))

(declare-fun lt!101779 () Unit!4351)

(declare-fun Unit!4356 () Unit!4351)

(assert (=> b!64413 (= lt!101779 Unit!4356)))

(declare-fun call!820 () tuple2!5742)

(declare-fun checkByteArrayBitContent!0 (BitStream!2238 array!2817 array!2817 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64413 (checkByteArrayBitContent!0 (_2!2981 lt!101319) srcBuffer!2 (_1!2986 (readBits!0 (_1!2982 call!820) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!64414 () Bool)

(declare-fun res!53485 () Bool)

(assert (=> b!64414 (=> (not res!53485) (not e!42541))))

(assert (=> b!64414 (= res!53485 (= (size!1293 (buf!1674 (_2!2981 lt!101768))) (size!1293 (buf!1674 (_2!2981 lt!101319)))))))

(declare-fun b!64415 () Bool)

(declare-fun res!53487 () Bool)

(assert (=> b!64415 (=> (not res!53487) (not e!42541))))

(assert (=> b!64415 (= res!53487 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101768)))))

(declare-fun b!64416 () Bool)

(assert (=> b!64416 (= e!42540 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101775))))

(declare-fun bm!817 () Bool)

(declare-fun c!4624 () Bool)

(declare-fun lt!101778 () tuple2!5740)

(assert (=> bm!817 (= call!820 (reader!0 (_2!2981 lt!101319) (ite c!4624 (_2!2981 lt!101778) (_2!2981 lt!101319))))))

(declare-fun b!64412 () Bool)

(declare-fun res!53488 () Bool)

(assert (=> b!64412 (=> (not res!53488) (not e!42541))))

(assert (=> b!64412 (= res!53488 (invariant!0 (currentBit!3323 (_2!2981 lt!101768)) (currentByte!3328 (_2!2981 lt!101768)) (size!1293 (buf!1674 (_2!2981 lt!101768)))))))

(declare-fun d!20006 () Bool)

(assert (=> d!20006 e!42541))

(declare-fun res!53483 () Bool)

(assert (=> d!20006 (=> (not res!53483) (not e!42541))))

(declare-fun lt!101736 () (_ BitVec 64))

(assert (=> d!20006 (= res!53483 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101768))) (currentByte!3328 (_2!2981 lt!101768)) (currentBit!3323 (_2!2981 lt!101768))) (bvsub lt!101736 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20006 (or (= (bvand lt!101736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101736 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!101772 () (_ BitVec 64))

(assert (=> d!20006 (= lt!101736 (bvadd lt!101772 to!314))))

(assert (=> d!20006 (or (not (= (bvand lt!101772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!101772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!101772 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20006 (= lt!101772 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(assert (=> d!20006 (= lt!101768 e!42539)))

(assert (=> d!20006 (= c!4624 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!101758 () Unit!4351)

(declare-fun lt!101746 () Unit!4351)

(assert (=> d!20006 (= lt!101758 lt!101746)))

(assert (=> d!20006 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101319))))

(assert (=> d!20006 (= lt!101746 (lemmaIsPrefixRefl!0 (_2!2981 lt!101319)))))

(declare-fun lt!101737 () (_ BitVec 64))

(assert (=> d!20006 (= lt!101737 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(assert (=> d!20006 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20006 (= (appendBitsMSBFirstLoop!0 (_2!2981 lt!101319) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!101768)))

(declare-fun b!64417 () Bool)

(declare-fun res!53486 () Bool)

(assert (=> b!64417 (=> (not res!53486) (not e!42541))))

(assert (=> b!64417 (= res!53486 (= (size!1293 (buf!1674 (_2!2981 lt!101319))) (size!1293 (buf!1674 (_2!2981 lt!101768)))))))

(declare-fun b!64418 () Bool)

(declare-fun lt!101761 () tuple2!5740)

(declare-fun Unit!4357 () Unit!4351)

(assert (=> b!64418 (= e!42539 (tuple2!5741 Unit!4357 (_2!2981 lt!101761)))))

(assert (=> b!64418 (= lt!101778 (appendBitFromByte!0 (_2!2981 lt!101319) (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!101776 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101776 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101756 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101765 () Unit!4351)

(assert (=> b!64418 (= lt!101765 (validateOffsetBitsIneqLemma!0 (_2!2981 lt!101319) (_2!2981 lt!101778) lt!101776 lt!101756))))

(assert (=> b!64418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101778)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101778))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101778))) (bvsub lt!101776 lt!101756))))

(declare-fun lt!101739 () Unit!4351)

(assert (=> b!64418 (= lt!101739 lt!101765)))

(declare-fun lt!101770 () tuple2!5742)

(assert (=> b!64418 (= lt!101770 call!820)))

(declare-fun lt!101738 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101738 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101750 () Unit!4351)

(assert (=> b!64418 (= lt!101750 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101778)) lt!101738))))

(assert (=> b!64418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101778)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101738)))

(declare-fun lt!101742 () Unit!4351)

(assert (=> b!64418 (= lt!101742 lt!101750)))

(assert (=> b!64418 (= (head!513 (byteArrayBitContentToList!0 (_2!2981 lt!101778) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!513 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101778) (_1!2982 lt!101770) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101764 () Unit!4351)

(declare-fun Unit!4358 () Unit!4351)

(assert (=> b!64418 (= lt!101764 Unit!4358)))

(assert (=> b!64418 (= lt!101761 (appendBitsMSBFirstLoop!0 (_2!2981 lt!101778) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!101759 () Unit!4351)

(assert (=> b!64418 (= lt!101759 (lemmaIsPrefixTransitive!0 (_2!2981 lt!101319) (_2!2981 lt!101778) (_2!2981 lt!101761)))))

(assert (=> b!64418 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101761))))

(declare-fun lt!101760 () Unit!4351)

(assert (=> b!64418 (= lt!101760 lt!101759)))

(assert (=> b!64418 (= (size!1293 (buf!1674 (_2!2981 lt!101761))) (size!1293 (buf!1674 (_2!2981 lt!101319))))))

(declare-fun lt!101777 () Unit!4351)

(declare-fun Unit!4359 () Unit!4351)

(assert (=> b!64418 (= lt!101777 Unit!4359)))

(assert (=> b!64418 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101761))) (currentByte!3328 (_2!2981 lt!101761)) (currentBit!3323 (_2!2981 lt!101761))) (bvsub (bvadd (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101767 () Unit!4351)

(declare-fun Unit!4360 () Unit!4351)

(assert (=> b!64418 (= lt!101767 Unit!4360)))

(assert (=> b!64418 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101761))) (currentByte!3328 (_2!2981 lt!101761)) (currentBit!3323 (_2!2981 lt!101761))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101778))) (currentByte!3328 (_2!2981 lt!101778)) (currentBit!3323 (_2!2981 lt!101778))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101752 () Unit!4351)

(declare-fun Unit!4361 () Unit!4351)

(assert (=> b!64418 (= lt!101752 Unit!4361)))

(declare-fun lt!101751 () tuple2!5742)

(assert (=> b!64418 (= lt!101751 (reader!0 (_2!2981 lt!101319) (_2!2981 lt!101761)))))

(declare-fun lt!101744 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101744 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101762 () Unit!4351)

(assert (=> b!64418 (= lt!101762 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101761)) lt!101744))))

(assert (=> b!64418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101761)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101744)))

(declare-fun lt!101749 () Unit!4351)

(assert (=> b!64418 (= lt!101749 lt!101762)))

(declare-fun lt!101741 () tuple2!5742)

(assert (=> b!64418 (= lt!101741 (reader!0 (_2!2981 lt!101778) (_2!2981 lt!101761)))))

(declare-fun lt!101757 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101757 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101754 () Unit!4351)

(assert (=> b!64418 (= lt!101754 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101778) (buf!1674 (_2!2981 lt!101761)) lt!101757))))

(assert (=> b!64418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101761)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101778))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101778))) lt!101757)))

(declare-fun lt!101769 () Unit!4351)

(assert (=> b!64418 (= lt!101769 lt!101754)))

(declare-fun lt!101743 () List!694)

(assert (=> b!64418 (= lt!101743 (byteArrayBitContentToList!0 (_2!2981 lt!101761) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!101771 () List!694)

(assert (=> b!64418 (= lt!101771 (byteArrayBitContentToList!0 (_2!2981 lt!101761) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101766 () List!694)

(assert (=> b!64418 (= lt!101766 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101761) (_1!2982 lt!101751) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!101774 () List!694)

(assert (=> b!64418 (= lt!101774 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101761) (_1!2982 lt!101741) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101745 () (_ BitVec 64))

(assert (=> b!64418 (= lt!101745 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101753 () Unit!4351)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2238 BitStream!2238 BitStream!2238 BitStream!2238 (_ BitVec 64) List!694) Unit!4351)

(assert (=> b!64418 (= lt!101753 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2981 lt!101761) (_2!2981 lt!101761) (_1!2982 lt!101751) (_1!2982 lt!101741) lt!101745 lt!101766))))

(declare-fun tail!300 (List!694) List!694)

(assert (=> b!64418 (= (bitStreamReadBitsIntoList!0 (_2!2981 lt!101761) (_1!2982 lt!101741) (bvsub lt!101745 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!300 lt!101766))))

(declare-fun lt!101773 () Unit!4351)

(assert (=> b!64418 (= lt!101773 lt!101753)))

(declare-fun lt!101755 () Unit!4351)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2817 array!2817 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4351)

(assert (=> b!64418 (= lt!101755 (arrayBitRangesEqImpliesEq!0 (buf!1674 (_2!2981 lt!101778)) (buf!1674 (_2!2981 lt!101761)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!101737 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101778))) (currentByte!3328 (_2!2981 lt!101778)) (currentBit!3323 (_2!2981 lt!101778)))))))

(declare-fun bitAt!0 (array!2817 (_ BitVec 64)) Bool)

(assert (=> b!64418 (= (bitAt!0 (buf!1674 (_2!2981 lt!101778)) lt!101737) (bitAt!0 (buf!1674 (_2!2981 lt!101761)) lt!101737))))

(declare-fun lt!101748 () Unit!4351)

(assert (=> b!64418 (= lt!101748 lt!101755)))

(assert (= (and d!20006 c!4624) b!64418))

(assert (= (and d!20006 (not c!4624)) b!64413))

(assert (= (or b!64418 b!64413) bm!817))

(assert (= (and d!20006 res!53483) b!64412))

(assert (= (and b!64412 res!53488) b!64417))

(assert (= (and b!64417 res!53486) b!64415))

(assert (= (and b!64415 res!53487) b!64414))

(assert (= (and b!64414 res!53485) b!64411))

(assert (= (and b!64411 res!53484) b!64416))

(declare-fun m!102107 () Bool)

(assert (=> b!64411 m!102107))

(declare-fun m!102109 () Bool)

(assert (=> b!64411 m!102109))

(declare-fun m!102111 () Bool)

(assert (=> b!64411 m!102111))

(declare-fun m!102113 () Bool)

(assert (=> b!64411 m!102113))

(declare-fun m!102115 () Bool)

(assert (=> b!64411 m!102115))

(declare-fun m!102117 () Bool)

(assert (=> bm!817 m!102117))

(declare-fun m!102119 () Bool)

(assert (=> b!64418 m!102119))

(declare-fun m!102121 () Bool)

(assert (=> b!64418 m!102121))

(declare-fun m!102123 () Bool)

(assert (=> b!64418 m!102123))

(declare-fun m!102125 () Bool)

(assert (=> b!64418 m!102125))

(declare-fun m!102127 () Bool)

(assert (=> b!64418 m!102127))

(declare-fun m!102129 () Bool)

(assert (=> b!64418 m!102129))

(declare-fun m!102131 () Bool)

(assert (=> b!64418 m!102131))

(declare-fun m!102133 () Bool)

(assert (=> b!64418 m!102133))

(declare-fun m!102135 () Bool)

(assert (=> b!64418 m!102135))

(declare-fun m!102137 () Bool)

(assert (=> b!64418 m!102137))

(declare-fun m!102139 () Bool)

(assert (=> b!64418 m!102139))

(declare-fun m!102141 () Bool)

(assert (=> b!64418 m!102141))

(declare-fun m!102143 () Bool)

(assert (=> b!64418 m!102143))

(declare-fun m!102145 () Bool)

(assert (=> b!64418 m!102145))

(declare-fun m!102147 () Bool)

(assert (=> b!64418 m!102147))

(declare-fun m!102149 () Bool)

(assert (=> b!64418 m!102149))

(declare-fun m!102151 () Bool)

(assert (=> b!64418 m!102151))

(declare-fun m!102153 () Bool)

(assert (=> b!64418 m!102153))

(declare-fun m!102155 () Bool)

(assert (=> b!64418 m!102155))

(declare-fun m!102157 () Bool)

(assert (=> b!64418 m!102157))

(declare-fun m!102159 () Bool)

(assert (=> b!64418 m!102159))

(assert (=> b!64418 m!102147))

(declare-fun m!102161 () Bool)

(assert (=> b!64418 m!102161))

(declare-fun m!102163 () Bool)

(assert (=> b!64418 m!102163))

(declare-fun m!102165 () Bool)

(assert (=> b!64418 m!102165))

(declare-fun m!102167 () Bool)

(assert (=> b!64418 m!102167))

(declare-fun m!102169 () Bool)

(assert (=> b!64418 m!102169))

(declare-fun m!102171 () Bool)

(assert (=> b!64418 m!102171))

(assert (=> b!64418 m!101745))

(assert (=> b!64418 m!102155))

(declare-fun m!102173 () Bool)

(assert (=> b!64418 m!102173))

(assert (=> b!64418 m!102131))

(declare-fun m!102175 () Bool)

(assert (=> b!64418 m!102175))

(declare-fun m!102177 () Bool)

(assert (=> b!64418 m!102177))

(assert (=> b!64418 m!102125))

(declare-fun m!102179 () Bool)

(assert (=> b!64418 m!102179))

(declare-fun m!102181 () Bool)

(assert (=> b!64416 m!102181))

(declare-fun m!102183 () Bool)

(assert (=> b!64415 m!102183))

(declare-fun m!102185 () Bool)

(assert (=> d!20006 m!102185))

(assert (=> d!20006 m!101745))

(declare-fun m!102187 () Bool)

(assert (=> d!20006 m!102187))

(declare-fun m!102189 () Bool)

(assert (=> d!20006 m!102189))

(declare-fun m!102191 () Bool)

(assert (=> b!64413 m!102191))

(declare-fun m!102193 () Bool)

(assert (=> b!64413 m!102193))

(declare-fun m!102195 () Bool)

(assert (=> b!64412 m!102195))

(assert (=> b!64172 d!20006))

(declare-fun d!20074 () Bool)

(declare-fun res!53490 () Bool)

(declare-fun e!42542 () Bool)

(assert (=> d!20074 (=> (not res!53490) (not e!42542))))

(assert (=> d!20074 (= res!53490 (= (size!1293 (buf!1674 (_2!2981 lt!101319))) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (=> d!20074 (= (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101315)) e!42542)))

(declare-fun b!64419 () Bool)

(declare-fun res!53489 () Bool)

(assert (=> b!64419 (=> (not res!53489) (not e!42542))))

(assert (=> b!64419 (= res!53489 (bvsle (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315)))))))

(declare-fun b!64420 () Bool)

(declare-fun e!42543 () Bool)

(assert (=> b!64420 (= e!42542 e!42543)))

(declare-fun res!53491 () Bool)

(assert (=> b!64420 (=> res!53491 e!42543)))

(assert (=> b!64420 (= res!53491 (= (size!1293 (buf!1674 (_2!2981 lt!101319))) #b00000000000000000000000000000000))))

(declare-fun b!64421 () Bool)

(assert (=> b!64421 (= e!42543 (arrayBitRangesEq!0 (buf!1674 (_2!2981 lt!101319)) (buf!1674 (_2!2981 lt!101315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319)))))))

(assert (= (and d!20074 res!53490) b!64419))

(assert (= (and b!64419 res!53489) b!64420))

(assert (= (and b!64420 (not res!53491)) b!64421))

(assert (=> b!64419 m!101745))

(assert (=> b!64419 m!101795))

(assert (=> b!64421 m!101745))

(assert (=> b!64421 m!101745))

(declare-fun m!102197 () Bool)

(assert (=> b!64421 m!102197))

(assert (=> b!64172 d!20074))

(declare-fun d!20076 () Bool)

(assert (=> d!20076 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101315))))

(declare-fun lt!101782 () Unit!4351)

(declare-fun choose!30 (BitStream!2238 BitStream!2238 BitStream!2238) Unit!4351)

(assert (=> d!20076 (= lt!101782 (choose!30 thiss!1379 (_2!2981 lt!101319) (_2!2981 lt!101315)))))

(assert (=> d!20076 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101319))))

(assert (=> d!20076 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2981 lt!101319) (_2!2981 lt!101315)) lt!101782)))

(declare-fun bs!4928 () Bool)

(assert (= bs!4928 d!20076))

(assert (=> bs!4928 m!101775))

(declare-fun m!102199 () Bool)

(assert (=> bs!4928 m!102199))

(assert (=> bs!4928 m!101791))

(assert (=> b!64172 d!20076))

(declare-fun b!64432 () Bool)

(declare-fun e!42549 () Unit!4351)

(declare-fun Unit!4362 () Unit!4351)

(assert (=> b!64432 (= e!42549 Unit!4362)))

(declare-fun d!20078 () Bool)

(declare-fun e!42548 () Bool)

(assert (=> d!20078 e!42548))

(declare-fun res!53498 () Bool)

(assert (=> d!20078 (=> (not res!53498) (not e!42548))))

(declare-fun lt!101841 () tuple2!5742)

(assert (=> d!20078 (= res!53498 (isPrefixOf!0 (_1!2982 lt!101841) (_2!2982 lt!101841)))))

(declare-fun lt!101839 () BitStream!2238)

(assert (=> d!20078 (= lt!101841 (tuple2!5743 lt!101839 (_2!2981 lt!101319)))))

(declare-fun lt!101831 () Unit!4351)

(declare-fun lt!101826 () Unit!4351)

(assert (=> d!20078 (= lt!101831 lt!101826)))

(assert (=> d!20078 (isPrefixOf!0 lt!101839 (_2!2981 lt!101319))))

(assert (=> d!20078 (= lt!101826 (lemmaIsPrefixTransitive!0 lt!101839 (_2!2981 lt!101319) (_2!2981 lt!101319)))))

(declare-fun lt!101823 () Unit!4351)

(declare-fun lt!101838 () Unit!4351)

(assert (=> d!20078 (= lt!101823 lt!101838)))

(assert (=> d!20078 (isPrefixOf!0 lt!101839 (_2!2981 lt!101319))))

(assert (=> d!20078 (= lt!101838 (lemmaIsPrefixTransitive!0 lt!101839 thiss!1379 (_2!2981 lt!101319)))))

(declare-fun lt!101825 () Unit!4351)

(assert (=> d!20078 (= lt!101825 e!42549)))

(declare-fun c!4627 () Bool)

(assert (=> d!20078 (= c!4627 (not (= (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101840 () Unit!4351)

(declare-fun lt!101837 () Unit!4351)

(assert (=> d!20078 (= lt!101840 lt!101837)))

(assert (=> d!20078 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101319))))

(assert (=> d!20078 (= lt!101837 (lemmaIsPrefixRefl!0 (_2!2981 lt!101319)))))

(declare-fun lt!101842 () Unit!4351)

(declare-fun lt!101834 () Unit!4351)

(assert (=> d!20078 (= lt!101842 lt!101834)))

(assert (=> d!20078 (= lt!101834 (lemmaIsPrefixRefl!0 (_2!2981 lt!101319)))))

(declare-fun lt!101830 () Unit!4351)

(declare-fun lt!101827 () Unit!4351)

(assert (=> d!20078 (= lt!101830 lt!101827)))

(assert (=> d!20078 (isPrefixOf!0 lt!101839 lt!101839)))

(assert (=> d!20078 (= lt!101827 (lemmaIsPrefixRefl!0 lt!101839))))

(declare-fun lt!101832 () Unit!4351)

(declare-fun lt!101833 () Unit!4351)

(assert (=> d!20078 (= lt!101832 lt!101833)))

(assert (=> d!20078 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20078 (= lt!101833 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20078 (= lt!101839 (BitStream!2239 (buf!1674 (_2!2981 lt!101319)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(assert (=> d!20078 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101319))))

(assert (=> d!20078 (= (reader!0 thiss!1379 (_2!2981 lt!101319)) lt!101841)))

(declare-fun b!64433 () Bool)

(declare-fun res!53499 () Bool)

(assert (=> b!64433 (=> (not res!53499) (not e!42548))))

(assert (=> b!64433 (= res!53499 (isPrefixOf!0 (_1!2982 lt!101841) thiss!1379))))

(declare-fun b!64434 () Bool)

(declare-fun lt!101836 () Unit!4351)

(assert (=> b!64434 (= e!42549 lt!101836)))

(declare-fun lt!101835 () (_ BitVec 64))

(assert (=> b!64434 (= lt!101835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101824 () (_ BitVec 64))

(assert (=> b!64434 (= lt!101824 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2817 array!2817 (_ BitVec 64) (_ BitVec 64)) Unit!4351)

(assert (=> b!64434 (= lt!101836 (arrayBitRangesEqSymmetric!0 (buf!1674 thiss!1379) (buf!1674 (_2!2981 lt!101319)) lt!101835 lt!101824))))

(assert (=> b!64434 (arrayBitRangesEq!0 (buf!1674 (_2!2981 lt!101319)) (buf!1674 thiss!1379) lt!101835 lt!101824)))

(declare-fun lt!101828 () (_ BitVec 64))

(declare-fun lt!101829 () (_ BitVec 64))

(declare-fun b!64435 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2238 (_ BitVec 64)) BitStream!2238)

(assert (=> b!64435 (= e!42548 (= (_1!2982 lt!101841) (withMovedBitIndex!0 (_2!2982 lt!101841) (bvsub lt!101828 lt!101829))))))

(assert (=> b!64435 (or (= (bvand lt!101828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101828 lt!101829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64435 (= lt!101829 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(assert (=> b!64435 (= lt!101828 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(declare-fun b!64436 () Bool)

(declare-fun res!53500 () Bool)

(assert (=> b!64436 (=> (not res!53500) (not e!42548))))

(assert (=> b!64436 (= res!53500 (isPrefixOf!0 (_2!2982 lt!101841) (_2!2981 lt!101319)))))

(assert (= (and d!20078 c!4627) b!64434))

(assert (= (and d!20078 (not c!4627)) b!64432))

(assert (= (and d!20078 res!53498) b!64433))

(assert (= (and b!64433 res!53499) b!64436))

(assert (= (and b!64436 res!53500) b!64435))

(declare-fun m!102201 () Bool)

(assert (=> b!64433 m!102201))

(assert (=> d!20078 m!101739))

(declare-fun m!102203 () Bool)

(assert (=> d!20078 m!102203))

(assert (=> d!20078 m!101791))

(declare-fun m!102205 () Bool)

(assert (=> d!20078 m!102205))

(declare-fun m!102207 () Bool)

(assert (=> d!20078 m!102207))

(assert (=> d!20078 m!102189))

(declare-fun m!102209 () Bool)

(assert (=> d!20078 m!102209))

(assert (=> d!20078 m!102187))

(declare-fun m!102211 () Bool)

(assert (=> d!20078 m!102211))

(declare-fun m!102213 () Bool)

(assert (=> d!20078 m!102213))

(assert (=> d!20078 m!101737))

(assert (=> b!64434 m!101741))

(declare-fun m!102215 () Bool)

(assert (=> b!64434 m!102215))

(declare-fun m!102217 () Bool)

(assert (=> b!64434 m!102217))

(declare-fun m!102219 () Bool)

(assert (=> b!64436 m!102219))

(declare-fun m!102221 () Bool)

(assert (=> b!64435 m!102221))

(assert (=> b!64435 m!101745))

(assert (=> b!64435 m!101741))

(assert (=> b!64172 d!20078))

(declare-fun d!20080 () Bool)

(assert (=> d!20080 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4929 () Bool)

(assert (= bs!4929 d!20080))

(declare-fun m!102223 () Bool)

(assert (=> bs!4929 m!102223))

(assert (=> b!64172 d!20080))

(declare-fun d!20082 () Bool)

(assert (=> d!20082 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101845 () Unit!4351)

(declare-fun choose!9 (BitStream!2238 array!2817 (_ BitVec 64) BitStream!2238) Unit!4351)

(assert (=> d!20082 (= lt!101845 (choose!9 thiss!1379 (buf!1674 (_2!2981 lt!101319)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2239 (buf!1674 (_2!2981 lt!101319)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(assert (=> d!20082 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1674 (_2!2981 lt!101319)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101845)))

(declare-fun bs!4930 () Bool)

(assert (= bs!4930 d!20082))

(assert (=> bs!4930 m!101763))

(declare-fun m!102225 () Bool)

(assert (=> bs!4930 m!102225))

(assert (=> b!64172 d!20082))

(declare-fun d!20084 () Bool)

(assert (=> d!20084 (= (invariant!0 (currentBit!3323 (_2!2981 lt!101319)) (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101315)))) (and (bvsge (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (bvslt (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000001000) (bvsge (currentByte!3328 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101315)))) (and (= (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (= (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101315))))))))))

(assert (=> b!64161 d!20084))

(declare-fun d!20086 () Bool)

(declare-fun res!53502 () Bool)

(declare-fun e!42550 () Bool)

(assert (=> d!20086 (=> (not res!53502) (not e!42550))))

(assert (=> d!20086 (= res!53502 (= (size!1293 (buf!1674 (_1!2982 lt!101322))) (size!1293 (buf!1674 (_2!2981 lt!101315)))))))

(assert (=> d!20086 (= (isPrefixOf!0 (_1!2982 lt!101322) (_2!2981 lt!101315)) e!42550)))

(declare-fun b!64437 () Bool)

(declare-fun res!53501 () Bool)

(assert (=> b!64437 (=> (not res!53501) (not e!42550))))

(assert (=> b!64437 (= res!53501 (bvsle (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322))) (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315)))))))

(declare-fun b!64438 () Bool)

(declare-fun e!42551 () Bool)

(assert (=> b!64438 (= e!42550 e!42551)))

(declare-fun res!53503 () Bool)

(assert (=> b!64438 (=> res!53503 e!42551)))

(assert (=> b!64438 (= res!53503 (= (size!1293 (buf!1674 (_1!2982 lt!101322))) #b00000000000000000000000000000000))))

(declare-fun b!64439 () Bool)

(assert (=> b!64439 (= e!42551 (arrayBitRangesEq!0 (buf!1674 (_1!2982 lt!101322)) (buf!1674 (_2!2981 lt!101315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322)))))))

(assert (= (and d!20086 res!53502) b!64437))

(assert (= (and b!64437 res!53501) b!64438))

(assert (= (and b!64438 (not res!53503)) b!64439))

(assert (=> b!64437 m!101755))

(assert (=> b!64437 m!101795))

(assert (=> b!64439 m!101755))

(assert (=> b!64439 m!101755))

(declare-fun m!102227 () Bool)

(assert (=> b!64439 m!102227))

(assert (=> b!64171 d!20086))

(declare-fun d!20088 () Bool)

(assert (=> d!20088 (= (array_inv!1178 srcBuffer!2) (bvsge (size!1293 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12554 d!20088))

(declare-fun d!20090 () Bool)

(assert (=> d!20090 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3323 thiss!1379) (currentByte!3328 thiss!1379) (size!1293 (buf!1674 thiss!1379))))))

(declare-fun bs!4931 () Bool)

(assert (= bs!4931 d!20090))

(declare-fun m!102229 () Bool)

(assert (=> bs!4931 m!102229))

(assert (=> start!12554 d!20090))

(declare-fun d!20092 () Bool)

(declare-fun res!53505 () Bool)

(declare-fun e!42552 () Bool)

(assert (=> d!20092 (=> (not res!53505) (not e!42552))))

(assert (=> d!20092 (= res!53505 (= (size!1293 (buf!1674 thiss!1379)) (size!1293 (buf!1674 thiss!1379))))))

(assert (=> d!20092 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42552)))

(declare-fun b!64440 () Bool)

(declare-fun res!53504 () Bool)

(assert (=> b!64440 (=> (not res!53504) (not e!42552))))

(assert (=> b!64440 (= res!53504 (bvsle (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)) (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(declare-fun b!64441 () Bool)

(declare-fun e!42553 () Bool)

(assert (=> b!64441 (= e!42552 e!42553)))

(declare-fun res!53506 () Bool)

(assert (=> b!64441 (=> res!53506 e!42553)))

(assert (=> b!64441 (= res!53506 (= (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64442 () Bool)

(assert (=> b!64442 (= e!42553 (arrayBitRangesEq!0 (buf!1674 thiss!1379) (buf!1674 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(assert (= (and d!20092 res!53505) b!64440))

(assert (= (and b!64440 res!53504) b!64441))

(assert (= (and b!64441 (not res!53506)) b!64442))

(assert (=> b!64440 m!101741))

(assert (=> b!64440 m!101741))

(assert (=> b!64442 m!101741))

(assert (=> b!64442 m!101741))

(declare-fun m!102231 () Bool)

(assert (=> b!64442 m!102231))

(assert (=> b!64170 d!20092))

(declare-fun d!20094 () Bool)

(assert (=> d!20094 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101848 () Unit!4351)

(declare-fun choose!11 (BitStream!2238) Unit!4351)

(assert (=> d!20094 (= lt!101848 (choose!11 thiss!1379))))

(assert (=> d!20094 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!101848)))

(declare-fun bs!4933 () Bool)

(assert (= bs!4933 d!20094))

(assert (=> bs!4933 m!101737))

(declare-fun m!102233 () Bool)

(assert (=> bs!4933 m!102233))

(assert (=> b!64170 d!20094))

(declare-fun d!20096 () Bool)

(declare-fun e!42554 () Bool)

(assert (=> d!20096 e!42554))

(declare-fun res!53508 () Bool)

(assert (=> d!20096 (=> (not res!53508) (not e!42554))))

(declare-fun lt!101852 () (_ BitVec 64))

(declare-fun lt!101849 () (_ BitVec 64))

(declare-fun lt!101850 () (_ BitVec 64))

(assert (=> d!20096 (= res!53508 (= lt!101850 (bvsub lt!101849 lt!101852)))))

(assert (=> d!20096 (or (= (bvand lt!101849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101849 lt!101852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20096 (= lt!101852 (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379))))))

(declare-fun lt!101853 () (_ BitVec 64))

(declare-fun lt!101854 () (_ BitVec 64))

(assert (=> d!20096 (= lt!101849 (bvmul lt!101853 lt!101854))))

(assert (=> d!20096 (or (= lt!101853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101854 (bvsdiv (bvmul lt!101853 lt!101854) lt!101853)))))

(assert (=> d!20096 (= lt!101854 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20096 (= lt!101853 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))))))

(assert (=> d!20096 (= lt!101850 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3328 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3323 thiss!1379))))))

(assert (=> d!20096 (invariant!0 (currentBit!3323 thiss!1379) (currentByte!3328 thiss!1379) (size!1293 (buf!1674 thiss!1379)))))

(assert (=> d!20096 (= (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)) lt!101850)))

(declare-fun b!64443 () Bool)

(declare-fun res!53507 () Bool)

(assert (=> b!64443 (=> (not res!53507) (not e!42554))))

(assert (=> b!64443 (= res!53507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101850))))

(declare-fun b!64444 () Bool)

(declare-fun lt!101851 () (_ BitVec 64))

(assert (=> b!64444 (= e!42554 (bvsle lt!101850 (bvmul lt!101851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64444 (or (= lt!101851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101851)))))

(assert (=> b!64444 (= lt!101851 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))))))

(assert (= (and d!20096 res!53508) b!64443))

(assert (= (and b!64443 res!53507) b!64444))

(declare-fun m!102235 () Bool)

(assert (=> d!20096 m!102235))

(assert (=> d!20096 m!102229))

(assert (=> b!64170 d!20096))

(declare-fun d!20098 () Bool)

(assert (=> d!20098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101318) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319)))) lt!101318))))

(declare-fun bs!4934 () Bool)

(assert (= bs!4934 d!20098))

(declare-fun m!102237 () Bool)

(assert (=> bs!4934 m!102237))

(assert (=> b!64180 d!20098))

(declare-fun d!20100 () Bool)

(assert (=> d!20100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4935 () Bool)

(assert (= bs!4935 d!20100))

(declare-fun m!102239 () Bool)

(assert (=> bs!4935 m!102239))

(assert (=> b!64180 d!20100))

(declare-fun d!20102 () Bool)

(assert (=> d!20102 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101855 () Unit!4351)

(assert (=> d!20102 (= lt!101855 (choose!9 thiss!1379 (buf!1674 (_2!2981 lt!101315)) (bvsub to!314 i!635) (BitStream!2239 (buf!1674 (_2!2981 lt!101315)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379))))))

(assert (=> d!20102 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1674 (_2!2981 lt!101315)) (bvsub to!314 i!635)) lt!101855)))

(declare-fun bs!4936 () Bool)

(assert (= bs!4936 d!20102))

(assert (=> bs!4936 m!101799))

(declare-fun m!102241 () Bool)

(assert (=> bs!4936 m!102241))

(assert (=> b!64180 d!20102))

(declare-fun b!64453 () Bool)

(declare-datatypes ((tuple2!5752 0))(
  ( (tuple2!5753 (_1!2987 List!694) (_2!2987 BitStream!2238)) )
))
(declare-fun e!42559 () tuple2!5752)

(assert (=> b!64453 (= e!42559 (tuple2!5753 Nil!691 (_1!2982 lt!101313)))))

(declare-fun d!20104 () Bool)

(declare-fun e!42560 () Bool)

(assert (=> d!20104 e!42560))

(declare-fun c!4633 () Bool)

(assert (=> d!20104 (= c!4633 (= lt!101318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101862 () List!694)

(assert (=> d!20104 (= lt!101862 (_1!2987 e!42559))))

(declare-fun c!4632 () Bool)

(assert (=> d!20104 (= c!4632 (= lt!101318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20104 (bvsge lt!101318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20104 (= (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_1!2982 lt!101313) lt!101318) lt!101862)))

(declare-fun b!64456 () Bool)

(assert (=> b!64456 (= e!42560 (> (length!322 lt!101862) 0))))

(declare-fun b!64455 () Bool)

(declare-fun isEmpty!198 (List!694) Bool)

(assert (=> b!64455 (= e!42560 (isEmpty!198 lt!101862))))

(declare-datatypes ((tuple2!5754 0))(
  ( (tuple2!5755 (_1!2988 Bool) (_2!2988 BitStream!2238)) )
))
(declare-fun lt!101863 () tuple2!5754)

(declare-fun b!64454 () Bool)

(declare-fun lt!101864 () (_ BitVec 64))

(assert (=> b!64454 (= e!42559 (tuple2!5753 (Cons!690 (_1!2988 lt!101863) (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_2!2988 lt!101863) (bvsub lt!101318 lt!101864))) (_2!2988 lt!101863)))))

(declare-fun readBit!0 (BitStream!2238) tuple2!5754)

(assert (=> b!64454 (= lt!101863 (readBit!0 (_1!2982 lt!101313)))))

(assert (=> b!64454 (= lt!101864 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20104 c!4632) b!64453))

(assert (= (and d!20104 (not c!4632)) b!64454))

(assert (= (and d!20104 c!4633) b!64455))

(assert (= (and d!20104 (not c!4633)) b!64456))

(declare-fun m!102243 () Bool)

(assert (=> b!64456 m!102243))

(declare-fun m!102245 () Bool)

(assert (=> b!64455 m!102245))

(declare-fun m!102247 () Bool)

(assert (=> b!64454 m!102247))

(declare-fun m!102249 () Bool)

(assert (=> b!64454 m!102249))

(assert (=> b!64180 d!20104))

(declare-fun d!20106 () Bool)

(assert (=> d!20106 (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101315)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319))) lt!101318)))

(declare-fun lt!101865 () Unit!4351)

(assert (=> d!20106 (= lt!101865 (choose!9 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101315)) lt!101318 (BitStream!2239 (buf!1674 (_2!2981 lt!101315)) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319)))))))

(assert (=> d!20106 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2981 lt!101319) (buf!1674 (_2!2981 lt!101315)) lt!101318) lt!101865)))

(declare-fun bs!4937 () Bool)

(assert (= bs!4937 d!20106))

(assert (=> bs!4937 m!101811))

(declare-fun m!102251 () Bool)

(assert (=> bs!4937 m!102251))

(assert (=> b!64180 d!20106))

(declare-fun b!64457 () Bool)

(declare-fun e!42562 () Unit!4351)

(declare-fun Unit!4363 () Unit!4351)

(assert (=> b!64457 (= e!42562 Unit!4363)))

(declare-fun d!20108 () Bool)

(declare-fun e!42561 () Bool)

(assert (=> d!20108 e!42561))

(declare-fun res!53509 () Bool)

(assert (=> d!20108 (=> (not res!53509) (not e!42561))))

(declare-fun lt!101884 () tuple2!5742)

(assert (=> d!20108 (= res!53509 (isPrefixOf!0 (_1!2982 lt!101884) (_2!2982 lt!101884)))))

(declare-fun lt!101882 () BitStream!2238)

(assert (=> d!20108 (= lt!101884 (tuple2!5743 lt!101882 (_2!2981 lt!101315)))))

(declare-fun lt!101874 () Unit!4351)

(declare-fun lt!101869 () Unit!4351)

(assert (=> d!20108 (= lt!101874 lt!101869)))

(assert (=> d!20108 (isPrefixOf!0 lt!101882 (_2!2981 lt!101315))))

(assert (=> d!20108 (= lt!101869 (lemmaIsPrefixTransitive!0 lt!101882 (_2!2981 lt!101315) (_2!2981 lt!101315)))))

(declare-fun lt!101866 () Unit!4351)

(declare-fun lt!101881 () Unit!4351)

(assert (=> d!20108 (= lt!101866 lt!101881)))

(assert (=> d!20108 (isPrefixOf!0 lt!101882 (_2!2981 lt!101315))))

(assert (=> d!20108 (= lt!101881 (lemmaIsPrefixTransitive!0 lt!101882 thiss!1379 (_2!2981 lt!101315)))))

(declare-fun lt!101868 () Unit!4351)

(assert (=> d!20108 (= lt!101868 e!42562)))

(declare-fun c!4634 () Bool)

(assert (=> d!20108 (= c!4634 (not (= (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101883 () Unit!4351)

(declare-fun lt!101880 () Unit!4351)

(assert (=> d!20108 (= lt!101883 lt!101880)))

(assert (=> d!20108 (isPrefixOf!0 (_2!2981 lt!101315) (_2!2981 lt!101315))))

(assert (=> d!20108 (= lt!101880 (lemmaIsPrefixRefl!0 (_2!2981 lt!101315)))))

(declare-fun lt!101885 () Unit!4351)

(declare-fun lt!101877 () Unit!4351)

(assert (=> d!20108 (= lt!101885 lt!101877)))

(assert (=> d!20108 (= lt!101877 (lemmaIsPrefixRefl!0 (_2!2981 lt!101315)))))

(declare-fun lt!101873 () Unit!4351)

(declare-fun lt!101870 () Unit!4351)

(assert (=> d!20108 (= lt!101873 lt!101870)))

(assert (=> d!20108 (isPrefixOf!0 lt!101882 lt!101882)))

(assert (=> d!20108 (= lt!101870 (lemmaIsPrefixRefl!0 lt!101882))))

(declare-fun lt!101875 () Unit!4351)

(declare-fun lt!101876 () Unit!4351)

(assert (=> d!20108 (= lt!101875 lt!101876)))

(assert (=> d!20108 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20108 (= lt!101876 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20108 (= lt!101882 (BitStream!2239 (buf!1674 (_2!2981 lt!101315)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(assert (=> d!20108 (isPrefixOf!0 thiss!1379 (_2!2981 lt!101315))))

(assert (=> d!20108 (= (reader!0 thiss!1379 (_2!2981 lt!101315)) lt!101884)))

(declare-fun b!64458 () Bool)

(declare-fun res!53510 () Bool)

(assert (=> b!64458 (=> (not res!53510) (not e!42561))))

(assert (=> b!64458 (= res!53510 (isPrefixOf!0 (_1!2982 lt!101884) thiss!1379))))

(declare-fun b!64459 () Bool)

(declare-fun lt!101879 () Unit!4351)

(assert (=> b!64459 (= e!42562 lt!101879)))

(declare-fun lt!101878 () (_ BitVec 64))

(assert (=> b!64459 (= lt!101878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101867 () (_ BitVec 64))

(assert (=> b!64459 (= lt!101867 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(assert (=> b!64459 (= lt!101879 (arrayBitRangesEqSymmetric!0 (buf!1674 thiss!1379) (buf!1674 (_2!2981 lt!101315)) lt!101878 lt!101867))))

(assert (=> b!64459 (arrayBitRangesEq!0 (buf!1674 (_2!2981 lt!101315)) (buf!1674 thiss!1379) lt!101878 lt!101867)))

(declare-fun lt!101871 () (_ BitVec 64))

(declare-fun b!64460 () Bool)

(declare-fun lt!101872 () (_ BitVec 64))

(assert (=> b!64460 (= e!42561 (= (_1!2982 lt!101884) (withMovedBitIndex!0 (_2!2982 lt!101884) (bvsub lt!101871 lt!101872))))))

(assert (=> b!64460 (or (= (bvand lt!101871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101871 lt!101872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64460 (= lt!101872 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315))))))

(assert (=> b!64460 (= lt!101871 (bitIndex!0 (size!1293 (buf!1674 thiss!1379)) (currentByte!3328 thiss!1379) (currentBit!3323 thiss!1379)))))

(declare-fun b!64461 () Bool)

(declare-fun res!53511 () Bool)

(assert (=> b!64461 (=> (not res!53511) (not e!42561))))

(assert (=> b!64461 (= res!53511 (isPrefixOf!0 (_2!2982 lt!101884) (_2!2981 lt!101315)))))

(assert (= (and d!20108 c!4634) b!64459))

(assert (= (and d!20108 (not c!4634)) b!64457))

(assert (= (and d!20108 res!53509) b!64458))

(assert (= (and b!64458 res!53510) b!64461))

(assert (= (and b!64461 res!53511) b!64460))

(declare-fun m!102253 () Bool)

(assert (=> b!64458 m!102253))

(assert (=> d!20108 m!101739))

(declare-fun m!102255 () Bool)

(assert (=> d!20108 m!102255))

(assert (=> d!20108 m!101775))

(declare-fun m!102257 () Bool)

(assert (=> d!20108 m!102257))

(declare-fun m!102259 () Bool)

(assert (=> d!20108 m!102259))

(declare-fun m!102261 () Bool)

(assert (=> d!20108 m!102261))

(declare-fun m!102263 () Bool)

(assert (=> d!20108 m!102263))

(declare-fun m!102265 () Bool)

(assert (=> d!20108 m!102265))

(declare-fun m!102267 () Bool)

(assert (=> d!20108 m!102267))

(declare-fun m!102269 () Bool)

(assert (=> d!20108 m!102269))

(assert (=> d!20108 m!101737))

(assert (=> b!64459 m!101741))

(declare-fun m!102271 () Bool)

(assert (=> b!64459 m!102271))

(declare-fun m!102273 () Bool)

(assert (=> b!64459 m!102273))

(declare-fun m!102275 () Bool)

(assert (=> b!64461 m!102275))

(declare-fun m!102277 () Bool)

(assert (=> b!64460 m!102277))

(assert (=> b!64460 m!101795))

(assert (=> b!64460 m!101741))

(assert (=> b!64180 d!20108))

(declare-fun b!64462 () Bool)

(declare-fun e!42563 () tuple2!5752)

(assert (=> b!64462 (= e!42563 (tuple2!5753 Nil!691 (_1!2982 lt!101322)))))

(declare-fun d!20110 () Bool)

(declare-fun e!42564 () Bool)

(assert (=> d!20110 e!42564))

(declare-fun c!4636 () Bool)

(assert (=> d!20110 (= c!4636 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101886 () List!694)

(assert (=> d!20110 (= lt!101886 (_1!2987 e!42563))))

(declare-fun c!4635 () Bool)

(assert (=> d!20110 (= c!4635 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20110 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20110 (= (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_1!2982 lt!101322) (bvsub to!314 i!635)) lt!101886)))

(declare-fun b!64465 () Bool)

(assert (=> b!64465 (= e!42564 (> (length!322 lt!101886) 0))))

(declare-fun b!64464 () Bool)

(assert (=> b!64464 (= e!42564 (isEmpty!198 lt!101886))))

(declare-fun lt!101887 () tuple2!5754)

(declare-fun lt!101888 () (_ BitVec 64))

(declare-fun b!64463 () Bool)

(assert (=> b!64463 (= e!42563 (tuple2!5753 (Cons!690 (_1!2988 lt!101887) (bitStreamReadBitsIntoList!0 (_2!2981 lt!101315) (_2!2988 lt!101887) (bvsub (bvsub to!314 i!635) lt!101888))) (_2!2988 lt!101887)))))

(assert (=> b!64463 (= lt!101887 (readBit!0 (_1!2982 lt!101322)))))

(assert (=> b!64463 (= lt!101888 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20110 c!4635) b!64462))

(assert (= (and d!20110 (not c!4635)) b!64463))

(assert (= (and d!20110 c!4636) b!64464))

(assert (= (and d!20110 (not c!4636)) b!64465))

(declare-fun m!102279 () Bool)

(assert (=> b!64465 m!102279))

(declare-fun m!102281 () Bool)

(assert (=> b!64464 m!102281))

(declare-fun m!102283 () Bool)

(assert (=> b!64463 m!102283))

(declare-fun m!102285 () Bool)

(assert (=> b!64463 m!102285))

(assert (=> b!64180 d!20110))

(declare-fun b!64466 () Bool)

(declare-fun e!42566 () Unit!4351)

(declare-fun Unit!4364 () Unit!4351)

(assert (=> b!64466 (= e!42566 Unit!4364)))

(declare-fun d!20112 () Bool)

(declare-fun e!42565 () Bool)

(assert (=> d!20112 e!42565))

(declare-fun res!53512 () Bool)

(assert (=> d!20112 (=> (not res!53512) (not e!42565))))

(declare-fun lt!101907 () tuple2!5742)

(assert (=> d!20112 (= res!53512 (isPrefixOf!0 (_1!2982 lt!101907) (_2!2982 lt!101907)))))

(declare-fun lt!101905 () BitStream!2238)

(assert (=> d!20112 (= lt!101907 (tuple2!5743 lt!101905 (_2!2981 lt!101315)))))

(declare-fun lt!101897 () Unit!4351)

(declare-fun lt!101892 () Unit!4351)

(assert (=> d!20112 (= lt!101897 lt!101892)))

(assert (=> d!20112 (isPrefixOf!0 lt!101905 (_2!2981 lt!101315))))

(assert (=> d!20112 (= lt!101892 (lemmaIsPrefixTransitive!0 lt!101905 (_2!2981 lt!101315) (_2!2981 lt!101315)))))

(declare-fun lt!101889 () Unit!4351)

(declare-fun lt!101904 () Unit!4351)

(assert (=> d!20112 (= lt!101889 lt!101904)))

(assert (=> d!20112 (isPrefixOf!0 lt!101905 (_2!2981 lt!101315))))

(assert (=> d!20112 (= lt!101904 (lemmaIsPrefixTransitive!0 lt!101905 (_2!2981 lt!101319) (_2!2981 lt!101315)))))

(declare-fun lt!101891 () Unit!4351)

(assert (=> d!20112 (= lt!101891 e!42566)))

(declare-fun c!4637 () Bool)

(assert (=> d!20112 (= c!4637 (not (= (size!1293 (buf!1674 (_2!2981 lt!101319))) #b00000000000000000000000000000000)))))

(declare-fun lt!101906 () Unit!4351)

(declare-fun lt!101903 () Unit!4351)

(assert (=> d!20112 (= lt!101906 lt!101903)))

(assert (=> d!20112 (isPrefixOf!0 (_2!2981 lt!101315) (_2!2981 lt!101315))))

(assert (=> d!20112 (= lt!101903 (lemmaIsPrefixRefl!0 (_2!2981 lt!101315)))))

(declare-fun lt!101908 () Unit!4351)

(declare-fun lt!101900 () Unit!4351)

(assert (=> d!20112 (= lt!101908 lt!101900)))

(assert (=> d!20112 (= lt!101900 (lemmaIsPrefixRefl!0 (_2!2981 lt!101315)))))

(declare-fun lt!101896 () Unit!4351)

(declare-fun lt!101893 () Unit!4351)

(assert (=> d!20112 (= lt!101896 lt!101893)))

(assert (=> d!20112 (isPrefixOf!0 lt!101905 lt!101905)))

(assert (=> d!20112 (= lt!101893 (lemmaIsPrefixRefl!0 lt!101905))))

(declare-fun lt!101898 () Unit!4351)

(declare-fun lt!101899 () Unit!4351)

(assert (=> d!20112 (= lt!101898 lt!101899)))

(assert (=> d!20112 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101319))))

(assert (=> d!20112 (= lt!101899 (lemmaIsPrefixRefl!0 (_2!2981 lt!101319)))))

(assert (=> d!20112 (= lt!101905 (BitStream!2239 (buf!1674 (_2!2981 lt!101315)) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(assert (=> d!20112 (isPrefixOf!0 (_2!2981 lt!101319) (_2!2981 lt!101315))))

(assert (=> d!20112 (= (reader!0 (_2!2981 lt!101319) (_2!2981 lt!101315)) lt!101907)))

(declare-fun b!64467 () Bool)

(declare-fun res!53513 () Bool)

(assert (=> b!64467 (=> (not res!53513) (not e!42565))))

(assert (=> b!64467 (= res!53513 (isPrefixOf!0 (_1!2982 lt!101907) (_2!2981 lt!101319)))))

(declare-fun b!64468 () Bool)

(declare-fun lt!101902 () Unit!4351)

(assert (=> b!64468 (= e!42566 lt!101902)))

(declare-fun lt!101901 () (_ BitVec 64))

(assert (=> b!64468 (= lt!101901 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101890 () (_ BitVec 64))

(assert (=> b!64468 (= lt!101890 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(assert (=> b!64468 (= lt!101902 (arrayBitRangesEqSymmetric!0 (buf!1674 (_2!2981 lt!101319)) (buf!1674 (_2!2981 lt!101315)) lt!101901 lt!101890))))

(assert (=> b!64468 (arrayBitRangesEq!0 (buf!1674 (_2!2981 lt!101315)) (buf!1674 (_2!2981 lt!101319)) lt!101901 lt!101890)))

(declare-fun lt!101894 () (_ BitVec 64))

(declare-fun b!64469 () Bool)

(declare-fun lt!101895 () (_ BitVec 64))

(assert (=> b!64469 (= e!42565 (= (_1!2982 lt!101907) (withMovedBitIndex!0 (_2!2982 lt!101907) (bvsub lt!101894 lt!101895))))))

(assert (=> b!64469 (or (= (bvand lt!101894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101894 lt!101895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64469 (= lt!101895 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101315))) (currentByte!3328 (_2!2981 lt!101315)) (currentBit!3323 (_2!2981 lt!101315))))))

(assert (=> b!64469 (= lt!101894 (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))))))

(declare-fun b!64470 () Bool)

(declare-fun res!53514 () Bool)

(assert (=> b!64470 (=> (not res!53514) (not e!42565))))

(assert (=> b!64470 (= res!53514 (isPrefixOf!0 (_2!2982 lt!101907) (_2!2981 lt!101315)))))

(assert (= (and d!20112 c!4637) b!64468))

(assert (= (and d!20112 (not c!4637)) b!64466))

(assert (= (and d!20112 res!53512) b!64467))

(assert (= (and b!64467 res!53513) b!64470))

(assert (= (and b!64470 res!53514) b!64469))

(declare-fun m!102287 () Bool)

(assert (=> b!64467 m!102287))

(assert (=> d!20112 m!102189))

(declare-fun m!102289 () Bool)

(assert (=> d!20112 m!102289))

(assert (=> d!20112 m!101773))

(declare-fun m!102291 () Bool)

(assert (=> d!20112 m!102291))

(declare-fun m!102293 () Bool)

(assert (=> d!20112 m!102293))

(assert (=> d!20112 m!102261))

(declare-fun m!102295 () Bool)

(assert (=> d!20112 m!102295))

(assert (=> d!20112 m!102265))

(declare-fun m!102297 () Bool)

(assert (=> d!20112 m!102297))

(declare-fun m!102299 () Bool)

(assert (=> d!20112 m!102299))

(assert (=> d!20112 m!102187))

(assert (=> b!64468 m!101745))

(declare-fun m!102301 () Bool)

(assert (=> b!64468 m!102301))

(declare-fun m!102303 () Bool)

(assert (=> b!64468 m!102303))

(declare-fun m!102305 () Bool)

(assert (=> b!64470 m!102305))

(declare-fun m!102307 () Bool)

(assert (=> b!64469 m!102307))

(assert (=> b!64469 m!101795))

(assert (=> b!64469 m!101745))

(assert (=> b!64180 d!20112))

(declare-fun d!20114 () Bool)

(declare-fun e!42567 () Bool)

(assert (=> d!20114 e!42567))

(declare-fun res!53516 () Bool)

(assert (=> d!20114 (=> (not res!53516) (not e!42567))))

(declare-fun lt!101912 () (_ BitVec 64))

(declare-fun lt!101909 () (_ BitVec 64))

(declare-fun lt!101910 () (_ BitVec 64))

(assert (=> d!20114 (= res!53516 (= lt!101910 (bvsub lt!101909 lt!101912)))))

(assert (=> d!20114 (or (= (bvand lt!101909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101912 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101909 lt!101912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20114 (= lt!101912 (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))) ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319)))))))

(declare-fun lt!101913 () (_ BitVec 64))

(declare-fun lt!101914 () (_ BitVec 64))

(assert (=> d!20114 (= lt!101909 (bvmul lt!101913 lt!101914))))

(assert (=> d!20114 (or (= lt!101913 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101914 (bvsdiv (bvmul lt!101913 lt!101914) lt!101913)))))

(assert (=> d!20114 (= lt!101914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20114 (= lt!101913 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))))))

(assert (=> d!20114 (= lt!101910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3328 (_2!2981 lt!101319))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3323 (_2!2981 lt!101319)))))))

(assert (=> d!20114 (invariant!0 (currentBit!3323 (_2!2981 lt!101319)) (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101319))))))

(assert (=> d!20114 (= (bitIndex!0 (size!1293 (buf!1674 (_2!2981 lt!101319))) (currentByte!3328 (_2!2981 lt!101319)) (currentBit!3323 (_2!2981 lt!101319))) lt!101910)))

(declare-fun b!64471 () Bool)

(declare-fun res!53515 () Bool)

(assert (=> b!64471 (=> (not res!53515) (not e!42567))))

(assert (=> b!64471 (= res!53515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101910))))

(declare-fun b!64472 () Bool)

(declare-fun lt!101911 () (_ BitVec 64))

(assert (=> b!64472 (= e!42567 (bvsle lt!101910 (bvmul lt!101911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64472 (or (= lt!101911 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101911 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101911)))))

(assert (=> b!64472 (= lt!101911 ((_ sign_extend 32) (size!1293 (buf!1674 (_2!2981 lt!101319)))))))

(assert (= (and d!20114 res!53516) b!64471))

(assert (= (and b!64471 res!53515) b!64472))

(assert (=> d!20114 m!101907))

(assert (=> d!20114 m!101817))

(assert (=> b!64168 d!20114))

(declare-fun d!20116 () Bool)

(assert (=> d!20116 (= (head!513 (byteArrayBitContentToList!0 (_2!2981 lt!101319) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!809 (byteArrayBitContentToList!0 (_2!2981 lt!101319) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64178 d!20116))

(declare-fun d!20118 () Bool)

(declare-fun c!4640 () Bool)

(assert (=> d!20118 (= c!4640 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42570 () List!694)

(assert (=> d!20118 (= (byteArrayBitContentToList!0 (_2!2981 lt!101319) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42570)))

(declare-fun b!64477 () Bool)

(assert (=> b!64477 (= e!42570 Nil!691)))

(declare-fun b!64478 () Bool)

(assert (=> b!64478 (= e!42570 (Cons!690 (not (= (bvand ((_ sign_extend 24) (select (arr!1857 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2981 lt!101319) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20118 c!4640) b!64477))

(assert (= (and d!20118 (not c!4640)) b!64478))

(assert (=> b!64478 m!101787))

(assert (=> b!64478 m!101935))

(declare-fun m!102309 () Bool)

(assert (=> b!64478 m!102309))

(assert (=> b!64178 d!20118))

(declare-fun d!20120 () Bool)

(assert (=> d!20120 (= (head!513 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101319) (_1!2982 lt!101321) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!809 (bitStreamReadBitsIntoList!0 (_2!2981 lt!101319) (_1!2982 lt!101321) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64178 d!20120))

(declare-fun b!64479 () Bool)

(declare-fun e!42571 () tuple2!5752)

(assert (=> b!64479 (= e!42571 (tuple2!5753 Nil!691 (_1!2982 lt!101321)))))

(declare-fun d!20122 () Bool)

(declare-fun e!42572 () Bool)

(assert (=> d!20122 e!42572))

(declare-fun c!4642 () Bool)

(assert (=> d!20122 (= c!4642 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101915 () List!694)

(assert (=> d!20122 (= lt!101915 (_1!2987 e!42571))))

(declare-fun c!4641 () Bool)

(assert (=> d!20122 (= c!4641 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20122 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20122 (= (bitStreamReadBitsIntoList!0 (_2!2981 lt!101319) (_1!2982 lt!101321) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101915)))

(declare-fun b!64482 () Bool)

(assert (=> b!64482 (= e!42572 (> (length!322 lt!101915) 0))))

(declare-fun b!64481 () Bool)

(assert (=> b!64481 (= e!42572 (isEmpty!198 lt!101915))))

(declare-fun b!64480 () Bool)

(declare-fun lt!101917 () (_ BitVec 64))

(declare-fun lt!101916 () tuple2!5754)

(assert (=> b!64480 (= e!42571 (tuple2!5753 (Cons!690 (_1!2988 lt!101916) (bitStreamReadBitsIntoList!0 (_2!2981 lt!101319) (_2!2988 lt!101916) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!101917))) (_2!2988 lt!101916)))))

(assert (=> b!64480 (= lt!101916 (readBit!0 (_1!2982 lt!101321)))))

(assert (=> b!64480 (= lt!101917 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20122 c!4641) b!64479))

(assert (= (and d!20122 (not c!4641)) b!64480))

(assert (= (and d!20122 c!4642) b!64481))

(assert (= (and d!20122 (not c!4642)) b!64482))

(declare-fun m!102311 () Bool)

(assert (=> b!64482 m!102311))

(declare-fun m!102313 () Bool)

(assert (=> b!64481 m!102313))

(declare-fun m!102315 () Bool)

(assert (=> b!64480 m!102315))

(declare-fun m!102317 () Bool)

(assert (=> b!64480 m!102317))

(assert (=> b!64178 d!20122))

(declare-fun d!20124 () Bool)

(assert (=> d!20124 (= (array_inv!1178 (buf!1674 thiss!1379)) (bvsge (size!1293 (buf!1674 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64167 d!20124))

(declare-fun d!20126 () Bool)

(assert (=> d!20126 (= (invariant!0 (currentBit!3323 (_2!2981 lt!101319)) (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101319)))) (and (bvsge (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (bvslt (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000001000) (bvsge (currentByte!3328 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101319)))) (and (= (currentBit!3323 (_2!2981 lt!101319)) #b00000000000000000000000000000000) (= (currentByte!3328 (_2!2981 lt!101319)) (size!1293 (buf!1674 (_2!2981 lt!101319))))))))))

(assert (=> b!64177 d!20126))

(declare-fun d!20128 () Bool)

(declare-fun e!42573 () Bool)

(assert (=> d!20128 e!42573))

(declare-fun res!53518 () Bool)

(assert (=> d!20128 (=> (not res!53518) (not e!42573))))

(declare-fun lt!101921 () (_ BitVec 64))

(declare-fun lt!101919 () (_ BitVec 64))

(declare-fun lt!101918 () (_ BitVec 64))

(assert (=> d!20128 (= res!53518 (= lt!101919 (bvsub lt!101918 lt!101921)))))

(assert (=> d!20128 (or (= (bvand lt!101918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101921 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101918 lt!101921) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20128 (= lt!101921 (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101322)))) ((_ sign_extend 32) (currentByte!3328 (_1!2982 lt!101322))) ((_ sign_extend 32) (currentBit!3323 (_1!2982 lt!101322)))))))

(declare-fun lt!101922 () (_ BitVec 64))

(declare-fun lt!101923 () (_ BitVec 64))

(assert (=> d!20128 (= lt!101918 (bvmul lt!101922 lt!101923))))

(assert (=> d!20128 (or (= lt!101922 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101923 (bvsdiv (bvmul lt!101922 lt!101923) lt!101922)))))

(assert (=> d!20128 (= lt!101923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20128 (= lt!101922 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101322)))))))

(assert (=> d!20128 (= lt!101919 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3328 (_1!2982 lt!101322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3323 (_1!2982 lt!101322)))))))

(assert (=> d!20128 (invariant!0 (currentBit!3323 (_1!2982 lt!101322)) (currentByte!3328 (_1!2982 lt!101322)) (size!1293 (buf!1674 (_1!2982 lt!101322))))))

(assert (=> d!20128 (= (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322))) lt!101919)))

(declare-fun b!64483 () Bool)

(declare-fun res!53517 () Bool)

(assert (=> b!64483 (=> (not res!53517) (not e!42573))))

(assert (=> b!64483 (= res!53517 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101919))))

(declare-fun b!64484 () Bool)

(declare-fun lt!101920 () (_ BitVec 64))

(assert (=> b!64484 (= e!42573 (bvsle lt!101919 (bvmul lt!101920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64484 (or (= lt!101920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101920)))))

(assert (=> b!64484 (= lt!101920 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101322)))))))

(assert (= (and d!20128 res!53518) b!64483))

(assert (= (and b!64483 res!53517) b!64484))

(declare-fun m!102319 () Bool)

(assert (=> d!20128 m!102319))

(declare-fun m!102321 () Bool)

(assert (=> d!20128 m!102321))

(assert (=> b!64166 d!20128))

(declare-fun d!20130 () Bool)

(declare-fun e!42574 () Bool)

(assert (=> d!20130 e!42574))

(declare-fun res!53520 () Bool)

(assert (=> d!20130 (=> (not res!53520) (not e!42574))))

(declare-fun lt!101924 () (_ BitVec 64))

(declare-fun lt!101925 () (_ BitVec 64))

(declare-fun lt!101927 () (_ BitVec 64))

(assert (=> d!20130 (= res!53520 (= lt!101925 (bvsub lt!101924 lt!101927)))))

(assert (=> d!20130 (or (= (bvand lt!101924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101924 lt!101927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20130 (= lt!101927 (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101313)))) ((_ sign_extend 32) (currentByte!3328 (_1!2982 lt!101313))) ((_ sign_extend 32) (currentBit!3323 (_1!2982 lt!101313)))))))

(declare-fun lt!101928 () (_ BitVec 64))

(declare-fun lt!101929 () (_ BitVec 64))

(assert (=> d!20130 (= lt!101924 (bvmul lt!101928 lt!101929))))

(assert (=> d!20130 (or (= lt!101928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101929 (bvsdiv (bvmul lt!101928 lt!101929) lt!101928)))))

(assert (=> d!20130 (= lt!101929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20130 (= lt!101928 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101313)))))))

(assert (=> d!20130 (= lt!101925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3328 (_1!2982 lt!101313))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3323 (_1!2982 lt!101313)))))))

(assert (=> d!20130 (invariant!0 (currentBit!3323 (_1!2982 lt!101313)) (currentByte!3328 (_1!2982 lt!101313)) (size!1293 (buf!1674 (_1!2982 lt!101313))))))

(assert (=> d!20130 (= (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101313))) (currentByte!3328 (_1!2982 lt!101313)) (currentBit!3323 (_1!2982 lt!101313))) lt!101925)))

(declare-fun b!64485 () Bool)

(declare-fun res!53519 () Bool)

(assert (=> b!64485 (=> (not res!53519) (not e!42574))))

(assert (=> b!64485 (= res!53519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101925))))

(declare-fun b!64486 () Bool)

(declare-fun lt!101926 () (_ BitVec 64))

(assert (=> b!64486 (= e!42574 (bvsle lt!101925 (bvmul lt!101926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64486 (or (= lt!101926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101926)))))

(assert (=> b!64486 (= lt!101926 ((_ sign_extend 32) (size!1293 (buf!1674 (_1!2982 lt!101313)))))))

(assert (= (and d!20130 res!53520) b!64485))

(assert (= (and b!64485 res!53519) b!64486))

(declare-fun m!102323 () Bool)

(assert (=> d!20130 m!102323))

(declare-fun m!102325 () Bool)

(assert (=> d!20130 m!102325))

(assert (=> b!64166 d!20130))

(declare-fun d!20132 () Bool)

(assert (=> d!20132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1293 (buf!1674 thiss!1379))) ((_ sign_extend 32) (currentByte!3328 thiss!1379)) ((_ sign_extend 32) (currentBit!3323 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4938 () Bool)

(assert (= bs!4938 d!20132))

(assert (=> bs!4938 m!102235))

(assert (=> b!64165 d!20132))

(declare-fun d!20134 () Bool)

(declare-fun res!53522 () Bool)

(declare-fun e!42575 () Bool)

(assert (=> d!20134 (=> (not res!53522) (not e!42575))))

(assert (=> d!20134 (= res!53522 (= (size!1293 (buf!1674 (_1!2982 lt!101322))) (size!1293 (buf!1674 (_1!2982 lt!101313)))))))

(assert (=> d!20134 (= (isPrefixOf!0 (_1!2982 lt!101322) (_1!2982 lt!101313)) e!42575)))

(declare-fun b!64487 () Bool)

(declare-fun res!53521 () Bool)

(assert (=> b!64487 (=> (not res!53521) (not e!42575))))

(assert (=> b!64487 (= res!53521 (bvsle (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322))) (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101313))) (currentByte!3328 (_1!2982 lt!101313)) (currentBit!3323 (_1!2982 lt!101313)))))))

(declare-fun b!64488 () Bool)

(declare-fun e!42576 () Bool)

(assert (=> b!64488 (= e!42575 e!42576)))

(declare-fun res!53523 () Bool)

(assert (=> b!64488 (=> res!53523 e!42576)))

(assert (=> b!64488 (= res!53523 (= (size!1293 (buf!1674 (_1!2982 lt!101322))) #b00000000000000000000000000000000))))

(declare-fun b!64489 () Bool)

(assert (=> b!64489 (= e!42576 (arrayBitRangesEq!0 (buf!1674 (_1!2982 lt!101322)) (buf!1674 (_1!2982 lt!101313)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1293 (buf!1674 (_1!2982 lt!101322))) (currentByte!3328 (_1!2982 lt!101322)) (currentBit!3323 (_1!2982 lt!101322)))))))

(assert (= (and d!20134 res!53522) b!64487))

(assert (= (and b!64487 res!53521) b!64488))

(assert (= (and b!64488 (not res!53523)) b!64489))

(assert (=> b!64487 m!101755))

(assert (=> b!64487 m!101757))

(assert (=> b!64489 m!101755))

(assert (=> b!64489 m!101755))

(declare-fun m!102327 () Bool)

(assert (=> b!64489 m!102327))

(assert (=> b!64175 d!20134))

(declare-fun d!20136 () Bool)

(declare-fun size!1295 (List!694) Int)

(assert (=> d!20136 (= (length!322 lt!101312) (size!1295 lt!101312))))

(declare-fun bs!4939 () Bool)

(assert (= bs!4939 d!20136))

(declare-fun m!102329 () Bool)

(assert (=> bs!4939 m!102329))

(assert (=> b!64164 d!20136))

(check-sat (not b!64481) (not d!20098) (not b!64247) (not b!64442) (not b!64272) (not b!64459) (not b!64415) (not d!20136) (not b!64270) (not d!20082) (not d!20078) (not b!64478) (not d!20090) (not b!64454) (not d!20080) (not b!64271) (not b!64455) (not b!64461) (not b!64249) (not b!64284) (not d!20102) (not b!64464) (not b!64275) (not b!64289) (not b!64456) (not d!19996) (not b!64468) (not d!19998) (not d!20106) (not d!19994) (not b!64489) (not b!64440) (not b!64469) (not b!64274) (not b!64470) (not b!64286) (not b!64480) (not b!64435) (not d!20100) (not b!64463) (not b!64433) (not b!64413) (not b!64434) (not b!64412) (not b!64436) (not b!64487) (not b!64460) (not d!20114) (not b!64439) (not d!20130) (not b!64411) (not b!64458) (not b!64416) (not d!20132) (not b!64252) (not b!64421) (not b!64482) (not d!20128) (not d!20076) (not b!64418) (not b!64437) (not b!64287) (not d!20112) (not d!20000) (not b!64277) (not d!20096) (not b!64276) (not b!64467) (not b!64465) (not b!64273) (not d!20094) (not b!64419) (not bm!817) (not d!20108) (not d!20006))
(check-sat)
