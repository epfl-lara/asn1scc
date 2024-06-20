; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58834 () Bool)

(assert start!58834)

(declare-datatypes ((array!15046 0))(
  ( (array!15047 (arr!7541 (Array (_ BitVec 32) (_ BitVec 8))) (size!6554 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11922 0))(
  ( (BitStream!11923 (buf!7022 array!15046) (currentByte!12981 (_ BitVec 32)) (currentBit!12976 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11922)

(declare-fun b!269989 () Bool)

(declare-fun w2!587 () BitStream!11922)

(declare-fun w1!591 () BitStream!11922)

(declare-fun e!189883 () Bool)

(assert (=> b!269989 (= e!189883 (not (or (bvsge (currentByte!12981 w1!591) (size!6554 (buf!7022 w1!591))) (bvsge (currentByte!12981 w1!591) (currentByte!12981 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12981 w2!587)) (bvsle (size!6554 (buf!7022 w2!587)) (size!6554 (buf!7022 w3!25))))))))

(declare-fun arrayRangesEq!1086 (array!15046 array!15046 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269989 (arrayRangesEq!1086 (buf!7022 w1!591) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591))))

(declare-datatypes ((Unit!19063 0))(
  ( (Unit!19064) )
))
(declare-fun lt!409256 () Unit!19063)

(declare-fun arrayRangesEqTransitive!349 (array!15046 array!15046 array!15046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> b!269989 (= lt!409256 (arrayRangesEqTransitive!349 (buf!7022 w1!591) (buf!7022 w2!587) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591) (currentByte!12981 w2!587)))))

(declare-fun res!225033 () Bool)

(assert (=> start!58834 (=> (not res!225033) (not e!189883))))

(declare-fun isPrefixOf!0 (BitStream!11922 BitStream!11922) Bool)

(assert (=> start!58834 (= res!225033 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58834 e!189883))

(declare-fun e!189880 () Bool)

(declare-fun inv!12 (BitStream!11922) Bool)

(assert (=> start!58834 (and (inv!12 w1!591) e!189880)))

(declare-fun e!189879 () Bool)

(assert (=> start!58834 (and (inv!12 w2!587) e!189879)))

(declare-fun e!189881 () Bool)

(assert (=> start!58834 (and (inv!12 w3!25) e!189881)))

(declare-fun b!269990 () Bool)

(declare-fun array_inv!6278 (array!15046) Bool)

(assert (=> b!269990 (= e!189881 (array_inv!6278 (buf!7022 w3!25)))))

(declare-fun b!269991 () Bool)

(assert (=> b!269991 (= e!189879 (array_inv!6278 (buf!7022 w2!587)))))

(declare-fun b!269992 () Bool)

(assert (=> b!269992 (= e!189880 (array_inv!6278 (buf!7022 w1!591)))))

(declare-fun b!269993 () Bool)

(declare-fun res!225034 () Bool)

(assert (=> b!269993 (=> (not res!225034) (not e!189883))))

(assert (=> b!269993 (= res!225034 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58834 res!225033) b!269993))

(assert (= (and b!269993 res!225034) b!269989))

(assert (= start!58834 b!269992))

(assert (= start!58834 b!269991))

(assert (= start!58834 b!269990))

(declare-fun m!401777 () Bool)

(assert (=> b!269990 m!401777))

(declare-fun m!401779 () Bool)

(assert (=> b!269992 m!401779))

(declare-fun m!401781 () Bool)

(assert (=> b!269991 m!401781))

(declare-fun m!401783 () Bool)

(assert (=> b!269993 m!401783))

(declare-fun m!401785 () Bool)

(assert (=> start!58834 m!401785))

(declare-fun m!401787 () Bool)

(assert (=> start!58834 m!401787))

(declare-fun m!401789 () Bool)

(assert (=> start!58834 m!401789))

(declare-fun m!401791 () Bool)

(assert (=> start!58834 m!401791))

(declare-fun m!401793 () Bool)

(assert (=> b!269989 m!401793))

(declare-fun m!401795 () Bool)

(assert (=> b!269989 m!401795))

(check-sat (not b!269991) (not b!269993) (not b!269989) (not b!269990) (not b!269992) (not start!58834))
(check-sat)
(get-model)

(declare-fun d!91610 () Bool)

(declare-fun res!225083 () Bool)

(declare-fun e!189938 () Bool)

(assert (=> d!91610 (=> (not res!225083) (not e!189938))))

(assert (=> d!91610 (= res!225083 (= (size!6554 (buf!7022 w2!587)) (size!6554 (buf!7022 w3!25))))))

(assert (=> d!91610 (= (isPrefixOf!0 w2!587 w3!25) e!189938)))

(declare-fun b!270051 () Bool)

(declare-fun res!225085 () Bool)

(assert (=> b!270051 (=> (not res!225085) (not e!189938))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270051 (= res!225085 (bvsle (bitIndex!0 (size!6554 (buf!7022 w2!587)) (currentByte!12981 w2!587) (currentBit!12976 w2!587)) (bitIndex!0 (size!6554 (buf!7022 w3!25)) (currentByte!12981 w3!25) (currentBit!12976 w3!25))))))

(declare-fun b!270052 () Bool)

(declare-fun e!189937 () Bool)

(assert (=> b!270052 (= e!189938 e!189937)))

(declare-fun res!225084 () Bool)

(assert (=> b!270052 (=> res!225084 e!189937)))

(assert (=> b!270052 (= res!225084 (= (size!6554 (buf!7022 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270053 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15046 array!15046 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270053 (= e!189937 (arrayBitRangesEq!0 (buf!7022 w2!587) (buf!7022 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6554 (buf!7022 w2!587)) (currentByte!12981 w2!587) (currentBit!12976 w2!587))))))

(assert (= (and d!91610 res!225083) b!270051))

(assert (= (and b!270051 res!225085) b!270052))

(assert (= (and b!270052 (not res!225084)) b!270053))

(declare-fun m!401865 () Bool)

(assert (=> b!270051 m!401865))

(declare-fun m!401867 () Bool)

(assert (=> b!270051 m!401867))

(assert (=> b!270053 m!401865))

(assert (=> b!270053 m!401865))

(declare-fun m!401869 () Bool)

(assert (=> b!270053 m!401869))

(assert (=> b!269993 d!91610))

(declare-fun d!91636 () Bool)

(assert (=> d!91636 (= (array_inv!6278 (buf!7022 w1!591)) (bvsge (size!6554 (buf!7022 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269992 d!91636))

(declare-fun d!91638 () Bool)

(assert (=> d!91638 (= (array_inv!6278 (buf!7022 w2!587)) (bvsge (size!6554 (buf!7022 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269991 d!91638))

(declare-fun d!91640 () Bool)

(declare-fun res!225086 () Bool)

(declare-fun e!189940 () Bool)

(assert (=> d!91640 (=> (not res!225086) (not e!189940))))

(assert (=> d!91640 (= res!225086 (= (size!6554 (buf!7022 w1!591)) (size!6554 (buf!7022 w2!587))))))

(assert (=> d!91640 (= (isPrefixOf!0 w1!591 w2!587) e!189940)))

(declare-fun b!270054 () Bool)

(declare-fun res!225088 () Bool)

(assert (=> b!270054 (=> (not res!225088) (not e!189940))))

(assert (=> b!270054 (= res!225088 (bvsle (bitIndex!0 (size!6554 (buf!7022 w1!591)) (currentByte!12981 w1!591) (currentBit!12976 w1!591)) (bitIndex!0 (size!6554 (buf!7022 w2!587)) (currentByte!12981 w2!587) (currentBit!12976 w2!587))))))

(declare-fun b!270055 () Bool)

(declare-fun e!189939 () Bool)

(assert (=> b!270055 (= e!189940 e!189939)))

(declare-fun res!225087 () Bool)

(assert (=> b!270055 (=> res!225087 e!189939)))

(assert (=> b!270055 (= res!225087 (= (size!6554 (buf!7022 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270056 () Bool)

(assert (=> b!270056 (= e!189939 (arrayBitRangesEq!0 (buf!7022 w1!591) (buf!7022 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6554 (buf!7022 w1!591)) (currentByte!12981 w1!591) (currentBit!12976 w1!591))))))

(assert (= (and d!91640 res!225086) b!270054))

(assert (= (and b!270054 res!225088) b!270055))

(assert (= (and b!270055 (not res!225087)) b!270056))

(declare-fun m!401871 () Bool)

(assert (=> b!270054 m!401871))

(assert (=> b!270054 m!401865))

(assert (=> b!270056 m!401871))

(assert (=> b!270056 m!401871))

(declare-fun m!401873 () Bool)

(assert (=> b!270056 m!401873))

(assert (=> start!58834 d!91640))

(declare-fun d!91642 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91642 (= (inv!12 w1!591) (invariant!0 (currentBit!12976 w1!591) (currentByte!12981 w1!591) (size!6554 (buf!7022 w1!591))))))

(declare-fun bs!23169 () Bool)

(assert (= bs!23169 d!91642))

(declare-fun m!401875 () Bool)

(assert (=> bs!23169 m!401875))

(assert (=> start!58834 d!91642))

(declare-fun d!91644 () Bool)

(assert (=> d!91644 (= (inv!12 w2!587) (invariant!0 (currentBit!12976 w2!587) (currentByte!12981 w2!587) (size!6554 (buf!7022 w2!587))))))

(declare-fun bs!23170 () Bool)

(assert (= bs!23170 d!91644))

(declare-fun m!401877 () Bool)

(assert (=> bs!23170 m!401877))

(assert (=> start!58834 d!91644))

(declare-fun d!91646 () Bool)

(assert (=> d!91646 (= (inv!12 w3!25) (invariant!0 (currentBit!12976 w3!25) (currentByte!12981 w3!25) (size!6554 (buf!7022 w3!25))))))

(declare-fun bs!23171 () Bool)

(assert (= bs!23171 d!91646))

(declare-fun m!401879 () Bool)

(assert (=> bs!23171 m!401879))

(assert (=> start!58834 d!91646))

(declare-fun d!91648 () Bool)

(assert (=> d!91648 (= (array_inv!6278 (buf!7022 w3!25)) (bvsge (size!6554 (buf!7022 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269990 d!91648))

(declare-fun d!91650 () Bool)

(declare-fun res!225093 () Bool)

(declare-fun e!189945 () Bool)

(assert (=> d!91650 (=> res!225093 e!189945)))

(assert (=> d!91650 (= res!225093 (= #b00000000000000000000000000000000 (currentByte!12981 w1!591)))))

(assert (=> d!91650 (= (arrayRangesEq!1086 (buf!7022 w1!591) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591)) e!189945)))

(declare-fun b!270061 () Bool)

(declare-fun e!189946 () Bool)

(assert (=> b!270061 (= e!189945 e!189946)))

(declare-fun res!225094 () Bool)

(assert (=> b!270061 (=> (not res!225094) (not e!189946))))

(assert (=> b!270061 (= res!225094 (= (select (arr!7541 (buf!7022 w1!591)) #b00000000000000000000000000000000) (select (arr!7541 (buf!7022 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270062 () Bool)

(assert (=> b!270062 (= e!189946 (arrayRangesEq!1086 (buf!7022 w1!591) (buf!7022 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12981 w1!591)))))

(assert (= (and d!91650 (not res!225093)) b!270061))

(assert (= (and b!270061 res!225094) b!270062))

(declare-fun m!401881 () Bool)

(assert (=> b!270061 m!401881))

(declare-fun m!401883 () Bool)

(assert (=> b!270061 m!401883))

(declare-fun m!401885 () Bool)

(assert (=> b!270062 m!401885))

(assert (=> b!269989 d!91650))

(declare-fun d!91652 () Bool)

(assert (=> d!91652 (arrayRangesEq!1086 (buf!7022 w1!591) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591))))

(declare-fun lt!409268 () Unit!19063)

(declare-fun choose!388 (array!15046 array!15046 array!15046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19063)

(assert (=> d!91652 (= lt!409268 (choose!388 (buf!7022 w1!591) (buf!7022 w2!587) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591) (currentByte!12981 w2!587)))))

(assert (=> d!91652 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12981 w1!591)) (bvsle (currentByte!12981 w1!591) (currentByte!12981 w2!587)))))

(assert (=> d!91652 (= (arrayRangesEqTransitive!349 (buf!7022 w1!591) (buf!7022 w2!587) (buf!7022 w3!25) #b00000000000000000000000000000000 (currentByte!12981 w1!591) (currentByte!12981 w2!587)) lt!409268)))

(declare-fun bs!23172 () Bool)

(assert (= bs!23172 d!91652))

(assert (=> bs!23172 m!401793))

(declare-fun m!401887 () Bool)

(assert (=> bs!23172 m!401887))

(assert (=> b!269989 d!91652))

(check-sat (not b!270051) (not b!270062) (not d!91646) (not b!270056) (not d!91652) (not d!91642) (not b!270053) (not b!270054) (not d!91644))
(check-sat)
