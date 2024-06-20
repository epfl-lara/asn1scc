; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63398 () Bool)

(assert start!63398)

(declare-fun res!235064 () Bool)

(declare-fun e!202582 () Bool)

(assert (=> start!63398 (=> (not res!235064) (not e!202582))))

(declare-datatypes ((array!16499 0))(
  ( (array!16500 (arr!8121 (Array (_ BitVec 32) (_ BitVec 8))) (size!7125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12620 0))(
  ( (BitStream!12621 (buf!7371 array!16499) (currentByte!13648 (_ BitVec 32)) (currentBit!13643 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12620)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63398 (= res!235064 (validate_offset_bits!1 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13648 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13643 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63398 e!202582))

(declare-fun e!202583 () Bool)

(declare-fun inv!12 (BitStream!12620) Bool)

(assert (=> start!63398 (and (inv!12 thiss!1939) e!202583)))

(declare-fun b!283655 () Bool)

(declare-datatypes ((Unit!19851 0))(
  ( (Unit!19852) )
))
(declare-datatypes ((tuple2!22594 0))(
  ( (tuple2!22595 (_1!12491 Unit!19851) (_2!12491 BitStream!12620)) )
))
(declare-fun lt!417984 () tuple2!22594)

(assert (=> b!283655 (= e!202582 (not (inv!12 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984))))))))

(declare-fun alignToByte!0 (BitStream!12620) tuple2!22594)

(assert (=> b!283655 (= lt!417984 (alignToByte!0 thiss!1939))))

(declare-fun b!283656 () Bool)

(declare-fun array_inv!6818 (array!16499) Bool)

(assert (=> b!283656 (= e!202583 (array_inv!6818 (buf!7371 thiss!1939)))))

(assert (= (and start!63398 res!235064) b!283655))

(assert (= start!63398 b!283656))

(declare-fun m!416727 () Bool)

(assert (=> start!63398 m!416727))

(declare-fun m!416729 () Bool)

(assert (=> start!63398 m!416729))

(declare-fun m!416731 () Bool)

(assert (=> b!283655 m!416731))

(declare-fun m!416733 () Bool)

(assert (=> b!283655 m!416733))

(declare-fun m!416735 () Bool)

(assert (=> b!283656 m!416735))

(push 1)

(assert (not b!283656))

(assert (not b!283655))

(assert (not start!63398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97380 () Bool)

(assert (=> d!97380 (= (array_inv!6818 (buf!7371 thiss!1939)) (bvsge (size!7125 (buf!7371 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283656 d!97380))

(declare-fun d!97386 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97386 (= (inv!12 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (invariant!0 (currentBit!13643 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (currentByte!13648 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (size!7125 (buf!7371 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))))))))

(declare-fun bs!24589 () Bool)

(assert (= bs!24589 d!97386))

(declare-fun m!416745 () Bool)

(assert (=> bs!24589 m!416745))

(assert (=> b!283655 d!97386))

(declare-fun d!97388 () Bool)

(declare-fun e!202596 () Bool)

(assert (=> d!97388 e!202596))

(declare-fun res!235076 () Bool)

(assert (=> d!97388 (=> (not res!235076) (not e!202596))))

(assert (=> d!97388 (= res!235076 (validate_offset_bits!1 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13643 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19857 () Unit!19851)

(declare-fun Unit!19858 () Unit!19851)

(assert (=> d!97388 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13643 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22595 Unit!19857 (BitStream!12621 (buf!7371 thiss!1939) (bvadd (currentByte!13648 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22595 Unit!19858 thiss!1939)))))

(declare-fun b!283667 () Bool)

(declare-fun e!202595 () Bool)

(assert (=> b!283667 (= e!202596 e!202595)))

(declare-fun res!235075 () Bool)

(assert (=> b!283667 (=> (not res!235075) (not e!202595))))

(declare-fun lt!418002 () tuple2!22594)

(assert (=> b!283667 (= res!235075 (= (buf!7371 (_2!12491 lt!418002)) (buf!7371 thiss!1939)))))

(declare-fun Unit!19859 () Unit!19851)

(declare-fun Unit!19860 () Unit!19851)

(assert (=> b!283667 (= lt!418002 (ite (not (= (currentBit!13643 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22595 Unit!19859 (BitStream!12621 (buf!7371 thiss!1939) (bvadd (currentByte!13648 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22595 Unit!19860 thiss!1939)))))

(declare-fun lt!418000 () (_ BitVec 64))

(declare-fun lt!418001 () (_ BitVec 64))

(declare-fun b!283668 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283668 (= e!202595 (bvsle (bitIndex!0 (size!7125 (buf!7371 (_2!12491 lt!418002))) (currentByte!13648 (_2!12491 lt!418002)) (currentBit!13643 (_2!12491 lt!418002))) (bvadd lt!418000 lt!418001)))))

(assert (=> b!283668 (or (not (= (bvand lt!418000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!418000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!418000 lt!418001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283668 (= lt!418001 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283668 (= lt!418000 (bitIndex!0 (size!7125 (buf!7371 thiss!1939)) (currentByte!13648 thiss!1939) (currentBit!13643 thiss!1939)))))

(assert (= (and d!97388 res!235076) b!283667))

(assert (= (and b!283667 res!235075) b!283668))

(declare-fun m!416753 () Bool)

(assert (=> d!97388 m!416753))

(declare-fun m!416755 () Bool)

(assert (=> b!283668 m!416755))

(declare-fun m!416757 () Bool)

(assert (=> b!283668 m!416757))

(assert (=> b!283655 d!97388))

(declare-fun d!97390 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13648 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13643 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13648 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13643 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24590 () Bool)

(assert (= bs!24590 d!97390))

(declare-fun m!416759 () Bool)

(assert (=> bs!24590 m!416759))

(assert (=> start!63398 d!97390))

(declare-fun d!97392 () Bool)

(assert (=> d!97392 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13643 thiss!1939) (currentByte!13648 thiss!1939) (size!7125 (buf!7371 thiss!1939))))))

(declare-fun bs!24591 () Bool)

(assert (= bs!24591 d!97392))

(declare-fun m!416761 () Bool)

(assert (=> bs!24591 m!416761))

(assert (=> start!63398 d!97392))

(push 1)

(assert (not b!283668))

(assert (not d!97392))

(assert (not d!97386))

(assert (not d!97390))

(assert (not d!97388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97416 () Bool)

(assert (=> d!97416 (= (remainingBits!0 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13648 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13643 thiss!1939)))))))

(assert (=> d!97390 d!97416))

(declare-fun d!97418 () Bool)

(assert (=> d!97418 (= (invariant!0 (currentBit!13643 thiss!1939) (currentByte!13648 thiss!1939) (size!7125 (buf!7371 thiss!1939))) (and (bvsge (currentBit!13643 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13643 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13648 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13648 thiss!1939) (size!7125 (buf!7371 thiss!1939))) (and (= (currentBit!13643 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13648 thiss!1939) (size!7125 (buf!7371 thiss!1939)))))))))

(assert (=> d!97392 d!97418))

(declare-fun d!97420 () Bool)

(assert (=> d!97420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13643 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13643 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24596 () Bool)

(assert (= bs!24596 d!97420))

(assert (=> bs!24596 m!416759))

(assert (=> d!97388 d!97420))

(declare-fun d!97422 () Bool)

(assert (=> d!97422 (= (invariant!0 (currentBit!13643 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (currentByte!13648 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (size!7125 (buf!7371 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))))) (and (bvsge (currentBit!13643 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) #b00000000000000000000000000000000) (bvslt (currentBit!13643 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) #b00000000000000000000000000001000) (bvsge (currentByte!13648 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13648 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (size!7125 (buf!7371 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))))) (and (= (currentBit!13643 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) #b00000000000000000000000000000000) (= (currentByte!13648 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984)))) (size!7125 (buf!7371 (BitStream!12621 (buf!7371 (_2!12491 lt!417984)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13648 (_2!12491 lt!417984))) #b00000000000000000000000000000010)) (currentBit!13643 (_2!12491 lt!417984))))))))))))

(assert (=> d!97386 d!97422))

(declare-fun d!97424 () Bool)

(declare-fun e!202613 () Bool)

(assert (=> d!97424 e!202613))

(declare-fun res!235104 () Bool)

(assert (=> d!97424 (=> (not res!235104) (not e!202613))))

(declare-fun lt!418075 () (_ BitVec 64))

(declare-fun lt!418077 () (_ BitVec 64))

(declare-fun lt!418074 () (_ BitVec 64))

(assert (=> d!97424 (= res!235104 (= lt!418074 (bvsub lt!418077 lt!418075)))))

(assert (=> d!97424 (or (= (bvand lt!418077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418077 lt!418075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97424 (= lt!418075 (remainingBits!0 ((_ sign_extend 32) (size!7125 (buf!7371 (_2!12491 lt!418002)))) ((_ sign_extend 32) (currentByte!13648 (_2!12491 lt!418002))) ((_ sign_extend 32) (currentBit!13643 (_2!12491 lt!418002)))))))

(declare-fun lt!418076 () (_ BitVec 64))

(declare-fun lt!418073 () (_ BitVec 64))

(assert (=> d!97424 (= lt!418077 (bvmul lt!418076 lt!418073))))

(assert (=> d!97424 (or (= lt!418076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418073 (bvsdiv (bvmul lt!418076 lt!418073) lt!418076)))))

(assert (=> d!97424 (= lt!418073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97424 (= lt!418076 ((_ sign_extend 32) (size!7125 (buf!7371 (_2!12491 lt!418002)))))))

(assert (=> d!97424 (= lt!418074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13648 (_2!12491 lt!418002))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13643 (_2!12491 lt!418002)))))))

(assert (=> d!97424 (invariant!0 (currentBit!13643 (_2!12491 lt!418002)) (currentByte!13648 (_2!12491 lt!418002)) (size!7125 (buf!7371 (_2!12491 lt!418002))))))

(assert (=> d!97424 (= (bitIndex!0 (size!7125 (buf!7371 (_2!12491 lt!418002))) (currentByte!13648 (_2!12491 lt!418002)) (currentBit!13643 (_2!12491 lt!418002))) lt!418074)))

(declare-fun b!283695 () Bool)

(declare-fun res!235103 () Bool)

(assert (=> b!283695 (=> (not res!235103) (not e!202613))))

(assert (=> b!283695 (= res!235103 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418074))))

(declare-fun b!283696 () Bool)

(declare-fun lt!418072 () (_ BitVec 64))

(assert (=> b!283696 (= e!202613 (bvsle lt!418074 (bvmul lt!418072 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283696 (or (= lt!418072 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418072 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418072)))))

(assert (=> b!283696 (= lt!418072 ((_ sign_extend 32) (size!7125 (buf!7371 (_2!12491 lt!418002)))))))

(assert (= (and d!97424 res!235104) b!283695))

(assert (= (and b!283695 res!235103) b!283696))

(declare-fun m!416781 () Bool)

(assert (=> d!97424 m!416781))

(declare-fun m!416783 () Bool)

(assert (=> d!97424 m!416783))

(assert (=> b!283668 d!97424))

(declare-fun d!97434 () Bool)

(declare-fun e!202614 () Bool)

(assert (=> d!97434 e!202614))

(declare-fun res!235106 () Bool)

(assert (=> d!97434 (=> (not res!235106) (not e!202614))))

(declare-fun lt!418083 () (_ BitVec 64))

(declare-fun lt!418081 () (_ BitVec 64))

(declare-fun lt!418080 () (_ BitVec 64))

(assert (=> d!97434 (= res!235106 (= lt!418080 (bvsub lt!418083 lt!418081)))))

(assert (=> d!97434 (or (= (bvand lt!418083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418083 lt!418081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97434 (= lt!418081 (remainingBits!0 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))) ((_ sign_extend 32) (currentByte!13648 thiss!1939)) ((_ sign_extend 32) (currentBit!13643 thiss!1939))))))

(declare-fun lt!418082 () (_ BitVec 64))

(declare-fun lt!418079 () (_ BitVec 64))

(assert (=> d!97434 (= lt!418083 (bvmul lt!418082 lt!418079))))

(assert (=> d!97434 (or (= lt!418082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418079 (bvsdiv (bvmul lt!418082 lt!418079) lt!418082)))))

(assert (=> d!97434 (= lt!418079 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97434 (= lt!418082 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))))))

(assert (=> d!97434 (= lt!418080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13648 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13643 thiss!1939))))))

(assert (=> d!97434 (invariant!0 (currentBit!13643 thiss!1939) (currentByte!13648 thiss!1939) (size!7125 (buf!7371 thiss!1939)))))

(assert (=> d!97434 (= (bitIndex!0 (size!7125 (buf!7371 thiss!1939)) (currentByte!13648 thiss!1939) (currentBit!13643 thiss!1939)) lt!418080)))

(declare-fun b!283697 () Bool)

(declare-fun res!235105 () Bool)

(assert (=> b!283697 (=> (not res!235105) (not e!202614))))

(assert (=> b!283697 (= res!235105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418080))))

(declare-fun b!283698 () Bool)

(declare-fun lt!418078 () (_ BitVec 64))

(assert (=> b!283698 (= e!202614 (bvsle lt!418080 (bvmul lt!418078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283698 (or (= lt!418078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418078)))))

(assert (=> b!283698 (= lt!418078 ((_ sign_extend 32) (size!7125 (buf!7371 thiss!1939))))))

(assert (= (and d!97434 res!235106) b!283697))

(assert (= (and b!283697 res!235105) b!283698))

(assert (=> d!97434 m!416759))

(assert (=> d!97434 m!416761))

(assert (=> b!283668 d!97434))

(push 1)

(assert (not d!97434))

(assert (not d!97420))

(assert (not d!97424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

