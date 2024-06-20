; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17998 () Bool)

(assert start!17998)

(declare-fun b!88470 () Bool)

(declare-fun res!72846 () Bool)

(declare-fun e!58544 () Bool)

(assert (=> b!88470 (=> (not res!72846) (not e!58544))))

(declare-datatypes ((array!4164 0))(
  ( (array!4165 (arr!2517 (Array (_ BitVec 32) (_ BitVec 8))) (size!1880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3322 0))(
  ( (BitStream!3323 (buf!2270 array!4164) (currentByte!4503 (_ BitVec 32)) (currentBit!4498 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3322)

(declare-fun thiss!1151 () BitStream!3322)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88470 (= res!72846 (and (bvsle i!576 nBits!336) (= (size!1880 (buf!2270 thiss!1152)) (size!1880 (buf!2270 thiss!1151)))))))

(declare-fun b!88471 () Bool)

(declare-fun res!72850 () Bool)

(assert (=> b!88471 (=> (not res!72850) (not e!58544))))

(assert (=> b!88471 (= res!72850 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88472 () Bool)

(declare-fun res!72849 () Bool)

(assert (=> b!88472 (=> (not res!72849) (not e!58544))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88472 (= res!72849 (invariant!0 (currentBit!4498 thiss!1151) (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151))))))

(declare-fun b!88473 () Bool)

(declare-fun res!72848 () Bool)

(assert (=> b!88473 (=> (not res!72848) (not e!58544))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88473 (= res!72848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))) ((_ sign_extend 32) (currentByte!4503 thiss!1151)) ((_ sign_extend 32) (currentBit!4498 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88474 () Bool)

(declare-fun e!58546 () Bool)

(declare-fun array_inv!1726 (array!4164) Bool)

(assert (=> b!88474 (= e!58546 (array_inv!1726 (buf!2270 thiss!1151)))))

(declare-fun b!88475 () Bool)

(declare-fun e!58545 () Bool)

(assert (=> b!88475 (= e!58545 (array_inv!1726 (buf!2270 thiss!1152)))))

(declare-fun res!72847 () Bool)

(assert (=> start!17998 (=> (not res!72847) (not e!58544))))

(assert (=> start!17998 (= res!72847 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17998 e!58544))

(assert (=> start!17998 true))

(declare-fun inv!12 (BitStream!3322) Bool)

(assert (=> start!17998 (and (inv!12 thiss!1151) e!58546)))

(assert (=> start!17998 (and (inv!12 thiss!1152) e!58545)))

(declare-fun b!88476 () Bool)

(declare-fun lt!136208 () (_ BitVec 64))

(declare-fun lt!136209 () (_ BitVec 64))

(assert (=> b!88476 (= e!58544 (and (= lt!136208 (bvand ((_ sign_extend 32) i!576) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!136208 (bvand (bvadd lt!136209 ((_ sign_extend 32) i!576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!88476 (= lt!136208 (bvand lt!136209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88476 (= lt!136209 (bitIndex!0 (size!1880 (buf!2270 thiss!1151)) (currentByte!4503 thiss!1151) (currentBit!4498 thiss!1151)))))

(declare-fun b!88477 () Bool)

(declare-fun res!72845 () Bool)

(assert (=> b!88477 (=> (not res!72845) (not e!58544))))

(assert (=> b!88477 (= res!72845 (invariant!0 (currentBit!4498 thiss!1152) (currentByte!4503 thiss!1152) (size!1880 (buf!2270 thiss!1152))))))

(assert (= (and start!17998 res!72847) b!88473))

(assert (= (and b!88473 res!72848) b!88472))

(assert (= (and b!88472 res!72849) b!88471))

(assert (= (and b!88471 res!72850) b!88477))

(assert (= (and b!88477 res!72845) b!88470))

(assert (= (and b!88470 res!72846) b!88476))

(assert (= start!17998 b!88474))

(assert (= start!17998 b!88475))

(declare-fun m!133637 () Bool)

(assert (=> b!88475 m!133637))

(declare-fun m!133639 () Bool)

(assert (=> b!88472 m!133639))

(declare-fun m!133641 () Bool)

(assert (=> start!17998 m!133641))

(declare-fun m!133643 () Bool)

(assert (=> start!17998 m!133643))

(declare-fun m!133645 () Bool)

(assert (=> b!88476 m!133645))

(declare-fun m!133647 () Bool)

(assert (=> b!88474 m!133647))

(declare-fun m!133649 () Bool)

(assert (=> b!88473 m!133649))

(declare-fun m!133651 () Bool)

(assert (=> b!88477 m!133651))

(push 1)

(assert (not b!88477))

(assert (not b!88474))

(assert (not b!88476))

(assert (not b!88475))

(assert (not b!88473))

(assert (not b!88472))

(assert (not start!17998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27782 () Bool)

(assert (=> d!27782 (= (array_inv!1726 (buf!2270 thiss!1151)) (bvsge (size!1880 (buf!2270 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88474 d!27782))

(declare-fun d!27784 () Bool)

(assert (=> d!27784 (= (array_inv!1726 (buf!2270 thiss!1152)) (bvsge (size!1880 (buf!2270 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88475 d!27784))

(declare-fun d!27786 () Bool)

(declare-fun e!58584 () Bool)

(assert (=> d!27786 e!58584))

(declare-fun res!72897 () Bool)

(assert (=> d!27786 (=> (not res!72897) (not e!58584))))

(declare-fun lt!136257 () (_ BitVec 64))

(declare-fun lt!136253 () (_ BitVec 64))

(declare-fun lt!136254 () (_ BitVec 64))

(assert (=> d!27786 (= res!72897 (= lt!136253 (bvsub lt!136257 lt!136254)))))

(assert (=> d!27786 (or (= (bvand lt!136257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136257 lt!136254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27786 (= lt!136254 (remainingBits!0 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))) ((_ sign_extend 32) (currentByte!4503 thiss!1151)) ((_ sign_extend 32) (currentBit!4498 thiss!1151))))))

(declare-fun lt!136252 () (_ BitVec 64))

(declare-fun lt!136255 () (_ BitVec 64))

(assert (=> d!27786 (= lt!136257 (bvmul lt!136252 lt!136255))))

(assert (=> d!27786 (or (= lt!136252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136255 (bvsdiv (bvmul lt!136252 lt!136255) lt!136252)))))

(assert (=> d!27786 (= lt!136255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27786 (= lt!136252 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))))))

(assert (=> d!27786 (= lt!136253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4503 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4498 thiss!1151))))))

(assert (=> d!27786 (invariant!0 (currentBit!4498 thiss!1151) (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151)))))

(assert (=> d!27786 (= (bitIndex!0 (size!1880 (buf!2270 thiss!1151)) (currentByte!4503 thiss!1151) (currentBit!4498 thiss!1151)) lt!136253)))

(declare-fun b!88536 () Bool)

(declare-fun res!72898 () Bool)

(assert (=> b!88536 (=> (not res!72898) (not e!58584))))

(assert (=> b!88536 (= res!72898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136253))))

(declare-fun b!88537 () Bool)

(declare-fun lt!136256 () (_ BitVec 64))

(assert (=> b!88537 (= e!58584 (bvsle lt!136253 (bvmul lt!136256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88537 (or (= lt!136256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136256)))))

(assert (=> b!88537 (= lt!136256 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))))))

(assert (= (and d!27786 res!72897) b!88536))

(assert (= (and b!88536 res!72898) b!88537))

(declare-fun m!133689 () Bool)

(assert (=> d!27786 m!133689))

(assert (=> d!27786 m!133639))

(assert (=> b!88476 d!27786))

(declare-fun d!27796 () Bool)

(assert (=> d!27796 (= (invariant!0 (currentBit!4498 thiss!1151) (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151))) (and (bvsge (currentBit!4498 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4498 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4503 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151))) (and (= (currentBit!4498 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151)))))))))

(assert (=> b!88472 d!27796))

(declare-fun d!27802 () Bool)

(assert (=> d!27802 (= (invariant!0 (currentBit!4498 thiss!1152) (currentByte!4503 thiss!1152) (size!1880 (buf!2270 thiss!1152))) (and (bvsge (currentBit!4498 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4498 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4503 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4503 thiss!1152) (size!1880 (buf!2270 thiss!1152))) (and (= (currentBit!4498 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4503 thiss!1152) (size!1880 (buf!2270 thiss!1152)))))))))

(assert (=> b!88477 d!27802))

(declare-fun d!27804 () Bool)

(assert (=> d!27804 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4498 thiss!1151) (currentByte!4503 thiss!1151) (size!1880 (buf!2270 thiss!1151))))))

(declare-fun bs!6880 () Bool)

(assert (= bs!6880 d!27804))

(assert (=> bs!6880 m!133639))

(assert (=> start!17998 d!27804))

(declare-fun d!27810 () Bool)

(assert (=> d!27810 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4498 thiss!1152) (currentByte!4503 thiss!1152) (size!1880 (buf!2270 thiss!1152))))))

(declare-fun bs!6882 () Bool)

(assert (= bs!6882 d!27810))

(assert (=> bs!6882 m!133651))

(assert (=> start!17998 d!27810))

(declare-fun d!27814 () Bool)

(assert (=> d!27814 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))) ((_ sign_extend 32) (currentByte!4503 thiss!1151)) ((_ sign_extend 32) (currentBit!4498 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1880 (buf!2270 thiss!1151))) ((_ sign_extend 32) (currentByte!4503 thiss!1151)) ((_ sign_extend 32) (currentBit!4498 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6884 () Bool)

(assert (= bs!6884 d!27814))

(assert (=> bs!6884 m!133689))

(assert (=> b!88473 d!27814))

(push 1)

(assert (not d!27814))

(assert (not d!27804))

(assert (not d!27786))

(assert (not d!27810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

