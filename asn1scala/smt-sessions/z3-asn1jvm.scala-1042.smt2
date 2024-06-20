; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29886 () Bool)

(assert start!29886)

(declare-fun b!153748 () Bool)

(declare-fun res!128762 () Bool)

(declare-fun e!103150 () Bool)

(assert (=> b!153748 (=> (not res!128762) (not e!103150))))

(declare-fun lt!240078 () (_ BitVec 64))

(declare-datatypes ((array!6922 0))(
  ( (array!6923 (arr!3945 (Array (_ BitVec 32) (_ BitVec 8))) (size!3122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5502 0))(
  ( (BitStream!5503 (buf!3625 array!6922) (currentByte!6626 (_ BitVec 32)) (currentBit!6621 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5502)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153748 (= res!128762 (bvsle lt!240078 (bitIndex!0 (size!3122 (buf!3625 bs2!18)) (currentByte!6626 bs2!18) (currentBit!6621 bs2!18))))))

(declare-fun b!153749 () Bool)

(declare-fun e!103146 () Bool)

(declare-fun bs1!10 () BitStream!5502)

(declare-fun array_inv!2911 (array!6922) Bool)

(assert (=> b!153749 (= e!103146 (array_inv!2911 (buf!3625 bs1!10)))))

(declare-fun b!153750 () Bool)

(declare-fun e!103147 () Bool)

(declare-datatypes ((tuple2!13644 0))(
  ( (tuple2!13645 (_1!7215 BitStream!5502) (_2!7215 (_ BitVec 8))) )
))
(declare-fun lt!240081 () tuple2!13644)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153750 (= e!103147 (not (invariant!0 (currentBit!6621 (_1!7215 lt!240081)) (currentByte!6626 (_1!7215 lt!240081)) (size!3122 (buf!3625 (_1!7215 lt!240081))))))))

(assert (=> b!153750 (= (select (arr!3945 (buf!3625 bs1!10)) (currentByte!6626 bs1!10)) (select (arr!3945 (buf!3625 bs2!18)) (currentByte!6626 bs1!10)))))

(declare-fun lt!240079 () (_ BitVec 32))

(declare-datatypes ((Unit!9723 0))(
  ( (Unit!9724) )
))
(declare-fun lt!240077 () Unit!9723)

(declare-fun arrayRangesEqImpliesEq!25 (array!6922 array!6922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9723)

(assert (=> b!153750 (= lt!240077 (arrayRangesEqImpliesEq!25 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 (currentByte!6626 bs1!10) lt!240079))))

(declare-fun res!128758 () Bool)

(declare-fun e!103152 () Bool)

(assert (=> start!29886 (=> (not res!128758) (not e!103152))))

(assert (=> start!29886 (= res!128758 (= (size!3122 (buf!3625 bs1!10)) (size!3122 (buf!3625 bs2!18))))))

(assert (=> start!29886 e!103152))

(declare-fun inv!12 (BitStream!5502) Bool)

(assert (=> start!29886 (and (inv!12 bs1!10) e!103146)))

(declare-fun e!103151 () Bool)

(assert (=> start!29886 (and (inv!12 bs2!18) e!103151)))

(declare-fun b!153751 () Bool)

(declare-fun res!128759 () Bool)

(assert (=> b!153751 (=> (not res!128759) (not e!103147))))

(declare-fun arrayRangesEq!384 (array!6922 array!6922 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153751 (= res!128759 (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 lt!240079))))

(declare-fun b!153752 () Bool)

(assert (=> b!153752 (= e!103150 e!103147)))

(declare-fun res!128763 () Bool)

(assert (=> b!153752 (=> (not res!128763) (not e!103147))))

(assert (=> b!153752 (= res!128763 (and (bvsle #b00000000000000000000000000000000 lt!240079) (bvsle lt!240079 (size!3122 (buf!3625 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6626 bs1!10)) (bvslt (currentByte!6626 bs1!10) lt!240079)))))

(declare-fun lt!240080 () (_ BitVec 64))

(assert (=> b!153752 (= lt!240079 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240080 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun readBytePure!0 (BitStream!5502) tuple2!13644)

(assert (=> b!153752 (= lt!240081 (readBytePure!0 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))))

(declare-fun lt!240082 () tuple2!13644)

(assert (=> b!153752 (= lt!240082 (readBytePure!0 bs1!10))))

(declare-fun b!153753 () Bool)

(assert (=> b!153753 (= e!103152 e!103150)))

(declare-fun res!128760 () Bool)

(assert (=> b!153753 (=> (not res!128760) (not e!103150))))

(assert (=> b!153753 (= res!128760 (bvsle lt!240078 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))))))))

(assert (=> b!153753 (= lt!240078 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240080))))

(assert (=> b!153753 (= lt!240080 (bitIndex!0 (size!3122 (buf!3625 bs1!10)) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))

(declare-fun b!153754 () Bool)

(declare-fun res!128761 () Bool)

(assert (=> b!153754 (=> (not res!128761) (not e!103150))))

(declare-fun arrayBitRangesEq!0 (array!6922 array!6922 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153754 (= res!128761 (arrayBitRangesEq!0 (buf!3625 bs1!10) (buf!3625 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240078))))

(declare-fun b!153755 () Bool)

(assert (=> b!153755 (= e!103151 (array_inv!2911 (buf!3625 bs2!18)))))

(assert (= (and start!29886 res!128758) b!153753))

(assert (= (and b!153753 res!128760) b!153748))

(assert (= (and b!153748 res!128762) b!153754))

(assert (= (and b!153754 res!128761) b!153752))

(assert (= (and b!153752 res!128763) b!153751))

(assert (= (and b!153751 res!128759) b!153750))

(assert (= start!29886 b!153749))

(assert (= start!29886 b!153755))

(declare-fun m!239639 () Bool)

(assert (=> b!153755 m!239639))

(declare-fun m!239641 () Bool)

(assert (=> b!153748 m!239641))

(declare-fun m!239643 () Bool)

(assert (=> start!29886 m!239643))

(declare-fun m!239645 () Bool)

(assert (=> start!29886 m!239645))

(declare-fun m!239647 () Bool)

(assert (=> b!153749 m!239647))

(declare-fun m!239649 () Bool)

(assert (=> b!153752 m!239649))

(declare-fun m!239651 () Bool)

(assert (=> b!153752 m!239651))

(declare-fun m!239653 () Bool)

(assert (=> b!153750 m!239653))

(declare-fun m!239655 () Bool)

(assert (=> b!153750 m!239655))

(declare-fun m!239657 () Bool)

(assert (=> b!153750 m!239657))

(declare-fun m!239659 () Bool)

(assert (=> b!153750 m!239659))

(declare-fun m!239661 () Bool)

(assert (=> b!153754 m!239661))

(declare-fun m!239663 () Bool)

(assert (=> b!153751 m!239663))

(declare-fun m!239665 () Bool)

(assert (=> b!153753 m!239665))

(check-sat (not b!153748) (not b!153749) (not b!153755) (not b!153753) (not b!153754) (not b!153752) (not start!29886) (not b!153750) (not b!153751))
(check-sat)
(get-model)

(declare-fun d!50584 () Bool)

(declare-fun e!103176 () Bool)

(assert (=> d!50584 e!103176))

(declare-fun res!128787 () Bool)

(assert (=> d!50584 (=> (not res!128787) (not e!103176))))

(declare-fun lt!240114 () (_ BitVec 64))

(declare-fun lt!240117 () (_ BitVec 64))

(declare-fun lt!240113 () (_ BitVec 64))

(assert (=> d!50584 (= res!128787 (= lt!240114 (bvsub lt!240117 lt!240113)))))

(assert (=> d!50584 (or (= (bvand lt!240117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240113 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240117 lt!240113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50584 (= lt!240113 (remainingBits!0 ((_ sign_extend 32) (size!3122 (buf!3625 bs2!18))) ((_ sign_extend 32) (currentByte!6626 bs2!18)) ((_ sign_extend 32) (currentBit!6621 bs2!18))))))

(declare-fun lt!240115 () (_ BitVec 64))

(declare-fun lt!240116 () (_ BitVec 64))

(assert (=> d!50584 (= lt!240117 (bvmul lt!240115 lt!240116))))

(assert (=> d!50584 (or (= lt!240115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240116 (bvsdiv (bvmul lt!240115 lt!240116) lt!240115)))))

(assert (=> d!50584 (= lt!240116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50584 (= lt!240115 ((_ sign_extend 32) (size!3122 (buf!3625 bs2!18))))))

(assert (=> d!50584 (= lt!240114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6626 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6621 bs2!18))))))

(assert (=> d!50584 (invariant!0 (currentBit!6621 bs2!18) (currentByte!6626 bs2!18) (size!3122 (buf!3625 bs2!18)))))

(assert (=> d!50584 (= (bitIndex!0 (size!3122 (buf!3625 bs2!18)) (currentByte!6626 bs2!18) (currentBit!6621 bs2!18)) lt!240114)))

(declare-fun b!153784 () Bool)

(declare-fun res!128786 () Bool)

(assert (=> b!153784 (=> (not res!128786) (not e!103176))))

(assert (=> b!153784 (= res!128786 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240114))))

(declare-fun b!153785 () Bool)

(declare-fun lt!240118 () (_ BitVec 64))

(assert (=> b!153785 (= e!103176 (bvsle lt!240114 (bvmul lt!240118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153785 (or (= lt!240118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240118)))))

(assert (=> b!153785 (= lt!240118 ((_ sign_extend 32) (size!3122 (buf!3625 bs2!18))))))

(assert (= (and d!50584 res!128787) b!153784))

(assert (= (and b!153784 res!128786) b!153785))

(declare-fun m!239695 () Bool)

(assert (=> d!50584 m!239695))

(declare-fun m!239697 () Bool)

(assert (=> d!50584 m!239697))

(assert (=> b!153748 d!50584))

(declare-fun d!50586 () Bool)

(assert (=> d!50586 (= (inv!12 bs1!10) (invariant!0 (currentBit!6621 bs1!10) (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10))))))

(declare-fun bs!12374 () Bool)

(assert (= bs!12374 d!50586))

(declare-fun m!239699 () Bool)

(assert (=> bs!12374 m!239699))

(assert (=> start!29886 d!50586))

(declare-fun d!50588 () Bool)

(assert (=> d!50588 (= (inv!12 bs2!18) (invariant!0 (currentBit!6621 bs2!18) (currentByte!6626 bs2!18) (size!3122 (buf!3625 bs2!18))))))

(declare-fun bs!12375 () Bool)

(assert (= bs!12375 d!50588))

(assert (=> bs!12375 m!239697))

(assert (=> start!29886 d!50588))

(declare-fun b!153800 () Bool)

(declare-fun e!103189 () Bool)

(declare-fun call!2180 () Bool)

(assert (=> b!153800 (= e!103189 call!2180)))

(declare-fun b!153801 () Bool)

(declare-fun res!128798 () Bool)

(declare-fun lt!240125 () (_ BitVec 32))

(assert (=> b!153801 (= res!128798 (= lt!240125 #b00000000000000000000000000000000))))

(declare-fun e!103194 () Bool)

(assert (=> b!153801 (=> res!128798 e!103194)))

(declare-fun e!103190 () Bool)

(assert (=> b!153801 (= e!103190 e!103194)))

(declare-fun c!8196 () Bool)

(declare-datatypes ((tuple4!180 0))(
  ( (tuple4!181 (_1!7217 (_ BitVec 32)) (_2!7217 (_ BitVec 32)) (_3!393 (_ BitVec 32)) (_4!90 (_ BitVec 32))) )
))
(declare-fun lt!240126 () tuple4!180)

(declare-fun bm!2177 () Bool)

(declare-fun lt!240127 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2177 (= call!2180 (byteRangesEq!0 (select (arr!3945 (buf!3625 bs1!10)) (_3!393 lt!240126)) (select (arr!3945 (buf!3625 bs2!18)) (_3!393 lt!240126)) lt!240127 (ite c!8196 lt!240125 #b00000000000000000000000000001000)))))

(declare-fun d!50590 () Bool)

(declare-fun res!128801 () Bool)

(declare-fun e!103192 () Bool)

(assert (=> d!50590 (=> res!128801 e!103192)))

(assert (=> d!50590 (= res!128801 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240078))))

(assert (=> d!50590 (= (arrayBitRangesEq!0 (buf!3625 bs1!10) (buf!3625 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240078) e!103192)))

(declare-fun b!153802 () Bool)

(assert (=> b!153802 (= e!103194 (byteRangesEq!0 (select (arr!3945 (buf!3625 bs1!10)) (_4!90 lt!240126)) (select (arr!3945 (buf!3625 bs2!18)) (_4!90 lt!240126)) #b00000000000000000000000000000000 lt!240125))))

(declare-fun b!153803 () Bool)

(declare-fun e!103191 () Bool)

(assert (=> b!153803 (= e!103191 e!103189)))

(assert (=> b!153803 (= c!8196 (= (_3!393 lt!240126) (_4!90 lt!240126)))))

(declare-fun b!153804 () Bool)

(assert (=> b!153804 (= e!103192 e!103191)))

(declare-fun res!128800 () Bool)

(assert (=> b!153804 (=> (not res!128800) (not e!103191))))

(declare-fun e!103193 () Bool)

(assert (=> b!153804 (= res!128800 e!103193)))

(declare-fun res!128799 () Bool)

(assert (=> b!153804 (=> res!128799 e!103193)))

(assert (=> b!153804 (= res!128799 (bvsge (_1!7217 lt!240126) (_2!7217 lt!240126)))))

(assert (=> b!153804 (= lt!240125 ((_ extract 31 0) (bvsrem lt!240078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153804 (= lt!240127 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!180)

(assert (=> b!153804 (= lt!240126 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240078))))

(declare-fun b!153805 () Bool)

(assert (=> b!153805 (= e!103193 (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (_1!7217 lt!240126) (_2!7217 lt!240126)))))

(declare-fun b!153806 () Bool)

(assert (=> b!153806 (= e!103189 e!103190)))

(declare-fun res!128802 () Bool)

(assert (=> b!153806 (= res!128802 call!2180)))

(assert (=> b!153806 (=> (not res!128802) (not e!103190))))

(assert (= (and d!50590 (not res!128801)) b!153804))

(assert (= (and b!153804 (not res!128799)) b!153805))

(assert (= (and b!153804 res!128800) b!153803))

(assert (= (and b!153803 c!8196) b!153800))

(assert (= (and b!153803 (not c!8196)) b!153806))

(assert (= (and b!153806 res!128802) b!153801))

(assert (= (and b!153801 (not res!128798)) b!153802))

(assert (= (or b!153800 b!153806) bm!2177))

(declare-fun m!239701 () Bool)

(assert (=> bm!2177 m!239701))

(declare-fun m!239703 () Bool)

(assert (=> bm!2177 m!239703))

(assert (=> bm!2177 m!239701))

(assert (=> bm!2177 m!239703))

(declare-fun m!239705 () Bool)

(assert (=> bm!2177 m!239705))

(declare-fun m!239707 () Bool)

(assert (=> b!153802 m!239707))

(declare-fun m!239709 () Bool)

(assert (=> b!153802 m!239709))

(assert (=> b!153802 m!239707))

(assert (=> b!153802 m!239709))

(declare-fun m!239711 () Bool)

(assert (=> b!153802 m!239711))

(declare-fun m!239713 () Bool)

(assert (=> b!153804 m!239713))

(declare-fun m!239715 () Bool)

(assert (=> b!153805 m!239715))

(assert (=> b!153754 d!50590))

(declare-fun d!50594 () Bool)

(assert (=> d!50594 (= (array_inv!2911 (buf!3625 bs1!10)) (bvsge (size!3122 (buf!3625 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153749 d!50594))

(declare-fun d!50596 () Bool)

(assert (=> d!50596 (= (array_inv!2911 (buf!3625 bs2!18)) (bvsge (size!3122 (buf!3625 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153755 d!50596))

(declare-fun d!50598 () Bool)

(assert (=> d!50598 (= (invariant!0 (currentBit!6621 (_1!7215 lt!240081)) (currentByte!6626 (_1!7215 lt!240081)) (size!3122 (buf!3625 (_1!7215 lt!240081)))) (and (bvsge (currentBit!6621 (_1!7215 lt!240081)) #b00000000000000000000000000000000) (bvslt (currentBit!6621 (_1!7215 lt!240081)) #b00000000000000000000000000001000) (bvsge (currentByte!6626 (_1!7215 lt!240081)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6626 (_1!7215 lt!240081)) (size!3122 (buf!3625 (_1!7215 lt!240081)))) (and (= (currentBit!6621 (_1!7215 lt!240081)) #b00000000000000000000000000000000) (= (currentByte!6626 (_1!7215 lt!240081)) (size!3122 (buf!3625 (_1!7215 lt!240081))))))))))

(assert (=> b!153750 d!50598))

(declare-fun d!50600 () Bool)

(assert (=> d!50600 (and (bvsge (currentByte!6626 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10))) (bvslt (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs2!18))) (= (select (arr!3945 (buf!3625 bs1!10)) (currentByte!6626 bs1!10)) (select (arr!3945 (buf!3625 bs2!18)) (currentByte!6626 bs1!10))))))

(declare-fun lt!240154 () Unit!9723)

(declare-fun choose!107 (array!6922 array!6922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9723)

(assert (=> d!50600 (= lt!240154 (choose!107 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 (currentByte!6626 bs1!10) lt!240079))))

(assert (=> d!50600 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!240079))))

(assert (=> d!50600 (= (arrayRangesEqImpliesEq!25 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 (currentByte!6626 bs1!10) lt!240079) lt!240154)))

(declare-fun bs!12376 () Bool)

(assert (= bs!12376 d!50600))

(assert (=> bs!12376 m!239655))

(assert (=> bs!12376 m!239657))

(declare-fun m!239725 () Bool)

(assert (=> bs!12376 m!239725))

(assert (=> b!153750 d!50600))

(declare-fun d!50606 () Bool)

(declare-fun res!128815 () Bool)

(declare-fun e!103203 () Bool)

(assert (=> d!50606 (=> res!128815 e!103203)))

(assert (=> d!50606 (= res!128815 (= #b00000000000000000000000000000000 lt!240079))))

(assert (=> d!50606 (= (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 lt!240079) e!103203)))

(declare-fun b!153819 () Bool)

(declare-fun e!103204 () Bool)

(assert (=> b!153819 (= e!103203 e!103204)))

(declare-fun res!128816 () Bool)

(assert (=> b!153819 (=> (not res!128816) (not e!103204))))

(assert (=> b!153819 (= res!128816 (= (select (arr!3945 (buf!3625 bs1!10)) #b00000000000000000000000000000000) (select (arr!3945 (buf!3625 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153820 () Bool)

(assert (=> b!153820 (= e!103204 (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240079))))

(assert (= (and d!50606 (not res!128815)) b!153819))

(assert (= (and b!153819 res!128816) b!153820))

(declare-fun m!239727 () Bool)

(assert (=> b!153819 m!239727))

(declare-fun m!239729 () Bool)

(assert (=> b!153819 m!239729))

(declare-fun m!239731 () Bool)

(assert (=> b!153820 m!239731))

(assert (=> b!153751 d!50606))

(declare-fun d!50608 () Bool)

(declare-datatypes ((tuple2!13648 0))(
  ( (tuple2!13649 (_1!7218 (_ BitVec 8)) (_2!7218 BitStream!5502)) )
))
(declare-fun lt!240157 () tuple2!13648)

(declare-fun readByte!0 (BitStream!5502) tuple2!13648)

(assert (=> d!50608 (= lt!240157 (readByte!0 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))))

(assert (=> d!50608 (= (readBytePure!0 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) (tuple2!13645 (_2!7218 lt!240157) (_1!7218 lt!240157)))))

(declare-fun bs!12377 () Bool)

(assert (= bs!12377 d!50608))

(declare-fun m!239733 () Bool)

(assert (=> bs!12377 m!239733))

(assert (=> b!153752 d!50608))

(declare-fun d!50610 () Bool)

(declare-fun lt!240158 () tuple2!13648)

(assert (=> d!50610 (= lt!240158 (readByte!0 bs1!10))))

(assert (=> d!50610 (= (readBytePure!0 bs1!10) (tuple2!13645 (_2!7218 lt!240158) (_1!7218 lt!240158)))))

(declare-fun bs!12378 () Bool)

(assert (= bs!12378 d!50610))

(declare-fun m!239735 () Bool)

(assert (=> bs!12378 m!239735))

(assert (=> b!153752 d!50610))

(declare-fun d!50612 () Bool)

(declare-fun e!103205 () Bool)

(assert (=> d!50612 e!103205))

(declare-fun res!128818 () Bool)

(assert (=> d!50612 (=> (not res!128818) (not e!103205))))

(declare-fun lt!240159 () (_ BitVec 64))

(declare-fun lt!240160 () (_ BitVec 64))

(declare-fun lt!240163 () (_ BitVec 64))

(assert (=> d!50612 (= res!128818 (= lt!240160 (bvsub lt!240163 lt!240159)))))

(assert (=> d!50612 (or (= (bvand lt!240163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240163 lt!240159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50612 (= lt!240159 (remainingBits!0 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))) ((_ sign_extend 32) (currentByte!6626 bs1!10)) ((_ sign_extend 32) (currentBit!6621 bs1!10))))))

(declare-fun lt!240161 () (_ BitVec 64))

(declare-fun lt!240162 () (_ BitVec 64))

(assert (=> d!50612 (= lt!240163 (bvmul lt!240161 lt!240162))))

(assert (=> d!50612 (or (= lt!240161 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240162 (bvsdiv (bvmul lt!240161 lt!240162) lt!240161)))))

(assert (=> d!50612 (= lt!240162 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50612 (= lt!240161 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))))))

(assert (=> d!50612 (= lt!240160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6626 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6621 bs1!10))))))

(assert (=> d!50612 (invariant!0 (currentBit!6621 bs1!10) (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10)))))

(assert (=> d!50612 (= (bitIndex!0 (size!3122 (buf!3625 bs1!10)) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)) lt!240160)))

(declare-fun b!153821 () Bool)

(declare-fun res!128817 () Bool)

(assert (=> b!153821 (=> (not res!128817) (not e!103205))))

(assert (=> b!153821 (= res!128817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240160))))

(declare-fun b!153822 () Bool)

(declare-fun lt!240164 () (_ BitVec 64))

(assert (=> b!153822 (= e!103205 (bvsle lt!240160 (bvmul lt!240164 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153822 (or (= lt!240164 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240164 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240164)))))

(assert (=> b!153822 (= lt!240164 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))))))

(assert (= (and d!50612 res!128818) b!153821))

(assert (= (and b!153821 res!128817) b!153822))

(declare-fun m!239737 () Bool)

(assert (=> d!50612 m!239737))

(assert (=> d!50612 m!239699))

(assert (=> b!153753 d!50612))

(check-sat (not b!153805) (not d!50600) (not b!153804) (not d!50610) (not d!50586) (not d!50584) (not b!153802) (not d!50588) (not b!153820) (not d!50608) (not bm!2177) (not d!50612))
(check-sat)
(get-model)

(declare-fun d!50656 () Bool)

(assert (=> d!50656 (= (byteRangesEq!0 (select (arr!3945 (buf!3625 bs1!10)) (_4!90 lt!240126)) (select (arr!3945 (buf!3625 bs2!18)) (_4!90 lt!240126)) #b00000000000000000000000000000000 lt!240125) (or (= #b00000000000000000000000000000000 lt!240125) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (_4!90 lt!240126))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240125))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs2!18)) (_4!90 lt!240126))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240125))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12389 () Bool)

(assert (= bs!12389 d!50656))

(declare-fun m!239803 () Bool)

(assert (=> bs!12389 m!239803))

(declare-fun m!239805 () Bool)

(assert (=> bs!12389 m!239805))

(assert (=> b!153802 d!50656))

(declare-fun d!50658 () Bool)

(assert (=> d!50658 (= (remainingBits!0 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))) ((_ sign_extend 32) (currentByte!6626 bs1!10)) ((_ sign_extend 32) (currentBit!6621 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6626 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6621 bs1!10)))))))

(assert (=> d!50612 d!50658))

(declare-fun d!50660 () Bool)

(assert (=> d!50660 (= (invariant!0 (currentBit!6621 bs1!10) (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10))) (and (bvsge (currentBit!6621 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6621 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6626 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10))) (and (= (currentBit!6621 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6626 bs1!10) (size!3122 (buf!3625 bs1!10)))))))))

(assert (=> d!50612 d!50660))

(declare-fun d!50662 () Bool)

(assert (=> d!50662 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240078) (tuple4!181 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!240078 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!240078 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153804 d!50662))

(declare-fun d!50664 () Bool)

(assert (=> d!50664 (= (remainingBits!0 ((_ sign_extend 32) (size!3122 (buf!3625 bs2!18))) ((_ sign_extend 32) (currentByte!6626 bs2!18)) ((_ sign_extend 32) (currentBit!6621 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3122 (buf!3625 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6626 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6621 bs2!18)))))))

(assert (=> d!50584 d!50664))

(declare-fun d!50666 () Bool)

(assert (=> d!50666 (= (invariant!0 (currentBit!6621 bs2!18) (currentByte!6626 bs2!18) (size!3122 (buf!3625 bs2!18))) (and (bvsge (currentBit!6621 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6621 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6626 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6626 bs2!18) (size!3122 (buf!3625 bs2!18))) (and (= (currentBit!6621 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6626 bs2!18) (size!3122 (buf!3625 bs2!18)))))))))

(assert (=> d!50584 d!50666))

(declare-fun d!50668 () Bool)

(declare-fun res!128869 () Bool)

(declare-fun e!103258 () Bool)

(assert (=> d!50668 (=> res!128869 e!103258)))

(assert (=> d!50668 (= res!128869 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240079))))

(assert (=> d!50668 (= (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240079) e!103258)))

(declare-fun b!153885 () Bool)

(declare-fun e!103259 () Bool)

(assert (=> b!153885 (= e!103258 e!103259)))

(declare-fun res!128870 () Bool)

(assert (=> b!153885 (=> (not res!128870) (not e!103259))))

(assert (=> b!153885 (= res!128870 (= (select (arr!3945 (buf!3625 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3945 (buf!3625 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153886 () Bool)

(assert (=> b!153886 (= e!103259 (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!240079))))

(assert (= (and d!50668 (not res!128869)) b!153885))

(assert (= (and b!153885 res!128870) b!153886))

(declare-fun m!239807 () Bool)

(assert (=> b!153885 m!239807))

(declare-fun m!239809 () Bool)

(assert (=> b!153885 m!239809))

(declare-fun m!239811 () Bool)

(assert (=> b!153886 m!239811))

(assert (=> b!153820 d!50668))

(assert (=> d!50586 d!50660))

(declare-fun d!50670 () Bool)

(assert (=> d!50670 (= (byteRangesEq!0 (select (arr!3945 (buf!3625 bs1!10)) (_3!393 lt!240126)) (select (arr!3945 (buf!3625 bs2!18)) (_3!393 lt!240126)) lt!240127 (ite c!8196 lt!240125 #b00000000000000000000000000001000)) (or (= lt!240127 (ite c!8196 lt!240125 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (_3!393 lt!240126))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8196 lt!240125 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240127)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs2!18)) (_3!393 lt!240126))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8196 lt!240125 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240127)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12390 () Bool)

(assert (= bs!12390 d!50670))

(declare-fun m!239813 () Bool)

(assert (=> bs!12390 m!239813))

(declare-fun m!239815 () Bool)

(assert (=> bs!12390 m!239815))

(assert (=> bm!2177 d!50670))

(declare-fun d!50672 () Bool)

(assert (=> d!50672 (= (select (arr!3945 (buf!3625 bs1!10)) (currentByte!6626 bs1!10)) (select (arr!3945 (buf!3625 bs2!18)) (currentByte!6626 bs1!10)))))

(assert (=> d!50672 true))

(declare-fun _$12!66 () Unit!9723)

(assert (=> d!50672 (= (choose!107 (buf!3625 bs1!10) (buf!3625 bs2!18) #b00000000000000000000000000000000 (currentByte!6626 bs1!10) lt!240079) _$12!66)))

(declare-fun bs!12391 () Bool)

(assert (= bs!12391 d!50672))

(assert (=> bs!12391 m!239655))

(assert (=> bs!12391 m!239657))

(assert (=> d!50600 d!50672))

(declare-fun lt!240235 () (_ BitVec 8))

(declare-fun lt!240241 () (_ BitVec 8))

(declare-fun d!50674 () Bool)

(assert (=> d!50674 (= lt!240235 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3945 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))) ((_ sign_extend 24) lt!240241))))))

(assert (=> d!50674 (= lt!240241 ((_ extract 7 0) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))))

(declare-fun e!103265 () Bool)

(assert (=> d!50674 e!103265))

(declare-fun res!128877 () Bool)

(assert (=> d!50674 (=> (not res!128877) (not e!103265))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50674 (= res!128877 (validate_offset_bits!1 ((_ sign_extend 32) (size!3122 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))) ((_ sign_extend 32) (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) ((_ sign_extend 32) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13654 0))(
  ( (tuple2!13655 (_1!7223 Unit!9723) (_2!7223 (_ BitVec 8))) )
))
(declare-fun Unit!9727 () Unit!9723)

(declare-fun Unit!9728 () Unit!9723)

(assert (=> d!50674 (= (readByte!0 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) (tuple2!13649 (_2!7223 (ite (bvsgt ((_ sign_extend 24) lt!240241) #b00000000000000000000000000000000) (tuple2!13655 Unit!9727 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240235) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) (bvadd (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240241)))))))) (tuple2!13655 Unit!9728 lt!240235))) (BitStream!5503 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) (bvadd (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) #b00000000000000000000000000000001) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))))))

(declare-fun b!153891 () Bool)

(declare-fun e!103264 () Bool)

(assert (=> b!153891 (= e!103265 e!103264)))

(declare-fun res!128876 () Bool)

(assert (=> b!153891 (=> (not res!128876) (not e!103264))))

(declare-fun lt!240238 () tuple2!13648)

(assert (=> b!153891 (= res!128876 (= (buf!3625 (_2!7218 lt!240238)) (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))))

(declare-fun lt!240236 () (_ BitVec 8))

(declare-fun lt!240239 () (_ BitVec 8))

(declare-fun Unit!9729 () Unit!9723)

(declare-fun Unit!9730 () Unit!9723)

(assert (=> b!153891 (= lt!240238 (tuple2!13649 (_2!7223 (ite (bvsgt ((_ sign_extend 24) lt!240239) #b00000000000000000000000000000000) (tuple2!13655 Unit!9729 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240236) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) (bvadd (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240239)))))))) (tuple2!13655 Unit!9730 lt!240236))) (BitStream!5503 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) (bvadd (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) #b00000000000000000000000000000001) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))))))

(assert (=> b!153891 (= lt!240236 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3945 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))))) ((_ sign_extend 24) lt!240239))))))

(assert (=> b!153891 (= lt!240239 ((_ extract 7 0) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))))

(declare-fun lt!240237 () (_ BitVec 64))

(declare-fun b!153892 () Bool)

(declare-fun lt!240240 () (_ BitVec 64))

(assert (=> b!153892 (= e!103264 (= (bitIndex!0 (size!3122 (buf!3625 (_2!7218 lt!240238))) (currentByte!6626 (_2!7218 lt!240238)) (currentBit!6621 (_2!7218 lt!240238))) (bvadd lt!240237 lt!240240)))))

(assert (=> b!153892 (or (not (= (bvand lt!240237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240240 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240237 lt!240240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153892 (= lt!240240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153892 (= lt!240237 (bitIndex!0 (size!3122 (buf!3625 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))) (currentByte!6626 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10))) (currentBit!6621 (BitStream!5503 (buf!3625 bs2!18) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))))

(assert (= (and d!50674 res!128877) b!153891))

(assert (= (and b!153891 res!128876) b!153892))

(declare-fun m!239817 () Bool)

(assert (=> d!50674 m!239817))

(declare-fun m!239819 () Bool)

(assert (=> d!50674 m!239819))

(declare-fun m!239821 () Bool)

(assert (=> d!50674 m!239821))

(assert (=> b!153891 m!239821))

(assert (=> b!153891 m!239817))

(declare-fun m!239823 () Bool)

(assert (=> b!153892 m!239823))

(declare-fun m!239825 () Bool)

(assert (=> b!153892 m!239825))

(assert (=> d!50608 d!50674))

(declare-fun d!50676 () Bool)

(declare-fun lt!240242 () (_ BitVec 8))

(declare-fun lt!240248 () (_ BitVec 8))

(assert (=> d!50676 (= lt!240242 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (currentByte!6626 bs1!10))) ((_ sign_extend 24) lt!240248))))))

(assert (=> d!50676 (= lt!240248 ((_ extract 7 0) (currentBit!6621 bs1!10)))))

(declare-fun e!103267 () Bool)

(assert (=> d!50676 e!103267))

(declare-fun res!128879 () Bool)

(assert (=> d!50676 (=> (not res!128879) (not e!103267))))

(assert (=> d!50676 (= res!128879 (validate_offset_bits!1 ((_ sign_extend 32) (size!3122 (buf!3625 bs1!10))) ((_ sign_extend 32) (currentByte!6626 bs1!10)) ((_ sign_extend 32) (currentBit!6621 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9731 () Unit!9723)

(declare-fun Unit!9732 () Unit!9723)

(assert (=> d!50676 (= (readByte!0 bs1!10) (tuple2!13649 (_2!7223 (ite (bvsgt ((_ sign_extend 24) lt!240248) #b00000000000000000000000000000000) (tuple2!13655 Unit!9731 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240242) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (bvadd (currentByte!6626 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240248)))))))) (tuple2!13655 Unit!9732 lt!240242))) (BitStream!5503 (buf!3625 bs1!10) (bvadd (currentByte!6626 bs1!10) #b00000000000000000000000000000001) (currentBit!6621 bs1!10))))))

(declare-fun b!153893 () Bool)

(declare-fun e!103266 () Bool)

(assert (=> b!153893 (= e!103267 e!103266)))

(declare-fun res!128878 () Bool)

(assert (=> b!153893 (=> (not res!128878) (not e!103266))))

(declare-fun lt!240245 () tuple2!13648)

(assert (=> b!153893 (= res!128878 (= (buf!3625 (_2!7218 lt!240245)) (buf!3625 bs1!10)))))

(declare-fun lt!240243 () (_ BitVec 8))

(declare-fun lt!240246 () (_ BitVec 8))

(declare-fun Unit!9733 () Unit!9723)

(declare-fun Unit!9734 () Unit!9723)

(assert (=> b!153893 (= lt!240245 (tuple2!13649 (_2!7223 (ite (bvsgt ((_ sign_extend 24) lt!240246) #b00000000000000000000000000000000) (tuple2!13655 Unit!9733 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240243) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (bvadd (currentByte!6626 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240246)))))))) (tuple2!13655 Unit!9734 lt!240243))) (BitStream!5503 (buf!3625 bs1!10) (bvadd (currentByte!6626 bs1!10) #b00000000000000000000000000000001) (currentBit!6621 bs1!10))))))

(assert (=> b!153893 (= lt!240243 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3945 (buf!3625 bs1!10)) (currentByte!6626 bs1!10))) ((_ sign_extend 24) lt!240246))))))

(assert (=> b!153893 (= lt!240246 ((_ extract 7 0) (currentBit!6621 bs1!10)))))

(declare-fun lt!240247 () (_ BitVec 64))

(declare-fun b!153894 () Bool)

(declare-fun lt!240244 () (_ BitVec 64))

(assert (=> b!153894 (= e!103266 (= (bitIndex!0 (size!3122 (buf!3625 (_2!7218 lt!240245))) (currentByte!6626 (_2!7218 lt!240245)) (currentBit!6621 (_2!7218 lt!240245))) (bvadd lt!240244 lt!240247)))))

(assert (=> b!153894 (or (not (= (bvand lt!240244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240247 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240244 lt!240247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153894 (= lt!240247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153894 (= lt!240244 (bitIndex!0 (size!3122 (buf!3625 bs1!10)) (currentByte!6626 bs1!10) (currentBit!6621 bs1!10)))))

(assert (= (and d!50676 res!128879) b!153893))

(assert (= (and b!153893 res!128878) b!153894))

(assert (=> d!50676 m!239655))

(declare-fun m!239827 () Bool)

(assert (=> d!50676 m!239827))

(declare-fun m!239829 () Bool)

(assert (=> d!50676 m!239829))

(assert (=> b!153893 m!239829))

(assert (=> b!153893 m!239655))

(declare-fun m!239831 () Bool)

(assert (=> b!153894 m!239831))

(assert (=> b!153894 m!239665))

(assert (=> d!50610 d!50676))

(assert (=> d!50588 d!50666))

(declare-fun d!50678 () Bool)

(declare-fun res!128880 () Bool)

(declare-fun e!103268 () Bool)

(assert (=> d!50678 (=> res!128880 e!103268)))

(assert (=> d!50678 (= res!128880 (= (_1!7217 lt!240126) (_2!7217 lt!240126)))))

(assert (=> d!50678 (= (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (_1!7217 lt!240126) (_2!7217 lt!240126)) e!103268)))

(declare-fun b!153895 () Bool)

(declare-fun e!103269 () Bool)

(assert (=> b!153895 (= e!103268 e!103269)))

(declare-fun res!128881 () Bool)

(assert (=> b!153895 (=> (not res!128881) (not e!103269))))

(assert (=> b!153895 (= res!128881 (= (select (arr!3945 (buf!3625 bs1!10)) (_1!7217 lt!240126)) (select (arr!3945 (buf!3625 bs2!18)) (_1!7217 lt!240126))))))

(declare-fun b!153896 () Bool)

(assert (=> b!153896 (= e!103269 (arrayRangesEq!384 (buf!3625 bs1!10) (buf!3625 bs2!18) (bvadd (_1!7217 lt!240126) #b00000000000000000000000000000001) (_2!7217 lt!240126)))))

(assert (= (and d!50678 (not res!128880)) b!153895))

(assert (= (and b!153895 res!128881) b!153896))

(declare-fun m!239833 () Bool)

(assert (=> b!153895 m!239833))

(declare-fun m!239835 () Bool)

(assert (=> b!153895 m!239835))

(declare-fun m!239837 () Bool)

(assert (=> b!153896 m!239837))

(assert (=> b!153805 d!50678))

(check-sat (not b!153894) (not b!153892) (not b!153896) (not d!50674) (not b!153886) (not d!50676))
(check-sat)
