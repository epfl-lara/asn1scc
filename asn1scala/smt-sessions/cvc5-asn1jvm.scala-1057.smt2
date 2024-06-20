; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30292 () Bool)

(assert start!30292)

(declare-fun b!155188 () Bool)

(declare-fun res!129815 () Bool)

(declare-fun e!104469 () Bool)

(assert (=> b!155188 (=> (not res!129815) (not e!104469))))

(declare-fun lt!241592 () (_ BitVec 64))

(declare-datatypes ((array!7040 0))(
  ( (array!7041 (arr!3989 (Array (_ BitVec 32) (_ BitVec 8))) (size!3166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5590 0))(
  ( (BitStream!5591 (buf!3669 array!7040) (currentByte!6708 (_ BitVec 32)) (currentBit!6703 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5590)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155188 (= res!129815 (bvsle lt!241592 (bitIndex!0 (size!3166 (buf!3669 bs2!18)) (currentByte!6708 bs2!18) (currentBit!6703 bs2!18))))))

(declare-fun b!155190 () Bool)

(declare-fun e!104471 () Bool)

(assert (=> b!155190 (= e!104469 e!104471)))

(declare-fun res!129813 () Bool)

(assert (=> b!155190 (=> (not res!129813) (not e!104471))))

(declare-fun lt!241595 () (_ BitVec 32))

(declare-fun bs1!10 () BitStream!5590)

(assert (=> b!155190 (= res!129813 (and (bvsle #b00000000000000000000000000000000 lt!241595) (bvsle lt!241595 (size!3166 (buf!3669 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6708 bs1!10)) (bvslt (currentByte!6708 bs1!10) lt!241595)))))

(declare-fun lt!241594 () (_ BitVec 64))

(assert (=> b!155190 (= lt!241595 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241594 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13746 0))(
  ( (tuple2!13747 (_1!7287 BitStream!5590) (_2!7287 (_ BitVec 8))) )
))
(declare-fun lt!241593 () tuple2!13746)

(declare-fun readBytePure!0 (BitStream!5590) tuple2!13746)

(assert (=> b!155190 (= lt!241593 (readBytePure!0 (BitStream!5591 (buf!3669 bs2!18) (currentByte!6708 bs1!10) (currentBit!6703 bs1!10))))))

(declare-fun lt!241591 () tuple2!13746)

(assert (=> b!155190 (= lt!241591 (readBytePure!0 bs1!10))))

(declare-fun b!155191 () Bool)

(declare-fun e!104473 () Bool)

(assert (=> b!155191 (= e!104473 e!104469)))

(declare-fun res!129812 () Bool)

(assert (=> b!155191 (=> (not res!129812) (not e!104469))))

(assert (=> b!155191 (= res!129812 (bvsle lt!241592 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3166 (buf!3669 bs1!10))))))))

(assert (=> b!155191 (= lt!241592 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241594))))

(assert (=> b!155191 (= lt!241594 (bitIndex!0 (size!3166 (buf!3669 bs1!10)) (currentByte!6708 bs1!10) (currentBit!6703 bs1!10)))))

(declare-fun b!155192 () Bool)

(declare-fun res!129816 () Bool)

(assert (=> b!155192 (=> (not res!129816) (not e!104469))))

(declare-fun arrayBitRangesEq!0 (array!7040 array!7040 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155192 (= res!129816 (arrayBitRangesEq!0 (buf!3669 bs1!10) (buf!3669 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241592))))

(declare-fun b!155193 () Bool)

(declare-fun arrayRangesEq!404 (array!7040 array!7040 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155193 (= e!104471 (not (arrayRangesEq!404 (buf!3669 bs1!10) (buf!3669 bs2!18) #b00000000000000000000000000000000 lt!241595)))))

(declare-fun b!155194 () Bool)

(declare-fun e!104472 () Bool)

(declare-fun array_inv!2955 (array!7040) Bool)

(assert (=> b!155194 (= e!104472 (array_inv!2955 (buf!3669 bs1!10)))))

(declare-fun b!155189 () Bool)

(declare-fun e!104474 () Bool)

(assert (=> b!155189 (= e!104474 (array_inv!2955 (buf!3669 bs2!18)))))

(declare-fun res!129814 () Bool)

(assert (=> start!30292 (=> (not res!129814) (not e!104473))))

(assert (=> start!30292 (= res!129814 (= (size!3166 (buf!3669 bs1!10)) (size!3166 (buf!3669 bs2!18))))))

(assert (=> start!30292 e!104473))

(declare-fun inv!12 (BitStream!5590) Bool)

(assert (=> start!30292 (and (inv!12 bs1!10) e!104472)))

(assert (=> start!30292 (and (inv!12 bs2!18) e!104474)))

(assert (= (and start!30292 res!129814) b!155191))

(assert (= (and b!155191 res!129812) b!155188))

(assert (= (and b!155188 res!129815) b!155192))

(assert (= (and b!155192 res!129816) b!155190))

(assert (= (and b!155190 res!129813) b!155193))

(assert (= start!30292 b!155194))

(assert (= start!30292 b!155189))

(declare-fun m!241155 () Bool)

(assert (=> b!155189 m!241155))

(declare-fun m!241157 () Bool)

(assert (=> b!155188 m!241157))

(declare-fun m!241159 () Bool)

(assert (=> b!155193 m!241159))

(declare-fun m!241161 () Bool)

(assert (=> b!155190 m!241161))

(declare-fun m!241163 () Bool)

(assert (=> b!155190 m!241163))

(declare-fun m!241165 () Bool)

(assert (=> start!30292 m!241165))

(declare-fun m!241167 () Bool)

(assert (=> start!30292 m!241167))

(declare-fun m!241169 () Bool)

(assert (=> b!155191 m!241169))

(declare-fun m!241171 () Bool)

(assert (=> b!155194 m!241171))

(declare-fun m!241173 () Bool)

(assert (=> b!155192 m!241173))

(push 1)

(assert (not b!155188))

(assert (not b!155192))

(assert (not b!155194))

(assert (not b!155189))

(assert (not b!155191))

(assert (not b!155190))

(assert (not start!30292))

(assert (not b!155193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51202 () Bool)

(declare-fun res!129863 () Bool)

(declare-fun e!104530 () Bool)

(assert (=> d!51202 (=> res!129863 e!104530)))

(assert (=> d!51202 (= res!129863 (= #b00000000000000000000000000000000 lt!241595))))

(assert (=> d!51202 (= (arrayRangesEq!404 (buf!3669 bs1!10) (buf!3669 bs2!18) #b00000000000000000000000000000000 lt!241595) e!104530)))

(declare-fun b!155253 () Bool)

(declare-fun e!104531 () Bool)

(assert (=> b!155253 (= e!104530 e!104531)))

(declare-fun res!129864 () Bool)

(assert (=> b!155253 (=> (not res!129864) (not e!104531))))

(assert (=> b!155253 (= res!129864 (= (select (arr!3989 (buf!3669 bs1!10)) #b00000000000000000000000000000000) (select (arr!3989 (buf!3669 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155254 () Bool)

(assert (=> b!155254 (= e!104531 (arrayRangesEq!404 (buf!3669 bs1!10) (buf!3669 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241595))))

(assert (= (and d!51202 (not res!129863)) b!155253))

(assert (= (and b!155253 res!129864) b!155254))

(declare-fun m!241225 () Bool)

(assert (=> b!155253 m!241225))

(declare-fun m!241227 () Bool)

(assert (=> b!155253 m!241227))

(declare-fun m!241229 () Bool)

(assert (=> b!155254 m!241229))

(assert (=> b!155193 d!51202))

(declare-fun b!155292 () Bool)

(declare-fun e!104567 () Bool)

(declare-fun e!104566 () Bool)

(assert (=> b!155292 (= e!104567 e!104566)))

(declare-fun c!8262 () Bool)

(declare-datatypes ((tuple4!224 0))(
  ( (tuple4!225 (_1!7292 (_ BitVec 32)) (_2!7292 (_ BitVec 32)) (_3!415 (_ BitVec 32)) (_4!112 (_ BitVec 32))) )
))
(declare-fun lt!241670 () tuple4!224)

(assert (=> b!155292 (= c!8262 (= (_3!415 lt!241670) (_4!112 lt!241670)))))

(declare-fun e!104565 () Bool)

(declare-fun b!155293 () Bool)

(assert (=> b!155293 (= e!104565 (arrayRangesEq!404 (buf!3669 bs1!10) (buf!3669 bs2!18) (_1!7292 lt!241670) (_2!7292 lt!241670)))))

(declare-fun b!155294 () Bool)

(declare-fun e!104564 () Bool)

(assert (=> b!155294 (= e!104564 e!104567)))

(declare-fun res!129896 () Bool)

(assert (=> b!155294 (=> (not res!129896) (not e!104567))))

(assert (=> b!155294 (= res!129896 e!104565)))

(declare-fun res!129895 () Bool)

(assert (=> b!155294 (=> res!129895 e!104565)))

(assert (=> b!155294 (= res!129895 (bvsge (_1!7292 lt!241670) (_2!7292 lt!241670)))))

(declare-fun lt!241669 () (_ BitVec 32))

(assert (=> b!155294 (= lt!241669 ((_ extract 31 0) (bvsrem lt!241592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241671 () (_ BitVec 32))

(assert (=> b!155294 (= lt!241671 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!224)

(assert (=> b!155294 (= lt!241670 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241592))))

(declare-fun d!51204 () Bool)

(declare-fun res!129893 () Bool)

(assert (=> d!51204 (=> res!129893 e!104564)))

(assert (=> d!51204 (= res!129893 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241592))))

(assert (=> d!51204 (= (arrayBitRangesEq!0 (buf!3669 bs1!10) (buf!3669 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241592) e!104564)))

(declare-fun bm!2243 () Bool)

(declare-fun call!2246 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2243 (= call!2246 (byteRangesEq!0 (select (arr!3989 (buf!3669 bs1!10)) (_3!415 lt!241670)) (select (arr!3989 (buf!3669 bs2!18)) (_3!415 lt!241670)) lt!241671 (ite c!8262 lt!241669 #b00000000000000000000000000001000)))))

(declare-fun b!155295 () Bool)

(declare-fun e!104563 () Bool)

(assert (=> b!155295 (= e!104566 e!104563)))

(declare-fun res!129894 () Bool)

(assert (=> b!155295 (= res!129894 call!2246)))

(assert (=> b!155295 (=> (not res!129894) (not e!104563))))

(declare-fun e!104568 () Bool)

(declare-fun b!155296 () Bool)

(assert (=> b!155296 (= e!104568 (byteRangesEq!0 (select (arr!3989 (buf!3669 bs1!10)) (_4!112 lt!241670)) (select (arr!3989 (buf!3669 bs2!18)) (_4!112 lt!241670)) #b00000000000000000000000000000000 lt!241669))))

(declare-fun b!155297 () Bool)

(declare-fun res!129892 () Bool)

(assert (=> b!155297 (= res!129892 (= lt!241669 #b00000000000000000000000000000000))))

(assert (=> b!155297 (=> res!129892 e!104568)))

(assert (=> b!155297 (= e!104563 e!104568)))

(declare-fun b!155298 () Bool)

(assert (=> b!155298 (= e!104566 call!2246)))

(assert (= (and d!51204 (not res!129893)) b!155294))

(assert (= (and b!155294 (not res!129895)) b!155293))

(assert (= (and b!155294 res!129896) b!155292))

(assert (= (and b!155292 c!8262) b!155298))

(assert (= (and b!155292 (not c!8262)) b!155295))

(assert (= (and b!155295 res!129894) b!155297))

(assert (= (and b!155297 (not res!129892)) b!155296))

(assert (= (or b!155298 b!155295) bm!2243))

(declare-fun m!241255 () Bool)

(assert (=> b!155293 m!241255))

(declare-fun m!241257 () Bool)

(assert (=> b!155294 m!241257))

(declare-fun m!241259 () Bool)

(assert (=> bm!2243 m!241259))

(declare-fun m!241261 () Bool)

(assert (=> bm!2243 m!241261))

(assert (=> bm!2243 m!241259))

(assert (=> bm!2243 m!241261))

(declare-fun m!241263 () Bool)

(assert (=> bm!2243 m!241263))

(declare-fun m!241265 () Bool)

(assert (=> b!155296 m!241265))

(declare-fun m!241267 () Bool)

(assert (=> b!155296 m!241267))

(assert (=> b!155296 m!241265))

(assert (=> b!155296 m!241267))

(declare-fun m!241269 () Bool)

(assert (=> b!155296 m!241269))

(assert (=> b!155192 d!51204))

(declare-fun d!51216 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51216 (= (inv!12 bs1!10) (invariant!0 (currentBit!6703 bs1!10) (currentByte!6708 bs1!10) (size!3166 (buf!3669 bs1!10))))))

(declare-fun bs!12536 () Bool)

(assert (= bs!12536 d!51216))

(declare-fun m!241271 () Bool)

(assert (=> bs!12536 m!241271))

(assert (=> start!30292 d!51216))

(declare-fun d!51218 () Bool)

(assert (=> d!51218 (= (inv!12 bs2!18) (invariant!0 (currentBit!6703 bs2!18) (currentByte!6708 bs2!18) (size!3166 (buf!3669 bs2!18))))))

(declare-fun bs!12537 () Bool)

(assert (= bs!12537 d!51218))

(declare-fun m!241273 () Bool)

(assert (=> bs!12537 m!241273))

(assert (=> start!30292 d!51218))

(declare-fun d!51220 () Bool)

(declare-fun e!104571 () Bool)

(assert (=> d!51220 e!104571))

(declare-fun res!129901 () Bool)

(assert (=> d!51220 (=> (not res!129901) (not e!104571))))

(declare-fun lt!241687 () (_ BitVec 64))

(declare-fun lt!241689 () (_ BitVec 64))

(declare-fun lt!241684 () (_ BitVec 64))

(assert (=> d!51220 (= res!129901 (= lt!241684 (bvsub lt!241687 lt!241689)))))

(assert (=> d!51220 (or (= (bvand lt!241687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241687 lt!241689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51220 (= lt!241689 (remainingBits!0 ((_ sign_extend 32) (size!3166 (buf!3669 bs1!10))) ((_ sign_extend 32) (currentByte!6708 bs1!10)) ((_ sign_extend 32) (currentBit!6703 bs1!10))))))

(declare-fun lt!241685 () (_ BitVec 64))

(declare-fun lt!241688 () (_ BitVec 64))

(assert (=> d!51220 (= lt!241687 (bvmul lt!241685 lt!241688))))

(assert (=> d!51220 (or (= lt!241685 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241688 (bvsdiv (bvmul lt!241685 lt!241688) lt!241685)))))

(assert (=> d!51220 (= lt!241688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51220 (= lt!241685 ((_ sign_extend 32) (size!3166 (buf!3669 bs1!10))))))

(assert (=> d!51220 (= lt!241684 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6708 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6703 bs1!10))))))

(assert (=> d!51220 (invariant!0 (currentBit!6703 bs1!10) (currentByte!6708 bs1!10) (size!3166 (buf!3669 bs1!10)))))

(assert (=> d!51220 (= (bitIndex!0 (size!3166 (buf!3669 bs1!10)) (currentByte!6708 bs1!10) (currentBit!6703 bs1!10)) lt!241684)))

(declare-fun b!155303 () Bool)

(declare-fun res!129902 () Bool)

(assert (=> b!155303 (=> (not res!129902) (not e!104571))))

(assert (=> b!155303 (= res!129902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241684))))

(declare-fun b!155304 () Bool)

(declare-fun lt!241686 () (_ BitVec 64))

(assert (=> b!155304 (= e!104571 (bvsle lt!241684 (bvmul lt!241686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155304 (or (= lt!241686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241686)))))

(assert (=> b!155304 (= lt!241686 ((_ sign_extend 32) (size!3166 (buf!3669 bs1!10))))))

(assert (= (and d!51220 res!129901) b!155303))

(assert (= (and b!155303 res!129902) b!155304))

(declare-fun m!241275 () Bool)

(assert (=> d!51220 m!241275))

(assert (=> d!51220 m!241271))

(assert (=> b!155191 d!51220))

(declare-fun d!51222 () Bool)

(declare-datatypes ((tuple2!13754 0))(
  ( (tuple2!13755 (_1!7293 (_ BitVec 8)) (_2!7293 BitStream!5590)) )
))
(declare-fun lt!241692 () tuple2!13754)

(declare-fun readByte!0 (BitStream!5590) tuple2!13754)

(assert (=> d!51222 (= lt!241692 (readByte!0 (BitStream!5591 (buf!3669 bs2!18) (currentByte!6708 bs1!10) (currentBit!6703 bs1!10))))))

(assert (=> d!51222 (= (readBytePure!0 (BitStream!5591 (buf!3669 bs2!18) (currentByte!6708 bs1!10) (currentBit!6703 bs1!10))) (tuple2!13747 (_2!7293 lt!241692) (_1!7293 lt!241692)))))

(declare-fun bs!12538 () Bool)

(assert (= bs!12538 d!51222))

(declare-fun m!241277 () Bool)

(assert (=> bs!12538 m!241277))

(assert (=> b!155190 d!51222))

(declare-fun d!51224 () Bool)

(declare-fun lt!241693 () tuple2!13754)

(assert (=> d!51224 (= lt!241693 (readByte!0 bs1!10))))

(assert (=> d!51224 (= (readBytePure!0 bs1!10) (tuple2!13747 (_2!7293 lt!241693) (_1!7293 lt!241693)))))

(declare-fun bs!12539 () Bool)

(assert (= bs!12539 d!51224))

(declare-fun m!241279 () Bool)

(assert (=> bs!12539 m!241279))

(assert (=> b!155190 d!51224))

(declare-fun d!51226 () Bool)

(assert (=> d!51226 (= (array_inv!2955 (buf!3669 bs1!10)) (bvsge (size!3166 (buf!3669 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155194 d!51226))

(declare-fun d!51228 () Bool)

(assert (=> d!51228 (= (array_inv!2955 (buf!3669 bs2!18)) (bvsge (size!3166 (buf!3669 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155189 d!51228))

(declare-fun d!51230 () Bool)

(declare-fun e!104572 () Bool)

(assert (=> d!51230 e!104572))

(declare-fun res!129903 () Bool)

(assert (=> d!51230 (=> (not res!129903) (not e!104572))))

(declare-fun lt!241694 () (_ BitVec 64))

(declare-fun lt!241699 () (_ BitVec 64))

(declare-fun lt!241697 () (_ BitVec 64))

(assert (=> d!51230 (= res!129903 (= lt!241694 (bvsub lt!241697 lt!241699)))))

(assert (=> d!51230 (or (= (bvand lt!241697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241697 lt!241699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51230 (= lt!241699 (remainingBits!0 ((_ sign_extend 32) (size!3166 (buf!3669 bs2!18))) ((_ sign_extend 32) (currentByte!6708 bs2!18)) ((_ sign_extend 32) (currentBit!6703 bs2!18))))))

(declare-fun lt!241695 () (_ BitVec 64))

(declare-fun lt!241698 () (_ BitVec 64))

(assert (=> d!51230 (= lt!241697 (bvmul lt!241695 lt!241698))))

(assert (=> d!51230 (or (= lt!241695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241698 (bvsdiv (bvmul lt!241695 lt!241698) lt!241695)))))

(assert (=> d!51230 (= lt!241698 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51230 (= lt!241695 ((_ sign_extend 32) (size!3166 (buf!3669 bs2!18))))))

(assert (=> d!51230 (= lt!241694 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6708 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6703 bs2!18))))))

(assert (=> d!51230 (invariant!0 (currentBit!6703 bs2!18) (currentByte!6708 bs2!18) (size!3166 (buf!3669 bs2!18)))))

(assert (=> d!51230 (= (bitIndex!0 (size!3166 (buf!3669 bs2!18)) (currentByte!6708 bs2!18) (currentBit!6703 bs2!18)) lt!241694)))

(declare-fun b!155305 () Bool)

(declare-fun res!129904 () Bool)

(assert (=> b!155305 (=> (not res!129904) (not e!104572))))

(assert (=> b!155305 (= res!129904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241694))))

(declare-fun b!155306 () Bool)

(declare-fun lt!241696 () (_ BitVec 64))

(assert (=> b!155306 (= e!104572 (bvsle lt!241694 (bvmul lt!241696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155306 (or (= lt!241696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241696)))))

(assert (=> b!155306 (= lt!241696 ((_ sign_extend 32) (size!3166 (buf!3669 bs2!18))))))

(assert (= (and d!51230 res!129903) b!155305))

(assert (= (and b!155305 res!129904) b!155306))

(declare-fun m!241281 () Bool)

(assert (=> d!51230 m!241281))

(assert (=> d!51230 m!241273))

(assert (=> b!155188 d!51230))

(push 1)

(assert (not b!155254))

(assert (not b!155296))

(assert (not d!51224))

(assert (not d!51222))

(assert (not d!51230))

(assert (not d!51220))

(assert (not d!51216))

(assert (not d!51218))

(assert (not bm!2243))

(assert (not b!155294))

(assert (not b!155293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

