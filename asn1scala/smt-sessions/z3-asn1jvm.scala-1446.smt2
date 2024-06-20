; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39628 () Bool)

(assert start!39628)

(declare-fun b!179195 () Bool)

(declare-fun res!148705 () Bool)

(declare-fun e!124666 () Bool)

(assert (=> b!179195 (=> (not res!148705) (not e!124666))))

(declare-datatypes ((array!9643 0))(
  ( (array!9644 (arr!5183 (Array (_ BitVec 32) (_ BitVec 8))) (size!4253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7614 0))(
  ( (BitStream!7615 (buf!4696 array!9643) (currentByte!8894 (_ BitVec 32)) (currentBit!8889 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7614)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179195 (= res!148705 (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204))))))

(declare-fun b!179196 () Bool)

(declare-fun res!148703 () Bool)

(assert (=> b!179196 (=> (not res!148703) (not e!124666))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179196 (= res!148703 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))) ((_ sign_extend 32) (currentByte!8894 thiss!1204)) ((_ sign_extend 32) (currentBit!8889 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179197 () Bool)

(declare-fun e!124669 () Bool)

(declare-datatypes ((tuple2!15452 0))(
  ( (tuple2!15453 (_1!8371 BitStream!7614) (_2!8371 Bool)) )
))
(declare-fun lt!274719 () tuple2!15452)

(declare-fun lt!274717 () tuple2!15452)

(assert (=> b!179197 (= e!124669 (= (_2!8371 lt!274719) (_2!8371 lt!274717)))))

(declare-fun b!179198 () Bool)

(declare-fun e!124675 () Bool)

(declare-fun e!124671 () Bool)

(assert (=> b!179198 (= e!124675 e!124671)))

(declare-fun res!148700 () Bool)

(assert (=> b!179198 (=> res!148700 e!124671)))

(declare-fun lt!274725 () (_ BitVec 64))

(declare-fun lt!274722 () (_ BitVec 64))

(assert (=> b!179198 (= res!148700 (not (= lt!274725 (bvsub (bvsub (bvadd lt!274722 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!12886 0))(
  ( (Unit!12887) )
))
(declare-datatypes ((tuple2!15454 0))(
  ( (tuple2!15455 (_1!8372 Unit!12886) (_2!8372 BitStream!7614)) )
))
(declare-fun lt!274714 () tuple2!15454)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179198 (= lt!274725 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714))))))

(declare-fun isPrefixOf!0 (BitStream!7614 BitStream!7614) Bool)

(assert (=> b!179198 (isPrefixOf!0 thiss!1204 (_2!8372 lt!274714))))

(declare-fun lt!274720 () Unit!12886)

(declare-fun lt!274715 () tuple2!15454)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7614 BitStream!7614 BitStream!7614) Unit!12886)

(assert (=> b!179198 (= lt!274720 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8372 lt!274715) (_2!8372 lt!274714)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15454)

(assert (=> b!179198 (= lt!274714 (appendBitsLSBFirstLoopTR!0 (_2!8372 lt!274715) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179199 () Bool)

(declare-fun res!148697 () Bool)

(assert (=> b!179199 (=> res!148697 e!124671)))

(assert (=> b!179199 (= res!148697 (not (isPrefixOf!0 thiss!1204 (_2!8372 lt!274715))))))

(declare-fun b!179200 () Bool)

(declare-fun res!148701 () Bool)

(assert (=> b!179200 (=> res!148701 e!124671)))

(declare-fun lt!274716 () (_ BitVec 64))

(assert (=> b!179200 (= res!148701 (or (not (= (size!4253 (buf!4696 (_2!8372 lt!274714))) (size!4253 (buf!4696 thiss!1204)))) (not (= lt!274725 (bvsub (bvadd lt!274716 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!148706 () Bool)

(assert (=> start!39628 (=> (not res!148706) (not e!124666))))

(assert (=> start!39628 (= res!148706 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39628 e!124666))

(assert (=> start!39628 true))

(declare-fun e!124670 () Bool)

(declare-fun inv!12 (BitStream!7614) Bool)

(assert (=> start!39628 (and (inv!12 thiss!1204) e!124670)))

(declare-fun b!179201 () Bool)

(declare-fun res!148698 () Bool)

(assert (=> b!179201 (=> (not res!148698) (not e!124666))))

(assert (=> b!179201 (= res!148698 (not (= i!590 nBits!348)))))

(declare-fun b!179202 () Bool)

(declare-fun res!148694 () Bool)

(declare-fun e!124667 () Bool)

(assert (=> b!179202 (=> (not res!148694) (not e!124667))))

(assert (=> b!179202 (= res!148694 (isPrefixOf!0 thiss!1204 (_2!8372 lt!274715)))))

(declare-fun b!179203 () Bool)

(declare-fun res!148699 () Bool)

(assert (=> b!179203 (=> res!148699 e!124671)))

(assert (=> b!179203 (= res!148699 (not (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!274714))))))

(declare-fun b!179204 () Bool)

(declare-fun e!124674 () Bool)

(assert (=> b!179204 (= e!124674 e!124667)))

(declare-fun res!148702 () Bool)

(assert (=> b!179204 (=> (not res!148702) (not e!124667))))

(declare-fun lt!274713 () (_ BitVec 64))

(declare-fun lt!274718 () (_ BitVec 64))

(assert (=> b!179204 (= res!148702 (= lt!274713 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274718)))))

(assert (=> b!179204 (= lt!274713 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(assert (=> b!179204 (= lt!274718 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(declare-fun b!179205 () Bool)

(declare-datatypes ((tuple2!15456 0))(
  ( (tuple2!15457 (_1!8373 BitStream!7614) (_2!8373 BitStream!7614)) )
))
(declare-fun lt!274727 () tuple2!15456)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179205 (= e!124671 (validate_offset_bit!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8373 lt!274727)))) ((_ sign_extend 32) (currentByte!8894 (_1!8373 lt!274727))) ((_ sign_extend 32) (currentBit!8889 (_1!8373 lt!274727)))))))

(declare-fun lt!274723 () tuple2!15456)

(declare-fun reader!0 (BitStream!7614 BitStream!7614) tuple2!15456)

(assert (=> b!179205 (= lt!274723 (reader!0 (_2!8372 lt!274715) (_2!8372 lt!274714)))))

(assert (=> b!179205 (= lt!274727 (reader!0 thiss!1204 (_2!8372 lt!274714)))))

(assert (=> b!179205 e!124669))

(declare-fun res!148707 () Bool)

(assert (=> b!179205 (=> (not res!148707) (not e!124669))))

(assert (=> b!179205 (= res!148707 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274719))) (currentByte!8894 (_1!8371 lt!274719)) (currentBit!8889 (_1!8371 lt!274719))) (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274717))) (currentByte!8894 (_1!8371 lt!274717)) (currentBit!8889 (_1!8371 lt!274717)))))))

(declare-fun lt!274724 () Unit!12886)

(declare-fun lt!274726 () BitStream!7614)

(declare-fun readBitPrefixLemma!0 (BitStream!7614 BitStream!7614) Unit!12886)

(assert (=> b!179205 (= lt!274724 (readBitPrefixLemma!0 lt!274726 (_2!8372 lt!274714)))))

(declare-fun readBitPure!0 (BitStream!7614) tuple2!15452)

(assert (=> b!179205 (= lt!274717 (readBitPure!0 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204))))))

(assert (=> b!179205 (= lt!274719 (readBitPure!0 lt!274726))))

(declare-fun e!124668 () Bool)

(assert (=> b!179205 e!124668))

(declare-fun res!148704 () Bool)

(assert (=> b!179205 (=> (not res!148704) (not e!124668))))

(assert (=> b!179205 (= res!148704 (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (=> b!179205 (= lt!274726 (BitStream!7615 (buf!4696 (_2!8372 lt!274715)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(declare-fun b!179206 () Bool)

(assert (=> b!179206 (= e!124668 (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274714)))))))

(declare-fun b!179207 () Bool)

(declare-fun e!124672 () Bool)

(assert (=> b!179207 (= e!124667 e!124672)))

(declare-fun res!148696 () Bool)

(assert (=> b!179207 (=> (not res!148696) (not e!124672))))

(declare-fun lt!274712 () tuple2!15452)

(declare-fun lt!274721 () Bool)

(assert (=> b!179207 (= res!148696 (and (= (_2!8371 lt!274712) lt!274721) (= (_1!8371 lt!274712) (_2!8372 lt!274715))))))

(declare-fun readerFrom!0 (BitStream!7614 (_ BitVec 32) (_ BitVec 32)) BitStream!7614)

(assert (=> b!179207 (= lt!274712 (readBitPure!0 (readerFrom!0 (_2!8372 lt!274715) (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204))))))

(declare-fun b!179208 () Bool)

(assert (=> b!179208 (= e!124672 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274712))) (currentByte!8894 (_1!8371 lt!274712)) (currentBit!8889 (_1!8371 lt!274712))) lt!274713))))

(declare-fun b!179209 () Bool)

(assert (=> b!179209 (= e!124666 (not e!124675))))

(declare-fun res!148693 () Bool)

(assert (=> b!179209 (=> res!148693 e!124675)))

(assert (=> b!179209 (= res!148693 (not (= lt!274722 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274716))))))

(assert (=> b!179209 (= lt!274722 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(assert (=> b!179209 (= lt!274716 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(assert (=> b!179209 e!124674))

(declare-fun res!148695 () Bool)

(assert (=> b!179209 (=> (not res!148695) (not e!124674))))

(assert (=> b!179209 (= res!148695 (= (size!4253 (buf!4696 thiss!1204)) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(declare-fun appendBit!0 (BitStream!7614 Bool) tuple2!15454)

(assert (=> b!179209 (= lt!274715 (appendBit!0 thiss!1204 lt!274721))))

(assert (=> b!179209 (= lt!274721 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179210 () Bool)

(declare-fun res!148692 () Bool)

(assert (=> b!179210 (=> res!148692 e!124671)))

(assert (=> b!179210 (= res!148692 (not (invariant!0 (currentBit!8889 (_2!8372 lt!274714)) (currentByte!8894 (_2!8372 lt!274714)) (size!4253 (buf!4696 (_2!8372 lt!274714))))))))

(declare-fun b!179211 () Bool)

(declare-fun array_inv!3994 (array!9643) Bool)

(assert (=> b!179211 (= e!124670 (array_inv!3994 (buf!4696 thiss!1204)))))

(assert (= (and start!39628 res!148706) b!179196))

(assert (= (and b!179196 res!148703) b!179195))

(assert (= (and b!179195 res!148705) b!179201))

(assert (= (and b!179201 res!148698) b!179209))

(assert (= (and b!179209 res!148695) b!179204))

(assert (= (and b!179204 res!148702) b!179202))

(assert (= (and b!179202 res!148694) b!179207))

(assert (= (and b!179207 res!148696) b!179208))

(assert (= (and b!179209 (not res!148693)) b!179198))

(assert (= (and b!179198 (not res!148700)) b!179210))

(assert (= (and b!179210 (not res!148692)) b!179200))

(assert (= (and b!179200 (not res!148701)) b!179203))

(assert (= (and b!179203 (not res!148699)) b!179199))

(assert (= (and b!179199 (not res!148697)) b!179205))

(assert (= (and b!179205 res!148704) b!179206))

(assert (= (and b!179205 res!148707) b!179197))

(assert (= start!39628 b!179211))

(declare-fun m!279271 () Bool)

(assert (=> start!39628 m!279271))

(declare-fun m!279273 () Bool)

(assert (=> b!179206 m!279273))

(declare-fun m!279275 () Bool)

(assert (=> b!179202 m!279275))

(assert (=> b!179199 m!279275))

(declare-fun m!279277 () Bool)

(assert (=> b!179210 m!279277))

(declare-fun m!279279 () Bool)

(assert (=> b!179195 m!279279))

(declare-fun m!279281 () Bool)

(assert (=> b!179211 m!279281))

(declare-fun m!279283 () Bool)

(assert (=> b!179196 m!279283))

(declare-fun m!279285 () Bool)

(assert (=> b!179203 m!279285))

(declare-fun m!279287 () Bool)

(assert (=> b!179208 m!279287))

(declare-fun m!279289 () Bool)

(assert (=> b!179207 m!279289))

(assert (=> b!179207 m!279289))

(declare-fun m!279291 () Bool)

(assert (=> b!179207 m!279291))

(declare-fun m!279293 () Bool)

(assert (=> b!179209 m!279293))

(declare-fun m!279295 () Bool)

(assert (=> b!179209 m!279295))

(declare-fun m!279297 () Bool)

(assert (=> b!179209 m!279297))

(assert (=> b!179204 m!279293))

(assert (=> b!179204 m!279295))

(declare-fun m!279299 () Bool)

(assert (=> b!179205 m!279299))

(declare-fun m!279301 () Bool)

(assert (=> b!179205 m!279301))

(declare-fun m!279303 () Bool)

(assert (=> b!179205 m!279303))

(declare-fun m!279305 () Bool)

(assert (=> b!179205 m!279305))

(declare-fun m!279307 () Bool)

(assert (=> b!179205 m!279307))

(declare-fun m!279309 () Bool)

(assert (=> b!179205 m!279309))

(declare-fun m!279311 () Bool)

(assert (=> b!179205 m!279311))

(declare-fun m!279313 () Bool)

(assert (=> b!179205 m!279313))

(declare-fun m!279315 () Bool)

(assert (=> b!179205 m!279315))

(declare-fun m!279317 () Bool)

(assert (=> b!179198 m!279317))

(declare-fun m!279319 () Bool)

(assert (=> b!179198 m!279319))

(declare-fun m!279321 () Bool)

(assert (=> b!179198 m!279321))

(declare-fun m!279323 () Bool)

(assert (=> b!179198 m!279323))

(check-sat (not b!179204) (not b!179198) (not b!179202) (not b!179211) (not b!179210) (not b!179196) (not b!179206) (not b!179203) (not b!179205) (not start!39628) (not b!179199) (not b!179209) (not b!179207) (not b!179195) (not b!179208))
(check-sat)
(get-model)

(declare-fun d!62643 () Bool)

(declare-fun e!124708 () Bool)

(assert (=> d!62643 e!124708))

(declare-fun res!148761 () Bool)

(assert (=> d!62643 (=> (not res!148761) (not e!124708))))

(declare-fun lt!274791 () (_ BitVec 64))

(declare-fun lt!274790 () (_ BitVec 64))

(declare-fun lt!274788 () (_ BitVec 64))

(assert (=> d!62643 (= res!148761 (= lt!274790 (bvsub lt!274788 lt!274791)))))

(assert (=> d!62643 (or (= (bvand lt!274788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274791 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274788 lt!274791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62643 (= lt!274791 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274712)))) ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274712))) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274712)))))))

(declare-fun lt!274793 () (_ BitVec 64))

(declare-fun lt!274792 () (_ BitVec 64))

(assert (=> d!62643 (= lt!274788 (bvmul lt!274793 lt!274792))))

(assert (=> d!62643 (or (= lt!274793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274792 (bvsdiv (bvmul lt!274793 lt!274792) lt!274793)))))

(assert (=> d!62643 (= lt!274792 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62643 (= lt!274793 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274712)))))))

(assert (=> d!62643 (= lt!274790 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274712))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274712)))))))

(assert (=> d!62643 (invariant!0 (currentBit!8889 (_1!8371 lt!274712)) (currentByte!8894 (_1!8371 lt!274712)) (size!4253 (buf!4696 (_1!8371 lt!274712))))))

(assert (=> d!62643 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274712))) (currentByte!8894 (_1!8371 lt!274712)) (currentBit!8889 (_1!8371 lt!274712))) lt!274790)))

(declare-fun b!179267 () Bool)

(declare-fun res!148760 () Bool)

(assert (=> b!179267 (=> (not res!148760) (not e!124708))))

(assert (=> b!179267 (= res!148760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274790))))

(declare-fun b!179268 () Bool)

(declare-fun lt!274789 () (_ BitVec 64))

(assert (=> b!179268 (= e!124708 (bvsle lt!274790 (bvmul lt!274789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179268 (or (= lt!274789 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274789 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274789)))))

(assert (=> b!179268 (= lt!274789 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274712)))))))

(assert (= (and d!62643 res!148761) b!179267))

(assert (= (and b!179267 res!148760) b!179268))

(declare-fun m!279379 () Bool)

(assert (=> d!62643 m!279379))

(declare-fun m!279381 () Bool)

(assert (=> d!62643 m!279381))

(assert (=> b!179208 d!62643))

(declare-fun d!62645 () Bool)

(declare-fun e!124709 () Bool)

(assert (=> d!62645 e!124709))

(declare-fun res!148763 () Bool)

(assert (=> d!62645 (=> (not res!148763) (not e!124709))))

(declare-fun lt!274797 () (_ BitVec 64))

(declare-fun lt!274796 () (_ BitVec 64))

(declare-fun lt!274794 () (_ BitVec 64))

(assert (=> d!62645 (= res!148763 (= lt!274796 (bvsub lt!274794 lt!274797)))))

(assert (=> d!62645 (or (= (bvand lt!274794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274794 lt!274797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62645 (= lt!274797 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274714)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274714))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274714)))))))

(declare-fun lt!274799 () (_ BitVec 64))

(declare-fun lt!274798 () (_ BitVec 64))

(assert (=> d!62645 (= lt!274794 (bvmul lt!274799 lt!274798))))

(assert (=> d!62645 (or (= lt!274799 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274798 (bvsdiv (bvmul lt!274799 lt!274798) lt!274799)))))

(assert (=> d!62645 (= lt!274798 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62645 (= lt!274799 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274714)))))))

(assert (=> d!62645 (= lt!274796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274714)))))))

(assert (=> d!62645 (invariant!0 (currentBit!8889 (_2!8372 lt!274714)) (currentByte!8894 (_2!8372 lt!274714)) (size!4253 (buf!4696 (_2!8372 lt!274714))))))

(assert (=> d!62645 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714))) lt!274796)))

(declare-fun b!179269 () Bool)

(declare-fun res!148762 () Bool)

(assert (=> b!179269 (=> (not res!148762) (not e!124709))))

(assert (=> b!179269 (= res!148762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274796))))

(declare-fun b!179270 () Bool)

(declare-fun lt!274795 () (_ BitVec 64))

(assert (=> b!179270 (= e!124709 (bvsle lt!274796 (bvmul lt!274795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179270 (or (= lt!274795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274795)))))

(assert (=> b!179270 (= lt!274795 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274714)))))))

(assert (= (and d!62645 res!148763) b!179269))

(assert (= (and b!179269 res!148762) b!179270))

(declare-fun m!279383 () Bool)

(assert (=> d!62645 m!279383))

(assert (=> d!62645 m!279277))

(assert (=> b!179198 d!62645))

(declare-fun d!62647 () Bool)

(declare-fun res!148770 () Bool)

(declare-fun e!124715 () Bool)

(assert (=> d!62647 (=> (not res!148770) (not e!124715))))

(assert (=> d!62647 (= res!148770 (= (size!4253 (buf!4696 thiss!1204)) (size!4253 (buf!4696 (_2!8372 lt!274714)))))))

(assert (=> d!62647 (= (isPrefixOf!0 thiss!1204 (_2!8372 lt!274714)) e!124715)))

(declare-fun b!179277 () Bool)

(declare-fun res!148771 () Bool)

(assert (=> b!179277 (=> (not res!148771) (not e!124715))))

(assert (=> b!179277 (= res!148771 (bvsle (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714)))))))

(declare-fun b!179278 () Bool)

(declare-fun e!124714 () Bool)

(assert (=> b!179278 (= e!124715 e!124714)))

(declare-fun res!148772 () Bool)

(assert (=> b!179278 (=> res!148772 e!124714)))

(assert (=> b!179278 (= res!148772 (= (size!4253 (buf!4696 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179279 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9643 array!9643 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179279 (= e!124714 (arrayBitRangesEq!0 (buf!4696 thiss!1204) (buf!4696 (_2!8372 lt!274714)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204))))))

(assert (= (and d!62647 res!148770) b!179277))

(assert (= (and b!179277 res!148771) b!179278))

(assert (= (and b!179278 (not res!148772)) b!179279))

(assert (=> b!179277 m!279295))

(assert (=> b!179277 m!279317))

(assert (=> b!179279 m!279295))

(assert (=> b!179279 m!279295))

(declare-fun m!279385 () Bool)

(assert (=> b!179279 m!279385))

(assert (=> b!179198 d!62647))

(declare-fun d!62649 () Bool)

(assert (=> d!62649 (isPrefixOf!0 thiss!1204 (_2!8372 lt!274714))))

(declare-fun lt!274802 () Unit!12886)

(declare-fun choose!30 (BitStream!7614 BitStream!7614 BitStream!7614) Unit!12886)

(assert (=> d!62649 (= lt!274802 (choose!30 thiss!1204 (_2!8372 lt!274715) (_2!8372 lt!274714)))))

(assert (=> d!62649 (isPrefixOf!0 thiss!1204 (_2!8372 lt!274715))))

(assert (=> d!62649 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8372 lt!274715) (_2!8372 lt!274714)) lt!274802)))

(declare-fun bs!15628 () Bool)

(assert (= bs!15628 d!62649))

(assert (=> bs!15628 m!279319))

(declare-fun m!279387 () Bool)

(assert (=> bs!15628 m!279387))

(assert (=> bs!15628 m!279275))

(assert (=> b!179198 d!62649))

(declare-fun b!179416 () Bool)

(declare-fun res!148891 () Bool)

(declare-fun lt!275246 () tuple2!15454)

(assert (=> b!179416 (= res!148891 (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!275246)))))

(declare-fun e!124792 () Bool)

(assert (=> b!179416 (=> (not res!148891) (not e!124792))))

(declare-fun b!179417 () Bool)

(declare-fun e!124789 () (_ BitVec 64))

(assert (=> b!179417 (= e!124789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!179418 () Bool)

(declare-fun e!124790 () tuple2!15454)

(declare-fun lt!275241 () tuple2!15454)

(assert (=> b!179418 (= e!124790 (tuple2!15455 (_1!8372 lt!275241) (_2!8372 lt!275241)))))

(declare-fun lt!275201 () Bool)

(assert (=> b!179418 (= lt!275201 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179418 (= lt!275246 (appendBit!0 (_2!8372 lt!274715) lt!275201))))

(declare-fun res!148895 () Bool)

(assert (=> b!179418 (= res!148895 (= (size!4253 (buf!4696 (_2!8372 lt!274715))) (size!4253 (buf!4696 (_2!8372 lt!275246)))))))

(assert (=> b!179418 (=> (not res!148895) (not e!124792))))

(assert (=> b!179418 e!124792))

(declare-fun lt!275219 () tuple2!15454)

(assert (=> b!179418 (= lt!275219 lt!275246)))

(assert (=> b!179418 (= lt!275241 (appendBitsLSBFirstLoopTR!0 (_2!8372 lt!275219) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!275222 () Unit!12886)

(assert (=> b!179418 (= lt!275222 (lemmaIsPrefixTransitive!0 (_2!8372 lt!274715) (_2!8372 lt!275219) (_2!8372 lt!275241)))))

(declare-fun call!2930 () Bool)

(assert (=> b!179418 call!2930))

(declare-fun lt!275248 () Unit!12886)

(assert (=> b!179418 (= lt!275248 lt!275222)))

(assert (=> b!179418 (invariant!0 (currentBit!8889 (_2!8372 lt!274715)) (currentByte!8894 (_2!8372 lt!274715)) (size!4253 (buf!4696 (_2!8372 lt!275219))))))

(declare-fun lt!275220 () BitStream!7614)

(assert (=> b!179418 (= lt!275220 (BitStream!7615 (buf!4696 (_2!8372 lt!275219)) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(assert (=> b!179418 (invariant!0 (currentBit!8889 lt!275220) (currentByte!8894 lt!275220) (size!4253 (buf!4696 (_2!8372 lt!275241))))))

(declare-fun lt!275227 () BitStream!7614)

(assert (=> b!179418 (= lt!275227 (BitStream!7615 (buf!4696 (_2!8372 lt!275241)) (currentByte!8894 lt!275220) (currentBit!8889 lt!275220)))))

(declare-fun lt!275205 () tuple2!15452)

(assert (=> b!179418 (= lt!275205 (readBitPure!0 lt!275220))))

(declare-fun lt!275250 () tuple2!15452)

(assert (=> b!179418 (= lt!275250 (readBitPure!0 lt!275227))))

(declare-fun lt!275233 () Unit!12886)

(assert (=> b!179418 (= lt!275233 (readBitPrefixLemma!0 lt!275220 (_2!8372 lt!275241)))))

(declare-fun res!148892 () Bool)

(assert (=> b!179418 (= res!148892 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275205))) (currentByte!8894 (_1!8371 lt!275205)) (currentBit!8889 (_1!8371 lt!275205))) (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275250))) (currentByte!8894 (_1!8371 lt!275250)) (currentBit!8889 (_1!8371 lt!275250)))))))

(declare-fun e!124795 () Bool)

(assert (=> b!179418 (=> (not res!148892) (not e!124795))))

(assert (=> b!179418 e!124795))

(declare-fun lt!275226 () Unit!12886)

(assert (=> b!179418 (= lt!275226 lt!275233)))

(declare-fun lt!275244 () tuple2!15456)

(assert (=> b!179418 (= lt!275244 (reader!0 (_2!8372 lt!274715) (_2!8372 lt!275241)))))

(declare-fun lt!275203 () tuple2!15456)

(assert (=> b!179418 (= lt!275203 (reader!0 (_2!8372 lt!275219) (_2!8372 lt!275241)))))

(declare-fun lt!275245 () tuple2!15452)

(assert (=> b!179418 (= lt!275245 (readBitPure!0 (_1!8373 lt!275244)))))

(assert (=> b!179418 (= (_2!8371 lt!275245) lt!275201)))

(declare-fun lt!275242 () Unit!12886)

(declare-fun Unit!12890 () Unit!12886)

(assert (=> b!179418 (= lt!275242 Unit!12890)))

(declare-fun lt!275197 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179418 (= lt!275197 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275247 () (_ BitVec 64))

(assert (=> b!179418 (= lt!275247 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275238 () Unit!12886)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7614 array!9643 (_ BitVec 64)) Unit!12886)

(assert (=> b!179418 (= lt!275238 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8372 lt!274715) (buf!4696 (_2!8372 lt!275241)) lt!275247))))

(assert (=> b!179418 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!275241)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715))) lt!275247)))

(declare-fun lt!275208 () Unit!12886)

(assert (=> b!179418 (= lt!275208 lt!275238)))

(declare-datatypes ((tuple2!15464 0))(
  ( (tuple2!15465 (_1!8377 BitStream!7614) (_2!8377 (_ BitVec 64))) )
))
(declare-fun lt!275206 () tuple2!15464)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15464)

(assert (=> b!179418 (= lt!275206 (readNBitsLSBFirstsLoopPure!0 (_1!8373 lt!275244) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275197))))

(declare-fun lt!275213 () (_ BitVec 64))

(assert (=> b!179418 (= lt!275213 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!275211 () Unit!12886)

(assert (=> b!179418 (= lt!275211 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8372 lt!275219) (buf!4696 (_2!8372 lt!275241)) lt!275213))))

(assert (=> b!179418 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!275241)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!275219))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!275219))) lt!275213)))

(declare-fun lt!275200 () Unit!12886)

(assert (=> b!179418 (= lt!275200 lt!275211)))

(declare-fun lt!275214 () tuple2!15464)

(assert (=> b!179418 (= lt!275214 (readNBitsLSBFirstsLoopPure!0 (_1!8373 lt!275203) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275197 (ite (_2!8371 lt!275245) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!275224 () tuple2!15464)

(assert (=> b!179418 (= lt!275224 (readNBitsLSBFirstsLoopPure!0 (_1!8373 lt!275244) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275197))))

(declare-fun c!9289 () Bool)

(assert (=> b!179418 (= c!9289 (_2!8371 (readBitPure!0 (_1!8373 lt!275244))))))

(declare-fun lt!275252 () tuple2!15464)

(declare-fun withMovedBitIndex!0 (BitStream!7614 (_ BitVec 64)) BitStream!7614)

(assert (=> b!179418 (= lt!275252 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8373 lt!275244) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275197 e!124789)))))

(declare-fun lt!275240 () Unit!12886)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12886)

(assert (=> b!179418 (= lt!275240 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8373 lt!275244) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275197))))

(assert (=> b!179418 (and (= (_2!8377 lt!275224) (_2!8377 lt!275252)) (= (_1!8377 lt!275224) (_1!8377 lt!275252)))))

(declare-fun lt!275249 () Unit!12886)

(assert (=> b!179418 (= lt!275249 lt!275240)))

(assert (=> b!179418 (= (_1!8373 lt!275244) (withMovedBitIndex!0 (_2!8373 lt!275244) (bvsub (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275241))) (currentByte!8894 (_2!8372 lt!275241)) (currentBit!8889 (_2!8372 lt!275241))))))))

(declare-fun lt!275217 () Unit!12886)

(declare-fun Unit!12891 () Unit!12886)

(assert (=> b!179418 (= lt!275217 Unit!12891)))

(assert (=> b!179418 (= (_1!8373 lt!275203) (withMovedBitIndex!0 (_2!8373 lt!275203) (bvsub (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275219))) (currentByte!8894 (_2!8372 lt!275219)) (currentBit!8889 (_2!8372 lt!275219))) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275241))) (currentByte!8894 (_2!8372 lt!275241)) (currentBit!8889 (_2!8372 lt!275241))))))))

(declare-fun lt!275223 () Unit!12886)

(declare-fun Unit!12892 () Unit!12886)

(assert (=> b!179418 (= lt!275223 Unit!12892)))

(assert (=> b!179418 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) (bvsub (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275219))) (currentByte!8894 (_2!8372 lt!275219)) (currentBit!8889 (_2!8372 lt!275219))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!275230 () Unit!12886)

(declare-fun Unit!12893 () Unit!12886)

(assert (=> b!179418 (= lt!275230 Unit!12893)))

(assert (=> b!179418 (= (_2!8377 lt!275206) (_2!8377 lt!275214))))

(declare-fun lt!275251 () Unit!12886)

(declare-fun Unit!12894 () Unit!12886)

(assert (=> b!179418 (= lt!275251 Unit!12894)))

(assert (=> b!179418 (invariant!0 (currentBit!8889 (_2!8372 lt!275241)) (currentByte!8894 (_2!8372 lt!275241)) (size!4253 (buf!4696 (_2!8372 lt!275241))))))

(declare-fun lt!275221 () Unit!12886)

(declare-fun Unit!12895 () Unit!12886)

(assert (=> b!179418 (= lt!275221 Unit!12895)))

(assert (=> b!179418 (= (size!4253 (buf!4696 (_2!8372 lt!274715))) (size!4253 (buf!4696 (_2!8372 lt!275241))))))

(declare-fun lt!275202 () Unit!12886)

(declare-fun Unit!12896 () Unit!12886)

(assert (=> b!179418 (= lt!275202 Unit!12896)))

(assert (=> b!179418 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275241))) (currentByte!8894 (_2!8372 lt!275241)) (currentBit!8889 (_2!8372 lt!275241))) (bvsub (bvadd (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275199 () Unit!12886)

(declare-fun Unit!12897 () Unit!12886)

(assert (=> b!179418 (= lt!275199 Unit!12897)))

(declare-fun lt!275243 () Unit!12886)

(declare-fun Unit!12898 () Unit!12886)

(assert (=> b!179418 (= lt!275243 Unit!12898)))

(declare-fun lt!275228 () tuple2!15456)

(assert (=> b!179418 (= lt!275228 (reader!0 (_2!8372 lt!274715) (_2!8372 lt!275241)))))

(declare-fun lt!275209 () (_ BitVec 64))

(assert (=> b!179418 (= lt!275209 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275215 () Unit!12886)

(assert (=> b!179418 (= lt!275215 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8372 lt!274715) (buf!4696 (_2!8372 lt!275241)) lt!275209))))

(assert (=> b!179418 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!275241)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715))) lt!275209)))

(declare-fun lt!275234 () Unit!12886)

(assert (=> b!179418 (= lt!275234 lt!275215)))

(declare-fun lt!275231 () tuple2!15464)

(assert (=> b!179418 (= lt!275231 (readNBitsLSBFirstsLoopPure!0 (_1!8373 lt!275228) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!148885 () Bool)

(assert (=> b!179418 (= res!148885 (= (_2!8377 lt!275231) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!124796 () Bool)

(assert (=> b!179418 (=> (not res!148885) (not e!124796))))

(assert (=> b!179418 e!124796))

(declare-fun lt!275218 () Unit!12886)

(declare-fun Unit!12899 () Unit!12886)

(assert (=> b!179418 (= lt!275218 Unit!12899)))

(declare-fun d!62651 () Bool)

(declare-fun e!124791 () Bool)

(assert (=> d!62651 e!124791))

(declare-fun res!148893 () Bool)

(assert (=> d!62651 (=> (not res!148893) (not e!124791))))

(declare-fun lt!275207 () tuple2!15454)

(assert (=> d!62651 (= res!148893 (invariant!0 (currentBit!8889 (_2!8372 lt!275207)) (currentByte!8894 (_2!8372 lt!275207)) (size!4253 (buf!4696 (_2!8372 lt!275207)))))))

(assert (=> d!62651 (= lt!275207 e!124790)))

(declare-fun c!9290 () Bool)

(assert (=> d!62651 (= c!9290 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62651 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62651 (= (appendBitsLSBFirstLoopTR!0 (_2!8372 lt!274715) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!275207)))

(declare-fun b!179419 () Bool)

(assert (=> b!179419 (= e!124795 (= (_2!8371 lt!275205) (_2!8371 lt!275250)))))

(declare-fun b!179420 () Bool)

(assert (=> b!179420 (= e!124789 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!179421 () Bool)

(declare-fun res!148890 () Bool)

(assert (=> b!179421 (= res!148890 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275246))) (currentByte!8894 (_2!8372 lt!275246)) (currentBit!8889 (_2!8372 lt!275246))) (bvadd (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!179421 (=> (not res!148890) (not e!124792))))

(declare-fun b!179422 () Bool)

(declare-fun res!148887 () Bool)

(assert (=> b!179422 (=> (not res!148887) (not e!124791))))

(declare-fun lt!275239 () (_ BitVec 64))

(declare-fun lt!275237 () (_ BitVec 64))

(assert (=> b!179422 (= res!148887 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275207))) (currentByte!8894 (_2!8372 lt!275207)) (currentBit!8889 (_2!8372 lt!275207))) (bvsub lt!275239 lt!275237)))))

(assert (=> b!179422 (or (= (bvand lt!275239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275239 lt!275237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179422 (= lt!275237 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!275232 () (_ BitVec 64))

(declare-fun lt!275236 () (_ BitVec 64))

(assert (=> b!179422 (= lt!275239 (bvadd lt!275232 lt!275236))))

(assert (=> b!179422 (or (not (= (bvand lt!275232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275236 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275232 lt!275236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179422 (= lt!275236 ((_ sign_extend 32) nBits!348))))

(assert (=> b!179422 (= lt!275232 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(declare-fun b!179423 () Bool)

(declare-fun lt!275198 () tuple2!15452)

(assert (=> b!179423 (= lt!275198 (readBitPure!0 (readerFrom!0 (_2!8372 lt!275246) (currentBit!8889 (_2!8372 lt!274715)) (currentByte!8894 (_2!8372 lt!274715)))))))

(declare-fun res!148886 () Bool)

(assert (=> b!179423 (= res!148886 (and (= (_2!8371 lt!275198) lt!275201) (= (_1!8371 lt!275198) (_2!8372 lt!275246))))))

(declare-fun e!124788 () Bool)

(assert (=> b!179423 (=> (not res!148886) (not e!124788))))

(assert (=> b!179423 (= e!124792 e!124788)))

(declare-fun b!179424 () Bool)

(declare-fun e!124793 () Bool)

(declare-fun lt!275225 () tuple2!15464)

(declare-fun lt!275235 () tuple2!15456)

(assert (=> b!179424 (= e!124793 (= (_1!8377 lt!275225) (_2!8373 lt!275235)))))

(declare-fun bm!2927 () Bool)

(assert (=> bm!2927 (= call!2930 (isPrefixOf!0 (_2!8372 lt!274715) (ite c!9290 (_2!8372 lt!274715) (_2!8372 lt!275241))))))

(declare-fun b!179425 () Bool)

(assert (=> b!179425 (= e!124796 (= (_1!8377 lt!275231) (_2!8373 lt!275228)))))

(declare-fun b!179426 () Bool)

(assert (=> b!179426 (= e!124791 e!124793)))

(declare-fun res!148888 () Bool)

(assert (=> b!179426 (=> (not res!148888) (not e!124793))))

(assert (=> b!179426 (= res!148888 (= (_2!8377 lt!275225) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!179426 (= lt!275225 (readNBitsLSBFirstsLoopPure!0 (_1!8373 lt!275235) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!275210 () Unit!12886)

(declare-fun lt!275216 () Unit!12886)

(assert (=> b!179426 (= lt!275210 lt!275216)))

(declare-fun lt!275229 () (_ BitVec 64))

(assert (=> b!179426 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!275207)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715))) lt!275229)))

(assert (=> b!179426 (= lt!275216 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8372 lt!274715) (buf!4696 (_2!8372 lt!275207)) lt!275229))))

(declare-fun e!124794 () Bool)

(assert (=> b!179426 e!124794))

(declare-fun res!148884 () Bool)

(assert (=> b!179426 (=> (not res!148884) (not e!124794))))

(assert (=> b!179426 (= res!148884 (and (= (size!4253 (buf!4696 (_2!8372 lt!274715))) (size!4253 (buf!4696 (_2!8372 lt!275207)))) (bvsge lt!275229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179426 (= lt!275229 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!179426 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!179426 (= lt!275235 (reader!0 (_2!8372 lt!274715) (_2!8372 lt!275207)))))

(declare-fun b!179427 () Bool)

(declare-fun res!148894 () Bool)

(assert (=> b!179427 (=> (not res!148894) (not e!124791))))

(assert (=> b!179427 (= res!148894 (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!275207)))))

(declare-fun b!179428 () Bool)

(assert (=> b!179428 (= e!124788 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275198))) (currentByte!8894 (_1!8371 lt!275198)) (currentBit!8889 (_1!8371 lt!275198))) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275246))) (currentByte!8894 (_2!8372 lt!275246)) (currentBit!8889 (_2!8372 lt!275246)))))))

(declare-fun b!179429 () Bool)

(assert (=> b!179429 (= e!124794 (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274715)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715))) lt!275229))))

(declare-fun b!179430 () Bool)

(declare-fun res!148889 () Bool)

(assert (=> b!179430 (=> (not res!148889) (not e!124791))))

(assert (=> b!179430 (= res!148889 (= (size!4253 (buf!4696 (_2!8372 lt!274715))) (size!4253 (buf!4696 (_2!8372 lt!275207)))))))

(declare-fun b!179431 () Bool)

(declare-fun Unit!12900 () Unit!12886)

(assert (=> b!179431 (= e!124790 (tuple2!15455 Unit!12900 (_2!8372 lt!274715)))))

(declare-fun lt!275212 () Unit!12886)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7614) Unit!12886)

(assert (=> b!179431 (= lt!275212 (lemmaIsPrefixRefl!0 (_2!8372 lt!274715)))))

(assert (=> b!179431 call!2930))

(declare-fun lt!275204 () Unit!12886)

(assert (=> b!179431 (= lt!275204 lt!275212)))

(assert (= (and d!62651 c!9290) b!179431))

(assert (= (and d!62651 (not c!9290)) b!179418))

(assert (= (and b!179418 res!148895) b!179421))

(assert (= (and b!179421 res!148890) b!179416))

(assert (= (and b!179416 res!148891) b!179423))

(assert (= (and b!179423 res!148886) b!179428))

(assert (= (and b!179418 res!148892) b!179419))

(assert (= (and b!179418 c!9289) b!179420))

(assert (= (and b!179418 (not c!9289)) b!179417))

(assert (= (and b!179418 res!148885) b!179425))

(assert (= (or b!179431 b!179418) bm!2927))

(assert (= (and d!62651 res!148893) b!179430))

(assert (= (and b!179430 res!148889) b!179422))

(assert (= (and b!179422 res!148887) b!179427))

(assert (= (and b!179427 res!148894) b!179426))

(assert (= (and b!179426 res!148884) b!179429))

(assert (= (and b!179426 res!148888) b!179424))

(declare-fun m!279583 () Bool)

(assert (=> bm!2927 m!279583))

(declare-fun m!279585 () Bool)

(assert (=> b!179416 m!279585))

(declare-fun m!279587 () Bool)

(assert (=> b!179426 m!279587))

(declare-fun m!279589 () Bool)

(assert (=> b!179426 m!279589))

(declare-fun m!279591 () Bool)

(assert (=> b!179426 m!279591))

(declare-fun m!279593 () Bool)

(assert (=> b!179426 m!279593))

(declare-fun m!279595 () Bool)

(assert (=> b!179426 m!279595))

(declare-fun m!279597 () Bool)

(assert (=> b!179426 m!279597))

(declare-fun m!279599 () Bool)

(assert (=> b!179431 m!279599))

(declare-fun m!279601 () Bool)

(assert (=> b!179423 m!279601))

(assert (=> b!179423 m!279601))

(declare-fun m!279603 () Bool)

(assert (=> b!179423 m!279603))

(declare-fun m!279605 () Bool)

(assert (=> b!179421 m!279605))

(assert (=> b!179421 m!279293))

(declare-fun m!279607 () Bool)

(assert (=> d!62651 m!279607))

(declare-fun m!279609 () Bool)

(assert (=> b!179429 m!279609))

(declare-fun m!279611 () Bool)

(assert (=> b!179422 m!279611))

(assert (=> b!179422 m!279293))

(declare-fun m!279613 () Bool)

(assert (=> b!179427 m!279613))

(declare-fun m!279615 () Bool)

(assert (=> b!179428 m!279615))

(assert (=> b!179428 m!279605))

(declare-fun m!279617 () Bool)

(assert (=> b!179418 m!279617))

(declare-fun m!279619 () Bool)

(assert (=> b!179418 m!279619))

(declare-fun m!279621 () Bool)

(assert (=> b!179418 m!279621))

(declare-fun m!279623 () Bool)

(assert (=> b!179418 m!279623))

(declare-fun m!279625 () Bool)

(assert (=> b!179418 m!279625))

(declare-fun m!279627 () Bool)

(assert (=> b!179418 m!279627))

(declare-fun m!279629 () Bool)

(assert (=> b!179418 m!279629))

(declare-fun m!279631 () Bool)

(assert (=> b!179418 m!279631))

(declare-fun m!279633 () Bool)

(assert (=> b!179418 m!279633))

(declare-fun m!279635 () Bool)

(assert (=> b!179418 m!279635))

(assert (=> b!179418 m!279623))

(declare-fun m!279637 () Bool)

(assert (=> b!179418 m!279637))

(assert (=> b!179418 m!279595))

(declare-fun m!279639 () Bool)

(assert (=> b!179418 m!279639))

(declare-fun m!279641 () Bool)

(assert (=> b!179418 m!279641))

(declare-fun m!279643 () Bool)

(assert (=> b!179418 m!279643))

(declare-fun m!279645 () Bool)

(assert (=> b!179418 m!279645))

(declare-fun m!279647 () Bool)

(assert (=> b!179418 m!279647))

(declare-fun m!279649 () Bool)

(assert (=> b!179418 m!279649))

(declare-fun m!279651 () Bool)

(assert (=> b!179418 m!279651))

(declare-fun m!279653 () Bool)

(assert (=> b!179418 m!279653))

(declare-fun m!279655 () Bool)

(assert (=> b!179418 m!279655))

(declare-fun m!279657 () Bool)

(assert (=> b!179418 m!279657))

(declare-fun m!279659 () Bool)

(assert (=> b!179418 m!279659))

(declare-fun m!279661 () Bool)

(assert (=> b!179418 m!279661))

(assert (=> b!179418 m!279591))

(declare-fun m!279663 () Bool)

(assert (=> b!179418 m!279663))

(declare-fun m!279665 () Bool)

(assert (=> b!179418 m!279665))

(assert (=> b!179418 m!279293))

(declare-fun m!279667 () Bool)

(assert (=> b!179418 m!279667))

(declare-fun m!279669 () Bool)

(assert (=> b!179418 m!279669))

(declare-fun m!279671 () Bool)

(assert (=> b!179418 m!279671))

(declare-fun m!279673 () Bool)

(assert (=> b!179418 m!279673))

(declare-fun m!279675 () Bool)

(assert (=> b!179418 m!279675))

(assert (=> b!179198 d!62651))

(declare-fun d!62723 () Bool)

(declare-fun e!124797 () Bool)

(assert (=> d!62723 e!124797))

(declare-fun res!148897 () Bool)

(assert (=> d!62723 (=> (not res!148897) (not e!124797))))

(declare-fun lt!275253 () (_ BitVec 64))

(declare-fun lt!275255 () (_ BitVec 64))

(declare-fun lt!275256 () (_ BitVec 64))

(assert (=> d!62723 (= res!148897 (= lt!275255 (bvsub lt!275253 lt!275256)))))

(assert (=> d!62723 (or (= (bvand lt!275253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275253 lt!275256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62723 (= lt!275256 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274715)))) ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715)))))))

(declare-fun lt!275258 () (_ BitVec 64))

(declare-fun lt!275257 () (_ BitVec 64))

(assert (=> d!62723 (= lt!275253 (bvmul lt!275258 lt!275257))))

(assert (=> d!62723 (or (= lt!275258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275257 (bvsdiv (bvmul lt!275258 lt!275257) lt!275258)))))

(assert (=> d!62723 (= lt!275257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62723 (= lt!275258 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (=> d!62723 (= lt!275255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 (_2!8372 lt!274715))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 (_2!8372 lt!274715)))))))

(assert (=> d!62723 (invariant!0 (currentBit!8889 (_2!8372 lt!274715)) (currentByte!8894 (_2!8372 lt!274715)) (size!4253 (buf!4696 (_2!8372 lt!274715))))))

(assert (=> d!62723 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) lt!275255)))

(declare-fun b!179432 () Bool)

(declare-fun res!148896 () Bool)

(assert (=> b!179432 (=> (not res!148896) (not e!124797))))

(assert (=> b!179432 (= res!148896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275255))))

(declare-fun b!179433 () Bool)

(declare-fun lt!275254 () (_ BitVec 64))

(assert (=> b!179433 (= e!124797 (bvsle lt!275255 (bvmul lt!275254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179433 (or (= lt!275254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275254)))))

(assert (=> b!179433 (= lt!275254 ((_ sign_extend 32) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (= (and d!62723 res!148897) b!179432))

(assert (= (and b!179432 res!148896) b!179433))

(declare-fun m!279677 () Bool)

(assert (=> d!62723 m!279677))

(declare-fun m!279679 () Bool)

(assert (=> d!62723 m!279679))

(assert (=> b!179209 d!62723))

(declare-fun d!62725 () Bool)

(declare-fun e!124798 () Bool)

(assert (=> d!62725 e!124798))

(declare-fun res!148899 () Bool)

(assert (=> d!62725 (=> (not res!148899) (not e!124798))))

(declare-fun lt!275262 () (_ BitVec 64))

(declare-fun lt!275259 () (_ BitVec 64))

(declare-fun lt!275261 () (_ BitVec 64))

(assert (=> d!62725 (= res!148899 (= lt!275261 (bvsub lt!275259 lt!275262)))))

(assert (=> d!62725 (or (= (bvand lt!275259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275259 lt!275262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62725 (= lt!275262 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))) ((_ sign_extend 32) (currentByte!8894 thiss!1204)) ((_ sign_extend 32) (currentBit!8889 thiss!1204))))))

(declare-fun lt!275264 () (_ BitVec 64))

(declare-fun lt!275263 () (_ BitVec 64))

(assert (=> d!62725 (= lt!275259 (bvmul lt!275264 lt!275263))))

(assert (=> d!62725 (or (= lt!275264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275263 (bvsdiv (bvmul lt!275264 lt!275263) lt!275264)))))

(assert (=> d!62725 (= lt!275263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62725 (= lt!275264 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))))))

(assert (=> d!62725 (= lt!275261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 thiss!1204))))))

(assert (=> d!62725 (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204)))))

(assert (=> d!62725 (= (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)) lt!275261)))

(declare-fun b!179434 () Bool)

(declare-fun res!148898 () Bool)

(assert (=> b!179434 (=> (not res!148898) (not e!124798))))

(assert (=> b!179434 (= res!148898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275261))))

(declare-fun b!179435 () Bool)

(declare-fun lt!275260 () (_ BitVec 64))

(assert (=> b!179435 (= e!124798 (bvsle lt!275261 (bvmul lt!275260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179435 (or (= lt!275260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275260)))))

(assert (=> b!179435 (= lt!275260 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))))))

(assert (= (and d!62725 res!148899) b!179434))

(assert (= (and b!179434 res!148898) b!179435))

(declare-fun m!279681 () Bool)

(assert (=> d!62725 m!279681))

(assert (=> d!62725 m!279279))

(assert (=> b!179209 d!62725))

(declare-fun b!179446 () Bool)

(declare-fun res!148911 () Bool)

(declare-fun e!124803 () Bool)

(assert (=> b!179446 (=> (not res!148911) (not e!124803))))

(declare-fun lt!275276 () tuple2!15454)

(assert (=> b!179446 (= res!148911 (isPrefixOf!0 thiss!1204 (_2!8372 lt!275276)))))

(declare-fun b!179445 () Bool)

(declare-fun res!148908 () Bool)

(assert (=> b!179445 (=> (not res!148908) (not e!124803))))

(declare-fun lt!275275 () (_ BitVec 64))

(declare-fun lt!275273 () (_ BitVec 64))

(assert (=> b!179445 (= res!148908 (= (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275276))) (currentByte!8894 (_2!8372 lt!275276)) (currentBit!8889 (_2!8372 lt!275276))) (bvadd lt!275273 lt!275275)))))

(assert (=> b!179445 (or (not (= (bvand lt!275273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275275 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275273 lt!275275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179445 (= lt!275275 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!179445 (= lt!275273 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(declare-fun b!179448 () Bool)

(declare-fun e!124804 () Bool)

(declare-fun lt!275274 () tuple2!15452)

(assert (=> b!179448 (= e!124804 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275274))) (currentByte!8894 (_1!8371 lt!275274)) (currentBit!8889 (_1!8371 lt!275274))) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!275276))) (currentByte!8894 (_2!8372 lt!275276)) (currentBit!8889 (_2!8372 lt!275276)))))))

(declare-fun d!62727 () Bool)

(assert (=> d!62727 e!124803))

(declare-fun res!148909 () Bool)

(assert (=> d!62727 (=> (not res!148909) (not e!124803))))

(assert (=> d!62727 (= res!148909 (= (size!4253 (buf!4696 thiss!1204)) (size!4253 (buf!4696 (_2!8372 lt!275276)))))))

(declare-fun choose!16 (BitStream!7614 Bool) tuple2!15454)

(assert (=> d!62727 (= lt!275276 (choose!16 thiss!1204 lt!274721))))

(assert (=> d!62727 (validate_offset_bit!0 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))) ((_ sign_extend 32) (currentByte!8894 thiss!1204)) ((_ sign_extend 32) (currentBit!8889 thiss!1204)))))

(assert (=> d!62727 (= (appendBit!0 thiss!1204 lt!274721) lt!275276)))

(declare-fun b!179447 () Bool)

(assert (=> b!179447 (= e!124803 e!124804)))

(declare-fun res!148910 () Bool)

(assert (=> b!179447 (=> (not res!148910) (not e!124804))))

(assert (=> b!179447 (= res!148910 (and (= (_2!8371 lt!275274) lt!274721) (= (_1!8371 lt!275274) (_2!8372 lt!275276))))))

(assert (=> b!179447 (= lt!275274 (readBitPure!0 (readerFrom!0 (_2!8372 lt!275276) (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204))))))

(assert (= (and d!62727 res!148909) b!179445))

(assert (= (and b!179445 res!148908) b!179446))

(assert (= (and b!179446 res!148911) b!179447))

(assert (= (and b!179447 res!148910) b!179448))

(declare-fun m!279683 () Bool)

(assert (=> b!179448 m!279683))

(declare-fun m!279685 () Bool)

(assert (=> b!179448 m!279685))

(declare-fun m!279687 () Bool)

(assert (=> b!179446 m!279687))

(assert (=> b!179445 m!279685))

(assert (=> b!179445 m!279295))

(declare-fun m!279689 () Bool)

(assert (=> d!62727 m!279689))

(declare-fun m!279691 () Bool)

(assert (=> d!62727 m!279691))

(declare-fun m!279693 () Bool)

(assert (=> b!179447 m!279693))

(assert (=> b!179447 m!279693))

(declare-fun m!279695 () Bool)

(assert (=> b!179447 m!279695))

(assert (=> b!179209 d!62727))

(declare-fun d!62729 () Bool)

(declare-fun res!148912 () Bool)

(declare-fun e!124806 () Bool)

(assert (=> d!62729 (=> (not res!148912) (not e!124806))))

(assert (=> d!62729 (= res!148912 (= (size!4253 (buf!4696 thiss!1204)) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (=> d!62729 (= (isPrefixOf!0 thiss!1204 (_2!8372 lt!274715)) e!124806)))

(declare-fun b!179449 () Bool)

(declare-fun res!148913 () Bool)

(assert (=> b!179449 (=> (not res!148913) (not e!124806))))

(assert (=> b!179449 (= res!148913 (bvsle (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715)))))))

(declare-fun b!179450 () Bool)

(declare-fun e!124805 () Bool)

(assert (=> b!179450 (= e!124806 e!124805)))

(declare-fun res!148914 () Bool)

(assert (=> b!179450 (=> res!148914 e!124805)))

(assert (=> b!179450 (= res!148914 (= (size!4253 (buf!4696 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179451 () Bool)

(assert (=> b!179451 (= e!124805 (arrayBitRangesEq!0 (buf!4696 thiss!1204) (buf!4696 (_2!8372 lt!274715)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204))))))

(assert (= (and d!62729 res!148912) b!179449))

(assert (= (and b!179449 res!148913) b!179450))

(assert (= (and b!179450 (not res!148914)) b!179451))

(assert (=> b!179449 m!279295))

(assert (=> b!179449 m!279293))

(assert (=> b!179451 m!279295))

(assert (=> b!179451 m!279295))

(declare-fun m!279697 () Bool)

(assert (=> b!179451 m!279697))

(assert (=> b!179199 d!62729))

(declare-fun d!62731 () Bool)

(assert (=> d!62731 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204))))))

(declare-fun bs!15639 () Bool)

(assert (= bs!15639 d!62731))

(assert (=> bs!15639 m!279279))

(assert (=> start!39628 d!62731))

(declare-fun b!179462 () Bool)

(declare-fun e!124812 () Unit!12886)

(declare-fun Unit!12901 () Unit!12886)

(assert (=> b!179462 (= e!124812 Unit!12901)))

(declare-fun d!62733 () Bool)

(declare-fun e!124811 () Bool)

(assert (=> d!62733 e!124811))

(declare-fun res!148923 () Bool)

(assert (=> d!62733 (=> (not res!148923) (not e!124811))))

(declare-fun lt!275335 () tuple2!15456)

(assert (=> d!62733 (= res!148923 (isPrefixOf!0 (_1!8373 lt!275335) (_2!8373 lt!275335)))))

(declare-fun lt!275323 () BitStream!7614)

(assert (=> d!62733 (= lt!275335 (tuple2!15457 lt!275323 (_2!8372 lt!274714)))))

(declare-fun lt!275321 () Unit!12886)

(declare-fun lt!275334 () Unit!12886)

(assert (=> d!62733 (= lt!275321 lt!275334)))

(assert (=> d!62733 (isPrefixOf!0 lt!275323 (_2!8372 lt!274714))))

(assert (=> d!62733 (= lt!275334 (lemmaIsPrefixTransitive!0 lt!275323 (_2!8372 lt!274714) (_2!8372 lt!274714)))))

(declare-fun lt!275317 () Unit!12886)

(declare-fun lt!275332 () Unit!12886)

(assert (=> d!62733 (= lt!275317 lt!275332)))

(assert (=> d!62733 (isPrefixOf!0 lt!275323 (_2!8372 lt!274714))))

(assert (=> d!62733 (= lt!275332 (lemmaIsPrefixTransitive!0 lt!275323 (_2!8372 lt!274715) (_2!8372 lt!274714)))))

(declare-fun lt!275336 () Unit!12886)

(assert (=> d!62733 (= lt!275336 e!124812)))

(declare-fun c!9293 () Bool)

(assert (=> d!62733 (= c!9293 (not (= (size!4253 (buf!4696 (_2!8372 lt!274715))) #b00000000000000000000000000000000)))))

(declare-fun lt!275333 () Unit!12886)

(declare-fun lt!275329 () Unit!12886)

(assert (=> d!62733 (= lt!275333 lt!275329)))

(assert (=> d!62733 (isPrefixOf!0 (_2!8372 lt!274714) (_2!8372 lt!274714))))

(assert (=> d!62733 (= lt!275329 (lemmaIsPrefixRefl!0 (_2!8372 lt!274714)))))

(declare-fun lt!275327 () Unit!12886)

(declare-fun lt!275318 () Unit!12886)

(assert (=> d!62733 (= lt!275327 lt!275318)))

(assert (=> d!62733 (= lt!275318 (lemmaIsPrefixRefl!0 (_2!8372 lt!274714)))))

(declare-fun lt!275331 () Unit!12886)

(declare-fun lt!275326 () Unit!12886)

(assert (=> d!62733 (= lt!275331 lt!275326)))

(assert (=> d!62733 (isPrefixOf!0 lt!275323 lt!275323)))

(assert (=> d!62733 (= lt!275326 (lemmaIsPrefixRefl!0 lt!275323))))

(declare-fun lt!275320 () Unit!12886)

(declare-fun lt!275319 () Unit!12886)

(assert (=> d!62733 (= lt!275320 lt!275319)))

(assert (=> d!62733 (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!274715))))

(assert (=> d!62733 (= lt!275319 (lemmaIsPrefixRefl!0 (_2!8372 lt!274715)))))

(assert (=> d!62733 (= lt!275323 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(assert (=> d!62733 (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!274714))))

(assert (=> d!62733 (= (reader!0 (_2!8372 lt!274715) (_2!8372 lt!274714)) lt!275335)))

(declare-fun lt!275330 () (_ BitVec 64))

(declare-fun b!179463 () Bool)

(declare-fun lt!275324 () (_ BitVec 64))

(assert (=> b!179463 (= e!124811 (= (_1!8373 lt!275335) (withMovedBitIndex!0 (_2!8373 lt!275335) (bvsub lt!275330 lt!275324))))))

(assert (=> b!179463 (or (= (bvand lt!275330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275330 lt!275324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179463 (= lt!275324 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714))))))

(assert (=> b!179463 (= lt!275330 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(declare-fun b!179464 () Bool)

(declare-fun res!148922 () Bool)

(assert (=> b!179464 (=> (not res!148922) (not e!124811))))

(assert (=> b!179464 (= res!148922 (isPrefixOf!0 (_2!8373 lt!275335) (_2!8372 lt!274714)))))

(declare-fun b!179465 () Bool)

(declare-fun res!148921 () Bool)

(assert (=> b!179465 (=> (not res!148921) (not e!124811))))

(assert (=> b!179465 (= res!148921 (isPrefixOf!0 (_1!8373 lt!275335) (_2!8372 lt!274715)))))

(declare-fun b!179466 () Bool)

(declare-fun lt!275322 () Unit!12886)

(assert (=> b!179466 (= e!124812 lt!275322)))

(declare-fun lt!275328 () (_ BitVec 64))

(assert (=> b!179466 (= lt!275328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!275325 () (_ BitVec 64))

(assert (=> b!179466 (= lt!275325 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9643 array!9643 (_ BitVec 64) (_ BitVec 64)) Unit!12886)

(assert (=> b!179466 (= lt!275322 (arrayBitRangesEqSymmetric!0 (buf!4696 (_2!8372 lt!274715)) (buf!4696 (_2!8372 lt!274714)) lt!275328 lt!275325))))

(assert (=> b!179466 (arrayBitRangesEq!0 (buf!4696 (_2!8372 lt!274714)) (buf!4696 (_2!8372 lt!274715)) lt!275328 lt!275325)))

(assert (= (and d!62733 c!9293) b!179466))

(assert (= (and d!62733 (not c!9293)) b!179462))

(assert (= (and d!62733 res!148923) b!179465))

(assert (= (and b!179465 res!148921) b!179464))

(assert (= (and b!179464 res!148922) b!179463))

(declare-fun m!279699 () Bool)

(assert (=> b!179464 m!279699))

(declare-fun m!279701 () Bool)

(assert (=> b!179465 m!279701))

(assert (=> b!179466 m!279293))

(declare-fun m!279703 () Bool)

(assert (=> b!179466 m!279703))

(declare-fun m!279705 () Bool)

(assert (=> b!179466 m!279705))

(assert (=> d!62733 m!279285))

(declare-fun m!279707 () Bool)

(assert (=> d!62733 m!279707))

(declare-fun m!279709 () Bool)

(assert (=> d!62733 m!279709))

(assert (=> d!62733 m!279599))

(declare-fun m!279711 () Bool)

(assert (=> d!62733 m!279711))

(declare-fun m!279713 () Bool)

(assert (=> d!62733 m!279713))

(declare-fun m!279715 () Bool)

(assert (=> d!62733 m!279715))

(declare-fun m!279717 () Bool)

(assert (=> d!62733 m!279717))

(declare-fun m!279719 () Bool)

(assert (=> d!62733 m!279719))

(declare-fun m!279721 () Bool)

(assert (=> d!62733 m!279721))

(declare-fun m!279723 () Bool)

(assert (=> d!62733 m!279723))

(declare-fun m!279725 () Bool)

(assert (=> b!179463 m!279725))

(assert (=> b!179463 m!279317))

(assert (=> b!179463 m!279293))

(assert (=> b!179205 d!62733))

(declare-fun d!62735 () Bool)

(assert (=> d!62735 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8373 lt!274727)))) ((_ sign_extend 32) (currentByte!8894 (_1!8373 lt!274727))) ((_ sign_extend 32) (currentBit!8889 (_1!8373 lt!274727)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8373 lt!274727)))) ((_ sign_extend 32) (currentByte!8894 (_1!8373 lt!274727))) ((_ sign_extend 32) (currentBit!8889 (_1!8373 lt!274727)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15640 () Bool)

(assert (= bs!15640 d!62735))

(declare-fun m!279727 () Bool)

(assert (=> bs!15640 m!279727))

(assert (=> b!179205 d!62735))

(declare-fun d!62737 () Bool)

(declare-fun e!124813 () Bool)

(assert (=> d!62737 e!124813))

(declare-fun res!148925 () Bool)

(assert (=> d!62737 (=> (not res!148925) (not e!124813))))

(declare-fun lt!275339 () (_ BitVec 64))

(declare-fun lt!275337 () (_ BitVec 64))

(declare-fun lt!275340 () (_ BitVec 64))

(assert (=> d!62737 (= res!148925 (= lt!275339 (bvsub lt!275337 lt!275340)))))

(assert (=> d!62737 (or (= (bvand lt!275337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275337 lt!275340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62737 (= lt!275340 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274719)))) ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274719))) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274719)))))))

(declare-fun lt!275342 () (_ BitVec 64))

(declare-fun lt!275341 () (_ BitVec 64))

(assert (=> d!62737 (= lt!275337 (bvmul lt!275342 lt!275341))))

(assert (=> d!62737 (or (= lt!275342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275341 (bvsdiv (bvmul lt!275342 lt!275341) lt!275342)))))

(assert (=> d!62737 (= lt!275341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62737 (= lt!275342 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274719)))))))

(assert (=> d!62737 (= lt!275339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274719))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274719)))))))

(assert (=> d!62737 (invariant!0 (currentBit!8889 (_1!8371 lt!274719)) (currentByte!8894 (_1!8371 lt!274719)) (size!4253 (buf!4696 (_1!8371 lt!274719))))))

(assert (=> d!62737 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274719))) (currentByte!8894 (_1!8371 lt!274719)) (currentBit!8889 (_1!8371 lt!274719))) lt!275339)))

(declare-fun b!179467 () Bool)

(declare-fun res!148924 () Bool)

(assert (=> b!179467 (=> (not res!148924) (not e!124813))))

(assert (=> b!179467 (= res!148924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275339))))

(declare-fun b!179468 () Bool)

(declare-fun lt!275338 () (_ BitVec 64))

(assert (=> b!179468 (= e!124813 (bvsle lt!275339 (bvmul lt!275338 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179468 (or (= lt!275338 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275338 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275338)))))

(assert (=> b!179468 (= lt!275338 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274719)))))))

(assert (= (and d!62737 res!148925) b!179467))

(assert (= (and b!179467 res!148924) b!179468))

(declare-fun m!279729 () Bool)

(assert (=> d!62737 m!279729))

(declare-fun m!279731 () Bool)

(assert (=> d!62737 m!279731))

(assert (=> b!179205 d!62737))

(declare-fun d!62739 () Bool)

(assert (=> d!62739 (= (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274715)))) (and (bvsge (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8889 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8894 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274715)))) (and (= (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274715))))))))))

(assert (=> b!179205 d!62739))

(declare-fun d!62741 () Bool)

(declare-datatypes ((tuple2!15466 0))(
  ( (tuple2!15467 (_1!8378 Bool) (_2!8378 BitStream!7614)) )
))
(declare-fun lt!275345 () tuple2!15466)

(declare-fun readBit!0 (BitStream!7614) tuple2!15466)

(assert (=> d!62741 (= lt!275345 (readBit!0 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204))))))

(assert (=> d!62741 (= (readBitPure!0 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204))) (tuple2!15453 (_2!8378 lt!275345) (_1!8378 lt!275345)))))

(declare-fun bs!15641 () Bool)

(assert (= bs!15641 d!62741))

(declare-fun m!279733 () Bool)

(assert (=> bs!15641 m!279733))

(assert (=> b!179205 d!62741))

(declare-fun d!62743 () Bool)

(declare-fun e!124814 () Bool)

(assert (=> d!62743 e!124814))

(declare-fun res!148927 () Bool)

(assert (=> d!62743 (=> (not res!148927) (not e!124814))))

(declare-fun lt!275346 () (_ BitVec 64))

(declare-fun lt!275349 () (_ BitVec 64))

(declare-fun lt!275348 () (_ BitVec 64))

(assert (=> d!62743 (= res!148927 (= lt!275348 (bvsub lt!275346 lt!275349)))))

(assert (=> d!62743 (or (= (bvand lt!275346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275346 lt!275349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62743 (= lt!275349 (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274717)))) ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274717))) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274717)))))))

(declare-fun lt!275351 () (_ BitVec 64))

(declare-fun lt!275350 () (_ BitVec 64))

(assert (=> d!62743 (= lt!275346 (bvmul lt!275351 lt!275350))))

(assert (=> d!62743 (or (= lt!275351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275350 (bvsdiv (bvmul lt!275351 lt!275350) lt!275351)))))

(assert (=> d!62743 (= lt!275350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62743 (= lt!275351 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274717)))))))

(assert (=> d!62743 (= lt!275348 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8894 (_1!8371 lt!274717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8889 (_1!8371 lt!274717)))))))

(assert (=> d!62743 (invariant!0 (currentBit!8889 (_1!8371 lt!274717)) (currentByte!8894 (_1!8371 lt!274717)) (size!4253 (buf!4696 (_1!8371 lt!274717))))))

(assert (=> d!62743 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!274717))) (currentByte!8894 (_1!8371 lt!274717)) (currentBit!8889 (_1!8371 lt!274717))) lt!275348)))

(declare-fun b!179469 () Bool)

(declare-fun res!148926 () Bool)

(assert (=> b!179469 (=> (not res!148926) (not e!124814))))

(assert (=> b!179469 (= res!148926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275348))))

(declare-fun b!179470 () Bool)

(declare-fun lt!275347 () (_ BitVec 64))

(assert (=> b!179470 (= e!124814 (bvsle lt!275348 (bvmul lt!275347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179470 (or (= lt!275347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275347)))))

(assert (=> b!179470 (= lt!275347 ((_ sign_extend 32) (size!4253 (buf!4696 (_1!8371 lt!274717)))))))

(assert (= (and d!62743 res!148927) b!179469))

(assert (= (and b!179469 res!148926) b!179470))

(declare-fun m!279735 () Bool)

(assert (=> d!62743 m!279735))

(declare-fun m!279737 () Bool)

(assert (=> d!62743 m!279737))

(assert (=> b!179205 d!62743))

(declare-fun d!62745 () Bool)

(declare-fun e!124817 () Bool)

(assert (=> d!62745 e!124817))

(declare-fun res!148930 () Bool)

(assert (=> d!62745 (=> (not res!148930) (not e!124817))))

(declare-fun lt!275363 () tuple2!15452)

(declare-fun lt!275362 () tuple2!15452)

(assert (=> d!62745 (= res!148930 (= (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275363))) (currentByte!8894 (_1!8371 lt!275363)) (currentBit!8889 (_1!8371 lt!275363))) (bitIndex!0 (size!4253 (buf!4696 (_1!8371 lt!275362))) (currentByte!8894 (_1!8371 lt!275362)) (currentBit!8889 (_1!8371 lt!275362)))))))

(declare-fun lt!275361 () Unit!12886)

(declare-fun lt!275360 () BitStream!7614)

(declare-fun choose!50 (BitStream!7614 BitStream!7614 BitStream!7614 tuple2!15452 tuple2!15452 BitStream!7614 Bool tuple2!15452 tuple2!15452 BitStream!7614 Bool) Unit!12886)

(assert (=> d!62745 (= lt!275361 (choose!50 lt!274726 (_2!8372 lt!274714) lt!275360 lt!275363 (tuple2!15453 (_1!8371 lt!275363) (_2!8371 lt!275363)) (_1!8371 lt!275363) (_2!8371 lt!275363) lt!275362 (tuple2!15453 (_1!8371 lt!275362) (_2!8371 lt!275362)) (_1!8371 lt!275362) (_2!8371 lt!275362)))))

(assert (=> d!62745 (= lt!275362 (readBitPure!0 lt!275360))))

(assert (=> d!62745 (= lt!275363 (readBitPure!0 lt!274726))))

(assert (=> d!62745 (= lt!275360 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 lt!274726) (currentBit!8889 lt!274726)))))

(assert (=> d!62745 (invariant!0 (currentBit!8889 lt!274726) (currentByte!8894 lt!274726) (size!4253 (buf!4696 (_2!8372 lt!274714))))))

(assert (=> d!62745 (= (readBitPrefixLemma!0 lt!274726 (_2!8372 lt!274714)) lt!275361)))

(declare-fun b!179473 () Bool)

(assert (=> b!179473 (= e!124817 (= (_2!8371 lt!275363) (_2!8371 lt!275362)))))

(assert (= (and d!62745 res!148930) b!179473))

(declare-fun m!279739 () Bool)

(assert (=> d!62745 m!279739))

(declare-fun m!279741 () Bool)

(assert (=> d!62745 m!279741))

(assert (=> d!62745 m!279301))

(declare-fun m!279743 () Bool)

(assert (=> d!62745 m!279743))

(declare-fun m!279745 () Bool)

(assert (=> d!62745 m!279745))

(declare-fun m!279747 () Bool)

(assert (=> d!62745 m!279747))

(assert (=> b!179205 d!62745))

(declare-fun d!62747 () Bool)

(declare-fun lt!275364 () tuple2!15466)

(assert (=> d!62747 (= lt!275364 (readBit!0 lt!274726))))

(assert (=> d!62747 (= (readBitPure!0 lt!274726) (tuple2!15453 (_2!8378 lt!275364) (_1!8378 lt!275364)))))

(declare-fun bs!15642 () Bool)

(assert (= bs!15642 d!62747))

(declare-fun m!279749 () Bool)

(assert (=> bs!15642 m!279749))

(assert (=> b!179205 d!62747))

(declare-fun b!179474 () Bool)

(declare-fun e!124819 () Unit!12886)

(declare-fun Unit!12902 () Unit!12886)

(assert (=> b!179474 (= e!124819 Unit!12902)))

(declare-fun d!62749 () Bool)

(declare-fun e!124818 () Bool)

(assert (=> d!62749 e!124818))

(declare-fun res!148933 () Bool)

(assert (=> d!62749 (=> (not res!148933) (not e!124818))))

(declare-fun lt!275383 () tuple2!15456)

(assert (=> d!62749 (= res!148933 (isPrefixOf!0 (_1!8373 lt!275383) (_2!8373 lt!275383)))))

(declare-fun lt!275371 () BitStream!7614)

(assert (=> d!62749 (= lt!275383 (tuple2!15457 lt!275371 (_2!8372 lt!274714)))))

(declare-fun lt!275369 () Unit!12886)

(declare-fun lt!275382 () Unit!12886)

(assert (=> d!62749 (= lt!275369 lt!275382)))

(assert (=> d!62749 (isPrefixOf!0 lt!275371 (_2!8372 lt!274714))))

(assert (=> d!62749 (= lt!275382 (lemmaIsPrefixTransitive!0 lt!275371 (_2!8372 lt!274714) (_2!8372 lt!274714)))))

(declare-fun lt!275365 () Unit!12886)

(declare-fun lt!275380 () Unit!12886)

(assert (=> d!62749 (= lt!275365 lt!275380)))

(assert (=> d!62749 (isPrefixOf!0 lt!275371 (_2!8372 lt!274714))))

(assert (=> d!62749 (= lt!275380 (lemmaIsPrefixTransitive!0 lt!275371 thiss!1204 (_2!8372 lt!274714)))))

(declare-fun lt!275384 () Unit!12886)

(assert (=> d!62749 (= lt!275384 e!124819)))

(declare-fun c!9294 () Bool)

(assert (=> d!62749 (= c!9294 (not (= (size!4253 (buf!4696 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!275381 () Unit!12886)

(declare-fun lt!275377 () Unit!12886)

(assert (=> d!62749 (= lt!275381 lt!275377)))

(assert (=> d!62749 (isPrefixOf!0 (_2!8372 lt!274714) (_2!8372 lt!274714))))

(assert (=> d!62749 (= lt!275377 (lemmaIsPrefixRefl!0 (_2!8372 lt!274714)))))

(declare-fun lt!275375 () Unit!12886)

(declare-fun lt!275366 () Unit!12886)

(assert (=> d!62749 (= lt!275375 lt!275366)))

(assert (=> d!62749 (= lt!275366 (lemmaIsPrefixRefl!0 (_2!8372 lt!274714)))))

(declare-fun lt!275379 () Unit!12886)

(declare-fun lt!275374 () Unit!12886)

(assert (=> d!62749 (= lt!275379 lt!275374)))

(assert (=> d!62749 (isPrefixOf!0 lt!275371 lt!275371)))

(assert (=> d!62749 (= lt!275374 (lemmaIsPrefixRefl!0 lt!275371))))

(declare-fun lt!275368 () Unit!12886)

(declare-fun lt!275367 () Unit!12886)

(assert (=> d!62749 (= lt!275368 lt!275367)))

(assert (=> d!62749 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62749 (= lt!275367 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62749 (= lt!275371 (BitStream!7615 (buf!4696 (_2!8372 lt!274714)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(assert (=> d!62749 (isPrefixOf!0 thiss!1204 (_2!8372 lt!274714))))

(assert (=> d!62749 (= (reader!0 thiss!1204 (_2!8372 lt!274714)) lt!275383)))

(declare-fun lt!275378 () (_ BitVec 64))

(declare-fun b!179475 () Bool)

(declare-fun lt!275372 () (_ BitVec 64))

(assert (=> b!179475 (= e!124818 (= (_1!8373 lt!275383) (withMovedBitIndex!0 (_2!8373 lt!275383) (bvsub lt!275378 lt!275372))))))

(assert (=> b!179475 (or (= (bvand lt!275378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275378 lt!275372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179475 (= lt!275372 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714))))))

(assert (=> b!179475 (= lt!275378 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(declare-fun b!179476 () Bool)

(declare-fun res!148932 () Bool)

(assert (=> b!179476 (=> (not res!148932) (not e!124818))))

(assert (=> b!179476 (= res!148932 (isPrefixOf!0 (_2!8373 lt!275383) (_2!8372 lt!274714)))))

(declare-fun b!179477 () Bool)

(declare-fun res!148931 () Bool)

(assert (=> b!179477 (=> (not res!148931) (not e!124818))))

(assert (=> b!179477 (= res!148931 (isPrefixOf!0 (_1!8373 lt!275383) thiss!1204))))

(declare-fun b!179478 () Bool)

(declare-fun lt!275370 () Unit!12886)

(assert (=> b!179478 (= e!124819 lt!275370)))

(declare-fun lt!275376 () (_ BitVec 64))

(assert (=> b!179478 (= lt!275376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!275373 () (_ BitVec 64))

(assert (=> b!179478 (= lt!275373 (bitIndex!0 (size!4253 (buf!4696 thiss!1204)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(assert (=> b!179478 (= lt!275370 (arrayBitRangesEqSymmetric!0 (buf!4696 thiss!1204) (buf!4696 (_2!8372 lt!274714)) lt!275376 lt!275373))))

(assert (=> b!179478 (arrayBitRangesEq!0 (buf!4696 (_2!8372 lt!274714)) (buf!4696 thiss!1204) lt!275376 lt!275373)))

(assert (= (and d!62749 c!9294) b!179478))

(assert (= (and d!62749 (not c!9294)) b!179474))

(assert (= (and d!62749 res!148933) b!179477))

(assert (= (and b!179477 res!148931) b!179476))

(assert (= (and b!179476 res!148932) b!179475))

(declare-fun m!279751 () Bool)

(assert (=> b!179476 m!279751))

(declare-fun m!279753 () Bool)

(assert (=> b!179477 m!279753))

(assert (=> b!179478 m!279295))

(declare-fun m!279755 () Bool)

(assert (=> b!179478 m!279755))

(declare-fun m!279757 () Bool)

(assert (=> b!179478 m!279757))

(assert (=> d!62749 m!279319))

(declare-fun m!279759 () Bool)

(assert (=> d!62749 m!279759))

(declare-fun m!279761 () Bool)

(assert (=> d!62749 m!279761))

(declare-fun m!279763 () Bool)

(assert (=> d!62749 m!279763))

(assert (=> d!62749 m!279711))

(assert (=> d!62749 m!279713))

(declare-fun m!279765 () Bool)

(assert (=> d!62749 m!279765))

(declare-fun m!279767 () Bool)

(assert (=> d!62749 m!279767))

(declare-fun m!279769 () Bool)

(assert (=> d!62749 m!279769))

(declare-fun m!279771 () Bool)

(assert (=> d!62749 m!279771))

(declare-fun m!279773 () Bool)

(assert (=> d!62749 m!279773))

(declare-fun m!279775 () Bool)

(assert (=> b!179475 m!279775))

(assert (=> b!179475 m!279317))

(assert (=> b!179475 m!279295))

(assert (=> b!179205 d!62749))

(declare-fun d!62751 () Bool)

(assert (=> d!62751 (= (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204))) (and (bvsge (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8889 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8894 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204))) (and (= (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8894 thiss!1204) (size!4253 (buf!4696 thiss!1204)))))))))

(assert (=> b!179195 d!62751))

(declare-fun d!62753 () Bool)

(assert (=> d!62753 (= (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274714)))) (and (bvsge (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8889 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8894 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274714)))) (and (= (currentBit!8889 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274714))))))))))

(assert (=> b!179206 d!62753))

(declare-fun d!62755 () Bool)

(assert (=> d!62755 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))) ((_ sign_extend 32) (currentByte!8894 thiss!1204)) ((_ sign_extend 32) (currentBit!8889 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4253 (buf!4696 thiss!1204))) ((_ sign_extend 32) (currentByte!8894 thiss!1204)) ((_ sign_extend 32) (currentBit!8889 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15643 () Bool)

(assert (= bs!15643 d!62755))

(assert (=> bs!15643 m!279681))

(assert (=> b!179196 d!62755))

(declare-fun d!62757 () Bool)

(declare-fun lt!275385 () tuple2!15466)

(assert (=> d!62757 (= lt!275385 (readBit!0 (readerFrom!0 (_2!8372 lt!274715) (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204))))))

(assert (=> d!62757 (= (readBitPure!0 (readerFrom!0 (_2!8372 lt!274715) (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204))) (tuple2!15453 (_2!8378 lt!275385) (_1!8378 lt!275385)))))

(declare-fun bs!15644 () Bool)

(assert (= bs!15644 d!62757))

(assert (=> bs!15644 m!279289))

(declare-fun m!279777 () Bool)

(assert (=> bs!15644 m!279777))

(assert (=> b!179207 d!62757))

(declare-fun d!62759 () Bool)

(declare-fun e!124822 () Bool)

(assert (=> d!62759 e!124822))

(declare-fun res!148937 () Bool)

(assert (=> d!62759 (=> (not res!148937) (not e!124822))))

(assert (=> d!62759 (= res!148937 (invariant!0 (currentBit!8889 (_2!8372 lt!274715)) (currentByte!8894 (_2!8372 lt!274715)) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (=> d!62759 (= (readerFrom!0 (_2!8372 lt!274715) (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204)) (BitStream!7615 (buf!4696 (_2!8372 lt!274715)) (currentByte!8894 thiss!1204) (currentBit!8889 thiss!1204)))))

(declare-fun b!179481 () Bool)

(assert (=> b!179481 (= e!124822 (invariant!0 (currentBit!8889 thiss!1204) (currentByte!8894 thiss!1204) (size!4253 (buf!4696 (_2!8372 lt!274715)))))))

(assert (= (and d!62759 res!148937) b!179481))

(assert (=> d!62759 m!279679))

(assert (=> b!179481 m!279315))

(assert (=> b!179207 d!62759))

(assert (=> b!179202 d!62729))

(declare-fun d!62761 () Bool)

(declare-fun res!148938 () Bool)

(declare-fun e!124824 () Bool)

(assert (=> d!62761 (=> (not res!148938) (not e!124824))))

(assert (=> d!62761 (= res!148938 (= (size!4253 (buf!4696 (_2!8372 lt!274715))) (size!4253 (buf!4696 (_2!8372 lt!274714)))))))

(assert (=> d!62761 (= (isPrefixOf!0 (_2!8372 lt!274715) (_2!8372 lt!274714)) e!124824)))

(declare-fun b!179482 () Bool)

(declare-fun res!148939 () Bool)

(assert (=> b!179482 (=> (not res!148939) (not e!124824))))

(assert (=> b!179482 (= res!148939 (bvsle (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715))) (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274714))) (currentByte!8894 (_2!8372 lt!274714)) (currentBit!8889 (_2!8372 lt!274714)))))))

(declare-fun b!179483 () Bool)

(declare-fun e!124823 () Bool)

(assert (=> b!179483 (= e!124824 e!124823)))

(declare-fun res!148940 () Bool)

(assert (=> b!179483 (=> res!148940 e!124823)))

(assert (=> b!179483 (= res!148940 (= (size!4253 (buf!4696 (_2!8372 lt!274715))) #b00000000000000000000000000000000))))

(declare-fun b!179484 () Bool)

(assert (=> b!179484 (= e!124823 (arrayBitRangesEq!0 (buf!4696 (_2!8372 lt!274715)) (buf!4696 (_2!8372 lt!274714)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4253 (buf!4696 (_2!8372 lt!274715))) (currentByte!8894 (_2!8372 lt!274715)) (currentBit!8889 (_2!8372 lt!274715)))))))

(assert (= (and d!62761 res!148938) b!179482))

(assert (= (and b!179482 res!148939) b!179483))

(assert (= (and b!179483 (not res!148940)) b!179484))

(assert (=> b!179482 m!279293))

(assert (=> b!179482 m!279317))

(assert (=> b!179484 m!279293))

(assert (=> b!179484 m!279293))

(declare-fun m!279779 () Bool)

(assert (=> b!179484 m!279779))

(assert (=> b!179203 d!62761))

(assert (=> b!179204 d!62723))

(assert (=> b!179204 d!62725))

(declare-fun d!62763 () Bool)

(assert (=> d!62763 (= (invariant!0 (currentBit!8889 (_2!8372 lt!274714)) (currentByte!8894 (_2!8372 lt!274714)) (size!4253 (buf!4696 (_2!8372 lt!274714)))) (and (bvsge (currentBit!8889 (_2!8372 lt!274714)) #b00000000000000000000000000000000) (bvslt (currentBit!8889 (_2!8372 lt!274714)) #b00000000000000000000000000001000) (bvsge (currentByte!8894 (_2!8372 lt!274714)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8894 (_2!8372 lt!274714)) (size!4253 (buf!4696 (_2!8372 lt!274714)))) (and (= (currentBit!8889 (_2!8372 lt!274714)) #b00000000000000000000000000000000) (= (currentByte!8894 (_2!8372 lt!274714)) (size!4253 (buf!4696 (_2!8372 lt!274714))))))))))

(assert (=> b!179210 d!62763))

(declare-fun d!62765 () Bool)

(assert (=> d!62765 (= (array_inv!3994 (buf!4696 thiss!1204)) (bvsge (size!4253 (buf!4696 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!179211 d!62765))

(check-sat (not b!179428) (not b!179477) (not b!179279) (not b!179445) (not d!62735) (not b!179429) (not d!62757) (not b!179422) (not d!62749) (not b!179431) (not b!179463) (not d!62649) (not d!62755) (not d!62723) (not b!179484) (not b!179476) (not b!179482) (not b!179423) (not b!179421) (not d!62643) (not d!62743) (not b!179418) (not b!179446) (not b!179451) (not b!179464) (not b!179277) (not d!62759) (not d!62745) (not b!179478) (not b!179416) (not d!62727) (not d!62737) (not b!179465) (not d!62733) (not b!179466) (not d!62725) (not d!62747) (not d!62741) (not d!62645) (not b!179449) (not b!179448) (not bm!2927) (not b!179447) (not d!62651) (not b!179427) (not b!179426) (not d!62731) (not b!179475) (not b!179481))
(check-sat)
