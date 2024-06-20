; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29888 () Bool)

(assert start!29888)

(declare-fun b!153772 () Bool)

(declare-fun e!103167 () Bool)

(declare-datatypes ((array!6924 0))(
  ( (array!6925 (arr!3946 (Array (_ BitVec 32) (_ BitVec 8))) (size!3123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5504 0))(
  ( (BitStream!5505 (buf!3626 array!6924) (currentByte!6627 (_ BitVec 32)) (currentBit!6622 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5504)

(declare-fun array_inv!2912 (array!6924) Bool)

(assert (=> b!153772 (= e!103167 (array_inv!2912 (buf!3626 bs1!10)))))

(declare-fun b!153773 () Bool)

(declare-fun res!128779 () Bool)

(declare-fun e!103168 () Bool)

(assert (=> b!153773 (=> (not res!128779) (not e!103168))))

(declare-fun bs2!18 () BitStream!5504)

(declare-fun lt!240100 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6924 array!6924 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153773 (= res!128779 (arrayBitRangesEq!0 (buf!3626 bs1!10) (buf!3626 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240100))))

(declare-fun b!153774 () Bool)

(declare-fun res!128777 () Bool)

(declare-fun e!103171 () Bool)

(assert (=> b!153774 (=> (not res!128777) (not e!103171))))

(declare-fun lt!240096 () (_ BitVec 32))

(declare-fun arrayRangesEq!385 (array!6924 array!6924 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153774 (= res!128777 (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 lt!240096))))

(declare-fun b!153775 () Bool)

(declare-fun e!103169 () Bool)

(assert (=> b!153775 (= e!103169 e!103168)))

(declare-fun res!128776 () Bool)

(assert (=> b!153775 (=> (not res!128776) (not e!103168))))

(assert (=> b!153775 (= res!128776 (bvsle lt!240100 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))))))))

(declare-fun lt!240095 () (_ BitVec 64))

(assert (=> b!153775 (= lt!240100 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240095))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153775 (= lt!240095 (bitIndex!0 (size!3123 (buf!3626 bs1!10)) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))

(declare-fun b!153776 () Bool)

(declare-fun res!128780 () Bool)

(assert (=> b!153776 (=> (not res!128780) (not e!103168))))

(assert (=> b!153776 (= res!128780 (bvsle lt!240100 (bitIndex!0 (size!3123 (buf!3626 bs2!18)) (currentByte!6627 bs2!18) (currentBit!6622 bs2!18))))))

(declare-fun b!153777 () Bool)

(declare-fun e!103172 () Bool)

(assert (=> b!153777 (= e!103172 (array_inv!2912 (buf!3626 bs2!18)))))

(declare-fun b!153778 () Bool)

(declare-datatypes ((tuple2!13646 0))(
  ( (tuple2!13647 (_1!7216 BitStream!5504) (_2!7216 (_ BitVec 8))) )
))
(declare-fun lt!240098 () tuple2!13646)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153778 (= e!103171 (not (invariant!0 (currentBit!6622 (_1!7216 lt!240098)) (currentByte!6627 (_1!7216 lt!240098)) (size!3123 (buf!3626 (_1!7216 lt!240098))))))))

(assert (=> b!153778 (= (select (arr!3946 (buf!3626 bs1!10)) (currentByte!6627 bs1!10)) (select (arr!3946 (buf!3626 bs2!18)) (currentByte!6627 bs1!10)))))

(declare-datatypes ((Unit!9725 0))(
  ( (Unit!9726) )
))
(declare-fun lt!240099 () Unit!9725)

(declare-fun arrayRangesEqImpliesEq!26 (array!6924 array!6924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9725)

(assert (=> b!153778 (= lt!240099 (arrayRangesEqImpliesEq!26 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 (currentByte!6627 bs1!10) lt!240096))))

(declare-fun b!153779 () Bool)

(assert (=> b!153779 (= e!103168 e!103171)))

(declare-fun res!128778 () Bool)

(assert (=> b!153779 (=> (not res!128778) (not e!103171))))

(assert (=> b!153779 (= res!128778 (and (bvsle #b00000000000000000000000000000000 lt!240096) (bvsle lt!240096 (size!3123 (buf!3626 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6627 bs1!10)) (bvslt (currentByte!6627 bs1!10) lt!240096)))))

(assert (=> b!153779 (= lt!240096 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240095 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun readBytePure!0 (BitStream!5504) tuple2!13646)

(assert (=> b!153779 (= lt!240098 (readBytePure!0 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))))

(declare-fun lt!240097 () tuple2!13646)

(assert (=> b!153779 (= lt!240097 (readBytePure!0 bs1!10))))

(declare-fun res!128781 () Bool)

(assert (=> start!29888 (=> (not res!128781) (not e!103169))))

(assert (=> start!29888 (= res!128781 (= (size!3123 (buf!3626 bs1!10)) (size!3123 (buf!3626 bs2!18))))))

(assert (=> start!29888 e!103169))

(declare-fun inv!12 (BitStream!5504) Bool)

(assert (=> start!29888 (and (inv!12 bs1!10) e!103167)))

(assert (=> start!29888 (and (inv!12 bs2!18) e!103172)))

(assert (= (and start!29888 res!128781) b!153775))

(assert (= (and b!153775 res!128776) b!153776))

(assert (= (and b!153776 res!128780) b!153773))

(assert (= (and b!153773 res!128779) b!153779))

(assert (= (and b!153779 res!128778) b!153774))

(assert (= (and b!153774 res!128777) b!153778))

(assert (= start!29888 b!153772))

(assert (= start!29888 b!153777))

(declare-fun m!239667 () Bool)

(assert (=> b!153778 m!239667))

(declare-fun m!239669 () Bool)

(assert (=> b!153778 m!239669))

(declare-fun m!239671 () Bool)

(assert (=> b!153778 m!239671))

(declare-fun m!239673 () Bool)

(assert (=> b!153778 m!239673))

(declare-fun m!239675 () Bool)

(assert (=> start!29888 m!239675))

(declare-fun m!239677 () Bool)

(assert (=> start!29888 m!239677))

(declare-fun m!239679 () Bool)

(assert (=> b!153775 m!239679))

(declare-fun m!239681 () Bool)

(assert (=> b!153773 m!239681))

(declare-fun m!239683 () Bool)

(assert (=> b!153777 m!239683))

(declare-fun m!239685 () Bool)

(assert (=> b!153772 m!239685))

(declare-fun m!239687 () Bool)

(assert (=> b!153776 m!239687))

(declare-fun m!239689 () Bool)

(assert (=> b!153774 m!239689))

(declare-fun m!239691 () Bool)

(assert (=> b!153779 m!239691))

(declare-fun m!239693 () Bool)

(assert (=> b!153779 m!239693))

(push 1)

(assert (not b!153778))

(assert (not b!153775))

(assert (not b!153772))

(assert (not b!153776))

(assert (not b!153779))

(assert (not b!153773))

(assert (not start!29888))

(assert (not b!153774))

(assert (not b!153777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50620 () Bool)

(assert (=> d!50620 (= (array_inv!2912 (buf!3626 bs2!18)) (bvsge (size!3123 (buf!3626 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153777 d!50620))

(declare-fun d!50622 () Bool)

(assert (=> d!50622 (= (array_inv!2912 (buf!3626 bs1!10)) (bvsge (size!3123 (buf!3626 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153772 d!50622))

(declare-fun d!50624 () Bool)

(assert (=> d!50624 (= (inv!12 bs1!10) (invariant!0 (currentBit!6622 bs1!10) (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10))))))

(declare-fun bs!12380 () Bool)

(assert (= bs!12380 d!50624))

(declare-fun m!239763 () Bool)

(assert (=> bs!12380 m!239763))

(assert (=> start!29888 d!50624))

(declare-fun d!50628 () Bool)

(assert (=> d!50628 (= (inv!12 bs2!18) (invariant!0 (currentBit!6622 bs2!18) (currentByte!6627 bs2!18) (size!3123 (buf!3626 bs2!18))))))

(declare-fun bs!12381 () Bool)

(assert (= bs!12381 d!50628))

(declare-fun m!239765 () Bool)

(assert (=> bs!12381 m!239765))

(assert (=> start!29888 d!50628))

(declare-fun d!50630 () Bool)

(assert (=> d!50630 (= (invariant!0 (currentBit!6622 (_1!7216 lt!240098)) (currentByte!6627 (_1!7216 lt!240098)) (size!3123 (buf!3626 (_1!7216 lt!240098)))) (and (bvsge (currentBit!6622 (_1!7216 lt!240098)) #b00000000000000000000000000000000) (bvslt (currentBit!6622 (_1!7216 lt!240098)) #b00000000000000000000000000001000) (bvsge (currentByte!6627 (_1!7216 lt!240098)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6627 (_1!7216 lt!240098)) (size!3123 (buf!3626 (_1!7216 lt!240098)))) (and (= (currentBit!6622 (_1!7216 lt!240098)) #b00000000000000000000000000000000) (= (currentByte!6627 (_1!7216 lt!240098)) (size!3123 (buf!3626 (_1!7216 lt!240098))))))))))

(assert (=> b!153778 d!50630))

(declare-fun d!50634 () Bool)

(assert (=> d!50634 (and (bvsge (currentByte!6627 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10))) (bvslt (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs2!18))) (= (select (arr!3946 (buf!3626 bs1!10)) (currentByte!6627 bs1!10)) (select (arr!3946 (buf!3626 bs2!18)) (currentByte!6627 bs1!10))))))

(declare-fun lt!240183 () Unit!9725)

(declare-fun choose!109 (array!6924 array!6924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9725)

(assert (=> d!50634 (= lt!240183 (choose!109 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 (currentByte!6627 bs1!10) lt!240096))))

(assert (=> d!50634 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!240096))))

(assert (=> d!50634 (= (arrayRangesEqImpliesEq!26 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 (currentByte!6627 bs1!10) lt!240096) lt!240183)))

(declare-fun bs!12386 () Bool)

(assert (= bs!12386 d!50634))

(assert (=> bs!12386 m!239669))

(assert (=> bs!12386 m!239671))

(declare-fun m!239771 () Bool)

(assert (=> bs!12386 m!239771))

(assert (=> b!153778 d!50634))

(declare-fun b!153865 () Bool)

(declare-fun e!103243 () Bool)

(declare-fun e!103246 () Bool)

(assert (=> b!153865 (= e!103243 e!103246)))

(declare-fun res!128850 () Bool)

(declare-datatypes ((tuple4!184 0))(
  ( (tuple4!185 (_1!7221 (_ BitVec 32)) (_2!7221 (_ BitVec 32)) (_3!395 (_ BitVec 32)) (_4!92 (_ BitVec 32))) )
))
(declare-fun lt!240192 () tuple4!184)

(declare-fun lt!240191 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153865 (= res!128850 (byteRangesEq!0 (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192)) lt!240191 #b00000000000000000000000000001000))))

(assert (=> b!153865 (=> (not res!128850) (not e!103246))))

(declare-fun b!153866 () Bool)

(declare-fun e!103242 () Bool)

(assert (=> b!153866 (= e!103242 e!103243)))

(declare-fun c!8202 () Bool)

(assert (=> b!153866 (= c!8202 (= (_3!395 lt!240192) (_4!92 lt!240192)))))

(declare-fun lt!240190 () (_ BitVec 32))

(declare-fun bm!2183 () Bool)

(declare-fun call!2186 () Bool)

(assert (=> bm!2183 (= call!2186 (byteRangesEq!0 (ite c!8202 (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs1!10)) (_4!92 lt!240192))) (ite c!8202 (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_4!92 lt!240192))) (ite c!8202 lt!240191 #b00000000000000000000000000000000) lt!240190))))

(declare-fun b!153867 () Bool)

(declare-fun res!128854 () Bool)

(assert (=> b!153867 (= res!128854 (= lt!240190 #b00000000000000000000000000000000))))

(declare-fun e!103247 () Bool)

(assert (=> b!153867 (=> res!128854 e!103247)))

(assert (=> b!153867 (= e!103246 e!103247)))

(declare-fun b!153868 () Bool)

(declare-fun e!103244 () Bool)

(assert (=> b!153868 (= e!103244 (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (_1!7221 lt!240192) (_2!7221 lt!240192)))))

(declare-fun b!153864 () Bool)

(assert (=> b!153864 (= e!103243 call!2186)))

(declare-fun d!50644 () Bool)

(declare-fun res!128853 () Bool)

(declare-fun e!103245 () Bool)

(assert (=> d!50644 (=> res!128853 e!103245)))

(assert (=> d!50644 (= res!128853 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240100))))

(assert (=> d!50644 (= (arrayBitRangesEq!0 (buf!3626 bs1!10) (buf!3626 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240100) e!103245)))

(declare-fun b!153869 () Bool)

(assert (=> b!153869 (= e!103247 call!2186)))

(declare-fun b!153870 () Bool)

(assert (=> b!153870 (= e!103245 e!103242)))

(declare-fun res!128852 () Bool)

(assert (=> b!153870 (=> (not res!128852) (not e!103242))))

(assert (=> b!153870 (= res!128852 e!103244)))

(declare-fun res!128851 () Bool)

(assert (=> b!153870 (=> res!128851 e!103244)))

(assert (=> b!153870 (= res!128851 (bvsge (_1!7221 lt!240192) (_2!7221 lt!240192)))))

(assert (=> b!153870 (= lt!240190 ((_ extract 31 0) (bvsrem lt!240100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153870 (= lt!240191 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!184)

(assert (=> b!153870 (= lt!240192 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240100))))

(assert (= (and d!50644 (not res!128853)) b!153870))

(assert (= (and b!153870 (not res!128851)) b!153868))

(assert (= (and b!153870 res!128852) b!153866))

(assert (= (and b!153866 c!8202) b!153864))

(assert (= (and b!153866 (not c!8202)) b!153865))

(assert (= (and b!153865 res!128850) b!153867))

(assert (= (and b!153867 (not res!128854)) b!153869))

(assert (= (or b!153864 b!153869) bm!2183))

(declare-fun m!239773 () Bool)

(assert (=> b!153865 m!239773))

(declare-fun m!239775 () Bool)

(assert (=> b!153865 m!239775))

(assert (=> b!153865 m!239773))

(assert (=> b!153865 m!239775))

(declare-fun m!239777 () Bool)

(assert (=> b!153865 m!239777))

(declare-fun m!239779 () Bool)

(assert (=> bm!2183 m!239779))

(assert (=> bm!2183 m!239775))

(assert (=> bm!2183 m!239773))

(declare-fun m!239781 () Bool)

(assert (=> bm!2183 m!239781))

(declare-fun m!239783 () Bool)

(assert (=> bm!2183 m!239783))

(declare-fun m!239785 () Bool)

(assert (=> b!153868 m!239785))

(declare-fun m!239787 () Bool)

(assert (=> b!153870 m!239787))

(assert (=> b!153773 d!50644))

(declare-fun d!50646 () Bool)

(declare-datatypes ((tuple2!13652 0))(
  ( (tuple2!13653 (_1!7222 (_ BitVec 8)) (_2!7222 BitStream!5504)) )
))
(declare-fun lt!240195 () tuple2!13652)

(declare-fun readByte!0 (BitStream!5504) tuple2!13652)

(assert (=> d!50646 (= lt!240195 (readByte!0 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))))

(assert (=> d!50646 (= (readBytePure!0 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) (tuple2!13647 (_2!7222 lt!240195) (_1!7222 lt!240195)))))

(declare-fun bs!12387 () Bool)

(assert (= bs!12387 d!50646))

(declare-fun m!239789 () Bool)

(assert (=> bs!12387 m!239789))

(assert (=> b!153779 d!50646))

(declare-fun d!50648 () Bool)

(declare-fun lt!240196 () tuple2!13652)

(assert (=> d!50648 (= lt!240196 (readByte!0 bs1!10))))

(assert (=> d!50648 (= (readBytePure!0 bs1!10) (tuple2!13647 (_2!7222 lt!240196) (_1!7222 lt!240196)))))

(declare-fun bs!12388 () Bool)

(assert (= bs!12388 d!50648))

(declare-fun m!239791 () Bool)

(assert (=> bs!12388 m!239791))

(assert (=> b!153779 d!50648))

(declare-fun d!50650 () Bool)

(declare-fun res!128859 () Bool)

(declare-fun e!103252 () Bool)

(assert (=> d!50650 (=> res!128859 e!103252)))

(assert (=> d!50650 (= res!128859 (= #b00000000000000000000000000000000 lt!240096))))

(assert (=> d!50650 (= (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 lt!240096) e!103252)))

(declare-fun b!153875 () Bool)

(declare-fun e!103253 () Bool)

(assert (=> b!153875 (= e!103252 e!103253)))

(declare-fun res!128860 () Bool)

(assert (=> b!153875 (=> (not res!128860) (not e!103253))))

(assert (=> b!153875 (= res!128860 (= (select (arr!3946 (buf!3626 bs1!10)) #b00000000000000000000000000000000) (select (arr!3946 (buf!3626 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153876 () Bool)

(assert (=> b!153876 (= e!103253 (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240096))))

(assert (= (and d!50650 (not res!128859)) b!153875))

(assert (= (and b!153875 res!128860) b!153876))

(declare-fun m!239793 () Bool)

(assert (=> b!153875 m!239793))

(declare-fun m!239795 () Bool)

(assert (=> b!153875 m!239795))

(declare-fun m!239797 () Bool)

(assert (=> b!153876 m!239797))

(assert (=> b!153774 d!50650))

(declare-fun d!50652 () Bool)

(declare-fun e!103256 () Bool)

(assert (=> d!50652 e!103256))

(declare-fun res!128865 () Bool)

(assert (=> d!50652 (=> (not res!128865) (not e!103256))))

(declare-fun lt!240209 () (_ BitVec 64))

(declare-fun lt!240210 () (_ BitVec 64))

(declare-fun lt!240212 () (_ BitVec 64))

(assert (=> d!50652 (= res!128865 (= lt!240212 (bvsub lt!240209 lt!240210)))))

(assert (=> d!50652 (or (= (bvand lt!240209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240209 lt!240210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50652 (= lt!240210 (remainingBits!0 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))) ((_ sign_extend 32) (currentByte!6627 bs1!10)) ((_ sign_extend 32) (currentBit!6622 bs1!10))))))

(declare-fun lt!240213 () (_ BitVec 64))

(declare-fun lt!240211 () (_ BitVec 64))

(assert (=> d!50652 (= lt!240209 (bvmul lt!240213 lt!240211))))

(assert (=> d!50652 (or (= lt!240213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240211 (bvsdiv (bvmul lt!240213 lt!240211) lt!240213)))))

(assert (=> d!50652 (= lt!240211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50652 (= lt!240213 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))))))

(assert (=> d!50652 (= lt!240212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6627 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6622 bs1!10))))))

(assert (=> d!50652 (invariant!0 (currentBit!6622 bs1!10) (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10)))))

(assert (=> d!50652 (= (bitIndex!0 (size!3123 (buf!3626 bs1!10)) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)) lt!240212)))

(declare-fun b!153881 () Bool)

(declare-fun res!128866 () Bool)

(assert (=> b!153881 (=> (not res!128866) (not e!103256))))

(assert (=> b!153881 (= res!128866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240212))))

(declare-fun b!153882 () Bool)

(declare-fun lt!240214 () (_ BitVec 64))

(assert (=> b!153882 (= e!103256 (bvsle lt!240212 (bvmul lt!240214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153882 (or (= lt!240214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240214)))))

(assert (=> b!153882 (= lt!240214 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))))))

(assert (= (and d!50652 res!128865) b!153881))

(assert (= (and b!153881 res!128866) b!153882))

(declare-fun m!239799 () Bool)

(assert (=> d!50652 m!239799))

(assert (=> d!50652 m!239763))

(assert (=> b!153775 d!50652))

(declare-fun d!50654 () Bool)

(declare-fun e!103257 () Bool)

(assert (=> d!50654 e!103257))

(declare-fun res!128867 () Bool)

(assert (=> d!50654 (=> (not res!128867) (not e!103257))))

(declare-fun lt!240216 () (_ BitVec 64))

(declare-fun lt!240215 () (_ BitVec 64))

(declare-fun lt!240218 () (_ BitVec 64))

(assert (=> d!50654 (= res!128867 (= lt!240218 (bvsub lt!240215 lt!240216)))))

(assert (=> d!50654 (or (= (bvand lt!240215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240215 lt!240216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50654 (= lt!240216 (remainingBits!0 ((_ sign_extend 32) (size!3123 (buf!3626 bs2!18))) ((_ sign_extend 32) (currentByte!6627 bs2!18)) ((_ sign_extend 32) (currentBit!6622 bs2!18))))))

(declare-fun lt!240219 () (_ BitVec 64))

(declare-fun lt!240217 () (_ BitVec 64))

(assert (=> d!50654 (= lt!240215 (bvmul lt!240219 lt!240217))))

(assert (=> d!50654 (or (= lt!240219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240217 (bvsdiv (bvmul lt!240219 lt!240217) lt!240219)))))

(assert (=> d!50654 (= lt!240217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50654 (= lt!240219 ((_ sign_extend 32) (size!3123 (buf!3626 bs2!18))))))

(assert (=> d!50654 (= lt!240218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6627 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6622 bs2!18))))))

(assert (=> d!50654 (invariant!0 (currentBit!6622 bs2!18) (currentByte!6627 bs2!18) (size!3123 (buf!3626 bs2!18)))))

(assert (=> d!50654 (= (bitIndex!0 (size!3123 (buf!3626 bs2!18)) (currentByte!6627 bs2!18) (currentBit!6622 bs2!18)) lt!240218)))

(declare-fun b!153883 () Bool)

(declare-fun res!128868 () Bool)

(assert (=> b!153883 (=> (not res!128868) (not e!103257))))

(assert (=> b!153883 (= res!128868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240218))))

(declare-fun b!153884 () Bool)

(declare-fun lt!240220 () (_ BitVec 64))

(assert (=> b!153884 (= e!103257 (bvsle lt!240218 (bvmul lt!240220 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153884 (or (= lt!240220 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240220 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240220)))))

(assert (=> b!153884 (= lt!240220 ((_ sign_extend 32) (size!3123 (buf!3626 bs2!18))))))

(assert (= (and d!50654 res!128867) b!153883))

(assert (= (and b!153883 res!128868) b!153884))

(declare-fun m!239801 () Bool)

(assert (=> d!50654 m!239801))

(assert (=> d!50654 m!239765))

(assert (=> b!153776 d!50654))

(push 1)

(assert (not d!50648))

(assert (not d!50624))

(assert (not d!50646))

(assert (not b!153870))

(assert (not b!153865))

(assert (not b!153876))

(assert (not d!50652))

(assert (not d!50628))

(assert (not d!50634))

(assert (not d!50654))

(assert (not bm!2183))

(assert (not b!153868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50680 () Bool)

(assert (=> d!50680 (= (remainingBits!0 ((_ sign_extend 32) (size!3123 (buf!3626 bs2!18))) ((_ sign_extend 32) (currentByte!6627 bs2!18)) ((_ sign_extend 32) (currentBit!6622 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3123 (buf!3626 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6627 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6622 bs2!18)))))))

(assert (=> d!50654 d!50680))

(declare-fun d!50682 () Bool)

(assert (=> d!50682 (= (invariant!0 (currentBit!6622 bs2!18) (currentByte!6627 bs2!18) (size!3123 (buf!3626 bs2!18))) (and (bvsge (currentBit!6622 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6622 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6627 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6627 bs2!18) (size!3123 (buf!3626 bs2!18))) (and (= (currentBit!6622 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6627 bs2!18) (size!3123 (buf!3626 bs2!18)))))))))

(assert (=> d!50654 d!50682))

(declare-fun d!50684 () Bool)

(assert (=> d!50684 (= (remainingBits!0 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))) ((_ sign_extend 32) (currentByte!6627 bs1!10)) ((_ sign_extend 32) (currentBit!6622 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6627 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6622 bs1!10)))))))

(assert (=> d!50652 d!50684))

(declare-fun d!50686 () Bool)

(assert (=> d!50686 (= (invariant!0 (currentBit!6622 bs1!10) (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10))) (and (bvsge (currentBit!6622 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6622 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6627 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10))) (and (= (currentBit!6622 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6627 bs1!10) (size!3123 (buf!3626 bs1!10)))))))))

(assert (=> d!50652 d!50686))

(declare-fun d!50688 () Bool)

(assert (=> d!50688 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240100) (tuple4!185 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!240100 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!240100 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153870 d!50688))

(assert (=> d!50628 d!50682))

(declare-fun lt!240263 () (_ BitVec 8))

(declare-fun d!50690 () Bool)

(declare-fun lt!240268 () (_ BitVec 8))

(assert (=> d!50690 (= lt!240263 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3946 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))) ((_ sign_extend 24) lt!240268))))))

(assert (=> d!50690 (= lt!240268 ((_ extract 7 0) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))))

(declare-fun e!103275 () Bool)

(assert (=> d!50690 e!103275))

(declare-fun res!128887 () Bool)

(assert (=> d!50690 (=> (not res!128887) (not e!103275))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50690 (= res!128887 (validate_offset_bits!1 ((_ sign_extend 32) (size!3123 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))) ((_ sign_extend 32) (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) ((_ sign_extend 32) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13656 0))(
  ( (tuple2!13657 (_1!7224 Unit!9725) (_2!7224 (_ BitVec 8))) )
))
(declare-fun Unit!9735 () Unit!9725)

(declare-fun Unit!9736 () Unit!9725)

(assert (=> d!50690 (= (readByte!0 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) (tuple2!13653 (_2!7224 (ite (bvsgt ((_ sign_extend 24) lt!240268) #b00000000000000000000000000000000) (tuple2!13657 Unit!9735 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240263) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) (bvadd (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240268)))))))) (tuple2!13657 Unit!9736 lt!240263))) (BitStream!5505 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) (bvadd (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) #b00000000000000000000000000000001) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))))))

(declare-fun b!153901 () Bool)

(declare-fun e!103274 () Bool)

(assert (=> b!153901 (= e!103275 e!103274)))

(declare-fun res!128888 () Bool)

(assert (=> b!153901 (=> (not res!128888) (not e!103274))))

(declare-fun lt!240265 () tuple2!13652)

(assert (=> b!153901 (= res!128888 (= (buf!3626 (_2!7222 lt!240265)) (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))))

(declare-fun lt!240264 () (_ BitVec 8))

(declare-fun lt!240267 () (_ BitVec 8))

(declare-fun Unit!9737 () Unit!9725)

(declare-fun Unit!9738 () Unit!9725)

(assert (=> b!153901 (= lt!240265 (tuple2!13653 (_2!7224 (ite (bvsgt ((_ sign_extend 24) lt!240264) #b00000000000000000000000000000000) (tuple2!13657 Unit!9737 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240267) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) (bvadd (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240264)))))))) (tuple2!13657 Unit!9738 lt!240267))) (BitStream!5505 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) (bvadd (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) #b00000000000000000000000000000001) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))))))

(assert (=> b!153901 (= lt!240267 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3946 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))))) ((_ sign_extend 24) lt!240264))))))

(assert (=> b!153901 (= lt!240264 ((_ extract 7 0) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))))

(declare-fun lt!240269 () (_ BitVec 64))

(declare-fun b!153902 () Bool)

(declare-fun lt!240266 () (_ BitVec 64))

(assert (=> b!153902 (= e!103274 (= (bitIndex!0 (size!3123 (buf!3626 (_2!7222 lt!240265))) (currentByte!6627 (_2!7222 lt!240265)) (currentBit!6622 (_2!7222 lt!240265))) (bvadd lt!240266 lt!240269)))))

(assert (=> b!153902 (or (not (= (bvand lt!240266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240269 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240266 lt!240269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153902 (= lt!240269 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153902 (= lt!240266 (bitIndex!0 (size!3123 (buf!3626 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))) (currentByte!6627 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10))) (currentBit!6622 (BitStream!5505 (buf!3626 bs2!18) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))))

(assert (= (and d!50690 res!128887) b!153901))

(assert (= (and b!153901 res!128888) b!153902))

(declare-fun m!239839 () Bool)

(assert (=> d!50690 m!239839))

(declare-fun m!239841 () Bool)

(assert (=> d!50690 m!239841))

(declare-fun m!239843 () Bool)

(assert (=> d!50690 m!239843))

(assert (=> b!153901 m!239843))

(assert (=> b!153901 m!239839))

(declare-fun m!239845 () Bool)

(assert (=> b!153902 m!239845))

(declare-fun m!239847 () Bool)

(assert (=> b!153902 m!239847))

(assert (=> d!50646 d!50690))

(assert (=> d!50624 d!50686))

(declare-fun d!50692 () Bool)

(declare-fun lt!240270 () (_ BitVec 8))

(declare-fun lt!240275 () (_ BitVec 8))

(assert (=> d!50692 (= lt!240270 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs1!10)) (currentByte!6627 bs1!10))) ((_ sign_extend 24) lt!240275))))))

(assert (=> d!50692 (= lt!240275 ((_ extract 7 0) (currentBit!6622 bs1!10)))))

(declare-fun e!103277 () Bool)

(assert (=> d!50692 e!103277))

(declare-fun res!128889 () Bool)

(assert (=> d!50692 (=> (not res!128889) (not e!103277))))

(assert (=> d!50692 (= res!128889 (validate_offset_bits!1 ((_ sign_extend 32) (size!3123 (buf!3626 bs1!10))) ((_ sign_extend 32) (currentByte!6627 bs1!10)) ((_ sign_extend 32) (currentBit!6622 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9739 () Unit!9725)

(declare-fun Unit!9740 () Unit!9725)

(assert (=> d!50692 (= (readByte!0 bs1!10) (tuple2!13653 (_2!7224 (ite (bvsgt ((_ sign_extend 24) lt!240275) #b00000000000000000000000000000000) (tuple2!13657 Unit!9739 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240270) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs1!10)) (bvadd (currentByte!6627 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240275)))))))) (tuple2!13657 Unit!9740 lt!240270))) (BitStream!5505 (buf!3626 bs1!10) (bvadd (currentByte!6627 bs1!10) #b00000000000000000000000000000001) (currentBit!6622 bs1!10))))))

(declare-fun b!153903 () Bool)

(declare-fun e!103276 () Bool)

(assert (=> b!153903 (= e!103277 e!103276)))

(declare-fun res!128890 () Bool)

(assert (=> b!153903 (=> (not res!128890) (not e!103276))))

(declare-fun lt!240272 () tuple2!13652)

(assert (=> b!153903 (= res!128890 (= (buf!3626 (_2!7222 lt!240272)) (buf!3626 bs1!10)))))

(declare-fun lt!240271 () (_ BitVec 8))

(declare-fun lt!240274 () (_ BitVec 8))

(declare-fun Unit!9741 () Unit!9725)

(declare-fun Unit!9742 () Unit!9725)

(assert (=> b!153903 (= lt!240272 (tuple2!13653 (_2!7224 (ite (bvsgt ((_ sign_extend 24) lt!240271) #b00000000000000000000000000000000) (tuple2!13657 Unit!9741 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240274) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs1!10)) (bvadd (currentByte!6627 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240271)))))))) (tuple2!13657 Unit!9742 lt!240274))) (BitStream!5505 (buf!3626 bs1!10) (bvadd (currentByte!6627 bs1!10) #b00000000000000000000000000000001) (currentBit!6622 bs1!10))))))

(assert (=> b!153903 (= lt!240274 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs1!10)) (currentByte!6627 bs1!10))) ((_ sign_extend 24) lt!240271))))))

(assert (=> b!153903 (= lt!240271 ((_ extract 7 0) (currentBit!6622 bs1!10)))))

(declare-fun lt!240273 () (_ BitVec 64))

(declare-fun b!153904 () Bool)

(declare-fun lt!240276 () (_ BitVec 64))

(assert (=> b!153904 (= e!103276 (= (bitIndex!0 (size!3123 (buf!3626 (_2!7222 lt!240272))) (currentByte!6627 (_2!7222 lt!240272)) (currentBit!6622 (_2!7222 lt!240272))) (bvadd lt!240273 lt!240276)))))

(assert (=> b!153904 (or (not (= (bvand lt!240273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240276 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240273 lt!240276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153904 (= lt!240276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153904 (= lt!240273 (bitIndex!0 (size!3123 (buf!3626 bs1!10)) (currentByte!6627 bs1!10) (currentBit!6622 bs1!10)))))

(assert (= (and d!50692 res!128889) b!153903))

(assert (= (and b!153903 res!128890) b!153904))

(assert (=> d!50692 m!239669))

(declare-fun m!239849 () Bool)

(assert (=> d!50692 m!239849))

(declare-fun m!239851 () Bool)

(assert (=> d!50692 m!239851))

(assert (=> b!153903 m!239851))

(assert (=> b!153903 m!239669))

(declare-fun m!239853 () Bool)

(assert (=> b!153904 m!239853))

(assert (=> b!153904 m!239679))

(assert (=> d!50648 d!50692))

(declare-fun d!50694 () Bool)

(declare-fun res!128891 () Bool)

(declare-fun e!103278 () Bool)

(assert (=> d!50694 (=> res!128891 e!103278)))

(assert (=> d!50694 (= res!128891 (= (_1!7221 lt!240192) (_2!7221 lt!240192)))))

(assert (=> d!50694 (= (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (_1!7221 lt!240192) (_2!7221 lt!240192)) e!103278)))

(declare-fun b!153905 () Bool)

(declare-fun e!103279 () Bool)

(assert (=> b!153905 (= e!103278 e!103279)))

(declare-fun res!128892 () Bool)

(assert (=> b!153905 (=> (not res!128892) (not e!103279))))

(assert (=> b!153905 (= res!128892 (= (select (arr!3946 (buf!3626 bs1!10)) (_1!7221 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_1!7221 lt!240192))))))

(declare-fun b!153906 () Bool)

(assert (=> b!153906 (= e!103279 (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (bvadd (_1!7221 lt!240192) #b00000000000000000000000000000001) (_2!7221 lt!240192)))))

(assert (= (and d!50694 (not res!128891)) b!153905))

(assert (= (and b!153905 res!128892) b!153906))

(declare-fun m!239855 () Bool)

(assert (=> b!153905 m!239855))

(declare-fun m!239857 () Bool)

(assert (=> b!153905 m!239857))

(declare-fun m!239859 () Bool)

(assert (=> b!153906 m!239859))

(assert (=> b!153868 d!50694))

(declare-fun d!50696 () Bool)

(assert (=> d!50696 (= (byteRangesEq!0 (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192)) lt!240191 #b00000000000000000000000000001000) (or (= lt!240191 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240191)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240191)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12392 () Bool)

(assert (= bs!12392 d!50696))

(declare-fun m!239861 () Bool)

(assert (=> bs!12392 m!239861))

(declare-fun m!239863 () Bool)

(assert (=> bs!12392 m!239863))

(assert (=> b!153865 d!50696))

(declare-fun d!50698 () Bool)

(assert (=> d!50698 (= (select (arr!3946 (buf!3626 bs1!10)) (currentByte!6627 bs1!10)) (select (arr!3946 (buf!3626 bs2!18)) (currentByte!6627 bs1!10)))))

(assert (=> d!50698 true))

(declare-fun _$12!69 () Unit!9725)

(assert (=> d!50698 (= (choose!109 (buf!3626 bs1!10) (buf!3626 bs2!18) #b00000000000000000000000000000000 (currentByte!6627 bs1!10) lt!240096) _$12!69)))

(declare-fun bs!12393 () Bool)

(assert (= bs!12393 d!50698))

(assert (=> bs!12393 m!239669))

(assert (=> bs!12393 m!239671))

(assert (=> d!50634 d!50698))

(declare-fun d!50700 () Bool)

(declare-fun res!128893 () Bool)

(declare-fun e!103280 () Bool)

(assert (=> d!50700 (=> res!128893 e!103280)))

(assert (=> d!50700 (= res!128893 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240096))))

(assert (=> d!50700 (= (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240096) e!103280)))

(declare-fun b!153907 () Bool)

(declare-fun e!103281 () Bool)

(assert (=> b!153907 (= e!103280 e!103281)))

(declare-fun res!128894 () Bool)

(assert (=> b!153907 (=> (not res!128894) (not e!103281))))

(assert (=> b!153907 (= res!128894 (= (select (arr!3946 (buf!3626 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3946 (buf!3626 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153908 () Bool)

(assert (=> b!153908 (= e!103281 (arrayRangesEq!385 (buf!3626 bs1!10) (buf!3626 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!240096))))

(assert (= (and d!50700 (not res!128893)) b!153907))

(assert (= (and b!153907 res!128894) b!153908))

(declare-fun m!239865 () Bool)

(assert (=> b!153907 m!239865))

(declare-fun m!239867 () Bool)

(assert (=> b!153907 m!239867))

(declare-fun m!239869 () Bool)

(assert (=> b!153908 m!239869))

(assert (=> b!153876 d!50700))

(declare-fun d!50702 () Bool)

(assert (=> d!50702 (= (byteRangesEq!0 (ite c!8202 (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs1!10)) (_4!92 lt!240192))) (ite c!8202 (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_4!92 lt!240192))) (ite c!8202 lt!240191 #b00000000000000000000000000000000) lt!240190) (or (= (ite c!8202 lt!240191 #b00000000000000000000000000000000) lt!240190) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8202 (select (arr!3946 (buf!3626 bs1!10)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs1!10)) (_4!92 lt!240192)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240190))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8202 lt!240191 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8202 (select (arr!3946 (buf!3626 bs2!18)) (_3!395 lt!240192)) (select (arr!3946 (buf!3626 bs2!18)) (_4!92 lt!240192)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240190))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8202 lt!240191 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!12394 () Bool)

(assert (= bs!12394 d!50702))

(declare-fun m!239871 () Bool)

(assert (=> bs!12394 m!239871))

(declare-fun m!239873 () Bool)

(assert (=> bs!12394 m!239873))

(assert (=> bm!2183 d!50702))

(push 1)

(assert (not d!50690))

(assert (not b!153908))

(assert (not b!153906))

(assert (not d!50692))

(assert (not b!153904))

(assert (not b!153902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

