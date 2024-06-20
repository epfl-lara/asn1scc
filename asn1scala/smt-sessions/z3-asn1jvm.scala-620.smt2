; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17586 () Bool)

(assert start!17586)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!4022 0))(
  ( (array!4023 (arr!2455 (Array (_ BitVec 32) (_ BitVec 8))) (size!1818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3198 0))(
  ( (BitStream!3199 (buf!2208 array!4022) (currentByte!4387 (_ BitVec 32)) (currentBit!4382 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3198)

(declare-fun b!84733 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-datatypes ((Unit!5677 0))(
  ( (Unit!5678) )
))
(declare-datatypes ((tuple3!378 0))(
  ( (tuple3!379 (_1!3839 Unit!5677) (_2!3839 BitStream!3198) (_3!213 (_ BitVec 32))) )
))
(declare-fun e!56553 () tuple3!378)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3198 (_ BitVec 64) BitStream!3198 (_ BitVec 32)) tuple3!378)

(assert (=> b!84733 (= e!56553 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84734 () Bool)

(declare-fun e!56552 () Bool)

(declare-fun e!56555 () Bool)

(assert (=> b!84734 (= e!56552 e!56555)))

(declare-fun res!69520 () Bool)

(assert (=> b!84734 (=> res!69520 e!56555)))

(declare-fun lt!134409 () tuple3!378)

(assert (=> b!84734 (= res!69520 (not (= (size!1818 (buf!2208 (_2!3839 lt!134409))) (size!1818 (buf!2208 thiss!1136)))))))

(assert (=> b!84734 (= lt!134409 e!56553)))

(declare-fun c!5837 () Bool)

(assert (=> b!84734 (= c!5837 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84735 () Bool)

(declare-fun e!56556 () Bool)

(declare-fun array_inv!1664 (array!4022) Bool)

(assert (=> b!84735 (= e!56556 (array_inv!1664 (buf!2208 thiss!1136)))))

(declare-fun res!69523 () Bool)

(assert (=> start!17586 (=> (not res!69523) (not e!56552))))

(assert (=> start!17586 (= res!69523 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17586 e!56552))

(assert (=> start!17586 true))

(declare-fun inv!12 (BitStream!3198) Bool)

(assert (=> start!17586 (and (inv!12 thiss!1136) e!56556)))

(declare-fun b!84736 () Bool)

(declare-fun Unit!5679 () Unit!5677)

(assert (=> b!84736 (= e!56553 (tuple3!379 Unit!5679 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84737 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84737 (= e!56555 (not (= (bitIndex!0 (size!1818 (buf!2208 (_2!3839 lt!134409))) (currentByte!4387 (_2!3839 lt!134409)) (currentBit!4382 (_2!3839 lt!134409))) (bvadd (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)) ((_ sign_extend 32) nBits!333)))))))

(declare-fun b!84738 () Bool)

(declare-fun res!69521 () Bool)

(assert (=> b!84738 (=> (not res!69521) (not e!56552))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84738 (= res!69521 (invariant!0 (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136))))))

(declare-fun b!84739 () Bool)

(declare-fun res!69522 () Bool)

(assert (=> b!84739 (=> (not res!69522) (not e!56552))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84739 (= res!69522 (validate_offset_bits!1 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))) ((_ sign_extend 32) (currentByte!4387 thiss!1136)) ((_ sign_extend 32) (currentBit!4382 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(assert (= (and start!17586 res!69523) b!84739))

(assert (= (and b!84739 res!69522) b!84738))

(assert (= (and b!84738 res!69521) b!84734))

(assert (= (and b!84734 c!5837) b!84733))

(assert (= (and b!84734 (not c!5837)) b!84736))

(assert (= (and b!84734 (not res!69520)) b!84737))

(assert (= start!17586 b!84735))

(declare-fun m!131173 () Bool)

(assert (=> b!84737 m!131173))

(declare-fun m!131175 () Bool)

(assert (=> b!84737 m!131175))

(declare-fun m!131177 () Bool)

(assert (=> b!84738 m!131177))

(declare-fun m!131179 () Bool)

(assert (=> start!17586 m!131179))

(declare-fun m!131181 () Bool)

(assert (=> b!84739 m!131181))

(declare-fun m!131183 () Bool)

(assert (=> b!84733 m!131183))

(declare-fun m!131185 () Bool)

(assert (=> b!84735 m!131185))

(check-sat (not b!84739) (not b!84733) (not b!84735) (not b!84737) (not start!17586) (not b!84738))
(check-sat)
(get-model)

(declare-fun d!27236 () Bool)

(assert (=> d!27236 (= (invariant!0 (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136))) (and (bvsge (currentBit!4382 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4382 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4387 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136))) (and (= (currentBit!4382 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136)))))))))

(assert (=> b!84738 d!27236))

(declare-fun d!27238 () Bool)

(declare-fun e!56612 () Bool)

(assert (=> d!27238 e!56612))

(declare-fun res!69641 () Bool)

(assert (=> d!27238 (=> (not res!69641) (not e!56612))))

(declare-fun lt!134524 () (_ BitVec 64))

(declare-fun lt!134526 () (_ BitVec 64))

(declare-fun lt!134522 () (_ BitVec 64))

(assert (=> d!27238 (= res!69641 (= lt!134524 (bvsub lt!134526 lt!134522)))))

(assert (=> d!27238 (or (= (bvand lt!134526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134526 lt!134522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27238 (= lt!134522 (remainingBits!0 ((_ sign_extend 32) (size!1818 (buf!2208 (_2!3839 lt!134409)))) ((_ sign_extend 32) (currentByte!4387 (_2!3839 lt!134409))) ((_ sign_extend 32) (currentBit!4382 (_2!3839 lt!134409)))))))

(declare-fun lt!134525 () (_ BitVec 64))

(declare-fun lt!134521 () (_ BitVec 64))

(assert (=> d!27238 (= lt!134526 (bvmul lt!134525 lt!134521))))

(assert (=> d!27238 (or (= lt!134525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134521 (bvsdiv (bvmul lt!134525 lt!134521) lt!134525)))))

(assert (=> d!27238 (= lt!134521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27238 (= lt!134525 ((_ sign_extend 32) (size!1818 (buf!2208 (_2!3839 lt!134409)))))))

(assert (=> d!27238 (= lt!134524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4387 (_2!3839 lt!134409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4382 (_2!3839 lt!134409)))))))

(assert (=> d!27238 (invariant!0 (currentBit!4382 (_2!3839 lt!134409)) (currentByte!4387 (_2!3839 lt!134409)) (size!1818 (buf!2208 (_2!3839 lt!134409))))))

(assert (=> d!27238 (= (bitIndex!0 (size!1818 (buf!2208 (_2!3839 lt!134409))) (currentByte!4387 (_2!3839 lt!134409)) (currentBit!4382 (_2!3839 lt!134409))) lt!134524)))

(declare-fun b!84877 () Bool)

(declare-fun res!69640 () Bool)

(assert (=> b!84877 (=> (not res!69640) (not e!56612))))

(assert (=> b!84877 (= res!69640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134524))))

(declare-fun b!84878 () Bool)

(declare-fun lt!134523 () (_ BitVec 64))

(assert (=> b!84878 (= e!56612 (bvsle lt!134524 (bvmul lt!134523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84878 (or (= lt!134523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134523)))))

(assert (=> b!84878 (= lt!134523 ((_ sign_extend 32) (size!1818 (buf!2208 (_2!3839 lt!134409)))))))

(assert (= (and d!27238 res!69641) b!84877))

(assert (= (and b!84877 res!69640) b!84878))

(declare-fun m!131257 () Bool)

(assert (=> d!27238 m!131257))

(declare-fun m!131259 () Bool)

(assert (=> d!27238 m!131259))

(assert (=> b!84737 d!27238))

(declare-fun d!27240 () Bool)

(declare-fun e!56613 () Bool)

(assert (=> d!27240 e!56613))

(declare-fun res!69643 () Bool)

(assert (=> d!27240 (=> (not res!69643) (not e!56613))))

(declare-fun lt!134532 () (_ BitVec 64))

(declare-fun lt!134530 () (_ BitVec 64))

(declare-fun lt!134528 () (_ BitVec 64))

(assert (=> d!27240 (= res!69643 (= lt!134530 (bvsub lt!134532 lt!134528)))))

(assert (=> d!27240 (or (= (bvand lt!134532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134532 lt!134528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27240 (= lt!134528 (remainingBits!0 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))) ((_ sign_extend 32) (currentByte!4387 thiss!1136)) ((_ sign_extend 32) (currentBit!4382 thiss!1136))))))

(declare-fun lt!134531 () (_ BitVec 64))

(declare-fun lt!134527 () (_ BitVec 64))

(assert (=> d!27240 (= lt!134532 (bvmul lt!134531 lt!134527))))

(assert (=> d!27240 (or (= lt!134531 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134527 (bvsdiv (bvmul lt!134531 lt!134527) lt!134531)))))

(assert (=> d!27240 (= lt!134527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27240 (= lt!134531 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))))))

(assert (=> d!27240 (= lt!134530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4387 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4382 thiss!1136))))))

(assert (=> d!27240 (invariant!0 (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136)))))

(assert (=> d!27240 (= (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)) lt!134530)))

(declare-fun b!84879 () Bool)

(declare-fun res!69642 () Bool)

(assert (=> b!84879 (=> (not res!69642) (not e!56613))))

(assert (=> b!84879 (= res!69642 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134530))))

(declare-fun b!84880 () Bool)

(declare-fun lt!134529 () (_ BitVec 64))

(assert (=> b!84880 (= e!56613 (bvsle lt!134530 (bvmul lt!134529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84880 (or (= lt!134529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134529)))))

(assert (=> b!84880 (= lt!134529 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))))))

(assert (= (and d!27240 res!69643) b!84879))

(assert (= (and b!84879 res!69642) b!84880))

(declare-fun m!131261 () Bool)

(assert (=> d!27240 m!131261))

(assert (=> d!27240 m!131177))

(assert (=> b!84737 d!27240))

(declare-fun d!27242 () Bool)

(assert (=> d!27242 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))) ((_ sign_extend 32) (currentByte!4387 thiss!1136)) ((_ sign_extend 32) (currentBit!4382 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))) ((_ sign_extend 32) (currentByte!4387 thiss!1136)) ((_ sign_extend 32) (currentBit!4382 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6741 () Bool)

(assert (= bs!6741 d!27242))

(assert (=> bs!6741 m!131261))

(assert (=> b!84739 d!27242))

(declare-fun b!84913 () Bool)

(declare-fun res!69683 () Bool)

(declare-fun e!56625 () Bool)

(assert (=> b!84913 (=> (not res!69683) (not e!56625))))

(declare-datatypes ((tuple2!7260 0))(
  ( (tuple2!7261 (_1!3845 Unit!5677) (_2!3845 BitStream!3198)) )
))
(declare-fun lt!134551 () tuple2!7260)

(assert (=> b!84913 (= res!69683 (= (bitIndex!0 (size!1818 (buf!2208 (_2!3845 lt!134551))) (currentByte!4387 (_2!3845 lt!134551)) (currentBit!4382 (_2!3845 lt!134551))) (bvadd (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84914 () Bool)

(declare-fun e!56626 () Bool)

(declare-fun lt!134556 () tuple3!378)

(assert (=> b!84914 (= e!56626 (bvsge (_3!213 lt!134556) nBits!333))))

(declare-fun b!84915 () Bool)

(declare-fun e!56628 () Bool)

(declare-datatypes ((tuple2!7262 0))(
  ( (tuple2!7263 (_1!3846 BitStream!3198) (_2!3846 Bool)) )
))
(declare-fun lt!134552 () tuple2!7262)

(assert (=> b!84915 (= e!56628 (= (bitIndex!0 (size!1818 (buf!2208 (_1!3846 lt!134552))) (currentByte!4387 (_1!3846 lt!134552)) (currentBit!4382 (_1!3846 lt!134552))) (bitIndex!0 (size!1818 (buf!2208 (_2!3845 lt!134551))) (currentByte!4387 (_2!3845 lt!134551)) (currentBit!4382 (_2!3845 lt!134551)))))))

(declare-fun b!84916 () Bool)

(declare-fun e!56627 () Bool)

(assert (=> b!84916 (= e!56627 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun lt!134555 () (_ BitVec 32))

(declare-fun b!84917 () Bool)

(declare-fun lt!134554 () tuple2!7260)

(declare-fun e!56624 () tuple3!378)

(assert (=> b!84917 (= e!56624 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3845 lt!134554) lt!134555))))

(declare-fun b!84918 () Bool)

(declare-fun Unit!5685 () Unit!5677)

(assert (=> b!84918 (= e!56624 (tuple3!379 Unit!5685 (_2!3845 lt!134554) lt!134555))))

(declare-fun b!84919 () Bool)

(declare-fun res!69675 () Bool)

(assert (=> b!84919 (=> (not res!69675) (not e!56627))))

(assert (=> b!84919 (= res!69675 (invariant!0 (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136))))))

(declare-fun b!84920 () Bool)

(declare-fun res!69680 () Bool)

(assert (=> b!84920 (=> (not res!69680) (not e!56627))))

(assert (=> b!84920 (= res!69680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1818 (buf!2208 thiss!1136))) ((_ sign_extend 32) (currentByte!4387 thiss!1136)) ((_ sign_extend 32) (currentBit!4382 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84921 () Bool)

(declare-fun res!69676 () Bool)

(assert (=> b!84921 (=> (not res!69676) (not e!56626))))

(assert (=> b!84921 (= res!69676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1818 (buf!2208 (_2!3839 lt!134556)))) ((_ sign_extend 32) (currentByte!4387 (_2!3839 lt!134556))) ((_ sign_extend 32) (currentBit!4382 (_2!3839 lt!134556))) ((_ sign_extend 32) (bvsub nBits!333 (_3!213 lt!134556)))))))

(assert (=> b!84921 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!213 lt!134556) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!213 lt!134556)) #b10000000000000000000000000000000)))))

(declare-fun b!84922 () Bool)

(declare-fun res!69685 () Bool)

(assert (=> b!84922 (=> (not res!69685) (not e!56627))))

(assert (=> b!84922 (= res!69685 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1818 (buf!2208 thiss!1136)) (size!1818 (buf!2208 thiss!1136)))))))

(declare-fun d!27244 () Bool)

(assert (=> d!27244 e!56626))

(declare-fun res!69684 () Bool)

(assert (=> d!27244 (=> (not res!69684) (not e!56626))))

(assert (=> d!27244 (= res!69684 (bvsge (_3!213 lt!134556) #b00000000000000000000000000000000))))

(assert (=> d!27244 (= lt!134556 e!56624)))

(declare-fun c!5849 () Bool)

(assert (=> d!27244 (= c!5849 (bvslt lt!134555 nBits!333))))

(assert (=> d!27244 (= lt!134555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27244 (= lt!134554 lt!134551)))

(assert (=> d!27244 e!56625))

(declare-fun res!69682 () Bool)

(assert (=> d!27244 (=> (not res!69682) (not e!56625))))

(assert (=> d!27244 (= res!69682 (= (size!1818 (buf!2208 thiss!1136)) (size!1818 (buf!2208 (_2!3845 lt!134551)))))))

(declare-fun lt!134553 () Bool)

(declare-fun appendBit!0 (BitStream!3198 Bool) tuple2!7260)

(assert (=> d!27244 (= lt!134551 (appendBit!0 thiss!1136 lt!134553))))

(assert (=> d!27244 (= lt!134553 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27244 e!56627))

(declare-fun res!69678 () Bool)

(assert (=> d!27244 (=> (not res!69678) (not e!56627))))

(assert (=> d!27244 (= res!69678 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27244 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134556)))

(declare-fun b!84923 () Bool)

(declare-fun res!69674 () Bool)

(assert (=> b!84923 (=> (not res!69674) (not e!56626))))

(assert (=> b!84923 (= res!69674 (invariant!0 (currentBit!4382 (_2!3839 lt!134556)) (currentByte!4387 (_2!3839 lt!134556)) (size!1818 (buf!2208 (_2!3839 lt!134556)))))))

(declare-fun b!84924 () Bool)

(assert (=> b!84924 (= e!56625 e!56628)))

(declare-fun res!69677 () Bool)

(assert (=> b!84924 (=> (not res!69677) (not e!56628))))

(assert (=> b!84924 (= res!69677 (and (= (_2!3846 lt!134552) lt!134553) (= (_1!3846 lt!134552) (_2!3845 lt!134551))))))

(declare-fun readBitPure!0 (BitStream!3198) tuple2!7262)

(declare-fun readerFrom!0 (BitStream!3198 (_ BitVec 32) (_ BitVec 32)) BitStream!3198)

(assert (=> b!84924 (= lt!134552 (readBitPure!0 (readerFrom!0 (_2!3845 lt!134551) (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136))))))

(declare-fun b!84925 () Bool)

(declare-fun res!69673 () Bool)

(assert (=> b!84925 (=> (not res!69673) (not e!56627))))

(assert (=> b!84925 (= res!69673 (= (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)) (bvadd (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84926 () Bool)

(declare-fun res!69672 () Bool)

(assert (=> b!84926 (=> (not res!69672) (not e!56625))))

(declare-fun isPrefixOf!0 (BitStream!3198 BitStream!3198) Bool)

(assert (=> b!84926 (= res!69672 (isPrefixOf!0 thiss!1136 (_2!3845 lt!134551)))))

(declare-fun b!84927 () Bool)

(declare-fun res!69679 () Bool)

(assert (=> b!84927 (=> (not res!69679) (not e!56626))))

(assert (=> b!84927 (= res!69679 (and (bvsle (_3!213 lt!134556) nBits!333) (= (size!1818 (buf!2208 (_2!3839 lt!134556))) (size!1818 (buf!2208 thiss!1136)))))))

(declare-fun b!84928 () Bool)

(declare-fun res!69681 () Bool)

(assert (=> b!84928 (=> (not res!69681) (not e!56626))))

(declare-fun lt!134549 () (_ BitVec 64))

(declare-fun lt!134550 () (_ BitVec 64))

(assert (=> b!84928 (= res!69681 (= (bitIndex!0 (size!1818 (buf!2208 (_2!3839 lt!134556))) (currentByte!4387 (_2!3839 lt!134556)) (currentBit!4382 (_2!3839 lt!134556))) (bvadd lt!134550 lt!134549)))))

(assert (=> b!84928 (or (not (= (bvand lt!134550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134549 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134550 lt!134549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84928 (= lt!134549 ((_ sign_extend 32) (_3!213 lt!134556)))))

(assert (=> b!84928 (= lt!134550 (bitIndex!0 (size!1818 (buf!2208 thiss!1136)) (currentByte!4387 thiss!1136) (currentBit!4382 thiss!1136)))))

(assert (= (and d!27244 res!69678) b!84919))

(assert (= (and b!84919 res!69675) b!84922))

(assert (= (and b!84922 res!69685) b!84925))

(assert (= (and b!84925 res!69673) b!84920))

(assert (= (and b!84920 res!69680) b!84916))

(assert (= (and d!27244 res!69682) b!84913))

(assert (= (and b!84913 res!69683) b!84926))

(assert (= (and b!84926 res!69672) b!84924))

(assert (= (and b!84924 res!69677) b!84915))

(assert (= (and d!27244 c!5849) b!84917))

(assert (= (and d!27244 (not c!5849)) b!84918))

(assert (= (and d!27244 res!69684) b!84923))

(assert (= (and b!84923 res!69674) b!84927))

(assert (= (and b!84927 res!69679) b!84928))

(assert (= (and b!84928 res!69681) b!84921))

(assert (= (and b!84921 res!69676) b!84914))

(declare-fun m!131263 () Bool)

(assert (=> b!84920 m!131263))

(declare-fun m!131265 () Bool)

(assert (=> b!84924 m!131265))

(assert (=> b!84924 m!131265))

(declare-fun m!131267 () Bool)

(assert (=> b!84924 m!131267))

(declare-fun m!131269 () Bool)

(assert (=> b!84917 m!131269))

(declare-fun m!131271 () Bool)

(assert (=> b!84915 m!131271))

(declare-fun m!131273 () Bool)

(assert (=> b!84915 m!131273))

(assert (=> b!84913 m!131273))

(assert (=> b!84913 m!131175))

(declare-fun m!131275 () Bool)

(assert (=> b!84923 m!131275))

(declare-fun m!131277 () Bool)

(assert (=> b!84921 m!131277))

(assert (=> b!84925 m!131175))

(assert (=> b!84925 m!131175))

(declare-fun m!131279 () Bool)

(assert (=> b!84926 m!131279))

(declare-fun m!131281 () Bool)

(assert (=> d!27244 m!131281))

(assert (=> b!84919 m!131177))

(declare-fun m!131283 () Bool)

(assert (=> b!84928 m!131283))

(assert (=> b!84928 m!131175))

(assert (=> b!84733 d!27244))

(declare-fun d!27246 () Bool)

(assert (=> d!27246 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4382 thiss!1136) (currentByte!4387 thiss!1136) (size!1818 (buf!2208 thiss!1136))))))

(declare-fun bs!6742 () Bool)

(assert (= bs!6742 d!27246))

(assert (=> bs!6742 m!131177))

(assert (=> start!17586 d!27246))

(declare-fun d!27248 () Bool)

(assert (=> d!27248 (= (array_inv!1664 (buf!2208 thiss!1136)) (bvsge (size!1818 (buf!2208 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84735 d!27248))

(check-sat (not b!84921) (not b!84924) (not d!27240) (not d!27238) (not b!84920) (not b!84926) (not b!84923) (not b!84913) (not d!27242) (not b!84925) (not d!27244) (not b!84915) (not b!84928) (not d!27246) (not b!84919) (not b!84917))
(check-sat)
