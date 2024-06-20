; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57772 () Bool)

(assert start!57772)

(declare-fun b!265090 () Bool)

(declare-fun e!185129 () Bool)

(declare-datatypes ((array!14772 0))(
  ( (array!14773 (arr!7431 (Array (_ BitVec 32) (_ BitVec 8))) (size!6444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11702 0))(
  ( (BitStream!11703 (buf!6912 array!14772) (currentByte!12791 (_ BitVec 32)) (currentBit!12786 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11702)

(declare-fun array_inv!6168 (array!14772) Bool)

(assert (=> b!265090 (= e!185129 (array_inv!6168 (buf!6912 w1!584)))))

(declare-fun b!265088 () Bool)

(declare-fun e!185128 () Bool)

(declare-fun e!185130 () Bool)

(assert (=> b!265088 (= e!185128 (not e!185130))))

(declare-fun res!221562 () Bool)

(assert (=> b!265088 (=> res!221562 e!185130)))

(assert (=> b!265088 (= res!221562 (= (size!6444 (buf!6912 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11702)

(declare-fun isPrefixOf!0 (BitStream!11702 BitStream!11702) Bool)

(assert (=> b!265088 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18861 0))(
  ( (Unit!18862) )
))
(declare-fun lt!406233 () Unit!18861)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11702) Unit!18861)

(assert (=> b!265088 (= lt!406233 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406235 () BitStream!11702)

(assert (=> b!265088 (isPrefixOf!0 lt!406235 lt!406235)))

(declare-fun lt!406234 () Unit!18861)

(assert (=> b!265088 (= lt!406234 (lemmaIsPrefixRefl!0 lt!406235))))

(assert (=> b!265088 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406232 () Unit!18861)

(assert (=> b!265088 (= lt!406232 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265088 (= lt!406235 (BitStream!11703 (buf!6912 w2!580) (currentByte!12791 w1!584) (currentBit!12786 w1!584)))))

(declare-fun res!221563 () Bool)

(assert (=> start!57772 (=> (not res!221563) (not e!185128))))

(assert (=> start!57772 (= res!221563 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57772 e!185128))

(declare-fun inv!12 (BitStream!11702) Bool)

(assert (=> start!57772 (and (inv!12 w1!584) e!185129)))

(declare-fun e!185132 () Bool)

(assert (=> start!57772 (and (inv!12 w2!580) e!185132)))

(declare-fun b!265091 () Bool)

(assert (=> b!265091 (= e!185132 (array_inv!6168 (buf!6912 w2!580)))))

(declare-fun b!265089 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14772 array!14772 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265089 (= e!185130 (arrayBitRangesEq!0 (buf!6912 w1!584) (buf!6912 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584))))))

(assert (= (and start!57772 res!221563) b!265088))

(assert (= (and b!265088 (not res!221562)) b!265089))

(assert (= start!57772 b!265090))

(assert (= start!57772 b!265091))

(declare-fun m!395763 () Bool)

(assert (=> b!265091 m!395763))

(declare-fun m!395765 () Bool)

(assert (=> b!265090 m!395765))

(declare-fun m!395767 () Bool)

(assert (=> b!265089 m!395767))

(assert (=> b!265089 m!395767))

(declare-fun m!395769 () Bool)

(assert (=> b!265089 m!395769))

(declare-fun m!395771 () Bool)

(assert (=> start!57772 m!395771))

(declare-fun m!395773 () Bool)

(assert (=> start!57772 m!395773))

(declare-fun m!395775 () Bool)

(assert (=> start!57772 m!395775))

(declare-fun m!395777 () Bool)

(assert (=> b!265088 m!395777))

(declare-fun m!395779 () Bool)

(assert (=> b!265088 m!395779))

(declare-fun m!395781 () Bool)

(assert (=> b!265088 m!395781))

(declare-fun m!395783 () Bool)

(assert (=> b!265088 m!395783))

(declare-fun m!395785 () Bool)

(assert (=> b!265088 m!395785))

(declare-fun m!395787 () Bool)

(assert (=> b!265088 m!395787))

(push 1)

(assert (not b!265089))

(assert (not start!57772))

(assert (not b!265088))

(assert (not b!265091))

(assert (not b!265090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89476 () Bool)

(assert (=> d!89476 (= (array_inv!6168 (buf!6912 w2!580)) (bvsge (size!6444 (buf!6912 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265091 d!89476))

(declare-fun d!89478 () Bool)

(declare-fun res!221578 () Bool)

(declare-fun e!185142 () Bool)

(assert (=> d!89478 (=> (not res!221578) (not e!185142))))

(assert (=> d!89478 (= res!221578 (= (size!6444 (buf!6912 w1!584)) (size!6444 (buf!6912 w2!580))))))

(assert (=> d!89478 (= (isPrefixOf!0 w1!584 w2!580) e!185142)))

(declare-fun b!265104 () Bool)

(declare-fun res!221577 () Bool)

(assert (=> b!265104 (=> (not res!221577) (not e!185142))))

(assert (=> b!265104 (= res!221577 (bvsle (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584)) (bitIndex!0 (size!6444 (buf!6912 w2!580)) (currentByte!12791 w2!580) (currentBit!12786 w2!580))))))

(declare-fun b!265105 () Bool)

(declare-fun e!185143 () Bool)

(assert (=> b!265105 (= e!185142 e!185143)))

(declare-fun res!221576 () Bool)

(assert (=> b!265105 (=> res!221576 e!185143)))

(assert (=> b!265105 (= res!221576 (= (size!6444 (buf!6912 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265106 () Bool)

(assert (=> b!265106 (= e!185143 (arrayBitRangesEq!0 (buf!6912 w1!584) (buf!6912 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584))))))

(assert (= (and d!89478 res!221578) b!265104))

(assert (= (and b!265104 res!221577) b!265105))

(assert (= (and b!265105 (not res!221576)) b!265106))

(assert (=> b!265104 m!395767))

(declare-fun m!395793 () Bool)

(assert (=> b!265104 m!395793))

(assert (=> b!265106 m!395767))

(assert (=> b!265106 m!395767))

(assert (=> b!265106 m!395769))

(assert (=> start!57772 d!89478))

(declare-fun d!89488 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89488 (= (inv!12 w1!584) (invariant!0 (currentBit!12786 w1!584) (currentByte!12791 w1!584) (size!6444 (buf!6912 w1!584))))))

(declare-fun bs!22710 () Bool)

(assert (= bs!22710 d!89488))

(declare-fun m!395797 () Bool)

(assert (=> bs!22710 m!395797))

(assert (=> start!57772 d!89488))

(declare-fun d!89492 () Bool)

(assert (=> d!89492 (= (inv!12 w2!580) (invariant!0 (currentBit!12786 w2!580) (currentByte!12791 w2!580) (size!6444 (buf!6912 w2!580))))))

(declare-fun bs!22711 () Bool)

(assert (= bs!22711 d!89492))

(declare-fun m!395799 () Bool)

(assert (=> bs!22711 m!395799))

(assert (=> start!57772 d!89492))

(declare-fun d!89494 () Bool)

(assert (=> d!89494 (= (array_inv!6168 (buf!6912 w1!584)) (bvsge (size!6444 (buf!6912 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265090 d!89494))

(declare-fun b!265156 () Bool)

(declare-fun e!185185 () Bool)

(declare-fun e!185182 () Bool)

(assert (=> b!265156 (= e!185185 e!185182)))

(declare-fun res!221624 () Bool)

(assert (=> b!265156 (=> (not res!221624) (not e!185182))))

(declare-fun e!185187 () Bool)

(assert (=> b!265156 (= res!221624 e!185187)))

(declare-fun res!221621 () Bool)

(assert (=> b!265156 (=> res!221621 e!185187)))

(declare-datatypes ((tuple4!362 0))(
  ( (tuple4!363 (_1!12161 (_ BitVec 32)) (_2!12161 (_ BitVec 32)) (_3!961 (_ BitVec 32)) (_4!181 (_ BitVec 32))) )
))
(declare-fun lt!406254 () tuple4!362)

(assert (=> b!265156 (= res!221621 (bvsge (_1!12161 lt!406254) (_2!12161 lt!406254)))))

(declare-fun lt!406253 () (_ BitVec 32))

(assert (=> b!265156 (= lt!406253 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406255 () (_ BitVec 32))

(assert (=> b!265156 (= lt!406255 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!362)

(assert (=> b!265156 (= lt!406254 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584))))))

(declare-fun b!265157 () Bool)

(declare-fun e!185184 () Bool)

(declare-fun e!185186 () Bool)

(assert (=> b!265157 (= e!185184 e!185186)))

(declare-fun res!221622 () Bool)

(declare-fun call!4120 () Bool)

(assert (=> b!265157 (= res!221622 call!4120)))

(assert (=> b!265157 (=> (not res!221622) (not e!185186))))

(declare-fun b!265158 () Bool)

(declare-fun arrayRangesEq!1017 (array!14772 array!14772 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265158 (= e!185187 (arrayRangesEq!1017 (buf!6912 w1!584) (buf!6912 w2!580) (_1!12161 lt!406254) (_2!12161 lt!406254)))))

(declare-fun e!185183 () Bool)

(declare-fun b!265159 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265159 (= e!185183 (byteRangesEq!0 (select (arr!7431 (buf!6912 w1!584)) (_4!181 lt!406254)) (select (arr!7431 (buf!6912 w2!580)) (_4!181 lt!406254)) #b00000000000000000000000000000000 lt!406253))))

(declare-fun d!89498 () Bool)

(declare-fun res!221623 () Bool)

(assert (=> d!89498 (=> res!221623 e!185185)))

(assert (=> d!89498 (= res!221623 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584))))))

(assert (=> d!89498 (= (arrayBitRangesEq!0 (buf!6912 w1!584) (buf!6912 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584))) e!185185)))

(declare-fun b!265160 () Bool)

(declare-fun res!221620 () Bool)

(assert (=> b!265160 (= res!221620 (= lt!406253 #b00000000000000000000000000000000))))

(assert (=> b!265160 (=> res!221620 e!185183)))

(assert (=> b!265160 (= e!185186 e!185183)))

(declare-fun b!265161 () Bool)

(assert (=> b!265161 (= e!185182 e!185184)))

(declare-fun c!12179 () Bool)

(assert (=> b!265161 (= c!12179 (= (_3!961 lt!406254) (_4!181 lt!406254)))))

(declare-fun bm!4117 () Bool)

(assert (=> bm!4117 (= call!4120 (byteRangesEq!0 (select (arr!7431 (buf!6912 w1!584)) (_3!961 lt!406254)) (select (arr!7431 (buf!6912 w2!580)) (_3!961 lt!406254)) lt!406255 (ite c!12179 lt!406253 #b00000000000000000000000000001000)))))

(declare-fun b!265162 () Bool)

(assert (=> b!265162 (= e!185184 call!4120)))

(assert (= (and d!89498 (not res!221623)) b!265156))

(assert (= (and b!265156 (not res!221621)) b!265158))

(assert (= (and b!265156 res!221624) b!265161))

(assert (= (and b!265161 c!12179) b!265162))

(assert (= (and b!265161 (not c!12179)) b!265157))

(assert (= (and b!265157 res!221622) b!265160))

(assert (= (and b!265160 (not res!221620)) b!265159))

(assert (= (or b!265162 b!265157) bm!4117))

(assert (=> b!265156 m!395767))

(declare-fun m!395821 () Bool)

(assert (=> b!265156 m!395821))

(declare-fun m!395823 () Bool)

(assert (=> b!265158 m!395823))

(declare-fun m!395825 () Bool)

(assert (=> b!265159 m!395825))

(declare-fun m!395827 () Bool)

(assert (=> b!265159 m!395827))

(assert (=> b!265159 m!395825))

(assert (=> b!265159 m!395827))

(declare-fun m!395829 () Bool)

(assert (=> b!265159 m!395829))

(declare-fun m!395831 () Bool)

(assert (=> bm!4117 m!395831))

(declare-fun m!395833 () Bool)

(assert (=> bm!4117 m!395833))

(assert (=> bm!4117 m!395831))

(assert (=> bm!4117 m!395833))

(declare-fun m!395835 () Bool)

(assert (=> bm!4117 m!395835))

(assert (=> b!265089 d!89498))

(declare-fun d!89524 () Bool)

(declare-fun e!185216 () Bool)

(assert (=> d!89524 e!185216))

(declare-fun res!221654 () Bool)

(assert (=> d!89524 (=> (not res!221654) (not e!185216))))

(declare-fun lt!406293 () (_ BitVec 64))

(declare-fun lt!406295 () (_ BitVec 64))

(declare-fun lt!406294 () (_ BitVec 64))

(assert (=> d!89524 (= res!221654 (= lt!406295 (bvsub lt!406293 lt!406294)))))

(assert (=> d!89524 (or (= (bvand lt!406293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406293 lt!406294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89524 (= lt!406294 (remainingBits!0 ((_ sign_extend 32) (size!6444 (buf!6912 w1!584))) ((_ sign_extend 32) (currentByte!12791 w1!584)) ((_ sign_extend 32) (currentBit!12786 w1!584))))))

(declare-fun lt!406296 () (_ BitVec 64))

(declare-fun lt!406297 () (_ BitVec 64))

(assert (=> d!89524 (= lt!406293 (bvmul lt!406296 lt!406297))))

(assert (=> d!89524 (or (= lt!406296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406297 (bvsdiv (bvmul lt!406296 lt!406297) lt!406296)))))

(assert (=> d!89524 (= lt!406297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89524 (= lt!406296 ((_ sign_extend 32) (size!6444 (buf!6912 w1!584))))))

(assert (=> d!89524 (= lt!406295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12791 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12786 w1!584))))))

(assert (=> d!89524 (invariant!0 (currentBit!12786 w1!584) (currentByte!12791 w1!584) (size!6444 (buf!6912 w1!584)))))

(assert (=> d!89524 (= (bitIndex!0 (size!6444 (buf!6912 w1!584)) (currentByte!12791 w1!584) (currentBit!12786 w1!584)) lt!406295)))

(declare-fun b!265199 () Bool)

(declare-fun res!221653 () Bool)

(assert (=> b!265199 (=> (not res!221653) (not e!185216))))

(assert (=> b!265199 (= res!221653 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406295))))

(declare-fun b!265200 () Bool)

(declare-fun lt!406292 () (_ BitVec 64))

(assert (=> b!265200 (= e!185216 (bvsle lt!406295 (bvmul lt!406292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265200 (or (= lt!406292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406292)))))

(assert (=> b!265200 (= lt!406292 ((_ sign_extend 32) (size!6444 (buf!6912 w1!584))))))

(assert (= (and d!89524 res!221654) b!265199))

(assert (= (and b!265199 res!221653) b!265200))

(declare-fun m!395869 () Bool)

(assert (=> d!89524 m!395869))

(assert (=> d!89524 m!395797))

(assert (=> b!265089 d!89524))

(declare-fun d!89530 () Bool)

(assert (=> d!89530 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406308 () Unit!18861)

(declare-fun choose!11 (BitStream!11702) Unit!18861)

(assert (=> d!89530 (= lt!406308 (choose!11 w2!580))))

(assert (=> d!89530 (= (lemmaIsPrefixRefl!0 w2!580) lt!406308)))

(declare-fun bs!22718 () Bool)

(assert (= bs!22718 d!89530))

(assert (=> bs!22718 m!395785))

(declare-fun m!395873 () Bool)

(assert (=> bs!22718 m!395873))

(assert (=> b!265088 d!89530))

(declare-fun d!89534 () Bool)

(declare-fun res!221661 () Bool)

(declare-fun e!185220 () Bool)

(assert (=> d!89534 (=> (not res!221661) (not e!185220))))

(assert (=> d!89534 (= res!221661 (= (size!6444 (buf!6912 lt!406235)) (size!6444 (buf!6912 lt!406235))))))

(assert (=> d!89534 (= (isPrefixOf!0 lt!406235 lt!406235) e!185220)))

(declare-fun b!265203 () Bool)

(declare-fun res!221660 () Bool)

(assert (=> b!265203 (=> (not res!221660) (not e!185220))))

(assert (=> b!265203 (= res!221660 (bvsle (bitIndex!0 (size!6444 (buf!6912 lt!406235)) (currentByte!12791 lt!406235) (currentBit!12786 lt!406235)) (bitIndex!0 (size!6444 (buf!6912 lt!406235)) (currentByte!12791 lt!406235) (currentBit!12786 lt!406235))))))

(declare-fun b!265204 () Bool)

(declare-fun e!185221 () Bool)

(assert (=> b!265204 (= e!185220 e!185221)))

(declare-fun res!221659 () Bool)

(assert (=> b!265204 (=> res!221659 e!185221)))

(assert (=> b!265204 (= res!221659 (= (size!6444 (buf!6912 lt!406235)) #b00000000000000000000000000000000))))

(declare-fun b!265205 () Bool)

(assert (=> b!265205 (= e!185221 (arrayBitRangesEq!0 (buf!6912 lt!406235) (buf!6912 lt!406235) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6444 (buf!6912 lt!406235)) (currentByte!12791 lt!406235) (currentBit!12786 lt!406235))))))

(assert (= (and d!89534 res!221661) b!265203))

(assert (= (and b!265203 res!221660) b!265204))

(assert (= (and b!265204 (not res!221659)) b!265205))

(declare-fun m!395875 () Bool)

(assert (=> b!265203 m!395875))

(assert (=> b!265203 m!395875))

(assert (=> b!265205 m!395875))

(assert (=> b!265205 m!395875))

(declare-fun m!395879 () Bool)

(assert (=> b!265205 m!395879))

(assert (=> b!265088 d!89534))

(declare-fun d!89538 () Bool)

(assert (=> d!89538 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406322 () Unit!18861)

(assert (=> d!89538 (= lt!406322 (choose!11 w1!584))))

(assert (=> d!89538 (= (lemmaIsPrefixRefl!0 w1!584) lt!406322)))

(declare-fun bs!22721 () Bool)

(assert (= bs!22721 d!89538))

(assert (=> bs!22721 m!395781))

(declare-fun m!395881 () Bool)

(assert (=> bs!22721 m!395881))

(assert (=> b!265088 d!89538))

(declare-fun d!89540 () Bool)

(assert (=> d!89540 (isPrefixOf!0 lt!406235 lt!406235)))

(declare-fun lt!406323 () Unit!18861)

(assert (=> d!89540 (= lt!406323 (choose!11 lt!406235))))

(assert (=> d!89540 (= (lemmaIsPrefixRefl!0 lt!406235) lt!406323)))

(declare-fun bs!22722 () Bool)

(assert (= bs!22722 d!89540))

(assert (=> bs!22722 m!395779))

(declare-fun m!395883 () Bool)

(assert (=> bs!22722 m!395883))

(assert (=> b!265088 d!89540))

(declare-fun d!89542 () Bool)

(declare-fun res!221669 () Bool)

(declare-fun e!185224 () Bool)

(assert (=> d!89542 (=> (not res!221669) (not e!185224))))

(assert (=> d!89542 (= res!221669 (= (size!6444 (buf!6912 w1!584)) (size!6444 (buf!6912 w1!584))))))

(assert (=> d!89542 (= (isPrefixOf!0 w1!584 w1!584) e!185224)))

(declare-fun b!265213 () Bool)

(declare-fun res!221668 () Bool)

(assert (=> b!265213 (=> (not res!221668) (not e!185224))))

