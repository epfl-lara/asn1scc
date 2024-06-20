; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58420 () Bool)

(assert start!58420)

(declare-fun b!268328 () Bool)

(declare-fun res!223800 () Bool)

(declare-fun e!188338 () Bool)

(assert (=> b!268328 (=> (not res!223800) (not e!188338))))

(declare-datatypes ((array!14964 0))(
  ( (array!14965 (arr!7512 (Array (_ BitVec 32) (_ BitVec 8))) (size!6525 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11864 0))(
  ( (BitStream!11865 (buf!6993 array!14964) (currentByte!12911 (_ BitVec 32)) (currentBit!12906 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11864)

(declare-fun w3!25 () BitStream!11864)

(declare-fun isPrefixOf!0 (BitStream!11864 BitStream!11864) Bool)

(assert (=> b!268328 (= res!223800 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268329 () Bool)

(declare-fun w1!591 () BitStream!11864)

(assert (=> b!268329 (= e!188338 (not (or (bvsge (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12906 w1!591)) (bvsle (currentBit!12906 w1!591) #b00000000000000000000000000001000)))))))

(declare-datatypes ((Unit!19027 0))(
  ( (Unit!19028) )
))
(declare-fun lt!408398 () Unit!19027)

(declare-fun e!188343 () Unit!19027)

(assert (=> b!268329 (= lt!408398 e!188343)))

(declare-fun c!12375 () Bool)

(assert (=> b!268329 (= c!12375 (and (bvslt (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))) (bvslt (currentByte!12911 w1!591) (currentByte!12911 w2!587))))))

(declare-fun e!188345 () Bool)

(assert (=> b!268329 e!188345))

(declare-fun res!223799 () Bool)

(assert (=> b!268329 (=> (not res!223799) (not e!188345))))

(declare-fun arrayRangesEq!1060 (array!14964 array!14964 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268329 (= res!223799 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591)))))

(declare-fun lt!408397 () Unit!19027)

(declare-fun arrayRangesEqTransitive!335 (array!14964 array!14964 array!14964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> b!268329 (= lt!408397 (arrayRangesEqTransitive!335 (buf!6993 w1!591) (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)))))

(declare-fun b!268330 () Bool)

(declare-fun Unit!19029 () Unit!19027)

(assert (=> b!268330 (= e!188343 Unit!19029)))

(declare-fun lt!408396 () Unit!19027)

(declare-fun arrayRangesEqImpliesEq!150 (array!14964 array!14964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> b!268330 (= lt!408396 (arrayRangesEqImpliesEq!150 (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)))))

(declare-fun res!223801 () Bool)

(assert (=> b!268330 (= res!223801 (= (select (arr!7512 (buf!6993 w2!587)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591))))))

(declare-fun e!188341 () Bool)

(assert (=> b!268330 (=> (not res!223801) (not e!188341))))

(assert (=> b!268330 e!188341))

(declare-fun b!268331 () Bool)

(declare-fun e!188340 () Bool)

(declare-fun array_inv!6249 (array!14964) Bool)

(assert (=> b!268331 (= e!188340 (array_inv!6249 (buf!6993 w1!591)))))

(declare-fun b!268332 () Bool)

(declare-fun Unit!19030 () Unit!19027)

(assert (=> b!268332 (= e!188343 Unit!19030)))

(declare-fun b!268333 () Bool)

(declare-fun e!188339 () Bool)

(assert (=> b!268333 (= e!188339 (array_inv!6249 (buf!6993 w3!25)))))

(declare-fun b!268334 () Bool)

(declare-fun e!188344 () Bool)

(assert (=> b!268334 (= e!188345 e!188344)))

(declare-fun res!223797 () Bool)

(assert (=> b!268334 (=> res!223797 e!188344)))

(assert (=> b!268334 (= res!223797 (or (bvsge (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))) (bvslt (currentByte!12911 w1!591) (currentByte!12911 w2!587))))))

(declare-fun b!268335 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268335 (= e!188341 (byteRangesEq!0 (select (arr!7512 (buf!6993 w1!591)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591)) #b00000000000000000000000000000000 (currentBit!12906 w1!591)))))

(declare-fun res!223798 () Bool)

(assert (=> start!58420 (=> (not res!223798) (not e!188338))))

(assert (=> start!58420 (= res!223798 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58420 e!188338))

(declare-fun inv!12 (BitStream!11864) Bool)

(assert (=> start!58420 (and (inv!12 w1!591) e!188340)))

(declare-fun e!188337 () Bool)

(assert (=> start!58420 (and (inv!12 w2!587) e!188337)))

(assert (=> start!58420 (and (inv!12 w3!25) e!188339)))

(declare-fun b!268336 () Bool)

(assert (=> b!268336 (= e!188337 (array_inv!6249 (buf!6993 w2!587)))))

(declare-fun b!268337 () Bool)

(assert (=> b!268337 (= e!188344 (byteRangesEq!0 (select (arr!7512 (buf!6993 w1!591)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591)) #b00000000000000000000000000000000 (currentBit!12906 w1!591)))))

(assert (= (and start!58420 res!223798) b!268328))

(assert (= (and b!268328 res!223800) b!268329))

(assert (= (and b!268329 res!223799) b!268334))

(assert (= (and b!268334 (not res!223797)) b!268337))

(assert (= (and b!268329 c!12375) b!268330))

(assert (= (and b!268329 (not c!12375)) b!268332))

(assert (= (and b!268330 res!223801) b!268335))

(assert (= start!58420 b!268331))

(assert (= start!58420 b!268336))

(assert (= start!58420 b!268333))

(declare-fun m!399737 () Bool)

(assert (=> start!58420 m!399737))

(declare-fun m!399739 () Bool)

(assert (=> start!58420 m!399739))

(declare-fun m!399741 () Bool)

(assert (=> start!58420 m!399741))

(declare-fun m!399743 () Bool)

(assert (=> start!58420 m!399743))

(declare-fun m!399745 () Bool)

(assert (=> b!268335 m!399745))

(declare-fun m!399747 () Bool)

(assert (=> b!268335 m!399747))

(assert (=> b!268335 m!399745))

(assert (=> b!268335 m!399747))

(declare-fun m!399749 () Bool)

(assert (=> b!268335 m!399749))

(declare-fun m!399751 () Bool)

(assert (=> b!268333 m!399751))

(declare-fun m!399753 () Bool)

(assert (=> b!268331 m!399753))

(declare-fun m!399755 () Bool)

(assert (=> b!268329 m!399755))

(declare-fun m!399757 () Bool)

(assert (=> b!268329 m!399757))

(declare-fun m!399759 () Bool)

(assert (=> b!268328 m!399759))

(declare-fun m!399761 () Bool)

(assert (=> b!268336 m!399761))

(declare-fun m!399763 () Bool)

(assert (=> b!268330 m!399763))

(declare-fun m!399765 () Bool)

(assert (=> b!268330 m!399765))

(assert (=> b!268330 m!399747))

(assert (=> b!268337 m!399745))

(assert (=> b!268337 m!399747))

(assert (=> b!268337 m!399745))

(assert (=> b!268337 m!399747))

(assert (=> b!268337 m!399749))

(push 1)

(assert (not b!268336))

(assert (not b!268330))

(assert (not start!58420))

(assert (not b!268329))

(assert (not b!268333))

(assert (not b!268337))

(assert (not b!268328))

(assert (not b!268331))

(assert (not b!268335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90690 () Bool)

(assert (=> d!90690 (= (byteRangesEq!0 (select (arr!7512 (buf!6993 w1!591)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591)) #b00000000000000000000000000000000 (currentBit!12906 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!12906 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7512 (buf!6993 w1!591)) (currentByte!12911 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12906 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!12906 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23025 () Bool)

(assert (= bs!23025 d!90690))

(declare-fun m!399793 () Bool)

(assert (=> bs!23025 m!399793))

(declare-fun m!399795 () Bool)

(assert (=> bs!23025 m!399795))

(assert (=> b!268335 d!90690))

(declare-fun d!90704 () Bool)

(assert (=> d!90704 (and (bvsge (currentByte!12911 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12911 w1!591) (size!6525 (buf!6993 w2!587))) (bvslt (currentByte!12911 w1!591) (size!6525 (buf!6993 w3!25))) (= (select (arr!7512 (buf!6993 w2!587)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591))))))

(declare-fun lt!408407 () Unit!19027)

(declare-fun choose!377 (array!14964 array!14964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> d!90704 (= lt!408407 (choose!377 (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)))))

(assert (=> d!90704 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12911 w2!587)))))

(assert (=> d!90704 (= (arrayRangesEqImpliesEq!150 (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)) lt!408407)))

(declare-fun bs!23027 () Bool)

(assert (= bs!23027 d!90704))

(assert (=> bs!23027 m!399765))

(assert (=> bs!23027 m!399747))

(declare-fun m!399799 () Bool)

(assert (=> bs!23027 m!399799))

(assert (=> b!268330 d!90704))

(declare-fun d!90708 () Bool)

(assert (=> d!90708 (= (array_inv!6249 (buf!6993 w2!587)) (bvsge (size!6525 (buf!6993 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268336 d!90708))

(declare-fun d!90712 () Bool)

(assert (=> d!90712 (= (array_inv!6249 (buf!6993 w1!591)) (bvsge (size!6525 (buf!6993 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268331 d!90712))

(assert (=> b!268337 d!90690))

(declare-fun d!90714 () Bool)

(declare-fun res!223846 () Bool)

(declare-fun e!188379 () Bool)

(assert (=> d!90714 (=> (not res!223846) (not e!188379))))

(assert (=> d!90714 (= res!223846 (= (size!6525 (buf!6993 w1!591)) (size!6525 (buf!6993 w2!587))))))

(assert (=> d!90714 (= (isPrefixOf!0 w1!591 w2!587) e!188379)))

(declare-fun b!268380 () Bool)

(declare-fun res!223845 () Bool)

(assert (=> b!268380 (=> (not res!223845) (not e!188379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268380 (= res!223845 (bvsle (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591)) (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587))))))

(declare-fun b!268381 () Bool)

(declare-fun e!188380 () Bool)

(assert (=> b!268381 (= e!188379 e!188380)))

(declare-fun res!223844 () Bool)

(assert (=> b!268381 (=> res!223844 e!188380)))

(assert (=> b!268381 (= res!223844 (= (size!6525 (buf!6993 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268382 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14964 array!14964 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268382 (= e!188380 (arrayBitRangesEq!0 (buf!6993 w1!591) (buf!6993 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591))))))

(assert (= (and d!90714 res!223846) b!268380))

(assert (= (and b!268380 res!223845) b!268381))

(assert (= (and b!268381 (not res!223844)) b!268382))

(declare-fun m!399831 () Bool)

(assert (=> b!268380 m!399831))

(declare-fun m!399833 () Bool)

(assert (=> b!268380 m!399833))

(assert (=> b!268382 m!399831))

(assert (=> b!268382 m!399831))

(declare-fun m!399835 () Bool)

(assert (=> b!268382 m!399835))

(assert (=> start!58420 d!90714))

(declare-fun d!90734 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90734 (= (inv!12 w1!591) (invariant!0 (currentBit!12906 w1!591) (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))))))

(declare-fun bs!23033 () Bool)

(assert (= bs!23033 d!90734))

(declare-fun m!399839 () Bool)

(assert (=> bs!23033 m!399839))

(assert (=> start!58420 d!90734))

(declare-fun d!90736 () Bool)

(assert (=> d!90736 (= (inv!12 w2!587) (invariant!0 (currentBit!12906 w2!587) (currentByte!12911 w2!587) (size!6525 (buf!6993 w2!587))))))

(declare-fun bs!23034 () Bool)

(assert (= bs!23034 d!90736))

(declare-fun m!399841 () Bool)

(assert (=> bs!23034 m!399841))

(assert (=> start!58420 d!90736))

(declare-fun d!90738 () Bool)

(assert (=> d!90738 (= (inv!12 w3!25) (invariant!0 (currentBit!12906 w3!25) (currentByte!12911 w3!25) (size!6525 (buf!6993 w3!25))))))

(declare-fun bs!23035 () Bool)

(assert (= bs!23035 d!90738))

(declare-fun m!399843 () Bool)

(assert (=> bs!23035 m!399843))

(assert (=> start!58420 d!90738))

(declare-fun d!90740 () Bool)

(assert (=> d!90740 (= (array_inv!6249 (buf!6993 w3!25)) (bvsge (size!6525 (buf!6993 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268333 d!90740))

(declare-fun d!90742 () Bool)

(declare-fun res!223849 () Bool)

(declare-fun e!188381 () Bool)

(assert (=> d!90742 (=> (not res!223849) (not e!188381))))

(assert (=> d!90742 (= res!223849 (= (size!6525 (buf!6993 w2!587)) (size!6525 (buf!6993 w3!25))))))

(assert (=> d!90742 (= (isPrefixOf!0 w2!587 w3!25) e!188381)))

(declare-fun b!268383 () Bool)

(declare-fun res!223848 () Bool)

(assert (=> b!268383 (=> (not res!223848) (not e!188381))))

(assert (=> b!268383 (= res!223848 (bvsle (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587)) (bitIndex!0 (size!6525 (buf!6993 w3!25)) (currentByte!12911 w3!25) (currentBit!12906 w3!25))))))

(declare-fun b!268384 () Bool)

(declare-fun e!188382 () Bool)

(assert (=> b!268384 (= e!188381 e!188382)))

(declare-fun res!223847 () Bool)

(assert (=> b!268384 (=> res!223847 e!188382)))

(assert (=> b!268384 (= res!223847 (= (size!6525 (buf!6993 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268385 () Bool)

(assert (=> b!268385 (= e!188382 (arrayBitRangesEq!0 (buf!6993 w2!587) (buf!6993 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587))))))

(assert (= (and d!90742 res!223849) b!268383))

(assert (= (and b!268383 res!223848) b!268384))

(assert (= (and b!268384 (not res!223847)) b!268385))

(assert (=> b!268383 m!399833))

(declare-fun m!399845 () Bool)

(assert (=> b!268383 m!399845))

(assert (=> b!268385 m!399833))

(assert (=> b!268385 m!399833))

(declare-fun m!399847 () Bool)

(assert (=> b!268385 m!399847))

(assert (=> b!268328 d!90742))

(declare-fun d!90744 () Bool)

(declare-fun res!223854 () Bool)

(declare-fun e!188387 () Bool)

(assert (=> d!90744 (=> res!223854 e!188387)))

(assert (=> d!90744 (= res!223854 (= #b00000000000000000000000000000000 (currentByte!12911 w1!591)))))

(assert (=> d!90744 (= (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591)) e!188387)))

(declare-fun b!268390 () Bool)

(declare-fun e!188388 () Bool)

(assert (=> b!268390 (= e!188387 e!188388)))

(declare-fun res!223855 () Bool)

(assert (=> b!268390 (=> (not res!223855) (not e!188388))))

(assert (=> b!268390 (= res!223855 (= (select (arr!7512 (buf!6993 w1!591)) #b00000000000000000000000000000000) (select (arr!7512 (buf!6993 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268391 () Bool)

(assert (=> b!268391 (= e!188388 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12911 w1!591)))))

(assert (= (and d!90744 (not res!223854)) b!268390))

(assert (= (and b!268390 res!223855) b!268391))

(declare-fun m!399849 () Bool)

(assert (=> b!268390 m!399849))

(declare-fun m!399851 () Bool)

(assert (=> b!268390 m!399851))

(declare-fun m!399853 () Bool)

(assert (=> b!268391 m!399853))

(assert (=> b!268329 d!90744))

(declare-fun d!90746 () Bool)

(assert (=> d!90746 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591))))

(declare-fun lt!408416 () Unit!19027)

(declare-fun choose!380 (array!14964 array!14964 array!14964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> d!90746 (= lt!408416 (choose!380 (buf!6993 w1!591) (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)))))

(assert (=> d!90746 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12911 w1!591)) (bvsle (currentByte!12911 w1!591) (currentByte!12911 w2!587)))))

(assert (=> d!90746 (= (arrayRangesEqTransitive!335 (buf!6993 w1!591) (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)) lt!408416)))

(declare-fun bs!23036 () Bool)

(assert (= bs!23036 d!90746))

(assert (=> bs!23036 m!399755))

(declare-fun m!399855 () Bool)

(assert (=> bs!23036 m!399855))

(assert (=> b!268329 d!90746))

(push 1)

(assert (not b!268382))

(assert (not b!268385))

(assert (not b!268380))

(assert (not b!268383))

(assert (not d!90738))

(assert (not d!90746))

(assert (not b!268391))

(assert (not d!90736))

(assert (not d!90704))

(assert (not d!90734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90790 () Bool)

(assert (=> d!90790 (= (invariant!0 (currentBit!12906 w2!587) (currentByte!12911 w2!587) (size!6525 (buf!6993 w2!587))) (and (bvsge (currentBit!12906 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12906 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12911 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12911 w2!587) (size!6525 (buf!6993 w2!587))) (and (= (currentBit!12906 w2!587) #b00000000000000000000000000000000) (= (currentByte!12911 w2!587) (size!6525 (buf!6993 w2!587)))))))))

(assert (=> d!90736 d!90790))

(declare-fun d!90792 () Bool)

(assert (=> d!90792 (= (select (arr!7512 (buf!6993 w2!587)) (currentByte!12911 w1!591)) (select (arr!7512 (buf!6993 w3!25)) (currentByte!12911 w1!591)))))

(assert (=> d!90792 true))

(declare-fun _$12!99 () Unit!19027)

(assert (=> d!90792 (= (choose!377 (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)) _$12!99)))

(declare-fun bs!23041 () Bool)

(assert (= bs!23041 d!90792))

(assert (=> bs!23041 m!399765))

(assert (=> bs!23041 m!399747))

(assert (=> d!90704 d!90792))

(declare-fun b!268486 () Bool)

(declare-fun e!188464 () Bool)

(declare-fun e!188466 () Bool)

(assert (=> b!268486 (= e!188464 e!188466)))

(declare-fun c!12386 () Bool)

(declare-datatypes ((tuple4!418 0))(
  ( (tuple4!419 (_1!12192 (_ BitVec 32)) (_2!12192 (_ BitVec 32)) (_3!989 (_ BitVec 32)) (_4!209 (_ BitVec 32))) )
))
(declare-fun lt!408509 () tuple4!418)

(assert (=> b!268486 (= c!12386 (= (_3!989 lt!408509) (_4!209 lt!408509)))))

(declare-fun b!268487 () Bool)

(declare-fun call!4246 () Bool)

(assert (=> b!268487 (= e!188466 call!4246)))

(declare-fun b!268488 () Bool)

(declare-fun res!223934 () Bool)

(declare-fun lt!408508 () (_ BitVec 32))

(assert (=> b!268488 (= res!223934 (= lt!408508 #b00000000000000000000000000000000))))

(declare-fun e!188465 () Bool)

(assert (=> b!268488 (=> res!223934 e!188465)))

(declare-fun e!188467 () Bool)

(assert (=> b!268488 (= e!188467 e!188465)))

(declare-fun b!268489 () Bool)

(declare-fun e!188463 () Bool)

(assert (=> b!268489 (= e!188463 e!188464)))

(declare-fun res!223933 () Bool)

(assert (=> b!268489 (=> (not res!223933) (not e!188464))))

(declare-fun e!188468 () Bool)

(assert (=> b!268489 (= res!223933 e!188468)))

(declare-fun res!223930 () Bool)

(assert (=> b!268489 (=> res!223930 e!188468)))

(assert (=> b!268489 (= res!223930 (bvsge (_1!12192 lt!408509) (_2!12192 lt!408509)))))

(assert (=> b!268489 (= lt!408508 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408507 () (_ BitVec 32))

(assert (=> b!268489 (= lt!408507 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!418)

(assert (=> b!268489 (= lt!408509 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591))))))

(declare-fun b!268490 () Bool)

(assert (=> b!268490 (= e!188466 e!188467)))

(declare-fun res!223931 () Bool)

(assert (=> b!268490 (= res!223931 (byteRangesEq!0 (select (arr!7512 (buf!6993 w1!591)) (_3!989 lt!408509)) (select (arr!7512 (buf!6993 w2!587)) (_3!989 lt!408509)) lt!408507 #b00000000000000000000000000001000))))

(assert (=> b!268490 (=> (not res!223931) (not e!188467))))

(declare-fun d!90794 () Bool)

(declare-fun res!223932 () Bool)

(assert (=> d!90794 (=> res!223932 e!188463)))

(assert (=> d!90794 (= res!223932 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591))))))

(assert (=> d!90794 (= (arrayBitRangesEq!0 (buf!6993 w1!591) (buf!6993 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591))) e!188463)))

(declare-fun b!268491 () Bool)

(assert (=> b!268491 (= e!188465 call!4246)))

(declare-fun bm!4243 () Bool)

(assert (=> bm!4243 (= call!4246 (byteRangesEq!0 (ite c!12386 (select (arr!7512 (buf!6993 w1!591)) (_3!989 lt!408509)) (select (arr!7512 (buf!6993 w1!591)) (_4!209 lt!408509))) (ite c!12386 (select (arr!7512 (buf!6993 w2!587)) (_3!989 lt!408509)) (select (arr!7512 (buf!6993 w2!587)) (_4!209 lt!408509))) (ite c!12386 lt!408507 #b00000000000000000000000000000000) lt!408508))))

(declare-fun b!268492 () Bool)

(assert (=> b!268492 (= e!188468 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w2!587) (_1!12192 lt!408509) (_2!12192 lt!408509)))))

(assert (= (and d!90794 (not res!223932)) b!268489))

(assert (= (and b!268489 (not res!223930)) b!268492))

(assert (= (and b!268489 res!223933) b!268486))

(assert (= (and b!268486 c!12386) b!268487))

(assert (= (and b!268486 (not c!12386)) b!268490))

(assert (= (and b!268490 res!223931) b!268488))

(assert (= (and b!268488 (not res!223934)) b!268491))

(assert (= (or b!268487 b!268491) bm!4243))

(assert (=> b!268489 m!399831))

(declare-fun m!399945 () Bool)

(assert (=> b!268489 m!399945))

(declare-fun m!399947 () Bool)

(assert (=> b!268490 m!399947))

(declare-fun m!399949 () Bool)

(assert (=> b!268490 m!399949))

(assert (=> b!268490 m!399947))

(assert (=> b!268490 m!399949))

(declare-fun m!399951 () Bool)

(assert (=> b!268490 m!399951))

(declare-fun m!399953 () Bool)

(assert (=> bm!4243 m!399953))

(assert (=> bm!4243 m!399949))

(declare-fun m!399955 () Bool)

(assert (=> bm!4243 m!399955))

(assert (=> bm!4243 m!399947))

(declare-fun m!399957 () Bool)

(assert (=> bm!4243 m!399957))

(declare-fun m!399959 () Bool)

(assert (=> b!268492 m!399959))

(assert (=> b!268382 d!90794))

(declare-fun d!90798 () Bool)

(declare-fun e!188471 () Bool)

(assert (=> d!90798 e!188471))

(declare-fun res!223939 () Bool)

(assert (=> d!90798 (=> (not res!223939) (not e!188471))))

(declare-fun lt!408524 () (_ BitVec 64))

(declare-fun lt!408525 () (_ BitVec 64))

(declare-fun lt!408526 () (_ BitVec 64))

(assert (=> d!90798 (= res!223939 (= lt!408525 (bvsub lt!408526 lt!408524)))))

(assert (=> d!90798 (or (= (bvand lt!408526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408526 lt!408524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90798 (= lt!408524 (remainingBits!0 ((_ sign_extend 32) (size!6525 (buf!6993 w1!591))) ((_ sign_extend 32) (currentByte!12911 w1!591)) ((_ sign_extend 32) (currentBit!12906 w1!591))))))

(declare-fun lt!408522 () (_ BitVec 64))

(declare-fun lt!408527 () (_ BitVec 64))

(assert (=> d!90798 (= lt!408526 (bvmul lt!408522 lt!408527))))

(assert (=> d!90798 (or (= lt!408522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408527 (bvsdiv (bvmul lt!408522 lt!408527) lt!408522)))))

(assert (=> d!90798 (= lt!408527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90798 (= lt!408522 ((_ sign_extend 32) (size!6525 (buf!6993 w1!591))))))

(assert (=> d!90798 (= lt!408525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12911 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12906 w1!591))))))

(assert (=> d!90798 (invariant!0 (currentBit!12906 w1!591) (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591)))))

(assert (=> d!90798 (= (bitIndex!0 (size!6525 (buf!6993 w1!591)) (currentByte!12911 w1!591) (currentBit!12906 w1!591)) lt!408525)))

(declare-fun b!268497 () Bool)

(declare-fun res!223940 () Bool)

(assert (=> b!268497 (=> (not res!223940) (not e!188471))))

(assert (=> b!268497 (= res!223940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408525))))

(declare-fun b!268498 () Bool)

(declare-fun lt!408523 () (_ BitVec 64))

(assert (=> b!268498 (= e!188471 (bvsle lt!408525 (bvmul lt!408523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268498 (or (= lt!408523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408523)))))

(assert (=> b!268498 (= lt!408523 ((_ sign_extend 32) (size!6525 (buf!6993 w1!591))))))

(assert (= (and d!90798 res!223939) b!268497))

(assert (= (and b!268497 res!223940) b!268498))

(declare-fun m!399961 () Bool)

(assert (=> d!90798 m!399961))

(assert (=> d!90798 m!399839))

(assert (=> b!268382 d!90798))

(declare-fun d!90800 () Bool)

(declare-fun res!223941 () Bool)

(declare-fun e!188472 () Bool)

(assert (=> d!90800 (=> res!223941 e!188472)))

(assert (=> d!90800 (= res!223941 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12911 w1!591)))))

(assert (=> d!90800 (= (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12911 w1!591)) e!188472)))

(declare-fun b!268499 () Bool)

(declare-fun e!188473 () Bool)

(assert (=> b!268499 (= e!188472 e!188473)))

(declare-fun res!223942 () Bool)

(assert (=> b!268499 (=> (not res!223942) (not e!188473))))

(assert (=> b!268499 (= res!223942 (= (select (arr!7512 (buf!6993 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7512 (buf!6993 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268500 () Bool)

(assert (=> b!268500 (= e!188473 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12911 w1!591)))))

(assert (= (and d!90800 (not res!223941)) b!268499))

(assert (= (and b!268499 res!223942) b!268500))

(declare-fun m!399963 () Bool)

(assert (=> b!268499 m!399963))

(declare-fun m!399965 () Bool)

(assert (=> b!268499 m!399965))

(declare-fun m!399967 () Bool)

(assert (=> b!268500 m!399967))

(assert (=> b!268391 d!90800))

(declare-fun d!90802 () Bool)

(declare-fun e!188474 () Bool)

(assert (=> d!90802 e!188474))

(declare-fun res!223943 () Bool)

(assert (=> d!90802 (=> (not res!223943) (not e!188474))))

(declare-fun lt!408530 () (_ BitVec 64))

(declare-fun lt!408531 () (_ BitVec 64))

(declare-fun lt!408532 () (_ BitVec 64))

(assert (=> d!90802 (= res!223943 (= lt!408531 (bvsub lt!408532 lt!408530)))))

(assert (=> d!90802 (or (= (bvand lt!408532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408532 lt!408530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90802 (= lt!408530 (remainingBits!0 ((_ sign_extend 32) (size!6525 (buf!6993 w2!587))) ((_ sign_extend 32) (currentByte!12911 w2!587)) ((_ sign_extend 32) (currentBit!12906 w2!587))))))

(declare-fun lt!408528 () (_ BitVec 64))

(declare-fun lt!408533 () (_ BitVec 64))

(assert (=> d!90802 (= lt!408532 (bvmul lt!408528 lt!408533))))

(assert (=> d!90802 (or (= lt!408528 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408533 (bvsdiv (bvmul lt!408528 lt!408533) lt!408528)))))

(assert (=> d!90802 (= lt!408533 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90802 (= lt!408528 ((_ sign_extend 32) (size!6525 (buf!6993 w2!587))))))

(assert (=> d!90802 (= lt!408531 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12911 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12906 w2!587))))))

(assert (=> d!90802 (invariant!0 (currentBit!12906 w2!587) (currentByte!12911 w2!587) (size!6525 (buf!6993 w2!587)))))

(assert (=> d!90802 (= (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587)) lt!408531)))

(declare-fun b!268501 () Bool)

(declare-fun res!223944 () Bool)

(assert (=> b!268501 (=> (not res!223944) (not e!188474))))

(assert (=> b!268501 (= res!223944 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408531))))

(declare-fun b!268502 () Bool)

(declare-fun lt!408529 () (_ BitVec 64))

(assert (=> b!268502 (= e!188474 (bvsle lt!408531 (bvmul lt!408529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268502 (or (= lt!408529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408529)))))

(assert (=> b!268502 (= lt!408529 ((_ sign_extend 32) (size!6525 (buf!6993 w2!587))))))

(assert (= (and d!90802 res!223943) b!268501))

(assert (= (and b!268501 res!223944) b!268502))

(declare-fun m!399969 () Bool)

(assert (=> d!90802 m!399969))

(assert (=> d!90802 m!399841))

(assert (=> b!268383 d!90802))

(declare-fun d!90804 () Bool)

(declare-fun e!188475 () Bool)

(assert (=> d!90804 e!188475))

(declare-fun res!223945 () Bool)

(assert (=> d!90804 (=> (not res!223945) (not e!188475))))

(declare-fun lt!408536 () (_ BitVec 64))

(declare-fun lt!408537 () (_ BitVec 64))

(declare-fun lt!408538 () (_ BitVec 64))

(assert (=> d!90804 (= res!223945 (= lt!408537 (bvsub lt!408538 lt!408536)))))

(assert (=> d!90804 (or (= (bvand lt!408538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408538 lt!408536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90804 (= lt!408536 (remainingBits!0 ((_ sign_extend 32) (size!6525 (buf!6993 w3!25))) ((_ sign_extend 32) (currentByte!12911 w3!25)) ((_ sign_extend 32) (currentBit!12906 w3!25))))))

(declare-fun lt!408534 () (_ BitVec 64))

(declare-fun lt!408539 () (_ BitVec 64))

(assert (=> d!90804 (= lt!408538 (bvmul lt!408534 lt!408539))))

(assert (=> d!90804 (or (= lt!408534 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408539 (bvsdiv (bvmul lt!408534 lt!408539) lt!408534)))))

(assert (=> d!90804 (= lt!408539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90804 (= lt!408534 ((_ sign_extend 32) (size!6525 (buf!6993 w3!25))))))

(assert (=> d!90804 (= lt!408537 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12911 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12906 w3!25))))))

(assert (=> d!90804 (invariant!0 (currentBit!12906 w3!25) (currentByte!12911 w3!25) (size!6525 (buf!6993 w3!25)))))

(assert (=> d!90804 (= (bitIndex!0 (size!6525 (buf!6993 w3!25)) (currentByte!12911 w3!25) (currentBit!12906 w3!25)) lt!408537)))

(declare-fun b!268503 () Bool)

(declare-fun res!223946 () Bool)

(assert (=> b!268503 (=> (not res!223946) (not e!188475))))

(assert (=> b!268503 (= res!223946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408537))))

(declare-fun b!268504 () Bool)

(declare-fun lt!408535 () (_ BitVec 64))

(assert (=> b!268504 (= e!188475 (bvsle lt!408537 (bvmul lt!408535 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268504 (or (= lt!408535 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408535 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408535)))))

(assert (=> b!268504 (= lt!408535 ((_ sign_extend 32) (size!6525 (buf!6993 w3!25))))))

(assert (= (and d!90804 res!223945) b!268503))

(assert (= (and b!268503 res!223946) b!268504))

(declare-fun m!399971 () Bool)

(assert (=> d!90804 m!399971))

(assert (=> d!90804 m!399843))

(assert (=> b!268383 d!90804))

(declare-fun b!268505 () Bool)

(declare-fun e!188477 () Bool)

(declare-fun e!188479 () Bool)

(assert (=> b!268505 (= e!188477 e!188479)))

(declare-fun c!12387 () Bool)

(declare-fun lt!408542 () tuple4!418)

(assert (=> b!268505 (= c!12387 (= (_3!989 lt!408542) (_4!209 lt!408542)))))

(declare-fun b!268506 () Bool)

(declare-fun call!4247 () Bool)

(assert (=> b!268506 (= e!188479 call!4247)))

(declare-fun b!268507 () Bool)

(declare-fun res!223951 () Bool)

(declare-fun lt!408541 () (_ BitVec 32))

(assert (=> b!268507 (= res!223951 (= lt!408541 #b00000000000000000000000000000000))))

(declare-fun e!188478 () Bool)

(assert (=> b!268507 (=> res!223951 e!188478)))

(declare-fun e!188480 () Bool)

(assert (=> b!268507 (= e!188480 e!188478)))

(declare-fun b!268508 () Bool)

(declare-fun e!188476 () Bool)

(assert (=> b!268508 (= e!188476 e!188477)))

(declare-fun res!223950 () Bool)

(assert (=> b!268508 (=> (not res!223950) (not e!188477))))

(declare-fun e!188481 () Bool)

(assert (=> b!268508 (= res!223950 e!188481)))

(declare-fun res!223947 () Bool)

(assert (=> b!268508 (=> res!223947 e!188481)))

(assert (=> b!268508 (= res!223947 (bvsge (_1!12192 lt!408542) (_2!12192 lt!408542)))))

(assert (=> b!268508 (= lt!408541 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408540 () (_ BitVec 32))

(assert (=> b!268508 (= lt!408540 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268508 (= lt!408542 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587))))))

(declare-fun b!268509 () Bool)

(assert (=> b!268509 (= e!188479 e!188480)))

(declare-fun res!223948 () Bool)

(assert (=> b!268509 (= res!223948 (byteRangesEq!0 (select (arr!7512 (buf!6993 w2!587)) (_3!989 lt!408542)) (select (arr!7512 (buf!6993 w3!25)) (_3!989 lt!408542)) lt!408540 #b00000000000000000000000000001000))))

(assert (=> b!268509 (=> (not res!223948) (not e!188480))))

(declare-fun d!90806 () Bool)

(declare-fun res!223949 () Bool)

(assert (=> d!90806 (=> res!223949 e!188476)))

(assert (=> d!90806 (= res!223949 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587))))))

(assert (=> d!90806 (= (arrayBitRangesEq!0 (buf!6993 w2!587) (buf!6993 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6525 (buf!6993 w2!587)) (currentByte!12911 w2!587) (currentBit!12906 w2!587))) e!188476)))

(declare-fun b!268510 () Bool)

(assert (=> b!268510 (= e!188478 call!4247)))

(declare-fun bm!4244 () Bool)

(assert (=> bm!4244 (= call!4247 (byteRangesEq!0 (ite c!12387 (select (arr!7512 (buf!6993 w2!587)) (_3!989 lt!408542)) (select (arr!7512 (buf!6993 w2!587)) (_4!209 lt!408542))) (ite c!12387 (select (arr!7512 (buf!6993 w3!25)) (_3!989 lt!408542)) (select (arr!7512 (buf!6993 w3!25)) (_4!209 lt!408542))) (ite c!12387 lt!408540 #b00000000000000000000000000000000) lt!408541))))

(declare-fun b!268511 () Bool)

(assert (=> b!268511 (= e!188481 (arrayRangesEq!1060 (buf!6993 w2!587) (buf!6993 w3!25) (_1!12192 lt!408542) (_2!12192 lt!408542)))))

(assert (= (and d!90806 (not res!223949)) b!268508))

(assert (= (and b!268508 (not res!223947)) b!268511))

(assert (= (and b!268508 res!223950) b!268505))

(assert (= (and b!268505 c!12387) b!268506))

(assert (= (and b!268505 (not c!12387)) b!268509))

(assert (= (and b!268509 res!223948) b!268507))

(assert (= (and b!268507 (not res!223951)) b!268510))

(assert (= (or b!268506 b!268510) bm!4244))

(assert (=> b!268508 m!399833))

(declare-fun m!399973 () Bool)

(assert (=> b!268508 m!399973))

(declare-fun m!399975 () Bool)

(assert (=> b!268509 m!399975))

(declare-fun m!399977 () Bool)

(assert (=> b!268509 m!399977))

(assert (=> b!268509 m!399975))

(assert (=> b!268509 m!399977))

(declare-fun m!399979 () Bool)

(assert (=> b!268509 m!399979))

(declare-fun m!399981 () Bool)

(assert (=> bm!4244 m!399981))

(assert (=> bm!4244 m!399977))

(declare-fun m!399983 () Bool)

(assert (=> bm!4244 m!399983))

(assert (=> bm!4244 m!399975))

(declare-fun m!399985 () Bool)

(assert (=> bm!4244 m!399985))

(declare-fun m!399987 () Bool)

(assert (=> b!268511 m!399987))

(assert (=> b!268385 d!90806))

(assert (=> b!268385 d!90802))

(assert (=> d!90746 d!90744))

(declare-fun d!90808 () Bool)

(assert (=> d!90808 (arrayRangesEq!1060 (buf!6993 w1!591) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591))))

(assert (=> d!90808 true))

(declare-fun _$16!113 () Unit!19027)

(assert (=> d!90808 (= (choose!380 (buf!6993 w1!591) (buf!6993 w2!587) (buf!6993 w3!25) #b00000000000000000000000000000000 (currentByte!12911 w1!591) (currentByte!12911 w2!587)) _$16!113)))

(declare-fun bs!23042 () Bool)

(assert (= bs!23042 d!90808))

(assert (=> bs!23042 m!399755))

(assert (=> d!90746 d!90808))

(assert (=> b!268380 d!90798))

(assert (=> b!268380 d!90802))

(declare-fun d!90810 () Bool)

(assert (=> d!90810 (= (invariant!0 (currentBit!12906 w3!25) (currentByte!12911 w3!25) (size!6525 (buf!6993 w3!25))) (and (bvsge (currentBit!12906 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12906 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12911 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12911 w3!25) (size!6525 (buf!6993 w3!25))) (and (= (currentBit!12906 w3!25) #b00000000000000000000000000000000) (= (currentByte!12911 w3!25) (size!6525 (buf!6993 w3!25)))))))))

(assert (=> d!90738 d!90810))

(declare-fun d!90812 () Bool)

(assert (=> d!90812 (= (invariant!0 (currentBit!12906 w1!591) (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))) (and (bvsge (currentBit!12906 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12906 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12911 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591))) (and (= (currentBit!12906 w1!591) #b00000000000000000000000000000000) (= (currentByte!12911 w1!591) (size!6525 (buf!6993 w1!591)))))))))

(assert (=> d!90734 d!90812))

(push 1)

(assert (not b!268511))

(assert (not d!90808))

(assert (not b!268490))

(assert (not d!90798))

(assert (not bm!4244))

(assert (not b!268489))

(assert (not bm!4243))

(assert (not b!268508))

(assert (not b!268492))

(assert (not b!268500))

(assert (not b!268509))

(assert (not d!90802))

(assert (not d!90804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

