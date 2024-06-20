; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58418 () Bool)

(assert start!58418)

(declare-fun b!268298 () Bool)

(declare-fun e!188311 () Bool)

(declare-datatypes ((array!14962 0))(
  ( (array!14963 (arr!7511 (Array (_ BitVec 32) (_ BitVec 8))) (size!6524 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11862 0))(
  ( (BitStream!11863 (buf!6992 array!14962) (currentByte!12910 (_ BitVec 32)) (currentBit!12905 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11862)

(declare-fun w3!25 () BitStream!11862)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268298 (= e!188311 (byteRangesEq!0 (select (arr!7511 (buf!6992 w1!591)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591)) #b00000000000000000000000000000000 (currentBit!12905 w1!591)))))

(declare-fun b!268299 () Bool)

(declare-fun e!188303 () Bool)

(assert (=> b!268299 (= e!188303 (not (or (bvsge (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12905 w1!591)) (bvsle (currentBit!12905 w1!591) #b00000000000000000000000000001000)))))))

(declare-datatypes ((Unit!19023 0))(
  ( (Unit!19024) )
))
(declare-fun lt!408389 () Unit!19023)

(declare-fun e!188307 () Unit!19023)

(assert (=> b!268299 (= lt!408389 e!188307)))

(declare-fun c!12372 () Bool)

(declare-fun w2!587 () BitStream!11862)

(assert (=> b!268299 (= c!12372 (and (bvslt (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))) (bvslt (currentByte!12910 w1!591) (currentByte!12910 w2!587))))))

(declare-fun e!188310 () Bool)

(assert (=> b!268299 e!188310))

(declare-fun res!223784 () Bool)

(assert (=> b!268299 (=> (not res!223784) (not e!188310))))

(declare-fun arrayRangesEq!1059 (array!14962 array!14962 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268299 (= res!223784 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591)))))

(declare-fun lt!408387 () Unit!19023)

(declare-fun arrayRangesEqTransitive!334 (array!14962 array!14962 array!14962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19023)

(assert (=> b!268299 (= lt!408387 (arrayRangesEqTransitive!334 (buf!6992 w1!591) (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)))))

(declare-fun b!268300 () Bool)

(declare-fun e!188309 () Bool)

(assert (=> b!268300 (= e!188309 (byteRangesEq!0 (select (arr!7511 (buf!6992 w1!591)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591)) #b00000000000000000000000000000000 (currentBit!12905 w1!591)))))

(declare-fun b!268301 () Bool)

(declare-fun e!188304 () Bool)

(declare-fun array_inv!6248 (array!14962) Bool)

(assert (=> b!268301 (= e!188304 (array_inv!6248 (buf!6992 w2!587)))))

(declare-fun b!268302 () Bool)

(declare-fun res!223783 () Bool)

(assert (=> b!268302 (=> (not res!223783) (not e!188303))))

(declare-fun isPrefixOf!0 (BitStream!11862 BitStream!11862) Bool)

(assert (=> b!268302 (= res!223783 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268303 () Bool)

(declare-fun Unit!19025 () Unit!19023)

(assert (=> b!268303 (= e!188307 Unit!19025)))

(declare-fun b!268304 () Bool)

(declare-fun Unit!19026 () Unit!19023)

(assert (=> b!268304 (= e!188307 Unit!19026)))

(declare-fun lt!408388 () Unit!19023)

(declare-fun arrayRangesEqImpliesEq!149 (array!14962 array!14962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19023)

(assert (=> b!268304 (= lt!408388 (arrayRangesEqImpliesEq!149 (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)))))

(declare-fun res!223786 () Bool)

(assert (=> b!268304 (= res!223786 (= (select (arr!7511 (buf!6992 w2!587)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591))))))

(assert (=> b!268304 (=> (not res!223786) (not e!188309))))

(assert (=> b!268304 e!188309))

(declare-fun res!223782 () Bool)

(assert (=> start!58418 (=> (not res!223782) (not e!188303))))

(assert (=> start!58418 (= res!223782 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58418 e!188303))

(declare-fun e!188308 () Bool)

(declare-fun inv!12 (BitStream!11862) Bool)

(assert (=> start!58418 (and (inv!12 w1!591) e!188308)))

(assert (=> start!58418 (and (inv!12 w2!587) e!188304)))

(declare-fun e!188312 () Bool)

(assert (=> start!58418 (and (inv!12 w3!25) e!188312)))

(declare-fun b!268305 () Bool)

(assert (=> b!268305 (= e!188310 e!188311)))

(declare-fun res!223785 () Bool)

(assert (=> b!268305 (=> res!223785 e!188311)))

(assert (=> b!268305 (= res!223785 (or (bvsge (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))) (bvslt (currentByte!12910 w1!591) (currentByte!12910 w2!587))))))

(declare-fun b!268306 () Bool)

(assert (=> b!268306 (= e!188312 (array_inv!6248 (buf!6992 w3!25)))))

(declare-fun b!268307 () Bool)

(assert (=> b!268307 (= e!188308 (array_inv!6248 (buf!6992 w1!591)))))

(assert (= (and start!58418 res!223782) b!268302))

(assert (= (and b!268302 res!223783) b!268299))

(assert (= (and b!268299 res!223784) b!268305))

(assert (= (and b!268305 (not res!223785)) b!268298))

(assert (= (and b!268299 c!12372) b!268304))

(assert (= (and b!268299 (not c!12372)) b!268303))

(assert (= (and b!268304 res!223786) b!268300))

(assert (= start!58418 b!268307))

(assert (= start!58418 b!268301))

(assert (= start!58418 b!268306))

(declare-fun m!399707 () Bool)

(assert (=> b!268300 m!399707))

(declare-fun m!399709 () Bool)

(assert (=> b!268300 m!399709))

(assert (=> b!268300 m!399707))

(assert (=> b!268300 m!399709))

(declare-fun m!399711 () Bool)

(assert (=> b!268300 m!399711))

(declare-fun m!399713 () Bool)

(assert (=> b!268299 m!399713))

(declare-fun m!399715 () Bool)

(assert (=> b!268299 m!399715))

(declare-fun m!399717 () Bool)

(assert (=> b!268307 m!399717))

(declare-fun m!399719 () Bool)

(assert (=> b!268304 m!399719))

(declare-fun m!399721 () Bool)

(assert (=> b!268304 m!399721))

(assert (=> b!268304 m!399709))

(declare-fun m!399723 () Bool)

(assert (=> start!58418 m!399723))

(declare-fun m!399725 () Bool)

(assert (=> start!58418 m!399725))

(declare-fun m!399727 () Bool)

(assert (=> start!58418 m!399727))

(declare-fun m!399729 () Bool)

(assert (=> start!58418 m!399729))

(declare-fun m!399731 () Bool)

(assert (=> b!268302 m!399731))

(declare-fun m!399733 () Bool)

(assert (=> b!268301 m!399733))

(declare-fun m!399735 () Bool)

(assert (=> b!268306 m!399735))

(assert (=> b!268298 m!399707))

(assert (=> b!268298 m!399709))

(assert (=> b!268298 m!399707))

(assert (=> b!268298 m!399709))

(assert (=> b!268298 m!399711))

(check-sat (not start!58418) (not b!268301) (not b!268307) (not b!268304) (not b!268302) (not b!268299) (not b!268300) (not b!268306) (not b!268298))
(check-sat)
(get-model)

(declare-fun d!90676 () Bool)

(assert (=> d!90676 (= (byteRangesEq!0 (select (arr!7511 (buf!6992 w1!591)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591)) #b00000000000000000000000000000000 (currentBit!12905 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!12905 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7511 (buf!6992 w1!591)) (currentByte!12910 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12905 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12905 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23019 () Bool)

(assert (= bs!23019 d!90676))

(declare-fun m!399767 () Bool)

(assert (=> bs!23019 m!399767))

(declare-fun m!399769 () Bool)

(assert (=> bs!23019 m!399769))

(assert (=> b!268300 d!90676))

(declare-fun d!90680 () Bool)

(assert (=> d!90680 (= (array_inv!6248 (buf!6992 w3!25)) (bvsge (size!6524 (buf!6992 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268306 d!90680))

(declare-fun d!90682 () Bool)

(assert (=> d!90682 (= (array_inv!6248 (buf!6992 w2!587)) (bvsge (size!6524 (buf!6992 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268301 d!90682))

(declare-fun d!90684 () Bool)

(assert (=> d!90684 (= (array_inv!6248 (buf!6992 w1!591)) (bvsge (size!6524 (buf!6992 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268307 d!90684))

(declare-fun d!90686 () Bool)

(declare-fun res!223810 () Bool)

(declare-fun e!188351 () Bool)

(assert (=> d!90686 (=> (not res!223810) (not e!188351))))

(assert (=> d!90686 (= res!223810 (= (size!6524 (buf!6992 w1!591)) (size!6524 (buf!6992 w2!587))))))

(assert (=> d!90686 (= (isPrefixOf!0 w1!591 w2!587) e!188351)))

(declare-fun b!268344 () Bool)

(declare-fun res!223809 () Bool)

(assert (=> b!268344 (=> (not res!223809) (not e!188351))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268344 (= res!223809 (bvsle (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591)) (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587))))))

(declare-fun b!268345 () Bool)

(declare-fun e!188352 () Bool)

(assert (=> b!268345 (= e!188351 e!188352)))

(declare-fun res!223808 () Bool)

(assert (=> b!268345 (=> res!223808 e!188352)))

(assert (=> b!268345 (= res!223808 (= (size!6524 (buf!6992 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268346 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14962 array!14962 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268346 (= e!188352 (arrayBitRangesEq!0 (buf!6992 w1!591) (buf!6992 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591))))))

(assert (= (and d!90686 res!223810) b!268344))

(assert (= (and b!268344 res!223809) b!268345))

(assert (= (and b!268345 (not res!223808)) b!268346))

(declare-fun m!399777 () Bool)

(assert (=> b!268344 m!399777))

(declare-fun m!399779 () Bool)

(assert (=> b!268344 m!399779))

(assert (=> b!268346 m!399777))

(assert (=> b!268346 m!399777))

(declare-fun m!399781 () Bool)

(assert (=> b!268346 m!399781))

(assert (=> start!58418 d!90686))

(declare-fun d!90694 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90694 (= (inv!12 w1!591) (invariant!0 (currentBit!12905 w1!591) (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))))))

(declare-fun bs!23022 () Bool)

(assert (= bs!23022 d!90694))

(declare-fun m!399783 () Bool)

(assert (=> bs!23022 m!399783))

(assert (=> start!58418 d!90694))

(declare-fun d!90696 () Bool)

(assert (=> d!90696 (= (inv!12 w2!587) (invariant!0 (currentBit!12905 w2!587) (currentByte!12910 w2!587) (size!6524 (buf!6992 w2!587))))))

(declare-fun bs!23023 () Bool)

(assert (= bs!23023 d!90696))

(declare-fun m!399785 () Bool)

(assert (=> bs!23023 m!399785))

(assert (=> start!58418 d!90696))

(declare-fun d!90698 () Bool)

(assert (=> d!90698 (= (inv!12 w3!25) (invariant!0 (currentBit!12905 w3!25) (currentByte!12910 w3!25) (size!6524 (buf!6992 w3!25))))))

(declare-fun bs!23024 () Bool)

(assert (= bs!23024 d!90698))

(declare-fun m!399787 () Bool)

(assert (=> bs!23024 m!399787))

(assert (=> start!58418 d!90698))

(declare-fun d!90700 () Bool)

(declare-fun res!223813 () Bool)

(declare-fun e!188353 () Bool)

(assert (=> d!90700 (=> (not res!223813) (not e!188353))))

(assert (=> d!90700 (= res!223813 (= (size!6524 (buf!6992 w2!587)) (size!6524 (buf!6992 w3!25))))))

(assert (=> d!90700 (= (isPrefixOf!0 w2!587 w3!25) e!188353)))

(declare-fun b!268347 () Bool)

(declare-fun res!223812 () Bool)

(assert (=> b!268347 (=> (not res!223812) (not e!188353))))

(assert (=> b!268347 (= res!223812 (bvsle (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587)) (bitIndex!0 (size!6524 (buf!6992 w3!25)) (currentByte!12910 w3!25) (currentBit!12905 w3!25))))))

(declare-fun b!268348 () Bool)

(declare-fun e!188354 () Bool)

(assert (=> b!268348 (= e!188353 e!188354)))

(declare-fun res!223811 () Bool)

(assert (=> b!268348 (=> res!223811 e!188354)))

(assert (=> b!268348 (= res!223811 (= (size!6524 (buf!6992 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268349 () Bool)

(assert (=> b!268349 (= e!188354 (arrayBitRangesEq!0 (buf!6992 w2!587) (buf!6992 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587))))))

(assert (= (and d!90700 res!223813) b!268347))

(assert (= (and b!268347 res!223812) b!268348))

(assert (= (and b!268348 (not res!223811)) b!268349))

(assert (=> b!268347 m!399779))

(declare-fun m!399789 () Bool)

(assert (=> b!268347 m!399789))

(assert (=> b!268349 m!399779))

(assert (=> b!268349 m!399779))

(declare-fun m!399791 () Bool)

(assert (=> b!268349 m!399791))

(assert (=> b!268302 d!90700))

(assert (=> b!268298 d!90676))

(declare-fun d!90702 () Bool)

(assert (=> d!90702 (and (bvsge (currentByte!12910 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12910 w1!591) (size!6524 (buf!6992 w2!587))) (bvslt (currentByte!12910 w1!591) (size!6524 (buf!6992 w3!25))) (= (select (arr!7511 (buf!6992 w2!587)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591))))))

(declare-fun lt!408404 () Unit!19023)

(declare-fun choose!376 (array!14962 array!14962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19023)

(assert (=> d!90702 (= lt!408404 (choose!376 (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)))))

(assert (=> d!90702 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12910 w2!587)))))

(assert (=> d!90702 (= (arrayRangesEqImpliesEq!149 (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)) lt!408404)))

(declare-fun bs!23026 () Bool)

(assert (= bs!23026 d!90702))

(assert (=> bs!23026 m!399721))

(assert (=> bs!23026 m!399709))

(declare-fun m!399797 () Bool)

(assert (=> bs!23026 m!399797))

(assert (=> b!268304 d!90702))

(declare-fun d!90706 () Bool)

(declare-fun res!223827 () Bool)

(declare-fun e!188365 () Bool)

(assert (=> d!90706 (=> res!223827 e!188365)))

(assert (=> d!90706 (= res!223827 (= #b00000000000000000000000000000000 (currentByte!12910 w1!591)))))

(assert (=> d!90706 (= (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591)) e!188365)))

(declare-fun b!268363 () Bool)

(declare-fun e!188366 () Bool)

(assert (=> b!268363 (= e!188365 e!188366)))

(declare-fun res!223828 () Bool)

(assert (=> b!268363 (=> (not res!223828) (not e!188366))))

(assert (=> b!268363 (= res!223828 (= (select (arr!7511 (buf!6992 w1!591)) #b00000000000000000000000000000000) (select (arr!7511 (buf!6992 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268364 () Bool)

(assert (=> b!268364 (= e!188366 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12910 w1!591)))))

(assert (= (and d!90706 (not res!223827)) b!268363))

(assert (= (and b!268363 res!223828) b!268364))

(declare-fun m!399807 () Bool)

(assert (=> b!268363 m!399807))

(declare-fun m!399809 () Bool)

(assert (=> b!268363 m!399809))

(declare-fun m!399811 () Bool)

(assert (=> b!268364 m!399811))

(assert (=> b!268299 d!90706))

(declare-fun d!90716 () Bool)

(assert (=> d!90716 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591))))

(declare-fun lt!408410 () Unit!19023)

(declare-fun choose!378 (array!14962 array!14962 array!14962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19023)

(assert (=> d!90716 (= lt!408410 (choose!378 (buf!6992 w1!591) (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)))))

(assert (=> d!90716 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12910 w1!591)) (bvsle (currentByte!12910 w1!591) (currentByte!12910 w2!587)))))

(assert (=> d!90716 (= (arrayRangesEqTransitive!334 (buf!6992 w1!591) (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)) lt!408410)))

(declare-fun bs!23031 () Bool)

(assert (= bs!23031 d!90716))

(assert (=> bs!23031 m!399713))

(declare-fun m!399823 () Bool)

(assert (=> bs!23031 m!399823))

(assert (=> b!268299 d!90716))

(check-sat (not d!90698) (not d!90716) (not b!268344) (not d!90696) (not b!268347) (not b!268346) (not d!90694) (not b!268349) (not b!268364) (not d!90702))
(check-sat)
(get-model)

(declare-fun d!90748 () Bool)

(assert (=> d!90748 (= (invariant!0 (currentBit!12905 w2!587) (currentByte!12910 w2!587) (size!6524 (buf!6992 w2!587))) (and (bvsge (currentBit!12905 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12905 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12910 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12910 w2!587) (size!6524 (buf!6992 w2!587))) (and (= (currentBit!12905 w2!587) #b00000000000000000000000000000000) (= (currentByte!12910 w2!587) (size!6524 (buf!6992 w2!587)))))))))

(assert (=> d!90696 d!90748))

(declare-fun d!90750 () Bool)

(declare-fun e!188391 () Bool)

(assert (=> d!90750 e!188391))

(declare-fun res!223860 () Bool)

(assert (=> d!90750 (=> (not res!223860) (not e!188391))))

(declare-fun lt!408431 () (_ BitVec 64))

(declare-fun lt!408434 () (_ BitVec 64))

(declare-fun lt!408429 () (_ BitVec 64))

(assert (=> d!90750 (= res!223860 (= lt!408431 (bvsub lt!408434 lt!408429)))))

(assert (=> d!90750 (or (= (bvand lt!408434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408434 lt!408429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90750 (= lt!408429 (remainingBits!0 ((_ sign_extend 32) (size!6524 (buf!6992 w1!591))) ((_ sign_extend 32) (currentByte!12910 w1!591)) ((_ sign_extend 32) (currentBit!12905 w1!591))))))

(declare-fun lt!408430 () (_ BitVec 64))

(declare-fun lt!408432 () (_ BitVec 64))

(assert (=> d!90750 (= lt!408434 (bvmul lt!408430 lt!408432))))

(assert (=> d!90750 (or (= lt!408430 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408432 (bvsdiv (bvmul lt!408430 lt!408432) lt!408430)))))

(assert (=> d!90750 (= lt!408432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90750 (= lt!408430 ((_ sign_extend 32) (size!6524 (buf!6992 w1!591))))))

(assert (=> d!90750 (= lt!408431 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12910 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12905 w1!591))))))

(assert (=> d!90750 (invariant!0 (currentBit!12905 w1!591) (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591)))))

(assert (=> d!90750 (= (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591)) lt!408431)))

(declare-fun b!268396 () Bool)

(declare-fun res!223861 () Bool)

(assert (=> b!268396 (=> (not res!223861) (not e!188391))))

(assert (=> b!268396 (= res!223861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408431))))

(declare-fun b!268397 () Bool)

(declare-fun lt!408433 () (_ BitVec 64))

(assert (=> b!268397 (= e!188391 (bvsle lt!408431 (bvmul lt!408433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268397 (or (= lt!408433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408433)))))

(assert (=> b!268397 (= lt!408433 ((_ sign_extend 32) (size!6524 (buf!6992 w1!591))))))

(assert (= (and d!90750 res!223860) b!268396))

(assert (= (and b!268396 res!223861) b!268397))

(declare-fun m!399857 () Bool)

(assert (=> d!90750 m!399857))

(assert (=> d!90750 m!399783))

(assert (=> b!268344 d!90750))

(declare-fun d!90752 () Bool)

(declare-fun e!188392 () Bool)

(assert (=> d!90752 e!188392))

(declare-fun res!223862 () Bool)

(assert (=> d!90752 (=> (not res!223862) (not e!188392))))

(declare-fun lt!408437 () (_ BitVec 64))

(declare-fun lt!408435 () (_ BitVec 64))

(declare-fun lt!408440 () (_ BitVec 64))

(assert (=> d!90752 (= res!223862 (= lt!408437 (bvsub lt!408440 lt!408435)))))

(assert (=> d!90752 (or (= (bvand lt!408440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408435 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408440 lt!408435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90752 (= lt!408435 (remainingBits!0 ((_ sign_extend 32) (size!6524 (buf!6992 w2!587))) ((_ sign_extend 32) (currentByte!12910 w2!587)) ((_ sign_extend 32) (currentBit!12905 w2!587))))))

(declare-fun lt!408436 () (_ BitVec 64))

(declare-fun lt!408438 () (_ BitVec 64))

(assert (=> d!90752 (= lt!408440 (bvmul lt!408436 lt!408438))))

(assert (=> d!90752 (or (= lt!408436 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408438 (bvsdiv (bvmul lt!408436 lt!408438) lt!408436)))))

(assert (=> d!90752 (= lt!408438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90752 (= lt!408436 ((_ sign_extend 32) (size!6524 (buf!6992 w2!587))))))

(assert (=> d!90752 (= lt!408437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12910 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12905 w2!587))))))

(assert (=> d!90752 (invariant!0 (currentBit!12905 w2!587) (currentByte!12910 w2!587) (size!6524 (buf!6992 w2!587)))))

(assert (=> d!90752 (= (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587)) lt!408437)))

(declare-fun b!268398 () Bool)

(declare-fun res!223863 () Bool)

(assert (=> b!268398 (=> (not res!223863) (not e!188392))))

(assert (=> b!268398 (= res!223863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408437))))

(declare-fun b!268399 () Bool)

(declare-fun lt!408439 () (_ BitVec 64))

(assert (=> b!268399 (= e!188392 (bvsle lt!408437 (bvmul lt!408439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268399 (or (= lt!408439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408439)))))

(assert (=> b!268399 (= lt!408439 ((_ sign_extend 32) (size!6524 (buf!6992 w2!587))))))

(assert (= (and d!90752 res!223862) b!268398))

(assert (= (and b!268398 res!223863) b!268399))

(declare-fun m!399859 () Bool)

(assert (=> d!90752 m!399859))

(assert (=> d!90752 m!399785))

(assert (=> b!268344 d!90752))

(declare-fun d!90754 () Bool)

(assert (=> d!90754 (= (invariant!0 (currentBit!12905 w1!591) (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))) (and (bvsge (currentBit!12905 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12905 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12910 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591))) (and (= (currentBit!12905 w1!591) #b00000000000000000000000000000000) (= (currentByte!12910 w1!591) (size!6524 (buf!6992 w1!591)))))))))

(assert (=> d!90694 d!90754))

(declare-fun b!268414 () Bool)

(declare-fun e!188406 () Bool)

(declare-fun e!188407 () Bool)

(assert (=> b!268414 (= e!188406 e!188407)))

(declare-fun c!12378 () Bool)

(declare-datatypes ((tuple4!414 0))(
  ( (tuple4!415 (_1!12190 (_ BitVec 32)) (_2!12190 (_ BitVec 32)) (_3!987 (_ BitVec 32)) (_4!207 (_ BitVec 32))) )
))
(declare-fun lt!408449 () tuple4!414)

(assert (=> b!268414 (= c!12378 (= (_3!987 lt!408449) (_4!207 lt!408449)))))

(declare-fun b!268415 () Bool)

(declare-fun res!223876 () Bool)

(declare-fun lt!408447 () (_ BitVec 32))

(assert (=> b!268415 (= res!223876 (= lt!408447 #b00000000000000000000000000000000))))

(declare-fun e!188410 () Bool)

(assert (=> b!268415 (=> res!223876 e!188410)))

(declare-fun e!188405 () Bool)

(assert (=> b!268415 (= e!188405 e!188410)))

(declare-fun b!268416 () Bool)

(declare-fun e!188409 () Bool)

(assert (=> b!268416 (= e!188409 e!188406)))

(declare-fun res!223874 () Bool)

(assert (=> b!268416 (=> (not res!223874) (not e!188406))))

(declare-fun e!188408 () Bool)

(assert (=> b!268416 (= res!223874 e!188408)))

(declare-fun res!223877 () Bool)

(assert (=> b!268416 (=> res!223877 e!188408)))

(assert (=> b!268416 (= res!223877 (bvsge (_1!12190 lt!408449) (_2!12190 lt!408449)))))

(assert (=> b!268416 (= lt!408447 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408448 () (_ BitVec 32))

(assert (=> b!268416 (= lt!408448 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!414)

(assert (=> b!268416 (= lt!408449 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587))))))

(declare-fun b!268417 () Bool)

(assert (=> b!268417 (= e!188410 (byteRangesEq!0 (select (arr!7511 (buf!6992 w2!587)) (_4!207 lt!408449)) (select (arr!7511 (buf!6992 w3!25)) (_4!207 lt!408449)) #b00000000000000000000000000000000 lt!408447))))

(declare-fun call!4238 () Bool)

(declare-fun bm!4235 () Bool)

(assert (=> bm!4235 (= call!4238 (byteRangesEq!0 (select (arr!7511 (buf!6992 w2!587)) (_3!987 lt!408449)) (select (arr!7511 (buf!6992 w3!25)) (_3!987 lt!408449)) lt!408448 (ite c!12378 lt!408447 #b00000000000000000000000000001000)))))

(declare-fun b!268418 () Bool)

(assert (=> b!268418 (= e!188407 e!188405)))

(declare-fun res!223878 () Bool)

(assert (=> b!268418 (= res!223878 call!4238)))

(assert (=> b!268418 (=> (not res!223878) (not e!188405))))

(declare-fun d!90756 () Bool)

(declare-fun res!223875 () Bool)

(assert (=> d!90756 (=> res!223875 e!188409)))

(assert (=> d!90756 (= res!223875 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587))))))

(assert (=> d!90756 (= (arrayBitRangesEq!0 (buf!6992 w2!587) (buf!6992 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w2!587)) (currentByte!12910 w2!587) (currentBit!12905 w2!587))) e!188409)))

(declare-fun b!268419 () Bool)

(assert (=> b!268419 (= e!188407 call!4238)))

(declare-fun b!268420 () Bool)

(assert (=> b!268420 (= e!188408 (arrayRangesEq!1059 (buf!6992 w2!587) (buf!6992 w3!25) (_1!12190 lt!408449) (_2!12190 lt!408449)))))

(assert (= (and d!90756 (not res!223875)) b!268416))

(assert (= (and b!268416 (not res!223877)) b!268420))

(assert (= (and b!268416 res!223874) b!268414))

(assert (= (and b!268414 c!12378) b!268419))

(assert (= (and b!268414 (not c!12378)) b!268418))

(assert (= (and b!268418 res!223878) b!268415))

(assert (= (and b!268415 (not res!223876)) b!268417))

(assert (= (or b!268419 b!268418) bm!4235))

(assert (=> b!268416 m!399779))

(declare-fun m!399861 () Bool)

(assert (=> b!268416 m!399861))

(declare-fun m!399863 () Bool)

(assert (=> b!268417 m!399863))

(declare-fun m!399865 () Bool)

(assert (=> b!268417 m!399865))

(assert (=> b!268417 m!399863))

(assert (=> b!268417 m!399865))

(declare-fun m!399867 () Bool)

(assert (=> b!268417 m!399867))

(declare-fun m!399869 () Bool)

(assert (=> bm!4235 m!399869))

(declare-fun m!399871 () Bool)

(assert (=> bm!4235 m!399871))

(assert (=> bm!4235 m!399869))

(assert (=> bm!4235 m!399871))

(declare-fun m!399873 () Bool)

(assert (=> bm!4235 m!399873))

(declare-fun m!399875 () Bool)

(assert (=> b!268420 m!399875))

(assert (=> b!268349 d!90756))

(assert (=> b!268349 d!90752))

(assert (=> d!90716 d!90706))

(declare-fun d!90758 () Bool)

(assert (=> d!90758 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591))))

(assert (=> d!90758 true))

(declare-fun _$16!107 () Unit!19023)

(assert (=> d!90758 (= (choose!378 (buf!6992 w1!591) (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)) _$16!107)))

(declare-fun bs!23037 () Bool)

(assert (= bs!23037 d!90758))

(assert (=> bs!23037 m!399713))

(assert (=> d!90716 d!90758))

(assert (=> b!268347 d!90752))

(declare-fun d!90760 () Bool)

(declare-fun e!188411 () Bool)

(assert (=> d!90760 e!188411))

(declare-fun res!223879 () Bool)

(assert (=> d!90760 (=> (not res!223879) (not e!188411))))

(declare-fun lt!408452 () (_ BitVec 64))

(declare-fun lt!408455 () (_ BitVec 64))

(declare-fun lt!408450 () (_ BitVec 64))

(assert (=> d!90760 (= res!223879 (= lt!408452 (bvsub lt!408455 lt!408450)))))

(assert (=> d!90760 (or (= (bvand lt!408455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408455 lt!408450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90760 (= lt!408450 (remainingBits!0 ((_ sign_extend 32) (size!6524 (buf!6992 w3!25))) ((_ sign_extend 32) (currentByte!12910 w3!25)) ((_ sign_extend 32) (currentBit!12905 w3!25))))))

(declare-fun lt!408451 () (_ BitVec 64))

(declare-fun lt!408453 () (_ BitVec 64))

(assert (=> d!90760 (= lt!408455 (bvmul lt!408451 lt!408453))))

(assert (=> d!90760 (or (= lt!408451 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408453 (bvsdiv (bvmul lt!408451 lt!408453) lt!408451)))))

(assert (=> d!90760 (= lt!408453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90760 (= lt!408451 ((_ sign_extend 32) (size!6524 (buf!6992 w3!25))))))

(assert (=> d!90760 (= lt!408452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12910 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12905 w3!25))))))

(assert (=> d!90760 (invariant!0 (currentBit!12905 w3!25) (currentByte!12910 w3!25) (size!6524 (buf!6992 w3!25)))))

(assert (=> d!90760 (= (bitIndex!0 (size!6524 (buf!6992 w3!25)) (currentByte!12910 w3!25) (currentBit!12905 w3!25)) lt!408452)))

(declare-fun b!268421 () Bool)

(declare-fun res!223880 () Bool)

(assert (=> b!268421 (=> (not res!223880) (not e!188411))))

(assert (=> b!268421 (= res!223880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408452))))

(declare-fun b!268422 () Bool)

(declare-fun lt!408454 () (_ BitVec 64))

(assert (=> b!268422 (= e!188411 (bvsle lt!408452 (bvmul lt!408454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268422 (or (= lt!408454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408454)))))

(assert (=> b!268422 (= lt!408454 ((_ sign_extend 32) (size!6524 (buf!6992 w3!25))))))

(assert (= (and d!90760 res!223879) b!268421))

(assert (= (and b!268421 res!223880) b!268422))

(declare-fun m!399877 () Bool)

(assert (=> d!90760 m!399877))

(assert (=> d!90760 m!399787))

(assert (=> b!268347 d!90760))

(declare-fun b!268423 () Bool)

(declare-fun e!188413 () Bool)

(declare-fun e!188414 () Bool)

(assert (=> b!268423 (= e!188413 e!188414)))

(declare-fun c!12379 () Bool)

(declare-fun lt!408458 () tuple4!414)

(assert (=> b!268423 (= c!12379 (= (_3!987 lt!408458) (_4!207 lt!408458)))))

(declare-fun b!268424 () Bool)

(declare-fun res!223883 () Bool)

(declare-fun lt!408456 () (_ BitVec 32))

(assert (=> b!268424 (= res!223883 (= lt!408456 #b00000000000000000000000000000000))))

(declare-fun e!188417 () Bool)

(assert (=> b!268424 (=> res!223883 e!188417)))

(declare-fun e!188412 () Bool)

(assert (=> b!268424 (= e!188412 e!188417)))

(declare-fun b!268425 () Bool)

(declare-fun e!188416 () Bool)

(assert (=> b!268425 (= e!188416 e!188413)))

(declare-fun res!223881 () Bool)

(assert (=> b!268425 (=> (not res!223881) (not e!188413))))

(declare-fun e!188415 () Bool)

(assert (=> b!268425 (= res!223881 e!188415)))

(declare-fun res!223884 () Bool)

(assert (=> b!268425 (=> res!223884 e!188415)))

(assert (=> b!268425 (= res!223884 (bvsge (_1!12190 lt!408458) (_2!12190 lt!408458)))))

(assert (=> b!268425 (= lt!408456 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408457 () (_ BitVec 32))

(assert (=> b!268425 (= lt!408457 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268425 (= lt!408458 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591))))))

(declare-fun b!268426 () Bool)

(assert (=> b!268426 (= e!188417 (byteRangesEq!0 (select (arr!7511 (buf!6992 w1!591)) (_4!207 lt!408458)) (select (arr!7511 (buf!6992 w2!587)) (_4!207 lt!408458)) #b00000000000000000000000000000000 lt!408456))))

(declare-fun bm!4236 () Bool)

(declare-fun call!4239 () Bool)

(assert (=> bm!4236 (= call!4239 (byteRangesEq!0 (select (arr!7511 (buf!6992 w1!591)) (_3!987 lt!408458)) (select (arr!7511 (buf!6992 w2!587)) (_3!987 lt!408458)) lt!408457 (ite c!12379 lt!408456 #b00000000000000000000000000001000)))))

(declare-fun b!268427 () Bool)

(assert (=> b!268427 (= e!188414 e!188412)))

(declare-fun res!223885 () Bool)

(assert (=> b!268427 (= res!223885 call!4239)))

(assert (=> b!268427 (=> (not res!223885) (not e!188412))))

(declare-fun d!90762 () Bool)

(declare-fun res!223882 () Bool)

(assert (=> d!90762 (=> res!223882 e!188416)))

(assert (=> d!90762 (= res!223882 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591))))))

(assert (=> d!90762 (= (arrayBitRangesEq!0 (buf!6992 w1!591) (buf!6992 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6524 (buf!6992 w1!591)) (currentByte!12910 w1!591) (currentBit!12905 w1!591))) e!188416)))

(declare-fun b!268428 () Bool)

(assert (=> b!268428 (= e!188414 call!4239)))

(declare-fun b!268429 () Bool)

(assert (=> b!268429 (= e!188415 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w2!587) (_1!12190 lt!408458) (_2!12190 lt!408458)))))

(assert (= (and d!90762 (not res!223882)) b!268425))

(assert (= (and b!268425 (not res!223884)) b!268429))

(assert (= (and b!268425 res!223881) b!268423))

(assert (= (and b!268423 c!12379) b!268428))

(assert (= (and b!268423 (not c!12379)) b!268427))

(assert (= (and b!268427 res!223885) b!268424))

(assert (= (and b!268424 (not res!223883)) b!268426))

(assert (= (or b!268428 b!268427) bm!4236))

(assert (=> b!268425 m!399777))

(declare-fun m!399879 () Bool)

(assert (=> b!268425 m!399879))

(declare-fun m!399881 () Bool)

(assert (=> b!268426 m!399881))

(declare-fun m!399883 () Bool)

(assert (=> b!268426 m!399883))

(assert (=> b!268426 m!399881))

(assert (=> b!268426 m!399883))

(declare-fun m!399885 () Bool)

(assert (=> b!268426 m!399885))

(declare-fun m!399887 () Bool)

(assert (=> bm!4236 m!399887))

(declare-fun m!399889 () Bool)

(assert (=> bm!4236 m!399889))

(assert (=> bm!4236 m!399887))

(assert (=> bm!4236 m!399889))

(declare-fun m!399891 () Bool)

(assert (=> bm!4236 m!399891))

(declare-fun m!399893 () Bool)

(assert (=> b!268429 m!399893))

(assert (=> b!268346 d!90762))

(assert (=> b!268346 d!90750))

(declare-fun d!90764 () Bool)

(assert (=> d!90764 (= (select (arr!7511 (buf!6992 w2!587)) (currentByte!12910 w1!591)) (select (arr!7511 (buf!6992 w3!25)) (currentByte!12910 w1!591)))))

(assert (=> d!90764 true))

(declare-fun _$12!93 () Unit!19023)

(assert (=> d!90764 (= (choose!376 (buf!6992 w2!587) (buf!6992 w3!25) #b00000000000000000000000000000000 (currentByte!12910 w1!591) (currentByte!12910 w2!587)) _$12!93)))

(declare-fun bs!23038 () Bool)

(assert (= bs!23038 d!90764))

(assert (=> bs!23038 m!399721))

(assert (=> bs!23038 m!399709))

(assert (=> d!90702 d!90764))

(declare-fun d!90766 () Bool)

(declare-fun res!223886 () Bool)

(declare-fun e!188418 () Bool)

(assert (=> d!90766 (=> res!223886 e!188418)))

(assert (=> d!90766 (= res!223886 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12910 w1!591)))))

(assert (=> d!90766 (= (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12910 w1!591)) e!188418)))

(declare-fun b!268430 () Bool)

(declare-fun e!188419 () Bool)

(assert (=> b!268430 (= e!188418 e!188419)))

(declare-fun res!223887 () Bool)

(assert (=> b!268430 (=> (not res!223887) (not e!188419))))

(assert (=> b!268430 (= res!223887 (= (select (arr!7511 (buf!6992 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7511 (buf!6992 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268431 () Bool)

(assert (=> b!268431 (= e!188419 (arrayRangesEq!1059 (buf!6992 w1!591) (buf!6992 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12910 w1!591)))))

(assert (= (and d!90766 (not res!223886)) b!268430))

(assert (= (and b!268430 res!223887) b!268431))

(declare-fun m!399895 () Bool)

(assert (=> b!268430 m!399895))

(declare-fun m!399897 () Bool)

(assert (=> b!268430 m!399897))

(declare-fun m!399899 () Bool)

(assert (=> b!268431 m!399899))

(assert (=> b!268364 d!90766))

(declare-fun d!90768 () Bool)

(assert (=> d!90768 (= (invariant!0 (currentBit!12905 w3!25) (currentByte!12910 w3!25) (size!6524 (buf!6992 w3!25))) (and (bvsge (currentBit!12905 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12905 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12910 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12910 w3!25) (size!6524 (buf!6992 w3!25))) (and (= (currentBit!12905 w3!25) #b00000000000000000000000000000000) (= (currentByte!12910 w3!25) (size!6524 (buf!6992 w3!25)))))))))

(assert (=> d!90698 d!90768))

(check-sat (not b!268426) (not b!268431) (not d!90750) (not d!90760) (not d!90758) (not d!90752) (not b!268425) (not b!268417) (not b!268429) (not bm!4236) (not b!268420) (not bm!4235) (not b!268416))
