; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58570 () Bool)

(assert start!58570)

(declare-fun b!268924 () Bool)

(declare-fun res!224218 () Bool)

(declare-fun e!188920 () Bool)

(assert (=> b!268924 (=> (not res!224218) (not e!188920))))

(declare-datatypes ((array!14994 0))(
  ( (array!14995 (arr!7524 (Array (_ BitVec 32) (_ BitVec 8))) (size!6537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11888 0))(
  ( (BitStream!11889 (buf!7005 array!14994) (currentByte!12935 (_ BitVec 32)) (currentBit!12930 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11888)

(declare-fun w3!25 () BitStream!11888)

(declare-fun isPrefixOf!0 (BitStream!11888 BitStream!11888) Bool)

(assert (=> b!268924 (= res!224218 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268925 () Bool)

(declare-fun w1!591 () BitStream!11888)

(assert (=> b!268925 (= e!188920 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12935 w1!591)) (bvsgt (currentByte!12935 w1!591) (currentByte!12935 w2!587))))))

(declare-fun b!268926 () Bool)

(declare-fun e!188917 () Bool)

(declare-fun array_inv!6261 (array!14994) Bool)

(assert (=> b!268926 (= e!188917 (array_inv!6261 (buf!7005 w2!587)))))

(declare-fun res!224217 () Bool)

(assert (=> start!58570 (=> (not res!224217) (not e!188920))))

(assert (=> start!58570 (= res!224217 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58570 e!188920))

(declare-fun e!188916 () Bool)

(declare-fun inv!12 (BitStream!11888) Bool)

(assert (=> start!58570 (and (inv!12 w1!591) e!188916)))

(assert (=> start!58570 (and (inv!12 w2!587) e!188917)))

(declare-fun e!188922 () Bool)

(assert (=> start!58570 (and (inv!12 w3!25) e!188922)))

(declare-fun b!268927 () Bool)

(assert (=> b!268927 (= e!188922 (array_inv!6261 (buf!7005 w3!25)))))

(declare-fun b!268928 () Bool)

(assert (=> b!268928 (= e!188916 (array_inv!6261 (buf!7005 w1!591)))))

(assert (= (and start!58570 res!224217) b!268924))

(assert (= (and b!268924 res!224218) b!268925))

(assert (= start!58570 b!268928))

(assert (= start!58570 b!268926))

(assert (= start!58570 b!268927))

(declare-fun m!400453 () Bool)

(assert (=> b!268926 m!400453))

(declare-fun m!400455 () Bool)

(assert (=> b!268924 m!400455))

(declare-fun m!400457 () Bool)

(assert (=> start!58570 m!400457))

(declare-fun m!400459 () Bool)

(assert (=> start!58570 m!400459))

(declare-fun m!400461 () Bool)

(assert (=> start!58570 m!400461))

(declare-fun m!400463 () Bool)

(assert (=> start!58570 m!400463))

(declare-fun m!400465 () Bool)

(assert (=> b!268928 m!400465))

(declare-fun m!400467 () Bool)

(assert (=> b!268927 m!400467))

(push 1)

(assert (not b!268926))

(assert (not b!268927))

(assert (not start!58570))

(assert (not b!268928))

(assert (not b!268924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90960 () Bool)

(assert (=> d!90960 (= (array_inv!6261 (buf!7005 w1!591)) (bvsge (size!6537 (buf!7005 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268928 d!90960))

(declare-fun d!90962 () Bool)

(assert (=> d!90962 (= (array_inv!6261 (buf!7005 w2!587)) (bvsge (size!6537 (buf!7005 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268926 d!90962))

(declare-fun d!90964 () Bool)

(assert (=> d!90964 (= (array_inv!6261 (buf!7005 w3!25)) (bvsge (size!6537 (buf!7005 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268927 d!90964))

(declare-fun d!90966 () Bool)

(declare-fun res!224251 () Bool)

(declare-fun e!188943 () Bool)

(assert (=> d!90966 (=> (not res!224251) (not e!188943))))

(assert (=> d!90966 (= res!224251 (= (size!6537 (buf!7005 w1!591)) (size!6537 (buf!7005 w2!587))))))

(assert (=> d!90966 (= (isPrefixOf!0 w1!591 w2!587) e!188943)))

(declare-fun b!268959 () Bool)

(declare-fun res!224250 () Bool)

(assert (=> b!268959 (=> (not res!224250) (not e!188943))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268959 (= res!224250 (bvsle (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591)) (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587))))))

(declare-fun b!268960 () Bool)

(declare-fun e!188944 () Bool)

(assert (=> b!268960 (= e!188943 e!188944)))

(declare-fun res!224249 () Bool)

(assert (=> b!268960 (=> res!224249 e!188944)))

(assert (=> b!268960 (= res!224249 (= (size!6537 (buf!7005 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268961 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14994 array!14994 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268961 (= e!188944 (arrayBitRangesEq!0 (buf!7005 w1!591) (buf!7005 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591))))))

(assert (= (and d!90966 res!224251) b!268959))

(assert (= (and b!268959 res!224250) b!268960))

(assert (= (and b!268960 (not res!224249)) b!268961))

(declare-fun m!400501 () Bool)

(assert (=> b!268959 m!400501))

(declare-fun m!400503 () Bool)

(assert (=> b!268959 m!400503))

(assert (=> b!268961 m!400501))

(assert (=> b!268961 m!400501))

(declare-fun m!400505 () Bool)

(assert (=> b!268961 m!400505))

(assert (=> start!58570 d!90966))

(declare-fun d!90982 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90982 (= (inv!12 w1!591) (invariant!0 (currentBit!12930 w1!591) (currentByte!12935 w1!591) (size!6537 (buf!7005 w1!591))))))

(declare-fun bs!23076 () Bool)

(assert (= bs!23076 d!90982))

(declare-fun m!400507 () Bool)

(assert (=> bs!23076 m!400507))

(assert (=> start!58570 d!90982))

(declare-fun d!90984 () Bool)

(assert (=> d!90984 (= (inv!12 w2!587) (invariant!0 (currentBit!12930 w2!587) (currentByte!12935 w2!587) (size!6537 (buf!7005 w2!587))))))

(declare-fun bs!23077 () Bool)

(assert (= bs!23077 d!90984))

(declare-fun m!400509 () Bool)

(assert (=> bs!23077 m!400509))

(assert (=> start!58570 d!90984))

(declare-fun d!90986 () Bool)

(assert (=> d!90986 (= (inv!12 w3!25) (invariant!0 (currentBit!12930 w3!25) (currentByte!12935 w3!25) (size!6537 (buf!7005 w3!25))))))

(declare-fun bs!23078 () Bool)

(assert (= bs!23078 d!90986))

(declare-fun m!400511 () Bool)

(assert (=> bs!23078 m!400511))

(assert (=> start!58570 d!90986))

(declare-fun d!90988 () Bool)

(declare-fun res!224254 () Bool)

(declare-fun e!188945 () Bool)

(assert (=> d!90988 (=> (not res!224254) (not e!188945))))

(assert (=> d!90988 (= res!224254 (= (size!6537 (buf!7005 w2!587)) (size!6537 (buf!7005 w3!25))))))

(assert (=> d!90988 (= (isPrefixOf!0 w2!587 w3!25) e!188945)))

(declare-fun b!268962 () Bool)

(declare-fun res!224253 () Bool)

(assert (=> b!268962 (=> (not res!224253) (not e!188945))))

(assert (=> b!268962 (= res!224253 (bvsle (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587)) (bitIndex!0 (size!6537 (buf!7005 w3!25)) (currentByte!12935 w3!25) (currentBit!12930 w3!25))))))

(declare-fun b!268963 () Bool)

(declare-fun e!188946 () Bool)

(assert (=> b!268963 (= e!188945 e!188946)))

(declare-fun res!224252 () Bool)

(assert (=> b!268963 (=> res!224252 e!188946)))

(assert (=> b!268963 (= res!224252 (= (size!6537 (buf!7005 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268964 () Bool)

(assert (=> b!268964 (= e!188946 (arrayBitRangesEq!0 (buf!7005 w2!587) (buf!7005 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587))))))

(assert (= (and d!90988 res!224254) b!268962))

(assert (= (and b!268962 res!224253) b!268963))

(assert (= (and b!268963 (not res!224252)) b!268964))

(assert (=> b!268962 m!400503))

(declare-fun m!400513 () Bool)

(assert (=> b!268962 m!400513))

(assert (=> b!268964 m!400503))

(assert (=> b!268964 m!400503))

(declare-fun m!400515 () Bool)

(assert (=> b!268964 m!400515))

(assert (=> b!268924 d!90988))

(push 1)

(assert (not b!268964))

(assert (not d!90986))

(assert (not d!90984))

(assert (not b!268961))

(assert (not b!268959))

(assert (not d!90982))

(assert (not b!268962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91006 () Bool)

(assert (=> d!91006 (= (invariant!0 (currentBit!12930 w3!25) (currentByte!12935 w3!25) (size!6537 (buf!7005 w3!25))) (and (bvsge (currentBit!12930 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12930 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12935 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12935 w3!25) (size!6537 (buf!7005 w3!25))) (and (= (currentBit!12930 w3!25) #b00000000000000000000000000000000) (= (currentByte!12935 w3!25) (size!6537 (buf!7005 w3!25)))))))))

(assert (=> d!90986 d!91006))

(declare-fun d!91014 () Bool)

(declare-fun e!188978 () Bool)

(assert (=> d!91014 e!188978))

(declare-fun res!224289 () Bool)

(assert (=> d!91014 (=> (not res!224289) (not e!188978))))

(declare-fun lt!408789 () (_ BitVec 64))

(declare-fun lt!408786 () (_ BitVec 64))

(declare-fun lt!408787 () (_ BitVec 64))

(assert (=> d!91014 (= res!224289 (= lt!408789 (bvsub lt!408786 lt!408787)))))

(assert (=> d!91014 (or (= (bvand lt!408786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408786 lt!408787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91014 (= lt!408787 (remainingBits!0 ((_ sign_extend 32) (size!6537 (buf!7005 w2!587))) ((_ sign_extend 32) (currentByte!12935 w2!587)) ((_ sign_extend 32) (currentBit!12930 w2!587))))))

(declare-fun lt!408791 () (_ BitVec 64))

(declare-fun lt!408790 () (_ BitVec 64))

(assert (=> d!91014 (= lt!408786 (bvmul lt!408791 lt!408790))))

(assert (=> d!91014 (or (= lt!408791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408790 (bvsdiv (bvmul lt!408791 lt!408790) lt!408791)))))

(assert (=> d!91014 (= lt!408790 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91014 (= lt!408791 ((_ sign_extend 32) (size!6537 (buf!7005 w2!587))))))

(assert (=> d!91014 (= lt!408789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12935 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12930 w2!587))))))

(assert (=> d!91014 (invariant!0 (currentBit!12930 w2!587) (currentByte!12935 w2!587) (size!6537 (buf!7005 w2!587)))))

(assert (=> d!91014 (= (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587)) lt!408789)))

(declare-fun b!269007 () Bool)

(declare-fun res!224290 () Bool)

(assert (=> b!269007 (=> (not res!224290) (not e!188978))))

(assert (=> b!269007 (= res!224290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408789))))

(declare-fun b!269008 () Bool)

(declare-fun lt!408788 () (_ BitVec 64))

(assert (=> b!269008 (= e!188978 (bvsle lt!408789 (bvmul lt!408788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269008 (or (= lt!408788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408788)))))

(assert (=> b!269008 (= lt!408788 ((_ sign_extend 32) (size!6537 (buf!7005 w2!587))))))

(assert (= (and d!91014 res!224289) b!269007))

(assert (= (and b!269007 res!224290) b!269008))

(declare-fun m!400555 () Bool)

(assert (=> d!91014 m!400555))

(assert (=> d!91014 m!400509))

(assert (=> b!268962 d!91014))

(declare-fun d!91016 () Bool)

(declare-fun e!188979 () Bool)

(assert (=> d!91016 e!188979))

(declare-fun res!224291 () Bool)

(assert (=> d!91016 (=> (not res!224291) (not e!188979))))

(declare-fun lt!408793 () (_ BitVec 64))

(declare-fun lt!408795 () (_ BitVec 64))

(declare-fun lt!408792 () (_ BitVec 64))

(assert (=> d!91016 (= res!224291 (= lt!408795 (bvsub lt!408792 lt!408793)))))

(assert (=> d!91016 (or (= (bvand lt!408792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408792 lt!408793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91016 (= lt!408793 (remainingBits!0 ((_ sign_extend 32) (size!6537 (buf!7005 w3!25))) ((_ sign_extend 32) (currentByte!12935 w3!25)) ((_ sign_extend 32) (currentBit!12930 w3!25))))))

(declare-fun lt!408797 () (_ BitVec 64))

(declare-fun lt!408796 () (_ BitVec 64))

(assert (=> d!91016 (= lt!408792 (bvmul lt!408797 lt!408796))))

(assert (=> d!91016 (or (= lt!408797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408796 (bvsdiv (bvmul lt!408797 lt!408796) lt!408797)))))

(assert (=> d!91016 (= lt!408796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91016 (= lt!408797 ((_ sign_extend 32) (size!6537 (buf!7005 w3!25))))))

(assert (=> d!91016 (= lt!408795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12935 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12930 w3!25))))))

(assert (=> d!91016 (invariant!0 (currentBit!12930 w3!25) (currentByte!12935 w3!25) (size!6537 (buf!7005 w3!25)))))

(assert (=> d!91016 (= (bitIndex!0 (size!6537 (buf!7005 w3!25)) (currentByte!12935 w3!25) (currentBit!12930 w3!25)) lt!408795)))

(declare-fun b!269009 () Bool)

(declare-fun res!224292 () Bool)

(assert (=> b!269009 (=> (not res!224292) (not e!188979))))

(assert (=> b!269009 (= res!224292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408795))))

(declare-fun b!269010 () Bool)

(declare-fun lt!408794 () (_ BitVec 64))

(assert (=> b!269010 (= e!188979 (bvsle lt!408795 (bvmul lt!408794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269010 (or (= lt!408794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408794)))))

(assert (=> b!269010 (= lt!408794 ((_ sign_extend 32) (size!6537 (buf!7005 w3!25))))))

(assert (= (and d!91016 res!224291) b!269009))

(assert (= (and b!269009 res!224292) b!269010))

(declare-fun m!400557 () Bool)

(assert (=> d!91016 m!400557))

(assert (=> d!91016 m!400511))

(assert (=> b!268962 d!91016))

(declare-fun d!91018 () Bool)

(assert (=> d!91018 (= (invariant!0 (currentBit!12930 w2!587) (currentByte!12935 w2!587) (size!6537 (buf!7005 w2!587))) (and (bvsge (currentBit!12930 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12930 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12935 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12935 w2!587) (size!6537 (buf!7005 w2!587))) (and (= (currentBit!12930 w2!587) #b00000000000000000000000000000000) (= (currentByte!12935 w2!587) (size!6537 (buf!7005 w2!587)))))))))

(assert (=> d!90984 d!91018))

(declare-fun b!269046 () Bool)

(declare-fun e!189014 () Bool)

(declare-fun e!189011 () Bool)

(assert (=> b!269046 (= e!189014 e!189011)))

(declare-fun c!12418 () Bool)

(declare-datatypes ((tuple4!430 0))(
  ( (tuple4!431 (_1!12198 (_ BitVec 32)) (_2!12198 (_ BitVec 32)) (_3!995 (_ BitVec 32)) (_4!215 (_ BitVec 32))) )
))
(declare-fun lt!408814 () tuple4!430)

(assert (=> b!269046 (= c!12418 (= (_3!995 lt!408814) (_4!215 lt!408814)))))

(declare-fun b!269047 () Bool)

(declare-fun call!4269 () Bool)

(assert (=> b!269047 (= e!189011 call!4269)))

(declare-fun bm!4266 () Bool)

(declare-fun lt!408815 () (_ BitVec 32))

(declare-fun lt!408813 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4266 (= call!4269 (byteRangesEq!0 (ite c!12418 (select (arr!7524 (buf!7005 w1!591)) (_3!995 lt!408814)) (select (arr!7524 (buf!7005 w1!591)) (_4!215 lt!408814))) (ite c!12418 (select (arr!7524 (buf!7005 w2!587)) (_3!995 lt!408814)) (select (arr!7524 (buf!7005 w2!587)) (_4!215 lt!408814))) (ite c!12418 lt!408815 #b00000000000000000000000000000000) lt!408813))))

(declare-fun b!269048 () Bool)

(declare-fun e!189012 () Bool)

(declare-fun arrayRangesEq!1072 (array!14994 array!14994 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269048 (= e!189012 (arrayRangesEq!1072 (buf!7005 w1!591) (buf!7005 w2!587) (_1!12198 lt!408814) (_2!12198 lt!408814)))))

(declare-fun b!269049 () Bool)

(declare-fun e!189015 () Bool)

(assert (=> b!269049 (= e!189015 e!189014)))

(declare-fun res!224322 () Bool)

(assert (=> b!269049 (=> (not res!224322) (not e!189014))))

(assert (=> b!269049 (= res!224322 e!189012)))

(declare-fun res!224321 () Bool)

(assert (=> b!269049 (=> res!224321 e!189012)))

(assert (=> b!269049 (= res!224321 (bvsge (_1!12198 lt!408814) (_2!12198 lt!408814)))))

(assert (=> b!269049 (= lt!408813 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269049 (= lt!408815 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!430)

(assert (=> b!269049 (= lt!408814 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591))))))

(declare-fun d!91020 () Bool)

(declare-fun res!224319 () Bool)

(assert (=> d!91020 (=> res!224319 e!189015)))

(assert (=> d!91020 (= res!224319 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591))))))

(assert (=> d!91020 (= (arrayBitRangesEq!0 (buf!7005 w1!591) (buf!7005 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591))) e!189015)))

(declare-fun b!269050 () Bool)

(declare-fun res!224320 () Bool)

(assert (=> b!269050 (= res!224320 (= lt!408813 #b00000000000000000000000000000000))))

(declare-fun e!189013 () Bool)

(assert (=> b!269050 (=> res!224320 e!189013)))

(declare-fun e!189010 () Bool)

(assert (=> b!269050 (= e!189010 e!189013)))

(declare-fun b!269051 () Bool)

(assert (=> b!269051 (= e!189013 call!4269)))

(declare-fun b!269052 () Bool)

(assert (=> b!269052 (= e!189011 e!189010)))

(declare-fun res!224318 () Bool)

(assert (=> b!269052 (= res!224318 (byteRangesEq!0 (select (arr!7524 (buf!7005 w1!591)) (_3!995 lt!408814)) (select (arr!7524 (buf!7005 w2!587)) (_3!995 lt!408814)) lt!408815 #b00000000000000000000000000001000))))

(assert (=> b!269052 (=> (not res!224318) (not e!189010))))

(assert (= (and d!91020 (not res!224319)) b!269049))

(assert (= (and b!269049 (not res!224321)) b!269048))

(assert (= (and b!269049 res!224322) b!269046))

(assert (= (and b!269046 c!12418) b!269047))

(assert (= (and b!269046 (not c!12418)) b!269052))

(assert (= (and b!269052 res!224318) b!269050))

(assert (= (and b!269050 (not res!224320)) b!269051))

(assert (= (or b!269047 b!269051) bm!4266))

(declare-fun m!400575 () Bool)

(assert (=> bm!4266 m!400575))

(declare-fun m!400577 () Bool)

(assert (=> bm!4266 m!400577))

(declare-fun m!400579 () Bool)

(assert (=> bm!4266 m!400579))

(declare-fun m!400581 () Bool)

(assert (=> bm!4266 m!400581))

(declare-fun m!400583 () Bool)

(assert (=> bm!4266 m!400583))

(declare-fun m!400585 () Bool)

(assert (=> b!269048 m!400585))

(assert (=> b!269049 m!400501))

(declare-fun m!400587 () Bool)

(assert (=> b!269049 m!400587))

(assert (=> b!269052 m!400575))

(assert (=> b!269052 m!400577))

(assert (=> b!269052 m!400575))

(assert (=> b!269052 m!400577))

(declare-fun m!400589 () Bool)

(assert (=> b!269052 m!400589))

(assert (=> b!268961 d!91020))

(declare-fun d!91024 () Bool)

(declare-fun e!189016 () Bool)

(assert (=> d!91024 e!189016))

(declare-fun res!224323 () Bool)

(assert (=> d!91024 (=> (not res!224323) (not e!189016))))

(declare-fun lt!408817 () (_ BitVec 64))

(declare-fun lt!408816 () (_ BitVec 64))

(declare-fun lt!408819 () (_ BitVec 64))

(assert (=> d!91024 (= res!224323 (= lt!408819 (bvsub lt!408816 lt!408817)))))

(assert (=> d!91024 (or (= (bvand lt!408816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408816 lt!408817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91024 (= lt!408817 (remainingBits!0 ((_ sign_extend 32) (size!6537 (buf!7005 w1!591))) ((_ sign_extend 32) (currentByte!12935 w1!591)) ((_ sign_extend 32) (currentBit!12930 w1!591))))))

(declare-fun lt!408821 () (_ BitVec 64))

(declare-fun lt!408820 () (_ BitVec 64))

(assert (=> d!91024 (= lt!408816 (bvmul lt!408821 lt!408820))))

(assert (=> d!91024 (or (= lt!408821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408820 (bvsdiv (bvmul lt!408821 lt!408820) lt!408821)))))

(assert (=> d!91024 (= lt!408820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91024 (= lt!408821 ((_ sign_extend 32) (size!6537 (buf!7005 w1!591))))))

(assert (=> d!91024 (= lt!408819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12935 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12930 w1!591))))))

(assert (=> d!91024 (invariant!0 (currentBit!12930 w1!591) (currentByte!12935 w1!591) (size!6537 (buf!7005 w1!591)))))

(assert (=> d!91024 (= (bitIndex!0 (size!6537 (buf!7005 w1!591)) (currentByte!12935 w1!591) (currentBit!12930 w1!591)) lt!408819)))

(declare-fun b!269053 () Bool)

(declare-fun res!224324 () Bool)

(assert (=> b!269053 (=> (not res!224324) (not e!189016))))

(assert (=> b!269053 (= res!224324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408819))))

(declare-fun b!269054 () Bool)

(declare-fun lt!408818 () (_ BitVec 64))

(assert (=> b!269054 (= e!189016 (bvsle lt!408819 (bvmul lt!408818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269054 (or (= lt!408818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408818)))))

(assert (=> b!269054 (= lt!408818 ((_ sign_extend 32) (size!6537 (buf!7005 w1!591))))))

(assert (= (and d!91024 res!224323) b!269053))

(assert (= (and b!269053 res!224324) b!269054))

(declare-fun m!400591 () Bool)

(assert (=> d!91024 m!400591))

(assert (=> d!91024 m!400507))

(assert (=> b!268961 d!91024))

(assert (=> b!268959 d!91024))

(assert (=> b!268959 d!91014))

(declare-fun b!269055 () Bool)

(declare-fun e!189023 () Bool)

(declare-fun e!189020 () Bool)

(assert (=> b!269055 (= e!189023 e!189020)))

(declare-fun c!12419 () Bool)

(declare-fun lt!408831 () tuple4!430)

(assert (=> b!269055 (= c!12419 (= (_3!995 lt!408831) (_4!215 lt!408831)))))

(declare-fun b!269056 () Bool)

(declare-fun call!4270 () Bool)

(assert (=> b!269056 (= e!189020 call!4270)))

(declare-fun lt!408830 () (_ BitVec 32))

(declare-fun bm!4267 () Bool)

(declare-fun lt!408832 () (_ BitVec 32))

(assert (=> bm!4267 (= call!4270 (byteRangesEq!0 (ite c!12419 (select (arr!7524 (buf!7005 w2!587)) (_3!995 lt!408831)) (select (arr!7524 (buf!7005 w2!587)) (_4!215 lt!408831))) (ite c!12419 (select (arr!7524 (buf!7005 w3!25)) (_3!995 lt!408831)) (select (arr!7524 (buf!7005 w3!25)) (_4!215 lt!408831))) (ite c!12419 lt!408832 #b00000000000000000000000000000000) lt!408830))))

(declare-fun b!269057 () Bool)

(declare-fun e!189021 () Bool)

(assert (=> b!269057 (= e!189021 (arrayRangesEq!1072 (buf!7005 w2!587) (buf!7005 w3!25) (_1!12198 lt!408831) (_2!12198 lt!408831)))))

(declare-fun b!269058 () Bool)

(declare-fun e!189024 () Bool)

(assert (=> b!269058 (= e!189024 e!189023)))

(declare-fun res!224331 () Bool)

(assert (=> b!269058 (=> (not res!224331) (not e!189023))))

(assert (=> b!269058 (= res!224331 e!189021)))

(declare-fun res!224330 () Bool)

(assert (=> b!269058 (=> res!224330 e!189021)))

(assert (=> b!269058 (= res!224330 (bvsge (_1!12198 lt!408831) (_2!12198 lt!408831)))))

(assert (=> b!269058 (= lt!408830 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269058 (= lt!408832 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269058 (= lt!408831 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587))))))

(declare-fun d!91026 () Bool)

(declare-fun res!224328 () Bool)

(assert (=> d!91026 (=> res!224328 e!189024)))

(assert (=> d!91026 (= res!224328 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587))))))

(assert (=> d!91026 (= (arrayBitRangesEq!0 (buf!7005 w2!587) (buf!7005 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6537 (buf!7005 w2!587)) (currentByte!12935 w2!587) (currentBit!12930 w2!587))) e!189024)))

(declare-fun b!269059 () Bool)

(declare-fun res!224329 () Bool)

(assert (=> b!269059 (= res!224329 (= lt!408830 #b00000000000000000000000000000000))))

(declare-fun e!189022 () Bool)

(assert (=> b!269059 (=> res!224329 e!189022)))

(declare-fun e!189019 () Bool)

(assert (=> b!269059 (= e!189019 e!189022)))

(declare-fun b!269060 () Bool)

(assert (=> b!269060 (= e!189022 call!4270)))

(declare-fun b!269061 () Bool)

(assert (=> b!269061 (= e!189020 e!189019)))

(declare-fun res!224327 () Bool)

(assert (=> b!269061 (= res!224327 (byteRangesEq!0 (select (arr!7524 (buf!7005 w2!587)) (_3!995 lt!408831)) (select (arr!7524 (buf!7005 w3!25)) (_3!995 lt!408831)) lt!408832 #b00000000000000000000000000001000))))

(assert (=> b!269061 (=> (not res!224327) (not e!189019))))

(assert (= (and d!91026 (not res!224328)) b!269058))

(assert (= (and b!269058 (not res!224330)) b!269057))

(assert (= (and b!269058 res!224331) b!269055))

(assert (= (and b!269055 c!12419) b!269056))

(assert (= (and b!269055 (not c!12419)) b!269061))

(assert (= (and b!269061 res!224327) b!269059))

(assert (= (and b!269059 (not res!224329)) b!269060))

(assert (= (or b!269056 b!269060) bm!4267))

(declare-fun m!400593 () Bool)

(assert (=> bm!4267 m!400593))

(declare-fun m!400595 () Bool)

(assert (=> bm!4267 m!400595))

(declare-fun m!400597 () Bool)

(assert (=> bm!4267 m!400597))

(declare-fun m!400599 () Bool)

(assert (=> bm!4267 m!400599))

(declare-fun m!400601 () Bool)

(assert (=> bm!4267 m!400601))

(declare-fun m!400603 () Bool)

(assert (=> b!269057 m!400603))

(assert (=> b!269058 m!400503))

(declare-fun m!400605 () Bool)

(assert (=> b!269058 m!400605))

(assert (=> b!269061 m!400593))

(assert (=> b!269061 m!400595))

(assert (=> b!269061 m!400593))

(assert (=> b!269061 m!400595))

(declare-fun m!400607 () Bool)

(assert (=> b!269061 m!400607))

(assert (=> b!268964 d!91026))

(assert (=> b!268964 d!91014))

(declare-fun d!91028 () Bool)

(assert (=> d!91028 (= (invariant!0 (currentBit!12930 w1!591) (currentByte!12935 w1!591) (size!6537 (buf!7005 w1!591))) (and (bvsge (currentBit!12930 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12930 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12935 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12935 w1!591) (size!6537 (buf!7005 w1!591))) (and (= (currentBit!12930 w1!591) #b00000000000000000000000000000000) (= (currentByte!12935 w1!591) (size!6537 (buf!7005 w1!591)))))))))

(assert (=> d!90982 d!91028))

(push 1)

(assert (not d!91014))

(assert (not bm!4266))

(assert (not bm!4267))

(assert (not b!269049))

(assert (not b!269061))

(assert (not b!269057))

(assert (not d!91024))

(assert (not d!91016))

(assert (not b!269058))

(assert (not b!269052))

(assert (not b!269048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

