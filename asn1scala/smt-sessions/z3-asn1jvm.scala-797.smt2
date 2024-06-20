; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23002 () Bool)

(assert start!23002)

(declare-fun b!116774 () Bool)

(declare-fun res!96580 () Bool)

(declare-fun e!76571 () Bool)

(assert (=> b!116774 (=> (not res!96580) (not e!76571))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!116774 (= res!96580 (bvslt i!615 nBits!396))))

(declare-fun b!116776 () Bool)

(declare-fun e!76570 () Bool)

(assert (=> b!116776 (= e!76570 e!76571)))

(declare-fun res!96588 () Bool)

(assert (=> b!116776 (=> (not res!96588) (not e!76571))))

(declare-datatypes ((array!5266 0))(
  ( (array!5267 (arr!2983 (Array (_ BitVec 32) (_ BitVec 8))) (size!2390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4254 0))(
  ( (BitStream!4255 (buf!2800 array!5266) (currentByte!5437 (_ BitVec 32)) (currentBit!5432 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4254)

(declare-fun lt!178407 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116776 (= res!96588 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)) lt!178407))))

(assert (=> b!116776 (= lt!178407 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116777 () Bool)

(declare-fun e!76575 () Bool)

(declare-fun e!76572 () Bool)

(assert (=> b!116777 (= e!76575 e!76572)))

(declare-fun res!96586 () Bool)

(assert (=> b!116777 (=> (not res!96586) (not e!76572))))

(declare-fun lt!178420 () (_ BitVec 64))

(declare-fun lt!178418 () (_ BitVec 64))

(assert (=> b!116777 (= res!96586 (= lt!178420 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178418)))))

(declare-datatypes ((Unit!7185 0))(
  ( (Unit!7186) )
))
(declare-datatypes ((tuple2!9720 0))(
  ( (tuple2!9721 (_1!5125 Unit!7185) (_2!5125 BitStream!4254)) )
))
(declare-fun lt!178415 () tuple2!9720)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116777 (= lt!178420 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(assert (=> b!116777 (= lt!178418 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(declare-fun b!116778 () Bool)

(declare-fun res!96587 () Bool)

(declare-fun e!76573 () Bool)

(assert (=> b!116778 (=> (not res!96587) (not e!76573))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116778 (= res!96587 (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(declare-fun b!116779 () Bool)

(declare-fun lt!178419 () tuple2!9720)

(assert (=> b!116779 (= e!76571 (not (= (size!2390 (buf!2800 (_2!5125 lt!178415))) (size!2390 (buf!2800 (_2!5125 lt!178419))))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9722 0))(
  ( (tuple2!9723 (_1!5126 BitStream!4254) (_2!5126 (_ BitVec 64))) )
))
(declare-fun lt!178414 () tuple2!9722)

(declare-datatypes ((tuple2!9724 0))(
  ( (tuple2!9725 (_1!5127 BitStream!4254) (_2!5127 BitStream!4254)) )
))
(declare-fun lt!178409 () tuple2!9724)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9722)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116779 (= lt!178414 (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!178409) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116779 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178419)))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)) lt!178407)))

(declare-fun lt!178421 () Unit!7185)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4254 array!5266 (_ BitVec 64)) Unit!7185)

(assert (=> b!116779 (= lt!178421 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2800 (_2!5125 lt!178419)) lt!178407))))

(declare-fun lt!178410 () Bool)

(declare-datatypes ((tuple2!9726 0))(
  ( (tuple2!9727 (_1!5128 BitStream!4254) (_2!5128 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4254) tuple2!9726)

(assert (=> b!116779 (= (_2!5128 (readBitPure!0 (_1!5127 lt!178409))) lt!178410)))

(declare-fun lt!178408 () tuple2!9724)

(declare-fun reader!0 (BitStream!4254 BitStream!4254) tuple2!9724)

(assert (=> b!116779 (= lt!178408 (reader!0 (_2!5125 lt!178415) (_2!5125 lt!178419)))))

(assert (=> b!116779 (= lt!178409 (reader!0 thiss!1305 (_2!5125 lt!178419)))))

(declare-fun e!76567 () Bool)

(assert (=> b!116779 e!76567))

(declare-fun res!96579 () Bool)

(assert (=> b!116779 (=> (not res!96579) (not e!76567))))

(declare-fun lt!178417 () tuple2!9726)

(declare-fun lt!178413 () tuple2!9726)

(assert (=> b!116779 (= res!96579 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178417))) (currentByte!5437 (_1!5128 lt!178417)) (currentBit!5432 (_1!5128 lt!178417))) (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178413))) (currentByte!5437 (_1!5128 lt!178413)) (currentBit!5432 (_1!5128 lt!178413)))))))

(declare-fun lt!178412 () Unit!7185)

(declare-fun lt!178411 () BitStream!4254)

(declare-fun readBitPrefixLemma!0 (BitStream!4254 BitStream!4254) Unit!7185)

(assert (=> b!116779 (= lt!178412 (readBitPrefixLemma!0 lt!178411 (_2!5125 lt!178419)))))

(assert (=> b!116779 (= lt!178413 (readBitPure!0 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))))))

(assert (=> b!116779 (= lt!178417 (readBitPure!0 lt!178411))))

(assert (=> b!116779 (= lt!178411 (BitStream!4255 (buf!2800 (_2!5125 lt!178415)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(assert (=> b!116779 e!76573))

(declare-fun res!96583 () Bool)

(assert (=> b!116779 (=> (not res!96583) (not e!76573))))

(declare-fun isPrefixOf!0 (BitStream!4254 BitStream!4254) Bool)

(assert (=> b!116779 (= res!96583 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178419)))))

(declare-fun lt!178422 () Unit!7185)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4254 BitStream!4254 BitStream!4254) Unit!7185)

(assert (=> b!116779 (= lt!178422 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5125 lt!178415) (_2!5125 lt!178419)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4254 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9720)

(assert (=> b!116779 (= lt!178419 (appendNLeastSignificantBitsLoop!0 (_2!5125 lt!178415) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116779 e!76575))

(declare-fun res!96581 () Bool)

(assert (=> b!116779 (=> (not res!96581) (not e!76575))))

(assert (=> b!116779 (= res!96581 (= (size!2390 (buf!2800 thiss!1305)) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(declare-fun appendBit!0 (BitStream!4254 Bool) tuple2!9720)

(assert (=> b!116779 (= lt!178415 (appendBit!0 thiss!1305 lt!178410))))

(assert (=> b!116779 (= lt!178410 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116780 () Bool)

(assert (=> b!116780 (= e!76567 (= (_2!5128 lt!178417) (_2!5128 lt!178413)))))

(declare-fun b!116781 () Bool)

(declare-fun e!76569 () Bool)

(assert (=> b!116781 (= e!76572 e!76569)))

(declare-fun res!96584 () Bool)

(assert (=> b!116781 (=> (not res!96584) (not e!76569))))

(declare-fun lt!178416 () tuple2!9726)

(assert (=> b!116781 (= res!96584 (and (= (_2!5128 lt!178416) lt!178410) (= (_1!5128 lt!178416) (_2!5125 lt!178415))))))

(declare-fun readerFrom!0 (BitStream!4254 (_ BitVec 32) (_ BitVec 32)) BitStream!4254)

(assert (=> b!116781 (= lt!178416 (readBitPure!0 (readerFrom!0 (_2!5125 lt!178415) (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305))))))

(declare-fun b!116782 () Bool)

(assert (=> b!116782 (= e!76569 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178416))) (currentByte!5437 (_1!5128 lt!178416)) (currentBit!5432 (_1!5128 lt!178416))) lt!178420))))

(declare-fun b!116775 () Bool)

(declare-fun res!96582 () Bool)

(assert (=> b!116775 (=> (not res!96582) (not e!76571))))

(assert (=> b!116775 (= res!96582 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!96578 () Bool)

(assert (=> start!23002 (=> (not res!96578) (not e!76570))))

(assert (=> start!23002 (= res!96578 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23002 e!76570))

(assert (=> start!23002 true))

(declare-fun e!76568 () Bool)

(declare-fun inv!12 (BitStream!4254) Bool)

(assert (=> start!23002 (and (inv!12 thiss!1305) e!76568)))

(declare-fun b!116783 () Bool)

(declare-fun res!96585 () Bool)

(assert (=> b!116783 (=> (not res!96585) (not e!76572))))

(assert (=> b!116783 (= res!96585 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178415)))))

(declare-fun b!116784 () Bool)

(declare-fun array_inv!2192 (array!5266) Bool)

(assert (=> b!116784 (= e!76568 (array_inv!2192 (buf!2800 thiss!1305)))))

(declare-fun b!116785 () Bool)

(assert (=> b!116785 (= e!76573 (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178419)))))))

(assert (= (and start!23002 res!96578) b!116776))

(assert (= (and b!116776 res!96588) b!116775))

(assert (= (and b!116775 res!96582) b!116774))

(assert (= (and b!116774 res!96580) b!116779))

(assert (= (and b!116779 res!96581) b!116777))

(assert (= (and b!116777 res!96586) b!116783))

(assert (= (and b!116783 res!96585) b!116781))

(assert (= (and b!116781 res!96584) b!116782))

(assert (= (and b!116779 res!96583) b!116778))

(assert (= (and b!116778 res!96587) b!116785))

(assert (= (and b!116779 res!96579) b!116780))

(assert (= start!23002 b!116784))

(declare-fun m!174883 () Bool)

(assert (=> b!116775 m!174883))

(declare-fun m!174885 () Bool)

(assert (=> b!116779 m!174885))

(declare-fun m!174887 () Bool)

(assert (=> b!116779 m!174887))

(declare-fun m!174889 () Bool)

(assert (=> b!116779 m!174889))

(declare-fun m!174891 () Bool)

(assert (=> b!116779 m!174891))

(declare-fun m!174893 () Bool)

(assert (=> b!116779 m!174893))

(declare-fun m!174895 () Bool)

(assert (=> b!116779 m!174895))

(declare-fun m!174897 () Bool)

(assert (=> b!116779 m!174897))

(declare-fun m!174899 () Bool)

(assert (=> b!116779 m!174899))

(declare-fun m!174901 () Bool)

(assert (=> b!116779 m!174901))

(declare-fun m!174903 () Bool)

(assert (=> b!116779 m!174903))

(declare-fun m!174905 () Bool)

(assert (=> b!116779 m!174905))

(declare-fun m!174907 () Bool)

(assert (=> b!116779 m!174907))

(declare-fun m!174909 () Bool)

(assert (=> b!116779 m!174909))

(declare-fun m!174911 () Bool)

(assert (=> b!116779 m!174911))

(declare-fun m!174913 () Bool)

(assert (=> b!116779 m!174913))

(declare-fun m!174915 () Bool)

(assert (=> b!116779 m!174915))

(declare-fun m!174917 () Bool)

(assert (=> b!116782 m!174917))

(declare-fun m!174919 () Bool)

(assert (=> b!116783 m!174919))

(declare-fun m!174921 () Bool)

(assert (=> b!116777 m!174921))

(declare-fun m!174923 () Bool)

(assert (=> b!116777 m!174923))

(declare-fun m!174925 () Bool)

(assert (=> b!116778 m!174925))

(declare-fun m!174927 () Bool)

(assert (=> b!116781 m!174927))

(assert (=> b!116781 m!174927))

(declare-fun m!174929 () Bool)

(assert (=> b!116781 m!174929))

(declare-fun m!174931 () Bool)

(assert (=> b!116784 m!174931))

(declare-fun m!174933 () Bool)

(assert (=> b!116785 m!174933))

(declare-fun m!174935 () Bool)

(assert (=> b!116776 m!174935))

(declare-fun m!174937 () Bool)

(assert (=> start!23002 m!174937))

(check-sat (not b!116776) (not b!116778) (not b!116785) (not b!116777) (not b!116783) (not b!116781) (not b!116782) (not start!23002) (not b!116779) (not b!116775) (not b!116784))
(check-sat)
(get-model)

(declare-fun d!37352 () Bool)

(assert (=> d!37352 (= (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178419)))) (and (bvsge (currentBit!5432 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5432 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5437 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178419)))) (and (= (currentBit!5432 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178419))))))))))

(assert (=> b!116785 d!37352))

(declare-fun d!37354 () Bool)

(assert (=> d!37354 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!116775 d!37354))

(declare-fun d!37356 () Bool)

(assert (=> d!37356 (= (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178415)))) (and (bvsge (currentBit!5432 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5432 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5437 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178415)))) (and (= (currentBit!5432 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178415))))))))))

(assert (=> b!116778 d!37356))

(declare-fun d!37358 () Bool)

(assert (=> d!37358 (= (array_inv!2192 (buf!2800 thiss!1305)) (bvsge (size!2390 (buf!2800 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!116784 d!37358))

(declare-fun d!37360 () Bool)

(assert (=> d!37360 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 thiss!1305))))))

(declare-fun bs!9047 () Bool)

(assert (= bs!9047 d!37360))

(declare-fun m!174995 () Bool)

(assert (=> bs!9047 m!174995))

(assert (=> start!23002 d!37360))

(declare-fun d!37362 () Bool)

(assert (=> d!37362 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!116779 d!37362))

(declare-fun d!37364 () Bool)

(assert (=> d!37364 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178419)))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)) lt!178407)))

(declare-fun lt!178473 () Unit!7185)

(declare-fun choose!9 (BitStream!4254 array!5266 (_ BitVec 64) BitStream!4254) Unit!7185)

(assert (=> d!37364 (= lt!178473 (choose!9 thiss!1305 (buf!2800 (_2!5125 lt!178419)) lt!178407 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))))))

(assert (=> d!37364 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2800 (_2!5125 lt!178419)) lt!178407) lt!178473)))

(declare-fun bs!9048 () Bool)

(assert (= bs!9048 d!37364))

(assert (=> bs!9048 m!174895))

(declare-fun m!174997 () Bool)

(assert (=> bs!9048 m!174997))

(assert (=> b!116779 d!37364))

(declare-fun d!37366 () Bool)

(declare-fun res!96629 () Bool)

(declare-fun e!76608 () Bool)

(assert (=> d!37366 (=> (not res!96629) (not e!76608))))

(assert (=> d!37366 (= res!96629 (= (size!2390 (buf!2800 thiss!1305)) (size!2390 (buf!2800 (_2!5125 lt!178419)))))))

(assert (=> d!37366 (= (isPrefixOf!0 thiss!1305 (_2!5125 lt!178419)) e!76608)))

(declare-fun b!116828 () Bool)

(declare-fun res!96630 () Bool)

(assert (=> b!116828 (=> (not res!96630) (not e!76608))))

(assert (=> b!116828 (= res!96630 (bvsle (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178419))) (currentByte!5437 (_2!5125 lt!178419)) (currentBit!5432 (_2!5125 lt!178419)))))))

(declare-fun b!116829 () Bool)

(declare-fun e!76607 () Bool)

(assert (=> b!116829 (= e!76608 e!76607)))

(declare-fun res!96628 () Bool)

(assert (=> b!116829 (=> res!96628 e!76607)))

(assert (=> b!116829 (= res!96628 (= (size!2390 (buf!2800 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!116830 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5266 array!5266 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116830 (= e!76607 (arrayBitRangesEq!0 (buf!2800 thiss!1305) (buf!2800 (_2!5125 lt!178419)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))))))

(assert (= (and d!37366 res!96629) b!116828))

(assert (= (and b!116828 res!96630) b!116829))

(assert (= (and b!116829 (not res!96628)) b!116830))

(assert (=> b!116828 m!174923))

(declare-fun m!174999 () Bool)

(assert (=> b!116828 m!174999))

(assert (=> b!116830 m!174923))

(assert (=> b!116830 m!174923))

(declare-fun m!175001 () Bool)

(assert (=> b!116830 m!175001))

(assert (=> b!116779 d!37366))

(declare-datatypes ((tuple2!9736 0))(
  ( (tuple2!9737 (_1!5133 (_ BitVec 64)) (_2!5133 BitStream!4254)) )
))
(declare-fun lt!178476 () tuple2!9736)

(declare-fun d!37368 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9736)

(assert (=> d!37368 (= lt!178476 (readNLeastSignificantBitsLoop!0 (_1!5127 lt!178409) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37368 (= (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!178409) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9723 (_2!5133 lt!178476) (_1!5133 lt!178476)))))

(declare-fun bs!9049 () Bool)

(assert (= bs!9049 d!37368))

(declare-fun m!175003 () Bool)

(assert (=> bs!9049 m!175003))

(assert (=> b!116779 d!37368))

(declare-fun d!37370 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178419)))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)) lt!178407) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178419)))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305))) lt!178407))))

(declare-fun bs!9050 () Bool)

(assert (= bs!9050 d!37370))

(declare-fun m!175005 () Bool)

(assert (=> bs!9050 m!175005))

(assert (=> b!116779 d!37370))

(declare-fun d!37372 () Bool)

(declare-datatypes ((tuple2!9738 0))(
  ( (tuple2!9739 (_1!5134 Bool) (_2!5134 BitStream!4254)) )
))
(declare-fun lt!178479 () tuple2!9738)

(declare-fun readBit!0 (BitStream!4254) tuple2!9738)

(assert (=> d!37372 (= lt!178479 (readBit!0 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))))))

(assert (=> d!37372 (= (readBitPure!0 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))) (tuple2!9727 (_2!5134 lt!178479) (_1!5134 lt!178479)))))

(declare-fun bs!9051 () Bool)

(assert (= bs!9051 d!37372))

(declare-fun m!175007 () Bool)

(assert (=> bs!9051 m!175007))

(assert (=> b!116779 d!37372))

(declare-fun d!37374 () Bool)

(assert (=> d!37374 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178419))))

(declare-fun lt!178482 () Unit!7185)

(declare-fun choose!30 (BitStream!4254 BitStream!4254 BitStream!4254) Unit!7185)

(assert (=> d!37374 (= lt!178482 (choose!30 thiss!1305 (_2!5125 lt!178415) (_2!5125 lt!178419)))))

(assert (=> d!37374 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178415))))

(assert (=> d!37374 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5125 lt!178415) (_2!5125 lt!178419)) lt!178482)))

(declare-fun bs!9052 () Bool)

(assert (= bs!9052 d!37374))

(assert (=> bs!9052 m!174899))

(declare-fun m!175009 () Bool)

(assert (=> bs!9052 m!175009))

(assert (=> bs!9052 m!174919))

(assert (=> b!116779 d!37374))

(declare-fun b!116841 () Bool)

(declare-fun res!96637 () Bool)

(declare-fun e!76614 () Bool)

(assert (=> b!116841 (=> (not res!96637) (not e!76614))))

(declare-fun lt!178523 () tuple2!9724)

(assert (=> b!116841 (= res!96637 (isPrefixOf!0 (_2!5127 lt!178523) (_2!5125 lt!178419)))))

(declare-fun lt!178541 () (_ BitVec 64))

(declare-fun b!116842 () Bool)

(declare-fun lt!178528 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4254 (_ BitVec 64)) BitStream!4254)

(assert (=> b!116842 (= e!76614 (= (_1!5127 lt!178523) (withMovedBitIndex!0 (_2!5127 lt!178523) (bvsub lt!178541 lt!178528))))))

(assert (=> b!116842 (or (= (bvand lt!178541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178541 lt!178528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116842 (= lt!178528 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178419))) (currentByte!5437 (_2!5125 lt!178419)) (currentBit!5432 (_2!5125 lt!178419))))))

(assert (=> b!116842 (= lt!178541 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(declare-fun b!116843 () Bool)

(declare-fun e!76613 () Unit!7185)

(declare-fun lt!178542 () Unit!7185)

(assert (=> b!116843 (= e!76613 lt!178542)))

(declare-fun lt!178534 () (_ BitVec 64))

(assert (=> b!116843 (= lt!178534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!178537 () (_ BitVec 64))

(assert (=> b!116843 (= lt!178537 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5266 array!5266 (_ BitVec 64) (_ BitVec 64)) Unit!7185)

(assert (=> b!116843 (= lt!178542 (arrayBitRangesEqSymmetric!0 (buf!2800 (_2!5125 lt!178415)) (buf!2800 (_2!5125 lt!178419)) lt!178534 lt!178537))))

(assert (=> b!116843 (arrayBitRangesEq!0 (buf!2800 (_2!5125 lt!178419)) (buf!2800 (_2!5125 lt!178415)) lt!178534 lt!178537)))

(declare-fun d!37376 () Bool)

(assert (=> d!37376 e!76614))

(declare-fun res!96638 () Bool)

(assert (=> d!37376 (=> (not res!96638) (not e!76614))))

(assert (=> d!37376 (= res!96638 (isPrefixOf!0 (_1!5127 lt!178523) (_2!5127 lt!178523)))))

(declare-fun lt!178540 () BitStream!4254)

(assert (=> d!37376 (= lt!178523 (tuple2!9725 lt!178540 (_2!5125 lt!178419)))))

(declare-fun lt!178524 () Unit!7185)

(declare-fun lt!178535 () Unit!7185)

(assert (=> d!37376 (= lt!178524 lt!178535)))

(assert (=> d!37376 (isPrefixOf!0 lt!178540 (_2!5125 lt!178419))))

(assert (=> d!37376 (= lt!178535 (lemmaIsPrefixTransitive!0 lt!178540 (_2!5125 lt!178419) (_2!5125 lt!178419)))))

(declare-fun lt!178539 () Unit!7185)

(declare-fun lt!178530 () Unit!7185)

(assert (=> d!37376 (= lt!178539 lt!178530)))

(assert (=> d!37376 (isPrefixOf!0 lt!178540 (_2!5125 lt!178419))))

(assert (=> d!37376 (= lt!178530 (lemmaIsPrefixTransitive!0 lt!178540 (_2!5125 lt!178415) (_2!5125 lt!178419)))))

(declare-fun lt!178536 () Unit!7185)

(assert (=> d!37376 (= lt!178536 e!76613)))

(declare-fun c!7033 () Bool)

(assert (=> d!37376 (= c!7033 (not (= (size!2390 (buf!2800 (_2!5125 lt!178415))) #b00000000000000000000000000000000)))))

(declare-fun lt!178533 () Unit!7185)

(declare-fun lt!178529 () Unit!7185)

(assert (=> d!37376 (= lt!178533 lt!178529)))

(assert (=> d!37376 (isPrefixOf!0 (_2!5125 lt!178419) (_2!5125 lt!178419))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4254) Unit!7185)

(assert (=> d!37376 (= lt!178529 (lemmaIsPrefixRefl!0 (_2!5125 lt!178419)))))

(declare-fun lt!178531 () Unit!7185)

(declare-fun lt!178527 () Unit!7185)

(assert (=> d!37376 (= lt!178531 lt!178527)))

(assert (=> d!37376 (= lt!178527 (lemmaIsPrefixRefl!0 (_2!5125 lt!178419)))))

(declare-fun lt!178538 () Unit!7185)

(declare-fun lt!178532 () Unit!7185)

(assert (=> d!37376 (= lt!178538 lt!178532)))

(assert (=> d!37376 (isPrefixOf!0 lt!178540 lt!178540)))

(assert (=> d!37376 (= lt!178532 (lemmaIsPrefixRefl!0 lt!178540))))

(declare-fun lt!178525 () Unit!7185)

(declare-fun lt!178526 () Unit!7185)

(assert (=> d!37376 (= lt!178525 lt!178526)))

(assert (=> d!37376 (isPrefixOf!0 (_2!5125 lt!178415) (_2!5125 lt!178415))))

(assert (=> d!37376 (= lt!178526 (lemmaIsPrefixRefl!0 (_2!5125 lt!178415)))))

(assert (=> d!37376 (= lt!178540 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(assert (=> d!37376 (isPrefixOf!0 (_2!5125 lt!178415) (_2!5125 lt!178419))))

(assert (=> d!37376 (= (reader!0 (_2!5125 lt!178415) (_2!5125 lt!178419)) lt!178523)))

(declare-fun b!116844 () Bool)

(declare-fun res!96639 () Bool)

(assert (=> b!116844 (=> (not res!96639) (not e!76614))))

(assert (=> b!116844 (= res!96639 (isPrefixOf!0 (_1!5127 lt!178523) (_2!5125 lt!178415)))))

(declare-fun b!116845 () Bool)

(declare-fun Unit!7189 () Unit!7185)

(assert (=> b!116845 (= e!76613 Unit!7189)))

(assert (= (and d!37376 c!7033) b!116843))

(assert (= (and d!37376 (not c!7033)) b!116845))

(assert (= (and d!37376 res!96638) b!116844))

(assert (= (and b!116844 res!96639) b!116841))

(assert (= (and b!116841 res!96637) b!116842))

(declare-fun m!175011 () Bool)

(assert (=> d!37376 m!175011))

(declare-fun m!175013 () Bool)

(assert (=> d!37376 m!175013))

(declare-fun m!175015 () Bool)

(assert (=> d!37376 m!175015))

(declare-fun m!175017 () Bool)

(assert (=> d!37376 m!175017))

(declare-fun m!175019 () Bool)

(assert (=> d!37376 m!175019))

(declare-fun m!175021 () Bool)

(assert (=> d!37376 m!175021))

(declare-fun m!175023 () Bool)

(assert (=> d!37376 m!175023))

(declare-fun m!175025 () Bool)

(assert (=> d!37376 m!175025))

(declare-fun m!175027 () Bool)

(assert (=> d!37376 m!175027))

(declare-fun m!175029 () Bool)

(assert (=> d!37376 m!175029))

(declare-fun m!175031 () Bool)

(assert (=> d!37376 m!175031))

(declare-fun m!175033 () Bool)

(assert (=> b!116841 m!175033))

(declare-fun m!175035 () Bool)

(assert (=> b!116844 m!175035))

(assert (=> b!116843 m!174921))

(declare-fun m!175037 () Bool)

(assert (=> b!116843 m!175037))

(declare-fun m!175039 () Bool)

(assert (=> b!116843 m!175039))

(declare-fun m!175041 () Bool)

(assert (=> b!116842 m!175041))

(assert (=> b!116842 m!174999))

(assert (=> b!116842 m!174921))

(assert (=> b!116779 d!37376))

(declare-fun d!37378 () Bool)

(declare-fun e!76617 () Bool)

(assert (=> d!37378 e!76617))

(declare-fun res!96642 () Bool)

(assert (=> d!37378 (=> (not res!96642) (not e!76617))))

(declare-fun lt!178551 () tuple2!9726)

(declare-fun lt!178553 () tuple2!9726)

(assert (=> d!37378 (= res!96642 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178551))) (currentByte!5437 (_1!5128 lt!178551)) (currentBit!5432 (_1!5128 lt!178551))) (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178553))) (currentByte!5437 (_1!5128 lt!178553)) (currentBit!5432 (_1!5128 lt!178553)))))))

(declare-fun lt!178552 () BitStream!4254)

(declare-fun lt!178554 () Unit!7185)

(declare-fun choose!50 (BitStream!4254 BitStream!4254 BitStream!4254 tuple2!9726 tuple2!9726 BitStream!4254 Bool tuple2!9726 tuple2!9726 BitStream!4254 Bool) Unit!7185)

(assert (=> d!37378 (= lt!178554 (choose!50 lt!178411 (_2!5125 lt!178419) lt!178552 lt!178551 (tuple2!9727 (_1!5128 lt!178551) (_2!5128 lt!178551)) (_1!5128 lt!178551) (_2!5128 lt!178551) lt!178553 (tuple2!9727 (_1!5128 lt!178553) (_2!5128 lt!178553)) (_1!5128 lt!178553) (_2!5128 lt!178553)))))

(assert (=> d!37378 (= lt!178553 (readBitPure!0 lt!178552))))

(assert (=> d!37378 (= lt!178551 (readBitPure!0 lt!178411))))

(assert (=> d!37378 (= lt!178552 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 lt!178411) (currentBit!5432 lt!178411)))))

(assert (=> d!37378 (invariant!0 (currentBit!5432 lt!178411) (currentByte!5437 lt!178411) (size!2390 (buf!2800 (_2!5125 lt!178419))))))

(assert (=> d!37378 (= (readBitPrefixLemma!0 lt!178411 (_2!5125 lt!178419)) lt!178554)))

(declare-fun b!116848 () Bool)

(assert (=> b!116848 (= e!76617 (= (_2!5128 lt!178551) (_2!5128 lt!178553)))))

(assert (= (and d!37378 res!96642) b!116848))

(declare-fun m!175043 () Bool)

(assert (=> d!37378 m!175043))

(declare-fun m!175045 () Bool)

(assert (=> d!37378 m!175045))

(assert (=> d!37378 m!174889))

(declare-fun m!175047 () Bool)

(assert (=> d!37378 m!175047))

(declare-fun m!175049 () Bool)

(assert (=> d!37378 m!175049))

(declare-fun m!175051 () Bool)

(assert (=> d!37378 m!175051))

(assert (=> b!116779 d!37378))

(declare-fun d!37380 () Bool)

(declare-fun e!76623 () Bool)

(assert (=> d!37380 e!76623))

(declare-fun res!96654 () Bool)

(assert (=> d!37380 (=> (not res!96654) (not e!76623))))

(declare-fun lt!178564 () tuple2!9720)

(assert (=> d!37380 (= res!96654 (= (size!2390 (buf!2800 thiss!1305)) (size!2390 (buf!2800 (_2!5125 lt!178564)))))))

(declare-fun choose!16 (BitStream!4254 Bool) tuple2!9720)

(assert (=> d!37380 (= lt!178564 (choose!16 thiss!1305 lt!178410))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37380 (validate_offset_bit!0 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)))))

(assert (=> d!37380 (= (appendBit!0 thiss!1305 lt!178410) lt!178564)))

(declare-fun b!116860 () Bool)

(declare-fun e!76622 () Bool)

(assert (=> b!116860 (= e!76623 e!76622)))

(declare-fun res!96652 () Bool)

(assert (=> b!116860 (=> (not res!96652) (not e!76622))))

(declare-fun lt!178566 () tuple2!9726)

(assert (=> b!116860 (= res!96652 (and (= (_2!5128 lt!178566) lt!178410) (= (_1!5128 lt!178566) (_2!5125 lt!178564))))))

(assert (=> b!116860 (= lt!178566 (readBitPure!0 (readerFrom!0 (_2!5125 lt!178564) (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305))))))

(declare-fun b!116858 () Bool)

(declare-fun res!96651 () Bool)

(assert (=> b!116858 (=> (not res!96651) (not e!76623))))

(declare-fun lt!178565 () (_ BitVec 64))

(declare-fun lt!178563 () (_ BitVec 64))

(assert (=> b!116858 (= res!96651 (= (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178564))) (currentByte!5437 (_2!5125 lt!178564)) (currentBit!5432 (_2!5125 lt!178564))) (bvadd lt!178565 lt!178563)))))

(assert (=> b!116858 (or (not (= (bvand lt!178565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178563 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!178565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!178565 lt!178563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116858 (= lt!178563 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!116858 (= lt!178565 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(declare-fun b!116859 () Bool)

(declare-fun res!96653 () Bool)

(assert (=> b!116859 (=> (not res!96653) (not e!76623))))

(assert (=> b!116859 (= res!96653 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178564)))))

(declare-fun b!116861 () Bool)

(assert (=> b!116861 (= e!76622 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178566))) (currentByte!5437 (_1!5128 lt!178566)) (currentBit!5432 (_1!5128 lt!178566))) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178564))) (currentByte!5437 (_2!5125 lt!178564)) (currentBit!5432 (_2!5125 lt!178564)))))))

(assert (= (and d!37380 res!96654) b!116858))

(assert (= (and b!116858 res!96651) b!116859))

(assert (= (and b!116859 res!96653) b!116860))

(assert (= (and b!116860 res!96652) b!116861))

(declare-fun m!175053 () Bool)

(assert (=> d!37380 m!175053))

(declare-fun m!175055 () Bool)

(assert (=> d!37380 m!175055))

(declare-fun m!175057 () Bool)

(assert (=> b!116861 m!175057))

(declare-fun m!175059 () Bool)

(assert (=> b!116861 m!175059))

(assert (=> b!116858 m!175059))

(assert (=> b!116858 m!174923))

(declare-fun m!175061 () Bool)

(assert (=> b!116860 m!175061))

(assert (=> b!116860 m!175061))

(declare-fun m!175063 () Bool)

(assert (=> b!116860 m!175063))

(declare-fun m!175065 () Bool)

(assert (=> b!116859 m!175065))

(assert (=> b!116779 d!37380))

(declare-fun d!37382 () Bool)

(declare-fun e!76626 () Bool)

(assert (=> d!37382 e!76626))

(declare-fun res!96660 () Bool)

(assert (=> d!37382 (=> (not res!96660) (not e!76626))))

(declare-fun lt!178580 () (_ BitVec 64))

(declare-fun lt!178579 () (_ BitVec 64))

(declare-fun lt!178583 () (_ BitVec 64))

(assert (=> d!37382 (= res!96660 (= lt!178580 (bvsub lt!178579 lt!178583)))))

(assert (=> d!37382 (or (= (bvand lt!178579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178579 lt!178583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37382 (= lt!178583 (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178413)))) ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178413))) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178413)))))))

(declare-fun lt!178582 () (_ BitVec 64))

(declare-fun lt!178581 () (_ BitVec 64))

(assert (=> d!37382 (= lt!178579 (bvmul lt!178582 lt!178581))))

(assert (=> d!37382 (or (= lt!178582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178581 (bvsdiv (bvmul lt!178582 lt!178581) lt!178582)))))

(assert (=> d!37382 (= lt!178581 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37382 (= lt!178582 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178413)))))))

(assert (=> d!37382 (= lt!178580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178413))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178413)))))))

(assert (=> d!37382 (invariant!0 (currentBit!5432 (_1!5128 lt!178413)) (currentByte!5437 (_1!5128 lt!178413)) (size!2390 (buf!2800 (_1!5128 lt!178413))))))

(assert (=> d!37382 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178413))) (currentByte!5437 (_1!5128 lt!178413)) (currentBit!5432 (_1!5128 lt!178413))) lt!178580)))

(declare-fun b!116866 () Bool)

(declare-fun res!96659 () Bool)

(assert (=> b!116866 (=> (not res!96659) (not e!76626))))

(assert (=> b!116866 (= res!96659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178580))))

(declare-fun b!116867 () Bool)

(declare-fun lt!178584 () (_ BitVec 64))

(assert (=> b!116867 (= e!76626 (bvsle lt!178580 (bvmul lt!178584 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116867 (or (= lt!178584 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178584 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178584)))))

(assert (=> b!116867 (= lt!178584 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178413)))))))

(assert (= (and d!37382 res!96660) b!116866))

(assert (= (and b!116866 res!96659) b!116867))

(declare-fun m!175067 () Bool)

(assert (=> d!37382 m!175067))

(declare-fun m!175069 () Bool)

(assert (=> d!37382 m!175069))

(assert (=> b!116779 d!37382))

(declare-fun d!37384 () Bool)

(declare-fun lt!178585 () tuple2!9738)

(assert (=> d!37384 (= lt!178585 (readBit!0 (_1!5127 lt!178409)))))

(assert (=> d!37384 (= (readBitPure!0 (_1!5127 lt!178409)) (tuple2!9727 (_2!5134 lt!178585) (_1!5134 lt!178585)))))

(declare-fun bs!9053 () Bool)

(assert (= bs!9053 d!37384))

(declare-fun m!175071 () Bool)

(assert (=> bs!9053 m!175071))

(assert (=> b!116779 d!37384))

(declare-fun d!37386 () Bool)

(declare-fun lt!178586 () tuple2!9738)

(assert (=> d!37386 (= lt!178586 (readBit!0 lt!178411))))

(assert (=> d!37386 (= (readBitPure!0 lt!178411) (tuple2!9727 (_2!5134 lt!178586) (_1!5134 lt!178586)))))

(declare-fun bs!9054 () Bool)

(assert (= bs!9054 d!37386))

(declare-fun m!175073 () Bool)

(assert (=> bs!9054 m!175073))

(assert (=> b!116779 d!37386))

(declare-fun b!116868 () Bool)

(declare-fun res!96661 () Bool)

(declare-fun e!76628 () Bool)

(assert (=> b!116868 (=> (not res!96661) (not e!76628))))

(declare-fun lt!178587 () tuple2!9724)

(assert (=> b!116868 (= res!96661 (isPrefixOf!0 (_2!5127 lt!178587) (_2!5125 lt!178419)))))

(declare-fun lt!178592 () (_ BitVec 64))

(declare-fun lt!178605 () (_ BitVec 64))

(declare-fun b!116869 () Bool)

(assert (=> b!116869 (= e!76628 (= (_1!5127 lt!178587) (withMovedBitIndex!0 (_2!5127 lt!178587) (bvsub lt!178605 lt!178592))))))

(assert (=> b!116869 (or (= (bvand lt!178605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178605 lt!178592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116869 (= lt!178592 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178419))) (currentByte!5437 (_2!5125 lt!178419)) (currentBit!5432 (_2!5125 lt!178419))))))

(assert (=> b!116869 (= lt!178605 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(declare-fun b!116870 () Bool)

(declare-fun e!76627 () Unit!7185)

(declare-fun lt!178606 () Unit!7185)

(assert (=> b!116870 (= e!76627 lt!178606)))

(declare-fun lt!178598 () (_ BitVec 64))

(assert (=> b!116870 (= lt!178598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!178601 () (_ BitVec 64))

(assert (=> b!116870 (= lt!178601 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(assert (=> b!116870 (= lt!178606 (arrayBitRangesEqSymmetric!0 (buf!2800 thiss!1305) (buf!2800 (_2!5125 lt!178419)) lt!178598 lt!178601))))

(assert (=> b!116870 (arrayBitRangesEq!0 (buf!2800 (_2!5125 lt!178419)) (buf!2800 thiss!1305) lt!178598 lt!178601)))

(declare-fun d!37388 () Bool)

(assert (=> d!37388 e!76628))

(declare-fun res!96662 () Bool)

(assert (=> d!37388 (=> (not res!96662) (not e!76628))))

(assert (=> d!37388 (= res!96662 (isPrefixOf!0 (_1!5127 lt!178587) (_2!5127 lt!178587)))))

(declare-fun lt!178604 () BitStream!4254)

(assert (=> d!37388 (= lt!178587 (tuple2!9725 lt!178604 (_2!5125 lt!178419)))))

(declare-fun lt!178588 () Unit!7185)

(declare-fun lt!178599 () Unit!7185)

(assert (=> d!37388 (= lt!178588 lt!178599)))

(assert (=> d!37388 (isPrefixOf!0 lt!178604 (_2!5125 lt!178419))))

(assert (=> d!37388 (= lt!178599 (lemmaIsPrefixTransitive!0 lt!178604 (_2!5125 lt!178419) (_2!5125 lt!178419)))))

(declare-fun lt!178603 () Unit!7185)

(declare-fun lt!178594 () Unit!7185)

(assert (=> d!37388 (= lt!178603 lt!178594)))

(assert (=> d!37388 (isPrefixOf!0 lt!178604 (_2!5125 lt!178419))))

(assert (=> d!37388 (= lt!178594 (lemmaIsPrefixTransitive!0 lt!178604 thiss!1305 (_2!5125 lt!178419)))))

(declare-fun lt!178600 () Unit!7185)

(assert (=> d!37388 (= lt!178600 e!76627)))

(declare-fun c!7034 () Bool)

(assert (=> d!37388 (= c!7034 (not (= (size!2390 (buf!2800 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!178597 () Unit!7185)

(declare-fun lt!178593 () Unit!7185)

(assert (=> d!37388 (= lt!178597 lt!178593)))

(assert (=> d!37388 (isPrefixOf!0 (_2!5125 lt!178419) (_2!5125 lt!178419))))

(assert (=> d!37388 (= lt!178593 (lemmaIsPrefixRefl!0 (_2!5125 lt!178419)))))

(declare-fun lt!178595 () Unit!7185)

(declare-fun lt!178591 () Unit!7185)

(assert (=> d!37388 (= lt!178595 lt!178591)))

(assert (=> d!37388 (= lt!178591 (lemmaIsPrefixRefl!0 (_2!5125 lt!178419)))))

(declare-fun lt!178602 () Unit!7185)

(declare-fun lt!178596 () Unit!7185)

(assert (=> d!37388 (= lt!178602 lt!178596)))

(assert (=> d!37388 (isPrefixOf!0 lt!178604 lt!178604)))

(assert (=> d!37388 (= lt!178596 (lemmaIsPrefixRefl!0 lt!178604))))

(declare-fun lt!178589 () Unit!7185)

(declare-fun lt!178590 () Unit!7185)

(assert (=> d!37388 (= lt!178589 lt!178590)))

(assert (=> d!37388 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37388 (= lt!178590 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37388 (= lt!178604 (BitStream!4255 (buf!2800 (_2!5125 lt!178419)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(assert (=> d!37388 (isPrefixOf!0 thiss!1305 (_2!5125 lt!178419))))

(assert (=> d!37388 (= (reader!0 thiss!1305 (_2!5125 lt!178419)) lt!178587)))

(declare-fun b!116871 () Bool)

(declare-fun res!96663 () Bool)

(assert (=> b!116871 (=> (not res!96663) (not e!76628))))

(assert (=> b!116871 (= res!96663 (isPrefixOf!0 (_1!5127 lt!178587) thiss!1305))))

(declare-fun b!116872 () Bool)

(declare-fun Unit!7190 () Unit!7185)

(assert (=> b!116872 (= e!76627 Unit!7190)))

(assert (= (and d!37388 c!7034) b!116870))

(assert (= (and d!37388 (not c!7034)) b!116872))

(assert (= (and d!37388 res!96662) b!116871))

(assert (= (and b!116871 res!96663) b!116868))

(assert (= (and b!116868 res!96661) b!116869))

(declare-fun m!175075 () Bool)

(assert (=> d!37388 m!175075))

(declare-fun m!175077 () Bool)

(assert (=> d!37388 m!175077))

(declare-fun m!175079 () Bool)

(assert (=> d!37388 m!175079))

(declare-fun m!175081 () Bool)

(assert (=> d!37388 m!175081))

(declare-fun m!175083 () Bool)

(assert (=> d!37388 m!175083))

(assert (=> d!37388 m!175021))

(declare-fun m!175085 () Bool)

(assert (=> d!37388 m!175085))

(declare-fun m!175087 () Bool)

(assert (=> d!37388 m!175087))

(assert (=> d!37388 m!175027))

(assert (=> d!37388 m!174899))

(declare-fun m!175089 () Bool)

(assert (=> d!37388 m!175089))

(declare-fun m!175091 () Bool)

(assert (=> b!116868 m!175091))

(declare-fun m!175093 () Bool)

(assert (=> b!116871 m!175093))

(assert (=> b!116870 m!174923))

(declare-fun m!175095 () Bool)

(assert (=> b!116870 m!175095))

(declare-fun m!175097 () Bool)

(assert (=> b!116870 m!175097))

(declare-fun m!175099 () Bool)

(assert (=> b!116869 m!175099))

(assert (=> b!116869 m!174999))

(assert (=> b!116869 m!174923))

(assert (=> b!116779 d!37388))

(declare-fun b!117017 () Bool)

(declare-fun e!76711 () (_ BitVec 64))

(assert (=> b!117017 (= e!76711 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!117018 () Bool)

(declare-fun e!76710 () Bool)

(declare-fun lt!179000 () tuple2!9726)

(declare-fun lt!179027 () tuple2!9726)

(assert (=> b!117018 (= e!76710 (= (_2!5128 lt!179000) (_2!5128 lt!179027)))))

(declare-fun b!117019 () Bool)

(declare-fun res!96789 () Bool)

(declare-fun e!76708 () Bool)

(assert (=> b!117019 (=> (not res!96789) (not e!76708))))

(declare-fun lt!179005 () tuple2!9720)

(assert (=> b!117019 (= res!96789 (isPrefixOf!0 (_2!5125 lt!178415) (_2!5125 lt!179005)))))

(declare-fun lt!179008 () tuple2!9720)

(declare-fun bm!1508 () Bool)

(declare-fun c!7047 () Bool)

(declare-fun lt!179014 () BitStream!4254)

(declare-fun call!1511 () Bool)

(assert (=> bm!1508 (= call!1511 (isPrefixOf!0 (ite c!7047 (_2!5125 lt!178415) lt!179014) (ite c!7047 (_2!5125 lt!179008) lt!179014)))))

(declare-fun b!117020 () Bool)

(declare-fun res!96786 () Bool)

(declare-fun lt!179003 () tuple2!9720)

(assert (=> b!117020 (= res!96786 (= (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179003))) (currentByte!5437 (_2!5125 lt!179003)) (currentBit!5432 (_2!5125 lt!179003))) (bvadd (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!76712 () Bool)

(assert (=> b!117020 (=> (not res!96786) (not e!76712))))

(declare-fun b!117021 () Bool)

(declare-fun e!76709 () tuple2!9720)

(declare-fun lt!179007 () Unit!7185)

(assert (=> b!117021 (= e!76709 (tuple2!9721 lt!179007 (_2!5125 lt!178415)))))

(assert (=> b!117021 (= lt!179014 (_2!5125 lt!178415))))

(assert (=> b!117021 (= lt!179007 (lemmaIsPrefixRefl!0 lt!179014))))

(assert (=> b!117021 call!1511))

(declare-fun b!117022 () Bool)

(declare-fun Unit!7191 () Unit!7185)

(assert (=> b!117022 (= e!76709 (tuple2!9721 Unit!7191 (_2!5125 lt!179008)))))

(declare-fun lt!178991 () Bool)

(assert (=> b!117022 (= lt!178991 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117022 (= lt!179003 (appendBit!0 (_2!5125 lt!178415) lt!178991))))

(declare-fun res!96788 () Bool)

(assert (=> b!117022 (= res!96788 (= (size!2390 (buf!2800 (_2!5125 lt!178415))) (size!2390 (buf!2800 (_2!5125 lt!179003)))))))

(assert (=> b!117022 (=> (not res!96788) (not e!76712))))

(assert (=> b!117022 e!76712))

(declare-fun lt!179006 () tuple2!9720)

(assert (=> b!117022 (= lt!179006 lt!179003)))

(assert (=> b!117022 (= lt!179008 (appendNLeastSignificantBitsLoop!0 (_2!5125 lt!179006) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!179019 () Unit!7185)

(assert (=> b!117022 (= lt!179019 (lemmaIsPrefixTransitive!0 (_2!5125 lt!178415) (_2!5125 lt!179006) (_2!5125 lt!179008)))))

(assert (=> b!117022 call!1511))

(declare-fun lt!179024 () Unit!7185)

(assert (=> b!117022 (= lt!179024 lt!179019)))

(assert (=> b!117022 (invariant!0 (currentBit!5432 (_2!5125 lt!178415)) (currentByte!5437 (_2!5125 lt!178415)) (size!2390 (buf!2800 (_2!5125 lt!179006))))))

(declare-fun lt!179009 () BitStream!4254)

(assert (=> b!117022 (= lt!179009 (BitStream!4255 (buf!2800 (_2!5125 lt!179006)) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(assert (=> b!117022 (invariant!0 (currentBit!5432 lt!179009) (currentByte!5437 lt!179009) (size!2390 (buf!2800 (_2!5125 lt!179008))))))

(declare-fun lt!179017 () BitStream!4254)

(assert (=> b!117022 (= lt!179017 (BitStream!4255 (buf!2800 (_2!5125 lt!179008)) (currentByte!5437 lt!179009) (currentBit!5432 lt!179009)))))

(assert (=> b!117022 (= lt!179000 (readBitPure!0 lt!179009))))

(assert (=> b!117022 (= lt!179027 (readBitPure!0 lt!179017))))

(declare-fun lt!179026 () Unit!7185)

(assert (=> b!117022 (= lt!179026 (readBitPrefixLemma!0 lt!179009 (_2!5125 lt!179008)))))

(declare-fun res!96793 () Bool)

(assert (=> b!117022 (= res!96793 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!179000))) (currentByte!5437 (_1!5128 lt!179000)) (currentBit!5432 (_1!5128 lt!179000))) (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!179027))) (currentByte!5437 (_1!5128 lt!179027)) (currentBit!5432 (_1!5128 lt!179027)))))))

(assert (=> b!117022 (=> (not res!96793) (not e!76710))))

(assert (=> b!117022 e!76710))

(declare-fun lt!179018 () Unit!7185)

(assert (=> b!117022 (= lt!179018 lt!179026)))

(declare-fun lt!179025 () tuple2!9724)

(assert (=> b!117022 (= lt!179025 (reader!0 (_2!5125 lt!178415) (_2!5125 lt!179008)))))

(declare-fun lt!179020 () tuple2!9724)

(assert (=> b!117022 (= lt!179020 (reader!0 (_2!5125 lt!179006) (_2!5125 lt!179008)))))

(declare-fun lt!179028 () tuple2!9726)

(assert (=> b!117022 (= lt!179028 (readBitPure!0 (_1!5127 lt!179025)))))

(assert (=> b!117022 (= (_2!5128 lt!179028) lt!178991)))

(declare-fun lt!179010 () Unit!7185)

(declare-fun Unit!7192 () Unit!7185)

(assert (=> b!117022 (= lt!179010 Unit!7192)))

(declare-fun lt!178986 () (_ BitVec 64))

(assert (=> b!117022 (= lt!178986 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!179015 () (_ BitVec 64))

(assert (=> b!117022 (= lt!179015 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!179030 () Unit!7185)

(assert (=> b!117022 (= lt!179030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5125 lt!178415) (buf!2800 (_2!5125 lt!179008)) lt!179015))))

(assert (=> b!117022 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!179008)))) ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!178415))) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!178415))) lt!179015)))

(declare-fun lt!179021 () Unit!7185)

(assert (=> b!117022 (= lt!179021 lt!179030)))

(declare-fun lt!178996 () tuple2!9722)

(assert (=> b!117022 (= lt!178996 (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!179025) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!178986))))

(declare-fun lt!178997 () (_ BitVec 64))

(assert (=> b!117022 (= lt!178997 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!179001 () Unit!7185)

(assert (=> b!117022 (= lt!179001 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5125 lt!179006) (buf!2800 (_2!5125 lt!179008)) lt!178997))))

(assert (=> b!117022 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!179008)))) ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!179006))) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!179006))) lt!178997)))

(declare-fun lt!179002 () Unit!7185)

(assert (=> b!117022 (= lt!179002 lt!179001)))

(declare-fun lt!179012 () tuple2!9722)

(assert (=> b!117022 (= lt!179012 (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!179020) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!178986 (ite (_2!5128 lt!179028) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!178992 () tuple2!9722)

(assert (=> b!117022 (= lt!178992 (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!179025) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!178986))))

(declare-fun c!7046 () Bool)

(assert (=> b!117022 (= c!7046 (_2!5128 (readBitPure!0 (_1!5127 lt!179025))))))

(declare-fun lt!178988 () tuple2!9722)

(assert (=> b!117022 (= lt!178988 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5127 lt!179025) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!178986 e!76711)))))

(declare-fun lt!179011 () Unit!7185)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7185)

(assert (=> b!117022 (= lt!179011 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5127 lt!179025) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!178986))))

(assert (=> b!117022 (and (= (_2!5126 lt!178992) (_2!5126 lt!178988)) (= (_1!5126 lt!178992) (_1!5126 lt!178988)))))

(declare-fun lt!179016 () Unit!7185)

(assert (=> b!117022 (= lt!179016 lt!179011)))

(assert (=> b!117022 (= (_1!5127 lt!179025) (withMovedBitIndex!0 (_2!5127 lt!179025) (bvsub (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179008))) (currentByte!5437 (_2!5125 lt!179008)) (currentBit!5432 (_2!5125 lt!179008))))))))

(declare-fun lt!179013 () Unit!7185)

(declare-fun Unit!7193 () Unit!7185)

(assert (=> b!117022 (= lt!179013 Unit!7193)))

(assert (=> b!117022 (= (_1!5127 lt!179020) (withMovedBitIndex!0 (_2!5127 lt!179020) (bvsub (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179006))) (currentByte!5437 (_2!5125 lt!179006)) (currentBit!5432 (_2!5125 lt!179006))) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179008))) (currentByte!5437 (_2!5125 lt!179008)) (currentBit!5432 (_2!5125 lt!179008))))))))

(declare-fun lt!178990 () Unit!7185)

(declare-fun Unit!7194 () Unit!7185)

(assert (=> b!117022 (= lt!178990 Unit!7194)))

(assert (=> b!117022 (= (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))) (bvsub (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179006))) (currentByte!5437 (_2!5125 lt!179006)) (currentBit!5432 (_2!5125 lt!179006))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!178993 () Unit!7185)

(declare-fun Unit!7195 () Unit!7185)

(assert (=> b!117022 (= lt!178993 Unit!7195)))

(assert (=> b!117022 (= (_2!5126 lt!178996) (_2!5126 lt!179012))))

(declare-fun lt!179029 () Unit!7185)

(declare-fun Unit!7196 () Unit!7185)

(assert (=> b!117022 (= lt!179029 Unit!7196)))

(assert (=> b!117022 (= (_1!5126 lt!178996) (_2!5127 lt!179025))))

(declare-fun b!117023 () Bool)

(declare-fun res!96787 () Bool)

(assert (=> b!117023 (=> (not res!96787) (not e!76708))))

(declare-fun lt!178999 () (_ BitVec 64))

(declare-fun lt!179004 () (_ BitVec 64))

(assert (=> b!117023 (= res!96787 (= (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179005))) (currentByte!5437 (_2!5125 lt!179005)) (currentBit!5432 (_2!5125 lt!179005))) (bvadd lt!179004 lt!178999)))))

(assert (=> b!117023 (or (not (= (bvand lt!179004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178999 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!179004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!179004 lt!178999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117023 (= lt!178999 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117023 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117023 (= lt!179004 (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))))))

(declare-fun b!117024 () Bool)

(declare-fun lt!179023 () tuple2!9722)

(declare-fun lt!178987 () tuple2!9724)

(assert (=> b!117024 (= e!76708 (and (= (_2!5126 lt!179023) v!199) (= (_1!5126 lt!179023) (_2!5127 lt!178987))))))

(declare-fun lt!178995 () (_ BitVec 64))

(assert (=> b!117024 (= lt!179023 (readNLeastSignificantBitsLoopPure!0 (_1!5127 lt!178987) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!178995))))

(declare-fun lt!178998 () Unit!7185)

(declare-fun lt!179022 () Unit!7185)

(assert (=> b!117024 (= lt!178998 lt!179022)))

(declare-fun lt!178994 () (_ BitVec 64))

(assert (=> b!117024 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!179005)))) ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!178415))) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!178415))) lt!178994)))

(assert (=> b!117024 (= lt!179022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5125 lt!178415) (buf!2800 (_2!5125 lt!179005)) lt!178994))))

(declare-fun e!76713 () Bool)

(assert (=> b!117024 e!76713))

(declare-fun res!96791 () Bool)

(assert (=> b!117024 (=> (not res!96791) (not e!76713))))

(assert (=> b!117024 (= res!96791 (and (= (size!2390 (buf!2800 (_2!5125 lt!178415))) (size!2390 (buf!2800 (_2!5125 lt!179005)))) (bvsge lt!178994 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117024 (= lt!178994 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117024 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117024 (= lt!178995 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117024 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117024 (= lt!178987 (reader!0 (_2!5125 lt!178415) (_2!5125 lt!179005)))))

(declare-fun b!117025 () Bool)

(declare-fun e!76707 () Bool)

(declare-fun lt!178989 () tuple2!9726)

(assert (=> b!117025 (= e!76707 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178989))) (currentByte!5437 (_1!5128 lt!178989)) (currentBit!5432 (_1!5128 lt!178989))) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!179003))) (currentByte!5437 (_2!5125 lt!179003)) (currentBit!5432 (_2!5125 lt!179003)))))))

(declare-fun b!117027 () Bool)

(assert (=> b!117027 (= e!76711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!37390 () Bool)

(assert (=> d!37390 e!76708))

(declare-fun res!96790 () Bool)

(assert (=> d!37390 (=> (not res!96790) (not e!76708))))

(assert (=> d!37390 (= res!96790 (= (size!2390 (buf!2800 (_2!5125 lt!178415))) (size!2390 (buf!2800 (_2!5125 lt!179005)))))))

(assert (=> d!37390 (= lt!179005 e!76709)))

(assert (=> d!37390 (= c!7047 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37390 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37390 (= (appendNLeastSignificantBitsLoop!0 (_2!5125 lt!178415) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!179005)))

(declare-fun b!117026 () Bool)

(assert (=> b!117026 (= e!76713 (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178415)))) ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!178415))) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!178415))) lt!178994))))

(declare-fun b!117028 () Bool)

(declare-fun res!96794 () Bool)

(assert (=> b!117028 (= res!96794 (isPrefixOf!0 (_2!5125 lt!178415) (_2!5125 lt!179003)))))

(assert (=> b!117028 (=> (not res!96794) (not e!76712))))

(declare-fun b!117029 () Bool)

(assert (=> b!117029 (= lt!178989 (readBitPure!0 (readerFrom!0 (_2!5125 lt!179003) (currentBit!5432 (_2!5125 lt!178415)) (currentByte!5437 (_2!5125 lt!178415)))))))

(declare-fun res!96792 () Bool)

(assert (=> b!117029 (= res!96792 (and (= (_2!5128 lt!178989) lt!178991) (= (_1!5128 lt!178989) (_2!5125 lt!179003))))))

(assert (=> b!117029 (=> (not res!96792) (not e!76707))))

(assert (=> b!117029 (= e!76712 e!76707)))

(assert (= (and d!37390 c!7047) b!117022))

(assert (= (and d!37390 (not c!7047)) b!117021))

(assert (= (and b!117022 res!96788) b!117020))

(assert (= (and b!117020 res!96786) b!117028))

(assert (= (and b!117028 res!96794) b!117029))

(assert (= (and b!117029 res!96792) b!117025))

(assert (= (and b!117022 res!96793) b!117018))

(assert (= (and b!117022 c!7046) b!117017))

(assert (= (and b!117022 (not c!7046)) b!117027))

(assert (= (or b!117022 b!117021) bm!1508))

(assert (= (and d!37390 res!96790) b!117023))

(assert (= (and b!117023 res!96787) b!117019))

(assert (= (and b!117019 res!96789) b!117024))

(assert (= (and b!117024 res!96791) b!117026))

(declare-fun m!175317 () Bool)

(assert (=> b!117028 m!175317))

(declare-fun m!175319 () Bool)

(assert (=> b!117021 m!175319))

(declare-fun m!175321 () Bool)

(assert (=> bm!1508 m!175321))

(declare-fun m!175323 () Bool)

(assert (=> b!117022 m!175323))

(declare-fun m!175325 () Bool)

(assert (=> b!117022 m!175325))

(declare-fun m!175327 () Bool)

(assert (=> b!117022 m!175327))

(declare-fun m!175329 () Bool)

(assert (=> b!117022 m!175329))

(declare-fun m!175331 () Bool)

(assert (=> b!117022 m!175331))

(declare-fun m!175333 () Bool)

(assert (=> b!117022 m!175333))

(declare-fun m!175335 () Bool)

(assert (=> b!117022 m!175335))

(declare-fun m!175337 () Bool)

(assert (=> b!117022 m!175337))

(declare-fun m!175339 () Bool)

(assert (=> b!117022 m!175339))

(declare-fun m!175341 () Bool)

(assert (=> b!117022 m!175341))

(declare-fun m!175343 () Bool)

(assert (=> b!117022 m!175343))

(declare-fun m!175345 () Bool)

(assert (=> b!117022 m!175345))

(declare-fun m!175347 () Bool)

(assert (=> b!117022 m!175347))

(assert (=> b!117022 m!174921))

(declare-fun m!175349 () Bool)

(assert (=> b!117022 m!175349))

(declare-fun m!175351 () Bool)

(assert (=> b!117022 m!175351))

(declare-fun m!175353 () Bool)

(assert (=> b!117022 m!175353))

(declare-fun m!175355 () Bool)

(assert (=> b!117022 m!175355))

(declare-fun m!175357 () Bool)

(assert (=> b!117022 m!175357))

(assert (=> b!117022 m!175343))

(declare-fun m!175359 () Bool)

(assert (=> b!117022 m!175359))

(declare-fun m!175361 () Bool)

(assert (=> b!117022 m!175361))

(declare-fun m!175363 () Bool)

(assert (=> b!117022 m!175363))

(declare-fun m!175365 () Bool)

(assert (=> b!117022 m!175365))

(declare-fun m!175367 () Bool)

(assert (=> b!117022 m!175367))

(declare-fun m!175369 () Bool)

(assert (=> b!117022 m!175369))

(declare-fun m!175371 () Bool)

(assert (=> b!117022 m!175371))

(declare-fun m!175373 () Bool)

(assert (=> b!117022 m!175373))

(declare-fun m!175375 () Bool)

(assert (=> b!117022 m!175375))

(declare-fun m!175377 () Bool)

(assert (=> b!117020 m!175377))

(assert (=> b!117020 m!174921))

(declare-fun m!175379 () Bool)

(assert (=> b!117023 m!175379))

(assert (=> b!117023 m!174921))

(declare-fun m!175381 () Bool)

(assert (=> b!117025 m!175381))

(assert (=> b!117025 m!175377))

(declare-fun m!175383 () Bool)

(assert (=> b!117019 m!175383))

(declare-fun m!175385 () Bool)

(assert (=> b!117026 m!175385))

(declare-fun m!175387 () Bool)

(assert (=> b!117029 m!175387))

(assert (=> b!117029 m!175387))

(declare-fun m!175389 () Bool)

(assert (=> b!117029 m!175389))

(declare-fun m!175391 () Bool)

(assert (=> b!117024 m!175391))

(assert (=> b!117024 m!175339))

(declare-fun m!175393 () Bool)

(assert (=> b!117024 m!175393))

(declare-fun m!175395 () Bool)

(assert (=> b!117024 m!175395))

(declare-fun m!175397 () Bool)

(assert (=> b!117024 m!175397))

(assert (=> b!116779 d!37390))

(declare-fun d!37482 () Bool)

(declare-fun e!76714 () Bool)

(assert (=> d!37482 e!76714))

(declare-fun res!96796 () Bool)

(assert (=> d!37482 (=> (not res!96796) (not e!76714))))

(declare-fun lt!179032 () (_ BitVec 64))

(declare-fun lt!179031 () (_ BitVec 64))

(declare-fun lt!179035 () (_ BitVec 64))

(assert (=> d!37482 (= res!96796 (= lt!179032 (bvsub lt!179031 lt!179035)))))

(assert (=> d!37482 (or (= (bvand lt!179031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179031 lt!179035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37482 (= lt!179035 (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178417)))) ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178417))) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178417)))))))

(declare-fun lt!179034 () (_ BitVec 64))

(declare-fun lt!179033 () (_ BitVec 64))

(assert (=> d!37482 (= lt!179031 (bvmul lt!179034 lt!179033))))

(assert (=> d!37482 (or (= lt!179034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179033 (bvsdiv (bvmul lt!179034 lt!179033) lt!179034)))))

(assert (=> d!37482 (= lt!179033 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37482 (= lt!179034 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178417)))))))

(assert (=> d!37482 (= lt!179032 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178417))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178417)))))))

(assert (=> d!37482 (invariant!0 (currentBit!5432 (_1!5128 lt!178417)) (currentByte!5437 (_1!5128 lt!178417)) (size!2390 (buf!2800 (_1!5128 lt!178417))))))

(assert (=> d!37482 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178417))) (currentByte!5437 (_1!5128 lt!178417)) (currentBit!5432 (_1!5128 lt!178417))) lt!179032)))

(declare-fun b!117030 () Bool)

(declare-fun res!96795 () Bool)

(assert (=> b!117030 (=> (not res!96795) (not e!76714))))

(assert (=> b!117030 (= res!96795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179032))))

(declare-fun b!117031 () Bool)

(declare-fun lt!179036 () (_ BitVec 64))

(assert (=> b!117031 (= e!76714 (bvsle lt!179032 (bvmul lt!179036 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117031 (or (= lt!179036 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179036 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179036)))))

(assert (=> b!117031 (= lt!179036 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178417)))))))

(assert (= (and d!37482 res!96796) b!117030))

(assert (= (and b!117030 res!96795) b!117031))

(declare-fun m!175399 () Bool)

(assert (=> d!37482 m!175399))

(declare-fun m!175401 () Bool)

(assert (=> d!37482 m!175401))

(assert (=> b!116779 d!37482))

(declare-fun d!37484 () Bool)

(declare-fun e!76715 () Bool)

(assert (=> d!37484 e!76715))

(declare-fun res!96798 () Bool)

(assert (=> d!37484 (=> (not res!96798) (not e!76715))))

(declare-fun lt!179041 () (_ BitVec 64))

(declare-fun lt!179037 () (_ BitVec 64))

(declare-fun lt!179038 () (_ BitVec 64))

(assert (=> d!37484 (= res!96798 (= lt!179038 (bvsub lt!179037 lt!179041)))))

(assert (=> d!37484 (or (= (bvand lt!179037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179037 lt!179041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37484 (= lt!179041 (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178416)))) ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178416))) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178416)))))))

(declare-fun lt!179040 () (_ BitVec 64))

(declare-fun lt!179039 () (_ BitVec 64))

(assert (=> d!37484 (= lt!179037 (bvmul lt!179040 lt!179039))))

(assert (=> d!37484 (or (= lt!179040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179039 (bvsdiv (bvmul lt!179040 lt!179039) lt!179040)))))

(assert (=> d!37484 (= lt!179039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37484 (= lt!179040 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178416)))))))

(assert (=> d!37484 (= lt!179038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5437 (_1!5128 lt!178416))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5432 (_1!5128 lt!178416)))))))

(assert (=> d!37484 (invariant!0 (currentBit!5432 (_1!5128 lt!178416)) (currentByte!5437 (_1!5128 lt!178416)) (size!2390 (buf!2800 (_1!5128 lt!178416))))))

(assert (=> d!37484 (= (bitIndex!0 (size!2390 (buf!2800 (_1!5128 lt!178416))) (currentByte!5437 (_1!5128 lt!178416)) (currentBit!5432 (_1!5128 lt!178416))) lt!179038)))

(declare-fun b!117032 () Bool)

(declare-fun res!96797 () Bool)

(assert (=> b!117032 (=> (not res!96797) (not e!76715))))

(assert (=> b!117032 (= res!96797 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179038))))

(declare-fun b!117033 () Bool)

(declare-fun lt!179042 () (_ BitVec 64))

(assert (=> b!117033 (= e!76715 (bvsle lt!179038 (bvmul lt!179042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117033 (or (= lt!179042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179042)))))

(assert (=> b!117033 (= lt!179042 ((_ sign_extend 32) (size!2390 (buf!2800 (_1!5128 lt!178416)))))))

(assert (= (and d!37484 res!96798) b!117032))

(assert (= (and b!117032 res!96797) b!117033))

(declare-fun m!175403 () Bool)

(assert (=> d!37484 m!175403))

(declare-fun m!175405 () Bool)

(assert (=> d!37484 m!175405))

(assert (=> b!116782 d!37484))

(declare-fun d!37486 () Bool)

(declare-fun e!76716 () Bool)

(assert (=> d!37486 e!76716))

(declare-fun res!96800 () Bool)

(assert (=> d!37486 (=> (not res!96800) (not e!76716))))

(declare-fun lt!179047 () (_ BitVec 64))

(declare-fun lt!179044 () (_ BitVec 64))

(declare-fun lt!179043 () (_ BitVec 64))

(assert (=> d!37486 (= res!96800 (= lt!179044 (bvsub lt!179043 lt!179047)))))

(assert (=> d!37486 (or (= (bvand lt!179043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179043 lt!179047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37486 (= lt!179047 (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178415)))) ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!178415))) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!178415)))))))

(declare-fun lt!179046 () (_ BitVec 64))

(declare-fun lt!179045 () (_ BitVec 64))

(assert (=> d!37486 (= lt!179043 (bvmul lt!179046 lt!179045))))

(assert (=> d!37486 (or (= lt!179046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179045 (bvsdiv (bvmul lt!179046 lt!179045) lt!179046)))))

(assert (=> d!37486 (= lt!179045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37486 (= lt!179046 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(assert (=> d!37486 (= lt!179044 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5437 (_2!5125 lt!178415))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5432 (_2!5125 lt!178415)))))))

(assert (=> d!37486 (invariant!0 (currentBit!5432 (_2!5125 lt!178415)) (currentByte!5437 (_2!5125 lt!178415)) (size!2390 (buf!2800 (_2!5125 lt!178415))))))

(assert (=> d!37486 (= (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415))) lt!179044)))

(declare-fun b!117034 () Bool)

(declare-fun res!96799 () Bool)

(assert (=> b!117034 (=> (not res!96799) (not e!76716))))

(assert (=> b!117034 (= res!96799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179044))))

(declare-fun b!117035 () Bool)

(declare-fun lt!179048 () (_ BitVec 64))

(assert (=> b!117035 (= e!76716 (bvsle lt!179044 (bvmul lt!179048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117035 (or (= lt!179048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179048)))))

(assert (=> b!117035 (= lt!179048 ((_ sign_extend 32) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(assert (= (and d!37486 res!96800) b!117034))

(assert (= (and b!117034 res!96799) b!117035))

(declare-fun m!175407 () Bool)

(assert (=> d!37486 m!175407))

(declare-fun m!175409 () Bool)

(assert (=> d!37486 m!175409))

(assert (=> b!116777 d!37486))

(declare-fun d!37488 () Bool)

(declare-fun e!76717 () Bool)

(assert (=> d!37488 e!76717))

(declare-fun res!96802 () Bool)

(assert (=> d!37488 (=> (not res!96802) (not e!76717))))

(declare-fun lt!179049 () (_ BitVec 64))

(declare-fun lt!179053 () (_ BitVec 64))

(declare-fun lt!179050 () (_ BitVec 64))

(assert (=> d!37488 (= res!96802 (= lt!179050 (bvsub lt!179049 lt!179053)))))

(assert (=> d!37488 (or (= (bvand lt!179049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179049 lt!179053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37488 (= lt!179053 (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305))))))

(declare-fun lt!179052 () (_ BitVec 64))

(declare-fun lt!179051 () (_ BitVec 64))

(assert (=> d!37488 (= lt!179049 (bvmul lt!179052 lt!179051))))

(assert (=> d!37488 (or (= lt!179052 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179051 (bvsdiv (bvmul lt!179052 lt!179051) lt!179052)))))

(assert (=> d!37488 (= lt!179051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37488 (= lt!179052 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))))))

(assert (=> d!37488 (= lt!179050 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5437 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5432 thiss!1305))))))

(assert (=> d!37488 (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 thiss!1305)))))

(assert (=> d!37488 (= (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)) lt!179050)))

(declare-fun b!117036 () Bool)

(declare-fun res!96801 () Bool)

(assert (=> b!117036 (=> (not res!96801) (not e!76717))))

(assert (=> b!117036 (= res!96801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179050))))

(declare-fun b!117037 () Bool)

(declare-fun lt!179054 () (_ BitVec 64))

(assert (=> b!117037 (= e!76717 (bvsle lt!179050 (bvmul lt!179054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117037 (or (= lt!179054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179054)))))

(assert (=> b!117037 (= lt!179054 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))))))

(assert (= (and d!37488 res!96802) b!117036))

(assert (= (and b!117036 res!96801) b!117037))

(declare-fun m!175411 () Bool)

(assert (=> d!37488 m!175411))

(assert (=> d!37488 m!174995))

(assert (=> b!116777 d!37488))

(declare-fun d!37490 () Bool)

(declare-fun res!96804 () Bool)

(declare-fun e!76719 () Bool)

(assert (=> d!37490 (=> (not res!96804) (not e!76719))))

(assert (=> d!37490 (= res!96804 (= (size!2390 (buf!2800 thiss!1305)) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(assert (=> d!37490 (= (isPrefixOf!0 thiss!1305 (_2!5125 lt!178415)) e!76719)))

(declare-fun b!117038 () Bool)

(declare-fun res!96805 () Bool)

(assert (=> b!117038 (=> (not res!96805) (not e!76719))))

(assert (=> b!117038 (= res!96805 (bvsle (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)) (bitIndex!0 (size!2390 (buf!2800 (_2!5125 lt!178415))) (currentByte!5437 (_2!5125 lt!178415)) (currentBit!5432 (_2!5125 lt!178415)))))))

(declare-fun b!117039 () Bool)

(declare-fun e!76718 () Bool)

(assert (=> b!117039 (= e!76719 e!76718)))

(declare-fun res!96803 () Bool)

(assert (=> b!117039 (=> res!96803 e!76718)))

(assert (=> b!117039 (= res!96803 (= (size!2390 (buf!2800 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117040 () Bool)

(assert (=> b!117040 (= e!76718 (arrayBitRangesEq!0 (buf!2800 thiss!1305) (buf!2800 (_2!5125 lt!178415)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2390 (buf!2800 thiss!1305)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305))))))

(assert (= (and d!37490 res!96804) b!117038))

(assert (= (and b!117038 res!96805) b!117039))

(assert (= (and b!117039 (not res!96803)) b!117040))

(assert (=> b!117038 m!174923))

(assert (=> b!117038 m!174921))

(assert (=> b!117040 m!174923))

(assert (=> b!117040 m!174923))

(declare-fun m!175413 () Bool)

(assert (=> b!117040 m!175413))

(assert (=> b!116783 d!37490))

(declare-fun d!37492 () Bool)

(declare-fun lt!179055 () tuple2!9738)

(assert (=> d!37492 (= lt!179055 (readBit!0 (readerFrom!0 (_2!5125 lt!178415) (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305))))))

(assert (=> d!37492 (= (readBitPure!0 (readerFrom!0 (_2!5125 lt!178415) (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305))) (tuple2!9727 (_2!5134 lt!179055) (_1!5134 lt!179055)))))

(declare-fun bs!9072 () Bool)

(assert (= bs!9072 d!37492))

(assert (=> bs!9072 m!174927))

(declare-fun m!175415 () Bool)

(assert (=> bs!9072 m!175415))

(assert (=> b!116781 d!37492))

(declare-fun d!37494 () Bool)

(declare-fun e!76722 () Bool)

(assert (=> d!37494 e!76722))

(declare-fun res!96809 () Bool)

(assert (=> d!37494 (=> (not res!96809) (not e!76722))))

(assert (=> d!37494 (= res!96809 (invariant!0 (currentBit!5432 (_2!5125 lt!178415)) (currentByte!5437 (_2!5125 lt!178415)) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(assert (=> d!37494 (= (readerFrom!0 (_2!5125 lt!178415) (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305)) (BitStream!4255 (buf!2800 (_2!5125 lt!178415)) (currentByte!5437 thiss!1305) (currentBit!5432 thiss!1305)))))

(declare-fun b!117043 () Bool)

(assert (=> b!117043 (= e!76722 (invariant!0 (currentBit!5432 thiss!1305) (currentByte!5437 thiss!1305) (size!2390 (buf!2800 (_2!5125 lt!178415)))))))

(assert (= (and d!37494 res!96809) b!117043))

(assert (=> d!37494 m!175409))

(assert (=> b!117043 m!174925))

(assert (=> b!116781 d!37494))

(declare-fun d!37496 () Bool)

(assert (=> d!37496 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305)) lt!178407) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2390 (buf!2800 thiss!1305))) ((_ sign_extend 32) (currentByte!5437 thiss!1305)) ((_ sign_extend 32) (currentBit!5432 thiss!1305))) lt!178407))))

(declare-fun bs!9073 () Bool)

(assert (= bs!9073 d!37496))

(assert (=> bs!9073 m!175411))

(assert (=> b!116776 d!37496))

(check-sat (not b!116830) (not d!37388) (not d!37380) (not b!116870) (not b!117025) (not d!37368) (not d!37496) (not d!37384) (not b!116861) (not bm!1508) (not d!37370) (not b!117024) (not b!116842) (not b!117028) (not b!116859) (not b!117040) (not d!37374) (not d!37386) (not b!116871) (not b!116868) (not b!116858) (not d!37494) (not b!117029) (not b!116869) (not d!37492) (not d!37482) (not b!116828) (not d!37382) (not b!116843) (not b!117023) (not d!37372) (not d!37378) (not d!37488) (not d!37360) (not b!117043) (not b!117021) (not b!117022) (not d!37484) (not d!37376) (not d!37364) (not b!117038) (not d!37486) (not b!117020) (not b!117026) (not b!116860) (not b!116844) (not b!117019) (not b!116841))
