; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31070 () Bool)

(assert start!31070)

(declare-fun b!156947 () Bool)

(declare-fun res!131172 () Bool)

(declare-fun e!106197 () Bool)

(assert (=> b!156947 (=> (not res!131172) (not e!106197))))

(declare-datatypes ((array!7228 0))(
  ( (array!7229 (arr!4132 (Array (_ BitVec 32) (_ BitVec 8))) (size!3267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5744 0))(
  ( (BitStream!5745 (buf!3746 array!7228) (currentByte!6873 (_ BitVec 32)) (currentBit!6868 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5744)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156947 (= res!131172 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) ((_ sign_extend 32) (currentByte!6873 bs!65)) ((_ sign_extend 32) (currentBit!6868 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156948 () Bool)

(declare-fun res!131170 () Bool)

(declare-fun e!106195 () Bool)

(assert (=> b!156948 (=> res!131170 e!106195)))

(declare-fun lt!245675 () (_ BitVec 64))

(declare-fun lt!245682 () BitStream!5744)

(declare-fun lt!245681 () (_ BitVec 64))

(assert (=> b!156948 (= res!131170 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun res!131174 () Bool)

(assert (=> start!31070 (=> (not res!131174) (not e!106197))))

(declare-fun arr!153 () array!7228)

(assert (=> start!31070 (= res!131174 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3267 arr!153))))))

(assert (=> start!31070 e!106197))

(assert (=> start!31070 true))

(declare-fun array_inv!3032 (array!7228) Bool)

(assert (=> start!31070 (array_inv!3032 arr!153)))

(declare-fun e!106198 () Bool)

(declare-fun inv!12 (BitStream!5744) Bool)

(assert (=> start!31070 (and (inv!12 bs!65) e!106198)))

(declare-fun b!156949 () Bool)

(declare-fun e!106196 () Bool)

(assert (=> b!156949 (= e!106196 (not e!106195))))

(declare-fun res!131171 () Bool)

(assert (=> b!156949 (=> res!131171 e!106195)))

(assert (=> b!156949 (= res!131171 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156949 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156949 (= lt!245675 ((_ sign_extend 32) (currentBit!6868 lt!245682)))))

(assert (=> b!156949 (= lt!245681 ((_ sign_extend 32) (currentByte!6873 lt!245682)))))

(declare-datatypes ((Unit!10166 0))(
  ( (Unit!10167) )
))
(declare-fun lt!245679 () Unit!10166)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5744 BitStream!5744 (_ BitVec 64) (_ BitVec 32)) Unit!10166)

(assert (=> b!156949 (= lt!245679 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245682 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14112 0))(
  ( (tuple2!14113 (_1!7500 BitStream!5744) (_2!7500 (_ BitVec 8))) )
))
(declare-fun lt!245678 () tuple2!14112)

(declare-fun readBytePure!0 (BitStream!5744) tuple2!14112)

(assert (=> b!156949 (= lt!245678 (readBytePure!0 lt!245682))))

(declare-datatypes ((tuple2!14114 0))(
  ( (tuple2!14115 (_1!7501 BitStream!5744) (_2!7501 array!7228)) )
))
(declare-fun lt!245683 () tuple2!14114)

(declare-fun lt!245680 () tuple2!14114)

(declare-fun b!156950 () Bool)

(assert (=> b!156950 (= e!106195 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsle (size!3267 (_2!7501 lt!245683)) (size!3267 (_2!7501 lt!245680)))))))

(declare-fun lt!245677 () tuple2!14114)

(declare-fun arrayRangesEq!433 (array!7228 array!7228 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156950 (arrayRangesEq!433 (_2!7501 lt!245680) (_2!7501 lt!245677) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!245674 () array!7228)

(declare-fun lt!245676 () Unit!10166)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5744 array!7228 (_ BitVec 32) (_ BitVec 32)) Unit!10166)

(assert (=> b!156950 (= lt!245676 (readByteArrayLoopArrayPrefixLemma!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5744 array!7228 (_ BitVec 32) (_ BitVec 32)) tuple2!14114)

(declare-fun withMovedByteIndex!0 (BitStream!5744 (_ BitVec 32)) BitStream!5744)

(assert (=> b!156950 (= lt!245677 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245673 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156950 (= lt!245673 (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))))))

(declare-fun b!156951 () Bool)

(assert (=> b!156951 (= e!106198 (array_inv!3032 (buf!3746 bs!65)))))

(declare-fun b!156952 () Bool)

(assert (=> b!156952 (= e!106197 e!106196)))

(declare-fun res!131173 () Bool)

(assert (=> b!156952 (=> (not res!131173) (not e!106196))))

(assert (=> b!156952 (= res!131173 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!156952 (= lt!245680 (readByteArrayLoopPure!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156952 (= lt!245674 (array!7229 (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (size!3267 arr!153)))))

(assert (=> b!156952 (= lt!245682 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!156952 (= lt!245683 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31070 res!131174) b!156947))

(assert (= (and b!156947 res!131172) b!156952))

(assert (= (and b!156952 res!131173) b!156949))

(assert (= (and b!156949 (not res!131171)) b!156948))

(assert (= (and b!156948 (not res!131170)) b!156950))

(assert (= start!31070 b!156951))

(declare-fun m!244749 () Bool)

(assert (=> b!156948 m!244749))

(declare-fun m!244751 () Bool)

(assert (=> b!156947 m!244751))

(declare-fun m!244753 () Bool)

(assert (=> start!31070 m!244753))

(declare-fun m!244755 () Bool)

(assert (=> start!31070 m!244755))

(declare-fun m!244757 () Bool)

(assert (=> b!156952 m!244757))

(declare-fun m!244759 () Bool)

(assert (=> b!156952 m!244759))

(declare-fun m!244761 () Bool)

(assert (=> b!156952 m!244761))

(declare-fun m!244763 () Bool)

(assert (=> b!156952 m!244763))

(declare-fun m!244765 () Bool)

(assert (=> b!156952 m!244765))

(assert (=> b!156950 m!244757))

(declare-fun m!244767 () Bool)

(assert (=> b!156950 m!244767))

(declare-fun m!244769 () Bool)

(assert (=> b!156950 m!244769))

(declare-fun m!244771 () Bool)

(assert (=> b!156950 m!244771))

(assert (=> b!156950 m!244771))

(declare-fun m!244773 () Bool)

(assert (=> b!156950 m!244773))

(declare-fun m!244775 () Bool)

(assert (=> b!156950 m!244775))

(assert (=> b!156950 m!244761))

(declare-fun m!244777 () Bool)

(assert (=> b!156951 m!244777))

(declare-fun m!244779 () Bool)

(assert (=> b!156949 m!244779))

(declare-fun m!244781 () Bool)

(assert (=> b!156949 m!244781))

(declare-fun m!244783 () Bool)

(assert (=> b!156949 m!244783))

(push 1)

(assert (not b!156951))

(assert (not b!156947))

(assert (not start!31070))

(assert (not b!156949))

(assert (not b!156952))

(assert (not b!156950))

(assert (not b!156948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52148 () Bool)

(declare-fun res!131179 () Bool)

(declare-fun e!106204 () Bool)

(assert (=> d!52148 (=> res!131179 e!106204)))

(assert (=> d!52148 (= res!131179 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52148 (= (arrayRangesEq!433 (_2!7501 lt!245680) (_2!7501 lt!245677) #b00000000000000000000000000000000 to!236) e!106204)))

(declare-fun b!156957 () Bool)

(declare-fun e!106205 () Bool)

(assert (=> b!156957 (= e!106204 e!106205)))

(declare-fun res!131180 () Bool)

(assert (=> b!156957 (=> (not res!131180) (not e!106205))))

(assert (=> b!156957 (= res!131180 (= (select (arr!4132 (_2!7501 lt!245680)) #b00000000000000000000000000000000) (select (arr!4132 (_2!7501 lt!245677)) #b00000000000000000000000000000000)))))

(declare-fun b!156958 () Bool)

(assert (=> b!156958 (= e!106205 (arrayRangesEq!433 (_2!7501 lt!245680) (_2!7501 lt!245677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52148 (not res!131179)) b!156957))

(assert (= (and b!156957 res!131180) b!156958))

(declare-fun m!244799 () Bool)

(assert (=> b!156957 m!244799))

(declare-fun m!244801 () Bool)

(assert (=> b!156957 m!244801))

(declare-fun m!244803 () Bool)

(assert (=> b!156958 m!244803))

(assert (=> b!156950 d!52148))

(declare-fun d!52152 () Bool)

(declare-datatypes ((tuple2!14120 0))(
  ( (tuple2!14121 (_1!7505 (_ BitVec 8)) (_2!7505 BitStream!5744)) )
))
(declare-fun lt!245704 () tuple2!14120)

(declare-fun readByte!0 (BitStream!5744) tuple2!14120)

(assert (=> d!52152 (= lt!245704 (readByte!0 bs!65))))

(assert (=> d!52152 (= (readBytePure!0 bs!65) (tuple2!14113 (_2!7505 lt!245704) (_1!7505 lt!245704)))))

(declare-fun bs!12794 () Bool)

(assert (= bs!12794 d!52152))

(declare-fun m!244811 () Bool)

(assert (=> bs!12794 m!244811))

(assert (=> b!156950 d!52152))

(declare-fun d!52156 () Bool)

(declare-fun lt!245713 () tuple2!14114)

(declare-fun lt!245715 () tuple2!14114)

(assert (=> d!52156 (arrayRangesEq!433 (_2!7501 lt!245713) (_2!7501 lt!245715) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!245714 () BitStream!5744)

(declare-fun lt!245716 () Unit!10166)

(declare-fun choose!35 (BitStream!5744 array!7228 (_ BitVec 32) (_ BitVec 32) tuple2!14114 array!7228 BitStream!5744 tuple2!14114 array!7228) Unit!10166)

(assert (=> d!52156 (= lt!245716 (choose!35 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!245713 (_2!7501 lt!245713) lt!245714 lt!245715 (_2!7501 lt!245715)))))

(assert (=> d!52156 (= lt!245715 (readByteArrayLoopPure!0 lt!245714 (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 (readBytePure!0 lt!245682))) (size!3267 lt!245674)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52156 (= lt!245714 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))))

(assert (=> d!52156 (= lt!245713 (readByteArrayLoopPure!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52156 (= (readByteArrayLoopArrayPrefixLemma!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!245716)))

(declare-fun bs!12798 () Bool)

(assert (= bs!12798 d!52156))

(declare-fun m!244815 () Bool)

(assert (=> bs!12798 m!244815))

(assert (=> bs!12798 m!244765))

(assert (=> bs!12798 m!244783))

(declare-fun m!244817 () Bool)

(assert (=> bs!12798 m!244817))

(assert (=> bs!12798 m!244771))

(declare-fun m!244819 () Bool)

(assert (=> bs!12798 m!244819))

(declare-fun m!244821 () Bool)

(assert (=> bs!12798 m!244821))

(assert (=> b!156950 d!52156))

(declare-datatypes ((tuple3!656 0))(
  ( (tuple3!657 (_1!7506 Unit!10166) (_2!7506 BitStream!5744) (_3!445 array!7228)) )
))
(declare-fun lt!245731 () tuple3!656)

(declare-fun d!52163 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5744 array!7228 (_ BitVec 32) (_ BitVec 32)) tuple3!656)

(assert (=> d!52163 (= lt!245731 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52163 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14115 (_2!7506 lt!245731) (_3!445 lt!245731)))))

(declare-fun bs!12805 () Bool)

(assert (= bs!12805 d!52163))

(assert (=> bs!12805 m!244771))

(declare-fun m!244839 () Bool)

(assert (=> bs!12805 m!244839))

(assert (=> b!156950 d!52163))

(declare-fun d!52179 () Bool)

(declare-datatypes ((tuple2!14122 0))(
  ( (tuple2!14123 (_1!7507 Unit!10166) (_2!7507 BitStream!5744)) )
))
(declare-fun moveByteIndex!0 (BitStream!5744 (_ BitVec 32)) tuple2!14122)

(assert (=> d!52179 (= (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (_2!7507 (moveByteIndex!0 lt!245682 #b00000000000000000000000000000001)))))

(declare-fun bs!12806 () Bool)

(assert (= bs!12806 d!52179))

(declare-fun m!244841 () Bool)

(assert (=> bs!12806 m!244841))

(assert (=> b!156950 d!52179))

(declare-fun d!52181 () Bool)

(assert (=> d!52181 (= (array_inv!3032 (buf!3746 bs!65)) (bvsge (size!3267 (buf!3746 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156951 d!52181))

(declare-fun d!52183 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52183 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) ((_ sign_extend 32) (currentByte!6873 bs!65)) ((_ sign_extend 32) (currentBit!6868 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) ((_ sign_extend 32) (currentByte!6873 bs!65)) ((_ sign_extend 32) (currentBit!6868 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12807 () Bool)

(assert (= bs!12807 d!52183))

(declare-fun m!244843 () Bool)

(assert (=> bs!12807 m!244843))

(assert (=> b!156947 d!52183))

(declare-fun lt!245732 () tuple3!656)

(declare-fun d!52185 () Bool)

(assert (=> d!52185 (= lt!245732 (readByteArrayLoop!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52185 (= (readByteArrayLoopPure!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14115 (_2!7506 lt!245732) (_3!445 lt!245732)))))

(declare-fun bs!12808 () Bool)

(assert (= bs!12808 d!52185))

(declare-fun m!244845 () Bool)

(assert (=> bs!12808 m!244845))

(assert (=> b!156952 d!52185))

(assert (=> b!156952 d!52152))

(declare-fun d!52187 () Bool)

(assert (=> d!52187 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7507 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12809 () Bool)

(assert (= bs!12809 d!52187))

(declare-fun m!244847 () Bool)

(assert (=> bs!12809 m!244847))

(assert (=> b!156952 d!52187))

(declare-fun d!52189 () Bool)

(declare-fun lt!245733 () tuple3!656)

(assert (=> d!52189 (= lt!245733 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52189 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14115 (_2!7506 lt!245733) (_3!445 lt!245733)))))

(declare-fun bs!12810 () Bool)

(assert (= bs!12810 d!52189))

(declare-fun m!244849 () Bool)

(assert (=> bs!12810 m!244849))

(assert (=> b!156952 d!52189))

(declare-fun d!52191 () Bool)

(assert (=> d!52191 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12811 () Bool)

(assert (= bs!12811 d!52191))

(declare-fun m!244851 () Bool)

(assert (=> bs!12811 m!244851))

(assert (=> b!156948 d!52191))

(declare-fun d!52193 () Bool)

(assert (=> d!52193 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12812 () Bool)

(assert (= bs!12812 d!52193))

(assert (=> bs!12812 m!244851))

(assert (=> b!156949 d!52193))

(declare-fun d!52195 () Bool)

(declare-fun e!106217 () Bool)

(assert (=> d!52195 e!106217))

(declare-fun res!131192 () Bool)

(assert (=> d!52195 (=> (not res!131192) (not e!106217))))

(assert (=> d!52195 (= res!131192 (and (or (let ((rhs!3423 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3423 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3423) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52196 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52196 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52196 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3422 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3422 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3422) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!245740 () Unit!10166)

(declare-fun choose!57 (BitStream!5744 BitStream!5744 (_ BitVec 64) (_ BitVec 32)) Unit!10166)

(assert (=> d!52195 (= lt!245740 (choose!57 bs!65 lt!245682 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52195 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245682 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!245740)))

(declare-fun lt!245741 () (_ BitVec 32))

(declare-fun b!156970 () Bool)

(assert (=> b!156970 (= e!106217 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) ((_ sign_extend 32) (currentByte!6873 lt!245682)) ((_ sign_extend 32) (currentBit!6868 lt!245682)) (bvsub (bvsub to!236 from!240) lt!245741)))))

(assert (=> b!156970 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!245741 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!245741) #b10000000000000000000000000000000)))))

(declare-fun lt!245742 () (_ BitVec 64))

(assert (=> b!156970 (= lt!245741 ((_ extract 31 0) lt!245742))))

(assert (=> b!156970 (and (bvslt lt!245742 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!245742 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!156970 (= lt!245742 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52195 res!131192) b!156970))

(declare-fun m!244853 () Bool)

(assert (=> d!52195 m!244853))

(declare-fun m!244855 () Bool)

(assert (=> b!156970 m!244855))

(assert (=> b!156949 d!52195))

(declare-fun d!52198 () Bool)

(declare-fun lt!245743 () tuple2!14120)

(assert (=> d!52198 (= lt!245743 (readByte!0 lt!245682))))

(assert (=> d!52198 (= (readBytePure!0 lt!245682) (tuple2!14113 (_2!7505 lt!245743) (_1!7505 lt!245743)))))

(declare-fun bs!12813 () Bool)

(assert (= bs!12813 d!52198))

(declare-fun m!244857 () Bool)

(assert (=> bs!12813 m!244857))

(assert (=> b!156949 d!52198))

(declare-fun d!52200 () Bool)

(assert (=> d!52200 (= (array_inv!3032 arr!153) (bvsge (size!3267 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31070 d!52200))

(declare-fun d!52202 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52202 (= (inv!12 bs!65) (invariant!0 (currentBit!6868 bs!65) (currentByte!6873 bs!65) (size!3267 (buf!3746 bs!65))))))

(declare-fun bs!12814 () Bool)

(assert (= bs!12814 d!52202))

(declare-fun m!244859 () Bool)

(assert (=> bs!12814 m!244859))

(assert (=> start!31070 d!52202))

(push 1)

(assert (not d!52152))

(assert (not d!52179))

(assert (not d!52185))

(assert (not d!52183))

(assert (not d!52198))

(assert (not d!52163))

(assert (not d!52156))

(assert (not d!52195))

(assert (not b!156958))

(assert (not d!52191))

(assert (not d!52187))

(assert (not d!52189))

(assert (not d!52202))

(assert (not b!156970))

(assert (not d!52193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52224 () Bool)

(declare-fun res!131204 () Bool)

(declare-fun e!106228 () Bool)

(assert (=> d!52224 (=> res!131204 e!106228)))

(assert (=> d!52224 (= res!131204 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52224 (= (arrayRangesEq!433 (_2!7501 lt!245680) (_2!7501 lt!245677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106228)))

(declare-fun b!156981 () Bool)

(declare-fun e!106229 () Bool)

(assert (=> b!156981 (= e!106228 e!106229)))

(declare-fun res!131205 () Bool)

(assert (=> b!156981 (=> (not res!131205) (not e!106229))))

(assert (=> b!156981 (= res!131205 (= (select (arr!4132 (_2!7501 lt!245680)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4132 (_2!7501 lt!245677)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!156982 () Bool)

(assert (=> b!156982 (= e!106229 (arrayRangesEq!433 (_2!7501 lt!245680) (_2!7501 lt!245677) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52224 (not res!131204)) b!156981))

(assert (= (and b!156981 res!131205) b!156982))

(declare-fun m!244893 () Bool)

(assert (=> b!156981 m!244893))

(declare-fun m!244895 () Bool)

(assert (=> b!156981 m!244895))

(declare-fun m!244897 () Bool)

(assert (=> b!156982 m!244897))

(assert (=> b!156958 d!52224))

(declare-fun d!52226 () Bool)

(declare-fun lt!245781 () (_ BitVec 8))

(declare-fun lt!245780 () (_ BitVec 8))

(assert (=> d!52226 (= lt!245781 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4132 (buf!3746 lt!245682)) (currentByte!6873 lt!245682))) ((_ sign_extend 24) lt!245780))))))

(assert (=> d!52226 (= lt!245780 ((_ extract 7 0) (currentBit!6868 lt!245682)))))

(declare-fun e!106234 () Bool)

(assert (=> d!52226 e!106234))

(declare-fun res!131211 () Bool)

(assert (=> d!52226 (=> (not res!131211) (not e!106234))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52226 (= res!131211 (validate_offset_bits!1 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) ((_ sign_extend 32) (currentByte!6873 lt!245682)) ((_ sign_extend 32) (currentBit!6868 lt!245682)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14130 0))(
  ( (tuple2!14131 (_1!7512 Unit!10166) (_2!7512 (_ BitVec 8))) )
))
(declare-fun Unit!10186 () Unit!10166)

(declare-fun Unit!10187 () Unit!10166)

(assert (=> d!52226 (= (readByte!0 lt!245682) (tuple2!14121 (_2!7512 (ite (bvsgt ((_ sign_extend 24) lt!245780) #b00000000000000000000000000000000) (tuple2!14131 Unit!10186 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245781) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4132 (buf!3746 lt!245682)) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245780)))))))) (tuple2!14131 Unit!10187 lt!245781))) (BitStream!5745 (buf!3746 lt!245682) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001) (currentBit!6868 lt!245682))))))

(declare-fun b!156987 () Bool)

(declare-fun e!106235 () Bool)

(assert (=> b!156987 (= e!106234 e!106235)))

(declare-fun res!131212 () Bool)

(assert (=> b!156987 (=> (not res!131212) (not e!106235))))

(declare-fun lt!245783 () tuple2!14120)

(assert (=> b!156987 (= res!131212 (= (buf!3746 (_2!7505 lt!245783)) (buf!3746 lt!245682)))))

(declare-fun lt!245786 () (_ BitVec 8))

(declare-fun lt!245782 () (_ BitVec 8))

(declare-fun Unit!10188 () Unit!10166)

(declare-fun Unit!10189 () Unit!10166)

(assert (=> b!156987 (= lt!245783 (tuple2!14121 (_2!7512 (ite (bvsgt ((_ sign_extend 24) lt!245786) #b00000000000000000000000000000000) (tuple2!14131 Unit!10188 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245782) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4132 (buf!3746 lt!245682)) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245786)))))))) (tuple2!14131 Unit!10189 lt!245782))) (BitStream!5745 (buf!3746 lt!245682) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001) (currentBit!6868 lt!245682))))))

(assert (=> b!156987 (= lt!245782 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4132 (buf!3746 lt!245682)) (currentByte!6873 lt!245682))) ((_ sign_extend 24) lt!245786))))))

(assert (=> b!156987 (= lt!245786 ((_ extract 7 0) (currentBit!6868 lt!245682)))))

(declare-fun b!156988 () Bool)

(declare-fun lt!245785 () (_ BitVec 64))

(declare-fun lt!245784 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156988 (= e!106235 (= (bitIndex!0 (size!3267 (buf!3746 (_2!7505 lt!245783))) (currentByte!6873 (_2!7505 lt!245783)) (currentBit!6868 (_2!7505 lt!245783))) (bvadd lt!245784 lt!245785)))))

(assert (=> b!156988 (or (not (= (bvand lt!245784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245785 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245784 lt!245785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156988 (= lt!245785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156988 (= lt!245784 (bitIndex!0 (size!3267 (buf!3746 lt!245682)) (currentByte!6873 lt!245682) (currentBit!6868 lt!245682)))))

(assert (= (and d!52226 res!131211) b!156987))

(assert (= (and b!156987 res!131212) b!156988))

(declare-fun m!244899 () Bool)

(assert (=> d!52226 m!244899))

(declare-fun m!244901 () Bool)

(assert (=> d!52226 m!244901))

(declare-fun m!244903 () Bool)

(assert (=> d!52226 m!244903))

(assert (=> b!156987 m!244903))

(assert (=> b!156987 m!244899))

(declare-fun m!244905 () Bool)

(assert (=> b!156988 m!244905))

(declare-fun m!244907 () Bool)

(assert (=> b!156988 m!244907))

(assert (=> d!52198 d!52226))

(declare-fun e!106270 () Bool)

(declare-fun b!157036 () Bool)

(declare-fun lt!246087 () tuple3!656)

(assert (=> b!157036 (= e!106270 (= (select (arr!4132 (_3!445 lt!246087)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7500 (readBytePure!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)))))))

(assert (=> b!157036 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3267 (_3!445 lt!246087))))))

(declare-fun c!8348 () Bool)

(declare-fun lt!246076 () (_ BitVec 32))

(declare-fun bm!2475 () Bool)

(declare-fun lt!246090 () tuple3!656)

(declare-fun call!2478 () Bool)

(assert (=> bm!2475 (= call!2478 (arrayRangesEq!433 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (ite c!8348 (_3!445 lt!246090) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (ite c!8348 lt!246076 #b00000000000000000000000000000000) (ite c!8348 (bvadd #b00000000000000000000000000000010 from!240) (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))))))))

(declare-fun lt!246074 () tuple2!14120)

(declare-fun call!2479 () (_ BitVec 64))

(declare-fun bm!2476 () Bool)

(assert (=> bm!2476 (= call!2479 (bitIndex!0 (ite c!8348 (size!3267 (buf!3746 (_2!7505 lt!246074))) (size!3267 (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)))) (ite c!8348 (currentByte!6873 (_2!7505 lt!246074)) (currentByte!6873 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) (ite c!8348 (currentBit!6868 (_2!7505 lt!246074)) (currentBit!6868 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)))))))

(declare-fun b!157037 () Bool)

(declare-fun e!106271 () tuple3!656)

(declare-fun lt!246080 () Unit!10166)

(assert (=> b!157037 (= e!106271 (tuple3!657 lt!246080 (_2!7506 lt!246090) (_3!445 lt!246090)))))

(assert (=> b!157037 (= lt!246074 (readByte!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)))))

(declare-fun lt!246066 () array!7228)

(assert (=> b!157037 (= lt!246066 (array!7229 (store (arr!4132 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7505 lt!246074)) (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)))))))

(declare-fun lt!246073 () (_ BitVec 64))

(assert (=> b!157037 (= lt!246073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246091 () (_ BitVec 32))

(assert (=> b!157037 (= lt!246091 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246095 () Unit!10166)

(assert (=> b!157037 (= lt!246095 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (_2!7505 lt!246074) lt!246073 lt!246091))))

(assert (=> b!157037 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 (_2!7505 lt!246074)))) ((_ sign_extend 32) (currentByte!6873 (_2!7505 lt!246074))) ((_ sign_extend 32) (currentBit!6868 (_2!7505 lt!246074))) (bvsub lt!246091 ((_ extract 31 0) (bvsdiv (bvadd lt!246073 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246068 () Unit!10166)

(assert (=> b!157037 (= lt!246068 lt!246095)))

(assert (=> b!157037 (= lt!246090 (readByteArrayLoop!0 (_2!7505 lt!246074) lt!246066 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157037 (= call!2479 (bvadd (bitIndex!0 (size!3267 (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) (currentByte!6873 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)) (currentBit!6868 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246079 () Unit!10166)

(declare-fun Unit!10195 () Unit!10166)

(assert (=> b!157037 (= lt!246079 Unit!10195)))

(assert (=> b!157037 (= (bvadd call!2479 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246090))) (currentByte!6873 (_2!7506 lt!246090)) (currentBit!6868 (_2!7506 lt!246090))))))

(declare-fun lt!246094 () Unit!10166)

(declare-fun Unit!10196 () Unit!10166)

(assert (=> b!157037 (= lt!246094 Unit!10196)))

(assert (=> b!157037 (= (bvadd (bitIndex!0 (size!3267 (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) (currentByte!6873 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)) (currentBit!6868 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246090))) (currentByte!6873 (_2!7506 lt!246090)) (currentBit!6868 (_2!7506 lt!246090))))))

(declare-fun lt!246092 () Unit!10166)

(declare-fun Unit!10197 () Unit!10166)

(assert (=> b!157037 (= lt!246092 Unit!10197)))

(assert (=> b!157037 (and (= (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)) (buf!3746 (_2!7506 lt!246090))) (= (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (size!3267 (_3!445 lt!246090))))))

(declare-fun lt!246096 () Unit!10166)

(declare-fun Unit!10198 () Unit!10166)

(assert (=> b!157037 (= lt!246096 Unit!10198)))

(declare-fun lt!246098 () Unit!10166)

(declare-fun arrayUpdatedAtPrefixLemma!40 (array!7228 (_ BitVec 32) (_ BitVec 8)) Unit!10166)

(assert (=> b!157037 (= lt!246098 (arrayUpdatedAtPrefixLemma!40 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7505 lt!246074)))))

(declare-fun call!2480 () Bool)

(assert (=> b!157037 call!2480))

(declare-fun lt!246075 () Unit!10166)

(assert (=> b!157037 (= lt!246075 lt!246098)))

(assert (=> b!157037 (= lt!246076 #b00000000000000000000000000000000)))

(declare-fun lt!246093 () Unit!10166)

(declare-fun arrayRangesEqTransitive!105 (array!7228 array!7228 array!7228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10166)

(assert (=> b!157037 (= lt!246093 (arrayRangesEqTransitive!105 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) lt!246066 (_3!445 lt!246090) lt!246076 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157037 call!2478))

(declare-fun lt!246072 () Unit!10166)

(assert (=> b!157037 (= lt!246072 lt!246093)))

(assert (=> b!157037 (arrayRangesEq!433 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (_3!445 lt!246090) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!246082 () Unit!10166)

(declare-fun Unit!10202 () Unit!10166)

(assert (=> b!157037 (= lt!246082 Unit!10202)))

(declare-fun lt!246086 () Unit!10166)

(declare-fun arrayRangesEqImpliesEq!49 (array!7228 array!7228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10166)

(assert (=> b!157037 (= lt!246086 (arrayRangesEqImpliesEq!49 lt!246066 (_3!445 lt!246090) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157037 (= (select (store (arr!4132 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7505 lt!246074)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4132 (_3!445 lt!246090)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246067 () Unit!10166)

(assert (=> b!157037 (= lt!246067 lt!246086)))

(declare-fun lt!246099 () Bool)

(assert (=> b!157037 (= lt!246099 (= (select (arr!4132 (_3!445 lt!246090)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7505 lt!246074)))))

(declare-fun Unit!10204 () Unit!10166)

(assert (=> b!157037 (= lt!246080 Unit!10204)))

(assert (=> b!157037 lt!246099))

(declare-fun lt!246101 () Unit!10166)

(declare-fun b!157038 () Bool)

(assert (=> b!157038 (= e!106271 (tuple3!657 lt!246101 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))))))

(assert (=> b!157038 (= call!2479 call!2479)))

(declare-fun lt!246089 () Unit!10166)

(declare-fun Unit!10206 () Unit!10166)

(assert (=> b!157038 (= lt!246089 Unit!10206)))

(declare-fun lt!246097 () Unit!10166)

(declare-fun arrayRangesEqReflexiveLemma!40 (array!7228) Unit!10166)

(assert (=> b!157038 (= lt!246097 (arrayRangesEqReflexiveLemma!40 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))))))

(assert (=> b!157038 call!2478))

(declare-fun lt!246088 () Unit!10166)

(assert (=> b!157038 (= lt!246088 lt!246097)))

(declare-fun lt!246083 () array!7228)

(assert (=> b!157038 (= lt!246083 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)))))

(declare-fun lt!246078 () array!7228)

(assert (=> b!157038 (= lt!246078 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)))))

(declare-fun lt!246070 () (_ BitVec 32))

(assert (=> b!157038 (= lt!246070 #b00000000000000000000000000000000)))

(declare-fun lt!246077 () (_ BitVec 32))

(assert (=> b!157038 (= lt!246077 (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))))))

(declare-fun lt!246071 () (_ BitVec 32))

(assert (=> b!157038 (= lt!246071 #b00000000000000000000000000000000)))

(declare-fun lt!246085 () (_ BitVec 32))

(assert (=> b!157038 (= lt!246085 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun arrayRangesEqSlicedLemma!40 (array!7228 array!7228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10166)

(assert (=> b!157038 (= lt!246101 (arrayRangesEqSlicedLemma!40 lt!246083 lt!246078 lt!246070 lt!246077 lt!246071 lt!246085))))

(assert (=> b!157038 call!2480))

(declare-fun e!106269 () Bool)

(declare-fun b!157039 () Bool)

(assert (=> b!157039 (= e!106269 (arrayRangesEq!433 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (_3!445 lt!246087) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun d!52228 () Bool)

(assert (=> d!52228 e!106270))

(declare-fun res!131247 () Bool)

(assert (=> d!52228 (=> res!131247 e!106270)))

(assert (=> d!52228 (= res!131247 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246069 () Bool)

(assert (=> d!52228 (= lt!246069 e!106269)))

(declare-fun res!131246 () Bool)

(assert (=> d!52228 (=> (not res!131246) (not e!106269))))

(declare-fun lt!246084 () (_ BitVec 64))

(declare-fun lt!246100 () (_ BitVec 64))

(assert (=> d!52228 (= res!131246 (= (bvadd lt!246100 lt!246084) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246087))) (currentByte!6873 (_2!7506 lt!246087)) (currentBit!6868 (_2!7506 lt!246087)))))))

(assert (=> d!52228 (or (not (= (bvand lt!246100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246100 lt!246084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246081 () (_ BitVec 64))

(assert (=> d!52228 (= lt!246084 (bvmul lt!246081 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52228 (or (= lt!246081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246081)))))

(assert (=> d!52228 (= lt!246081 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52228 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52228 (= lt!246100 (bitIndex!0 (size!3267 (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))) (currentByte!6873 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)) (currentBit!6868 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001))))))

(assert (=> d!52228 (= lt!246087 e!106271)))

(assert (=> d!52228 (= c!8348 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52228 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)))))))

(assert (=> d!52228 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!246087)))

(declare-fun bm!2477 () Bool)

(assert (=> bm!2477 (= call!2480 (arrayRangesEq!433 (ite c!8348 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)) lt!246083) (ite c!8348 (array!7229 (store (arr!4132 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7505 lt!246074)) (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153)))) lt!246078) (ite c!8348 #b00000000000000000000000000000000 lt!246071) (ite c!8348 (bvadd #b00000000000000000000000000000010 from!240) lt!246085)))))

(declare-fun b!157040 () Bool)

(declare-fun res!131248 () Bool)

(assert (=> b!157040 (=> (not res!131248) (not e!106269))))

(assert (=> b!157040 (= res!131248 (and (= (buf!3746 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001)) (buf!3746 (_2!7506 lt!246087))) (= (size!3267 (array!7229 (store (store (arr!4132 arr!153) from!240 (_2!7500 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 lt!245678)) (size!3267 arr!153))) (size!3267 (_3!445 lt!246087)))))))

(assert (= (and d!52228 c!8348) b!157037))

(assert (= (and d!52228 (not c!8348)) b!157038))

(assert (= (or b!157037 b!157038) bm!2477))

(assert (= (or b!157037 b!157038) bm!2475))

(assert (= (or b!157037 b!157038) bm!2476))

(assert (= (and d!52228 res!131246) b!157040))

(assert (= (and b!157040 res!131248) b!157039))

(assert (= (and d!52228 (not res!131247)) b!157036))

(declare-fun m!245075 () Bool)

(assert (=> bm!2477 m!245075))

(declare-fun m!245077 () Bool)

(assert (=> bm!2477 m!245077))

(declare-fun m!245079 () Bool)

(assert (=> d!52228 m!245079))

(declare-fun m!245081 () Bool)

(assert (=> d!52228 m!245081))

(declare-fun m!245083 () Bool)

(assert (=> b!157037 m!245083))

(declare-fun m!245085 () Bool)

(assert (=> b!157037 m!245085))

(assert (=> b!157037 m!245081))

(declare-fun m!245087 () Bool)

(assert (=> b!157037 m!245087))

(declare-fun m!245089 () Bool)

(assert (=> b!157037 m!245089))

(declare-fun m!245091 () Bool)

(assert (=> b!157037 m!245091))

(declare-fun m!245093 () Bool)

(assert (=> b!157037 m!245093))

(declare-fun m!245095 () Bool)

(assert (=> b!157037 m!245095))

(assert (=> b!157037 m!244771))

(declare-fun m!245097 () Bool)

(assert (=> b!157037 m!245097))

(declare-fun m!245099 () Bool)

(assert (=> b!157037 m!245099))

(declare-fun m!245101 () Bool)

(assert (=> b!157037 m!245101))

(assert (=> b!157037 m!245075))

(assert (=> b!157037 m!244771))

(declare-fun m!245103 () Bool)

(assert (=> b!157037 m!245103))

(declare-fun m!245105 () Bool)

(assert (=> b!157036 m!245105))

(assert (=> b!157036 m!244771))

(declare-fun m!245107 () Bool)

(assert (=> b!157036 m!245107))

(declare-fun m!245109 () Bool)

(assert (=> bm!2476 m!245109))

(declare-fun m!245111 () Bool)

(assert (=> b!157038 m!245111))

(declare-fun m!245113 () Bool)

(assert (=> b!157038 m!245113))

(declare-fun m!245115 () Bool)

(assert (=> bm!2475 m!245115))

(declare-fun m!245117 () Bool)

(assert (=> b!157039 m!245117))

(assert (=> d!52163 d!52228))

(declare-fun d!52269 () Bool)

(declare-fun lt!246103 () (_ BitVec 8))

(declare-fun lt!246102 () (_ BitVec 8))

(assert (=> d!52269 (= lt!246103 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4132 (buf!3746 bs!65)) (currentByte!6873 bs!65))) ((_ sign_extend 24) lt!246102))))))

(assert (=> d!52269 (= lt!246102 ((_ extract 7 0) (currentBit!6868 bs!65)))))

(declare-fun e!106272 () Bool)

(assert (=> d!52269 e!106272))

(declare-fun res!131249 () Bool)

(assert (=> d!52269 (=> (not res!131249) (not e!106272))))

(assert (=> d!52269 (= res!131249 (validate_offset_bits!1 ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) ((_ sign_extend 32) (currentByte!6873 bs!65)) ((_ sign_extend 32) (currentBit!6868 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10210 () Unit!10166)

(declare-fun Unit!10211 () Unit!10166)

(assert (=> d!52269 (= (readByte!0 bs!65) (tuple2!14121 (_2!7512 (ite (bvsgt ((_ sign_extend 24) lt!246102) #b00000000000000000000000000000000) (tuple2!14131 Unit!10210 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246103) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4132 (buf!3746 bs!65)) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246102)))))))) (tuple2!14131 Unit!10211 lt!246103))) (BitStream!5745 (buf!3746 bs!65) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001) (currentBit!6868 bs!65))))))

(declare-fun b!157041 () Bool)

(declare-fun e!106273 () Bool)

(assert (=> b!157041 (= e!106272 e!106273)))

(declare-fun res!131250 () Bool)

(assert (=> b!157041 (=> (not res!131250) (not e!106273))))

(declare-fun lt!246105 () tuple2!14120)

(assert (=> b!157041 (= res!131250 (= (buf!3746 (_2!7505 lt!246105)) (buf!3746 bs!65)))))

(declare-fun lt!246104 () (_ BitVec 8))

(declare-fun lt!246108 () (_ BitVec 8))

(declare-fun Unit!10212 () Unit!10166)

(declare-fun Unit!10213 () Unit!10166)

(assert (=> b!157041 (= lt!246105 (tuple2!14121 (_2!7512 (ite (bvsgt ((_ sign_extend 24) lt!246108) #b00000000000000000000000000000000) (tuple2!14131 Unit!10212 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246104) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4132 (buf!3746 bs!65)) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246108)))))))) (tuple2!14131 Unit!10213 lt!246104))) (BitStream!5745 (buf!3746 bs!65) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001) (currentBit!6868 bs!65))))))

(assert (=> b!157041 (= lt!246104 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4132 (buf!3746 bs!65)) (currentByte!6873 bs!65))) ((_ sign_extend 24) lt!246108))))))

(assert (=> b!157041 (= lt!246108 ((_ extract 7 0) (currentBit!6868 bs!65)))))

(declare-fun lt!246106 () (_ BitVec 64))

(declare-fun b!157042 () Bool)

(declare-fun lt!246107 () (_ BitVec 64))

(assert (=> b!157042 (= e!106273 (= (bitIndex!0 (size!3267 (buf!3746 (_2!7505 lt!246105))) (currentByte!6873 (_2!7505 lt!246105)) (currentBit!6868 (_2!7505 lt!246105))) (bvadd lt!246106 lt!246107)))))

(assert (=> b!157042 (or (not (= (bvand lt!246106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246107 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246106 lt!246107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157042 (= lt!246107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157042 (= lt!246106 (bitIndex!0 (size!3267 (buf!3746 bs!65)) (currentByte!6873 bs!65) (currentBit!6868 bs!65)))))

(assert (= (and d!52269 res!131249) b!157041))

(assert (= (and b!157041 res!131250) b!157042))

(declare-fun m!245119 () Bool)

(assert (=> d!52269 m!245119))

(declare-fun m!245121 () Bool)

(assert (=> d!52269 m!245121))

(declare-fun m!245123 () Bool)

(assert (=> d!52269 m!245123))

(assert (=> b!157041 m!245123))

(assert (=> b!157041 m!245119))

(declare-fun m!245125 () Bool)

(assert (=> b!157042 m!245125))

(declare-fun m!245127 () Bool)

(assert (=> b!157042 m!245127))

(assert (=> d!52152 d!52269))

(declare-fun d!52271 () Bool)

(assert (=> d!52271 (= (invariant!0 (currentBit!6868 bs!65) (currentByte!6873 bs!65) (size!3267 (buf!3746 bs!65))) (and (bvsge (currentBit!6868 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6868 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6873 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6873 bs!65) (size!3267 (buf!3746 bs!65))) (and (= (currentBit!6868 bs!65) #b00000000000000000000000000000000) (= (currentByte!6873 bs!65) (size!3267 (buf!3746 bs!65)))))))))

(assert (=> d!52202 d!52271))

(declare-fun d!52273 () Bool)

(declare-fun e!106279 () Bool)

(assert (=> d!52273 e!106279))

(declare-fun res!131256 () Bool)

(assert (=> d!52273 (=> (not res!131256) (not e!106279))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5744 (_ BitVec 32)) Bool)

(assert (=> d!52273 (= res!131256 (moveByteIndexPrecond!0 lt!245682 #b00000000000000000000000000000001))))

(declare-fun Unit!10214 () Unit!10166)

(assert (=> d!52273 (= (moveByteIndex!0 lt!245682 #b00000000000000000000000000000001) (tuple2!14123 Unit!10214 (BitStream!5745 (buf!3746 lt!245682) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001) (currentBit!6868 lt!245682))))))

(declare-fun b!157048 () Bool)

(assert (=> b!157048 (= e!106279 (and (or (not (= (bvand (currentByte!6873 lt!245682) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6873 lt!245682) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001) (bvadd (currentByte!6873 lt!245682) #b00000000000000000000000000000001))))))

(assert (= (and d!52273 res!131256) b!157048))

(declare-fun m!245133 () Bool)

(assert (=> d!52273 m!245133))

(assert (=> d!52179 d!52273))

(declare-fun d!52277 () Bool)

(declare-fun res!131257 () Bool)

(declare-fun e!106280 () Bool)

(assert (=> d!52277 (=> res!131257 e!106280)))

(assert (=> d!52277 (= res!131257 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52277 (= (arrayRangesEq!433 (_2!7501 lt!245713) (_2!7501 lt!245715) #b00000000000000000000000000000000 to!236) e!106280)))

(declare-fun b!157049 () Bool)

(declare-fun e!106281 () Bool)

(assert (=> b!157049 (= e!106280 e!106281)))

(declare-fun res!131258 () Bool)

(assert (=> b!157049 (=> (not res!131258) (not e!106281))))

(assert (=> b!157049 (= res!131258 (= (select (arr!4132 (_2!7501 lt!245713)) #b00000000000000000000000000000000) (select (arr!4132 (_2!7501 lt!245715)) #b00000000000000000000000000000000)))))

(declare-fun b!157050 () Bool)

(assert (=> b!157050 (= e!106281 (arrayRangesEq!433 (_2!7501 lt!245713) (_2!7501 lt!245715) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52277 (not res!131257)) b!157049))

(assert (= (and b!157049 res!131258) b!157050))

(declare-fun m!245137 () Bool)

(assert (=> b!157049 m!245137))

(declare-fun m!245139 () Bool)

(assert (=> b!157049 m!245139))

(declare-fun m!245141 () Bool)

(assert (=> b!157050 m!245141))

(assert (=> d!52156 d!52277))

(assert (=> d!52156 d!52179))

(declare-fun d!52283 () Bool)

(assert (=> d!52283 (arrayRangesEq!433 (_2!7501 (readByteArrayLoopPure!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7501 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245682 #b00000000000000000000000000000001) (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 (readBytePure!0 lt!245682))) (size!3267 lt!245674)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52283 true))

(declare-fun _$13!82 () Unit!10166)

(assert (=> d!52283 (= (choose!35 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!245713 (_2!7501 lt!245713) lt!245714 lt!245715 (_2!7501 lt!245715)) _$13!82)))

(declare-fun bs!12834 () Bool)

(assert (= bs!12834 d!52283))

(assert (=> bs!12834 m!244771))

(assert (=> bs!12834 m!244765))

(assert (=> bs!12834 m!244783))

(assert (=> bs!12834 m!244821))

(assert (=> bs!12834 m!244771))

(declare-fun m!245143 () Bool)

(assert (=> bs!12834 m!245143))

(declare-fun m!245145 () Bool)

(assert (=> bs!12834 m!245145))

(assert (=> d!52156 d!52283))

(assert (=> d!52156 d!52185))

(declare-fun lt!246119 () tuple3!656)

(declare-fun d!52285 () Bool)

(assert (=> d!52285 (= lt!246119 (readByteArrayLoop!0 lt!245714 (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 (readBytePure!0 lt!245682))) (size!3267 lt!245674)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52285 (= (readByteArrayLoopPure!0 lt!245714 (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_2!7500 (readBytePure!0 lt!245682))) (size!3267 lt!245674)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14115 (_2!7506 lt!246119) (_3!445 lt!246119)))))

(declare-fun bs!12835 () Bool)

(assert (= bs!12835 d!52285))

(declare-fun m!245147 () Bool)

(assert (=> bs!12835 m!245147))

(assert (=> d!52156 d!52285))

(assert (=> d!52156 d!52198))

(declare-fun d!52287 () Bool)

(assert (=> d!52287 (= (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) lt!245681 lt!245675) (bvsub (bvmul ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!245681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245675)))))

(assert (=> d!52193 d!52287))

(declare-fun e!106283 () Bool)

(declare-fun b!157051 () Bool)

(declare-fun lt!246141 () tuple3!656)

(assert (=> b!157051 (= e!106283 (= (select (arr!4132 (_3!445 lt!246141)) from!240) (_2!7500 (readBytePure!0 bs!65))))))

(assert (=> b!157051 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3267 (_3!445 lt!246141))))))

(declare-fun call!2481 () Bool)

(declare-fun lt!246130 () (_ BitVec 32))

(declare-fun bm!2478 () Bool)

(declare-fun c!8349 () Bool)

(declare-fun lt!246144 () tuple3!656)

(assert (=> bm!2478 (= call!2481 (arrayRangesEq!433 arr!153 (ite c!8349 (_3!445 lt!246144) arr!153) (ite c!8349 lt!246130 #b00000000000000000000000000000000) (ite c!8349 from!240 (size!3267 arr!153))))))

(declare-fun lt!246128 () tuple2!14120)

(declare-fun call!2482 () (_ BitVec 64))

(declare-fun bm!2479 () Bool)

(assert (=> bm!2479 (= call!2482 (bitIndex!0 (ite c!8349 (size!3267 (buf!3746 (_2!7505 lt!246128))) (size!3267 (buf!3746 bs!65))) (ite c!8349 (currentByte!6873 (_2!7505 lt!246128)) (currentByte!6873 bs!65)) (ite c!8349 (currentBit!6868 (_2!7505 lt!246128)) (currentBit!6868 bs!65))))))

(declare-fun b!157052 () Bool)

(declare-fun e!106284 () tuple3!656)

(declare-fun lt!246134 () Unit!10166)

(assert (=> b!157052 (= e!106284 (tuple3!657 lt!246134 (_2!7506 lt!246144) (_3!445 lt!246144)))))

(assert (=> b!157052 (= lt!246128 (readByte!0 bs!65))))

(declare-fun lt!246120 () array!7228)

(assert (=> b!157052 (= lt!246120 (array!7229 (store (arr!4132 arr!153) from!240 (_1!7505 lt!246128)) (size!3267 arr!153)))))

(declare-fun lt!246127 () (_ BitVec 64))

(assert (=> b!157052 (= lt!246127 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246145 () (_ BitVec 32))

(assert (=> b!157052 (= lt!246145 (bvsub to!236 from!240))))

(declare-fun lt!246149 () Unit!10166)

(assert (=> b!157052 (= lt!246149 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7505 lt!246128) lt!246127 lt!246145))))

(assert (=> b!157052 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 (_2!7505 lt!246128)))) ((_ sign_extend 32) (currentByte!6873 (_2!7505 lt!246128))) ((_ sign_extend 32) (currentBit!6868 (_2!7505 lt!246128))) (bvsub lt!246145 ((_ extract 31 0) (bvsdiv (bvadd lt!246127 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246122 () Unit!10166)

(assert (=> b!157052 (= lt!246122 lt!246149)))

(assert (=> b!157052 (= lt!246144 (readByteArrayLoop!0 (_2!7505 lt!246128) lt!246120 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157052 (= call!2482 (bvadd (bitIndex!0 (size!3267 (buf!3746 bs!65)) (currentByte!6873 bs!65) (currentBit!6868 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246133 () Unit!10166)

(declare-fun Unit!10215 () Unit!10166)

(assert (=> b!157052 (= lt!246133 Unit!10215)))

(assert (=> b!157052 (= (bvadd call!2482 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246144))) (currentByte!6873 (_2!7506 lt!246144)) (currentBit!6868 (_2!7506 lt!246144))))))

(declare-fun lt!246148 () Unit!10166)

(declare-fun Unit!10216 () Unit!10166)

(assert (=> b!157052 (= lt!246148 Unit!10216)))

(assert (=> b!157052 (= (bvadd (bitIndex!0 (size!3267 (buf!3746 bs!65)) (currentByte!6873 bs!65) (currentBit!6868 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246144))) (currentByte!6873 (_2!7506 lt!246144)) (currentBit!6868 (_2!7506 lt!246144))))))

(declare-fun lt!246146 () Unit!10166)

(declare-fun Unit!10217 () Unit!10166)

(assert (=> b!157052 (= lt!246146 Unit!10217)))

(assert (=> b!157052 (and (= (buf!3746 bs!65) (buf!3746 (_2!7506 lt!246144))) (= (size!3267 arr!153) (size!3267 (_3!445 lt!246144))))))

(declare-fun lt!246150 () Unit!10166)

(declare-fun Unit!10218 () Unit!10166)

(assert (=> b!157052 (= lt!246150 Unit!10218)))

(declare-fun lt!246152 () Unit!10166)

(assert (=> b!157052 (= lt!246152 (arrayUpdatedAtPrefixLemma!40 arr!153 from!240 (_1!7505 lt!246128)))))

(declare-fun call!2483 () Bool)

(assert (=> b!157052 call!2483))

(declare-fun lt!246129 () Unit!10166)

(assert (=> b!157052 (= lt!246129 lt!246152)))

(assert (=> b!157052 (= lt!246130 #b00000000000000000000000000000000)))

(declare-fun lt!246147 () Unit!10166)

(assert (=> b!157052 (= lt!246147 (arrayRangesEqTransitive!105 arr!153 lt!246120 (_3!445 lt!246144) lt!246130 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157052 call!2481))

(declare-fun lt!246126 () Unit!10166)

(assert (=> b!157052 (= lt!246126 lt!246147)))

(assert (=> b!157052 (arrayRangesEq!433 arr!153 (_3!445 lt!246144) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!246136 () Unit!10166)

(declare-fun Unit!10219 () Unit!10166)

(assert (=> b!157052 (= lt!246136 Unit!10219)))

(declare-fun lt!246140 () Unit!10166)

(assert (=> b!157052 (= lt!246140 (arrayRangesEqImpliesEq!49 lt!246120 (_3!445 lt!246144) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157052 (= (select (store (arr!4132 arr!153) from!240 (_1!7505 lt!246128)) from!240) (select (arr!4132 (_3!445 lt!246144)) from!240))))

(declare-fun lt!246121 () Unit!10166)

(assert (=> b!157052 (= lt!246121 lt!246140)))

(declare-fun lt!246153 () Bool)

(assert (=> b!157052 (= lt!246153 (= (select (arr!4132 (_3!445 lt!246144)) from!240) (_1!7505 lt!246128)))))

(declare-fun Unit!10220 () Unit!10166)

(assert (=> b!157052 (= lt!246134 Unit!10220)))

(assert (=> b!157052 lt!246153))

(declare-fun lt!246155 () Unit!10166)

(declare-fun b!157053 () Bool)

(assert (=> b!157053 (= e!106284 (tuple3!657 lt!246155 bs!65 arr!153))))

(assert (=> b!157053 (= call!2482 call!2482)))

(declare-fun lt!246143 () Unit!10166)

(declare-fun Unit!10221 () Unit!10166)

(assert (=> b!157053 (= lt!246143 Unit!10221)))

(declare-fun lt!246151 () Unit!10166)

(assert (=> b!157053 (= lt!246151 (arrayRangesEqReflexiveLemma!40 arr!153))))

(assert (=> b!157053 call!2481))

(declare-fun lt!246142 () Unit!10166)

(assert (=> b!157053 (= lt!246142 lt!246151)))

(declare-fun lt!246137 () array!7228)

(assert (=> b!157053 (= lt!246137 arr!153)))

(declare-fun lt!246132 () array!7228)

(assert (=> b!157053 (= lt!246132 arr!153)))

(declare-fun lt!246124 () (_ BitVec 32))

(assert (=> b!157053 (= lt!246124 #b00000000000000000000000000000000)))

(declare-fun lt!246131 () (_ BitVec 32))

(assert (=> b!157053 (= lt!246131 (size!3267 arr!153))))

(declare-fun lt!246125 () (_ BitVec 32))

(assert (=> b!157053 (= lt!246125 #b00000000000000000000000000000000)))

(declare-fun lt!246139 () (_ BitVec 32))

(assert (=> b!157053 (= lt!246139 from!240)))

(assert (=> b!157053 (= lt!246155 (arrayRangesEqSlicedLemma!40 lt!246137 lt!246132 lt!246124 lt!246131 lt!246125 lt!246139))))

(assert (=> b!157053 call!2483))

(declare-fun b!157054 () Bool)

(declare-fun e!106282 () Bool)

(assert (=> b!157054 (= e!106282 (arrayRangesEq!433 arr!153 (_3!445 lt!246141) #b00000000000000000000000000000000 from!240))))

(declare-fun d!52289 () Bool)

(assert (=> d!52289 e!106283))

(declare-fun res!131260 () Bool)

(assert (=> d!52289 (=> res!131260 e!106283)))

(assert (=> d!52289 (= res!131260 (bvsge from!240 to!236))))

(declare-fun lt!246123 () Bool)

(assert (=> d!52289 (= lt!246123 e!106282)))

(declare-fun res!131259 () Bool)

(assert (=> d!52289 (=> (not res!131259) (not e!106282))))

(declare-fun lt!246138 () (_ BitVec 64))

(declare-fun lt!246154 () (_ BitVec 64))

(assert (=> d!52289 (= res!131259 (= (bvadd lt!246154 lt!246138) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246141))) (currentByte!6873 (_2!7506 lt!246141)) (currentBit!6868 (_2!7506 lt!246141)))))))

(assert (=> d!52289 (or (not (= (bvand lt!246154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246138 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246154 lt!246138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246135 () (_ BitVec 64))

(assert (=> d!52289 (= lt!246138 (bvmul lt!246135 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52289 (or (= lt!246135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246135)))))

(assert (=> d!52289 (= lt!246135 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52289 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52289 (= lt!246154 (bitIndex!0 (size!3267 (buf!3746 bs!65)) (currentByte!6873 bs!65) (currentBit!6868 bs!65)))))

(assert (=> d!52289 (= lt!246141 e!106284)))

(assert (=> d!52289 (= c!8349 (bvslt from!240 to!236))))

(assert (=> d!52289 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3267 arr!153)))))

(assert (=> d!52289 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!246141)))

(declare-fun bm!2480 () Bool)

(assert (=> bm!2480 (= call!2483 (arrayRangesEq!433 (ite c!8349 arr!153 lt!246137) (ite c!8349 (array!7229 (store (arr!4132 arr!153) from!240 (_1!7505 lt!246128)) (size!3267 arr!153)) lt!246132) (ite c!8349 #b00000000000000000000000000000000 lt!246125) (ite c!8349 from!240 lt!246139)))))

(declare-fun b!157055 () Bool)

(declare-fun res!131261 () Bool)

(assert (=> b!157055 (=> (not res!131261) (not e!106282))))

(assert (=> b!157055 (= res!131261 (and (= (buf!3746 bs!65) (buf!3746 (_2!7506 lt!246141))) (= (size!3267 arr!153) (size!3267 (_3!445 lt!246141)))))))

(assert (= (and d!52289 c!8349) b!157052))

(assert (= (and d!52289 (not c!8349)) b!157053))

(assert (= (or b!157052 b!157053) bm!2480))

(assert (= (or b!157052 b!157053) bm!2478))

(assert (= (or b!157052 b!157053) bm!2479))

(assert (= (and d!52289 res!131259) b!157055))

(assert (= (and b!157055 res!131261) b!157054))

(assert (= (and d!52289 (not res!131260)) b!157051))

(declare-fun m!245149 () Bool)

(assert (=> bm!2480 m!245149))

(declare-fun m!245151 () Bool)

(assert (=> bm!2480 m!245151))

(declare-fun m!245153 () Bool)

(assert (=> d!52289 m!245153))

(assert (=> d!52289 m!245127))

(declare-fun m!245155 () Bool)

(assert (=> b!157052 m!245155))

(declare-fun m!245157 () Bool)

(assert (=> b!157052 m!245157))

(assert (=> b!157052 m!245127))

(declare-fun m!245159 () Bool)

(assert (=> b!157052 m!245159))

(declare-fun m!245161 () Bool)

(assert (=> b!157052 m!245161))

(declare-fun m!245163 () Bool)

(assert (=> b!157052 m!245163))

(declare-fun m!245165 () Bool)

(assert (=> b!157052 m!245165))

(declare-fun m!245167 () Bool)

(assert (=> b!157052 m!245167))

(assert (=> b!157052 m!244811))

(declare-fun m!245169 () Bool)

(assert (=> b!157052 m!245169))

(declare-fun m!245171 () Bool)

(assert (=> b!157052 m!245171))

(assert (=> b!157052 m!245149))

(declare-fun m!245173 () Bool)

(assert (=> b!157052 m!245173))

(declare-fun m!245175 () Bool)

(assert (=> b!157051 m!245175))

(assert (=> b!157051 m!244757))

(declare-fun m!245177 () Bool)

(assert (=> bm!2479 m!245177))

(declare-fun m!245179 () Bool)

(assert (=> b!157053 m!245179))

(declare-fun m!245181 () Bool)

(assert (=> b!157053 m!245181))

(declare-fun m!245183 () Bool)

(assert (=> bm!2478 m!245183))

(declare-fun m!245185 () Bool)

(assert (=> b!157054 m!245185))

(assert (=> d!52189 d!52289))

(declare-fun b!157056 () Bool)

(declare-fun e!106286 () Bool)

(declare-fun lt!246177 () tuple3!656)

(assert (=> b!157056 (= e!106286 (= (select (arr!4132 (_3!445 lt!246177)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7500 (readBytePure!0 lt!245682))))))

(assert (=> b!157056 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3267 (_3!445 lt!246177))))))

(declare-fun bm!2481 () Bool)

(declare-fun lt!246166 () (_ BitVec 32))

(declare-fun call!2484 () Bool)

(declare-fun lt!246180 () tuple3!656)

(declare-fun c!8350 () Bool)

(assert (=> bm!2481 (= call!2484 (arrayRangesEq!433 lt!245674 (ite c!8350 (_3!445 lt!246180) lt!245674) (ite c!8350 lt!246166 #b00000000000000000000000000000000) (ite c!8350 (bvadd #b00000000000000000000000000000001 from!240) (size!3267 lt!245674))))))

(declare-fun lt!246164 () tuple2!14120)

(declare-fun call!2485 () (_ BitVec 64))

(declare-fun bm!2482 () Bool)

(assert (=> bm!2482 (= call!2485 (bitIndex!0 (ite c!8350 (size!3267 (buf!3746 (_2!7505 lt!246164))) (size!3267 (buf!3746 lt!245682))) (ite c!8350 (currentByte!6873 (_2!7505 lt!246164)) (currentByte!6873 lt!245682)) (ite c!8350 (currentBit!6868 (_2!7505 lt!246164)) (currentBit!6868 lt!245682))))))

(declare-fun b!157057 () Bool)

(declare-fun e!106287 () tuple3!656)

(declare-fun lt!246170 () Unit!10166)

(assert (=> b!157057 (= e!106287 (tuple3!657 lt!246170 (_2!7506 lt!246180) (_3!445 lt!246180)))))

(assert (=> b!157057 (= lt!246164 (readByte!0 lt!245682))))

(declare-fun lt!246156 () array!7228)

(assert (=> b!157057 (= lt!246156 (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_1!7505 lt!246164)) (size!3267 lt!245674)))))

(declare-fun lt!246163 () (_ BitVec 64))

(assert (=> b!157057 (= lt!246163 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246181 () (_ BitVec 32))

(assert (=> b!157057 (= lt!246181 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246185 () Unit!10166)

(assert (=> b!157057 (= lt!246185 (validateOffsetBytesFromBitIndexLemma!0 lt!245682 (_2!7505 lt!246164) lt!246163 lt!246181))))

(assert (=> b!157057 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 (_2!7505 lt!246164)))) ((_ sign_extend 32) (currentByte!6873 (_2!7505 lt!246164))) ((_ sign_extend 32) (currentBit!6868 (_2!7505 lt!246164))) (bvsub lt!246181 ((_ extract 31 0) (bvsdiv (bvadd lt!246163 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246158 () Unit!10166)

(assert (=> b!157057 (= lt!246158 lt!246185)))

(assert (=> b!157057 (= lt!246180 (readByteArrayLoop!0 (_2!7505 lt!246164) lt!246156 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157057 (= call!2485 (bvadd (bitIndex!0 (size!3267 (buf!3746 lt!245682)) (currentByte!6873 lt!245682) (currentBit!6868 lt!245682)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246169 () Unit!10166)

(declare-fun Unit!10222 () Unit!10166)

(assert (=> b!157057 (= lt!246169 Unit!10222)))

(assert (=> b!157057 (= (bvadd call!2485 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246180))) (currentByte!6873 (_2!7506 lt!246180)) (currentBit!6868 (_2!7506 lt!246180))))))

(declare-fun lt!246184 () Unit!10166)

(declare-fun Unit!10223 () Unit!10166)

(assert (=> b!157057 (= lt!246184 Unit!10223)))

(assert (=> b!157057 (= (bvadd (bitIndex!0 (size!3267 (buf!3746 lt!245682)) (currentByte!6873 lt!245682) (currentBit!6868 lt!245682)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246180))) (currentByte!6873 (_2!7506 lt!246180)) (currentBit!6868 (_2!7506 lt!246180))))))

(declare-fun lt!246182 () Unit!10166)

(declare-fun Unit!10224 () Unit!10166)

(assert (=> b!157057 (= lt!246182 Unit!10224)))

(assert (=> b!157057 (and (= (buf!3746 lt!245682) (buf!3746 (_2!7506 lt!246180))) (= (size!3267 lt!245674) (size!3267 (_3!445 lt!246180))))))

(declare-fun lt!246186 () Unit!10166)

(declare-fun Unit!10225 () Unit!10166)

(assert (=> b!157057 (= lt!246186 Unit!10225)))

(declare-fun lt!246188 () Unit!10166)

(assert (=> b!157057 (= lt!246188 (arrayUpdatedAtPrefixLemma!40 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) (_1!7505 lt!246164)))))

(declare-fun call!2486 () Bool)

(assert (=> b!157057 call!2486))

(declare-fun lt!246165 () Unit!10166)

(assert (=> b!157057 (= lt!246165 lt!246188)))

(assert (=> b!157057 (= lt!246166 #b00000000000000000000000000000000)))

(declare-fun lt!246183 () Unit!10166)

(assert (=> b!157057 (= lt!246183 (arrayRangesEqTransitive!105 lt!245674 lt!246156 (_3!445 lt!246180) lt!246166 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157057 call!2484))

(declare-fun lt!246162 () Unit!10166)

(assert (=> b!157057 (= lt!246162 lt!246183)))

(assert (=> b!157057 (arrayRangesEq!433 lt!245674 (_3!445 lt!246180) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!246172 () Unit!10166)

(declare-fun Unit!10226 () Unit!10166)

(assert (=> b!157057 (= lt!246172 Unit!10226)))

(declare-fun lt!246176 () Unit!10166)

(assert (=> b!157057 (= lt!246176 (arrayRangesEqImpliesEq!49 lt!246156 (_3!445 lt!246180) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157057 (= (select (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_1!7505 lt!246164)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4132 (_3!445 lt!246180)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246157 () Unit!10166)

(assert (=> b!157057 (= lt!246157 lt!246176)))

(declare-fun lt!246189 () Bool)

(assert (=> b!157057 (= lt!246189 (= (select (arr!4132 (_3!445 lt!246180)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7505 lt!246164)))))

(declare-fun Unit!10227 () Unit!10166)

(assert (=> b!157057 (= lt!246170 Unit!10227)))

(assert (=> b!157057 lt!246189))

(declare-fun lt!246191 () Unit!10166)

(declare-fun b!157058 () Bool)

(assert (=> b!157058 (= e!106287 (tuple3!657 lt!246191 lt!245682 lt!245674))))

(assert (=> b!157058 (= call!2485 call!2485)))

(declare-fun lt!246179 () Unit!10166)

(declare-fun Unit!10228 () Unit!10166)

(assert (=> b!157058 (= lt!246179 Unit!10228)))

(declare-fun lt!246187 () Unit!10166)

(assert (=> b!157058 (= lt!246187 (arrayRangesEqReflexiveLemma!40 lt!245674))))

(assert (=> b!157058 call!2484))

(declare-fun lt!246178 () Unit!10166)

(assert (=> b!157058 (= lt!246178 lt!246187)))

(declare-fun lt!246173 () array!7228)

(assert (=> b!157058 (= lt!246173 lt!245674)))

(declare-fun lt!246168 () array!7228)

(assert (=> b!157058 (= lt!246168 lt!245674)))

(declare-fun lt!246160 () (_ BitVec 32))

(assert (=> b!157058 (= lt!246160 #b00000000000000000000000000000000)))

(declare-fun lt!246167 () (_ BitVec 32))

(assert (=> b!157058 (= lt!246167 (size!3267 lt!245674))))

(declare-fun lt!246161 () (_ BitVec 32))

(assert (=> b!157058 (= lt!246161 #b00000000000000000000000000000000)))

(declare-fun lt!246175 () (_ BitVec 32))

(assert (=> b!157058 (= lt!246175 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157058 (= lt!246191 (arrayRangesEqSlicedLemma!40 lt!246173 lt!246168 lt!246160 lt!246167 lt!246161 lt!246175))))

(assert (=> b!157058 call!2486))

(declare-fun e!106285 () Bool)

(declare-fun b!157059 () Bool)

(assert (=> b!157059 (= e!106285 (arrayRangesEq!433 lt!245674 (_3!445 lt!246177) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!52291 () Bool)

(assert (=> d!52291 e!106286))

(declare-fun res!131263 () Bool)

(assert (=> d!52291 (=> res!131263 e!106286)))

(assert (=> d!52291 (= res!131263 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!246159 () Bool)

(assert (=> d!52291 (= lt!246159 e!106285)))

(declare-fun res!131262 () Bool)

(assert (=> d!52291 (=> (not res!131262) (not e!106285))))

(declare-fun lt!246190 () (_ BitVec 64))

(declare-fun lt!246174 () (_ BitVec 64))

(assert (=> d!52291 (= res!131262 (= (bvadd lt!246190 lt!246174) (bitIndex!0 (size!3267 (buf!3746 (_2!7506 lt!246177))) (currentByte!6873 (_2!7506 lt!246177)) (currentBit!6868 (_2!7506 lt!246177)))))))

(assert (=> d!52291 (or (not (= (bvand lt!246190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246190 lt!246174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246171 () (_ BitVec 64))

(assert (=> d!52291 (= lt!246174 (bvmul lt!246171 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52291 (or (= lt!246171 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246171 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246171)))))

(assert (=> d!52291 (= lt!246171 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52291 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52291 (= lt!246190 (bitIndex!0 (size!3267 (buf!3746 lt!245682)) (currentByte!6873 lt!245682) (currentBit!6868 lt!245682)))))

(assert (=> d!52291 (= lt!246177 e!106287)))

(assert (=> d!52291 (= c!8350 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52291 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3267 lt!245674)))))

(assert (=> d!52291 (= (readByteArrayLoop!0 lt!245682 lt!245674 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246177)))

(declare-fun bm!2483 () Bool)

(assert (=> bm!2483 (= call!2486 (arrayRangesEq!433 (ite c!8350 lt!245674 lt!246173) (ite c!8350 (array!7229 (store (arr!4132 lt!245674) (bvadd #b00000000000000000000000000000001 from!240) (_1!7505 lt!246164)) (size!3267 lt!245674)) lt!246168) (ite c!8350 #b00000000000000000000000000000000 lt!246161) (ite c!8350 (bvadd #b00000000000000000000000000000001 from!240) lt!246175)))))

(declare-fun b!157060 () Bool)

(declare-fun res!131264 () Bool)

(assert (=> b!157060 (=> (not res!131264) (not e!106285))))

(assert (=> b!157060 (= res!131264 (and (= (buf!3746 lt!245682) (buf!3746 (_2!7506 lt!246177))) (= (size!3267 lt!245674) (size!3267 (_3!445 lt!246177)))))))

(assert (= (and d!52291 c!8350) b!157057))

(assert (= (and d!52291 (not c!8350)) b!157058))

(assert (= (or b!157057 b!157058) bm!2483))

(assert (= (or b!157057 b!157058) bm!2481))

(assert (= (or b!157057 b!157058) bm!2482))

(assert (= (and d!52291 res!131262) b!157060))

(assert (= (and b!157060 res!131264) b!157059))

(assert (= (and d!52291 (not res!131263)) b!157056))

(declare-fun m!245187 () Bool)

(assert (=> bm!2483 m!245187))

(declare-fun m!245189 () Bool)

(assert (=> bm!2483 m!245189))

(declare-fun m!245191 () Bool)

(assert (=> d!52291 m!245191))

(assert (=> d!52291 m!244907))

(declare-fun m!245193 () Bool)

(assert (=> b!157057 m!245193))

(declare-fun m!245195 () Bool)

(assert (=> b!157057 m!245195))

(assert (=> b!157057 m!244907))

(declare-fun m!245197 () Bool)

(assert (=> b!157057 m!245197))

(declare-fun m!245199 () Bool)

(assert (=> b!157057 m!245199))

(declare-fun m!245201 () Bool)

(assert (=> b!157057 m!245201))

(declare-fun m!245203 () Bool)

(assert (=> b!157057 m!245203))

(declare-fun m!245205 () Bool)

(assert (=> b!157057 m!245205))

(assert (=> b!157057 m!244857))

(declare-fun m!245207 () Bool)

(assert (=> b!157057 m!245207))

(declare-fun m!245209 () Bool)

(assert (=> b!157057 m!245209))

(assert (=> b!157057 m!245187))

(declare-fun m!245211 () Bool)

(assert (=> b!157057 m!245211))

(declare-fun m!245213 () Bool)

(assert (=> b!157056 m!245213))

(assert (=> b!157056 m!244783))

(declare-fun m!245215 () Bool)

(assert (=> bm!2482 m!245215))

(declare-fun m!245217 () Bool)

(assert (=> b!157058 m!245217))

(declare-fun m!245219 () Bool)

(assert (=> b!157058 m!245219))

(declare-fun m!245221 () Bool)

(assert (=> bm!2481 m!245221))

(declare-fun m!245223 () Bool)

(assert (=> b!157059 m!245223))

(assert (=> d!52185 d!52291))

(assert (=> d!52191 d!52287))

(declare-fun d!52293 () Bool)

(assert (=> d!52293 (= (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) ((_ sign_extend 32) (currentByte!6873 bs!65)) ((_ sign_extend 32) (currentBit!6868 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3267 (buf!3746 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6873 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6868 bs!65)))))))

(assert (=> d!52183 d!52293))

(declare-fun d!52295 () Bool)

(assert (=> d!52295 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) ((_ sign_extend 32) (currentByte!6873 lt!245682)) ((_ sign_extend 32) (currentBit!6868 lt!245682)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52295 true))

(declare-fun _$7!100 () Unit!10166)

(assert (=> d!52295 (= (choose!57 bs!65 lt!245682 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!100)))

(declare-fun bs!12836 () Bool)

(assert (= bs!12836 d!52295))

(declare-fun m!245225 () Bool)

(assert (=> bs!12836 m!245225))

(assert (=> d!52195 d!52295))

(declare-fun d!52297 () Bool)

(declare-fun e!106288 () Bool)

(assert (=> d!52297 e!106288))

(declare-fun res!131265 () Bool)

(assert (=> d!52297 (=> (not res!131265) (not e!106288))))

(assert (=> d!52297 (= res!131265 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10229 () Unit!10166)

(assert (=> d!52297 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14123 Unit!10229 (BitStream!5745 (buf!3746 bs!65) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001) (currentBit!6868 bs!65))))))

(declare-fun b!157061 () Bool)

(assert (=> b!157061 (= e!106288 (and (or (not (= (bvand (currentByte!6873 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6873 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6873 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52297 res!131265) b!157061))

(declare-fun m!245227 () Bool)

(assert (=> d!52297 m!245227))

(assert (=> d!52187 d!52297))

(declare-fun d!52299 () Bool)

(assert (=> d!52299 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) ((_ sign_extend 32) (currentByte!6873 lt!245682)) ((_ sign_extend 32) (currentBit!6868 lt!245682)) (bvsub (bvsub to!236 from!240) lt!245741)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!245741)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3267 (buf!3746 lt!245682))) ((_ sign_extend 32) (currentByte!6873 lt!245682)) ((_ sign_extend 32) (currentBit!6868 lt!245682))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12837 () Bool)

(assert (= bs!12837 d!52299))

(declare-fun m!245229 () Bool)

(assert (=> bs!12837 m!245229))

(assert (=> b!156970 d!52299))

(push 1)

(assert (not bm!2483))

(assert (not b!157052))

(assert (not bm!2480))

(assert (not d!52228))

(assert (not b!157053))

(assert (not d!52285))

(assert (not d!52291))

(assert (not b!157051))

(assert (not d!52226))

(assert (not bm!2478))

(assert (not bm!2482))

(assert (not d!52289))

(assert (not b!156988))

(assert (not b!157039))

(assert (not d!52295))

(assert (not bm!2476))

(assert (not d!52269))

(assert (not d!52273))

(assert (not bm!2479))

(assert (not b!157037))

(assert (not bm!2481))

(assert (not bm!2475))

(assert (not b!157036))

(assert (not b!157042))

(assert (not d!52299))

(assert (not b!157050))

(assert (not b!157058))

(assert (not b!157057))

(assert (not b!157056))

(assert (not d!52297))

(assert (not b!157054))

(assert (not bm!2477))

(assert (not b!157038))

(assert (not d!52283))

(assert (not b!157059))

(assert (not b!156982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

