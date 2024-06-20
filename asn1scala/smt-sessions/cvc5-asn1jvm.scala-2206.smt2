; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55924 () Bool)

(assert start!55924)

(declare-fun res!217584 () Bool)

(declare-fun e!180282 () Bool)

(assert (=> start!55924 (=> (not res!217584) (not e!180282))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55924 (= res!217584 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55924 e!180282))

(assert (=> start!55924 true))

(declare-datatypes ((array!14214 0))(
  ( (array!14215 (arr!7210 (Array (_ BitVec 32) (_ BitVec 8))) (size!6223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11368 0))(
  ( (BitStream!11369 (buf!6745 array!14214) (currentByte!12401 (_ BitVec 32)) (currentBit!12396 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11368)

(declare-fun e!180283 () Bool)

(declare-fun inv!12 (BitStream!11368) Bool)

(assert (=> start!55924 (and (inv!12 thiss!1754) e!180283)))

(declare-fun b!259787 () Bool)

(declare-fun e!180286 () Bool)

(declare-fun e!180284 () Bool)

(assert (=> b!259787 (= e!180286 (not e!180284))))

(declare-fun res!217581 () Bool)

(assert (=> b!259787 (=> res!217581 e!180284)))

(declare-datatypes ((tuple2!22274 0))(
  ( (tuple2!22275 (_1!12073 Bool) (_2!12073 BitStream!11368)) )
))
(declare-fun lt!401804 () tuple2!22274)

(declare-fun lt!401801 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259787 (= res!217581 (bvslt (bvsub lt!401801 from!526) (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!401804))) (currentByte!12401 (_2!12073 lt!401804)) (currentBit!12396 (_2!12073 lt!401804)))))))

(declare-fun lt!401803 () (_ BitVec 64))

(assert (=> b!259787 (= lt!401801 (bvadd lt!401803 nBits!535))))

(assert (=> b!259787 (= lt!401803 (bitIndex!0 (size!6223 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754) (currentBit!12396 thiss!1754)))))

(declare-fun expected!109 () Bool)

(declare-fun lt!401802 () tuple2!22274)

(declare-fun checkBitsLoop!0 (BitStream!11368 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22274)

(assert (=> b!259787 (= lt!401804 (checkBitsLoop!0 (_2!12073 lt!401802) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259787 (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401802)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401802))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401802))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18489 0))(
  ( (Unit!18490) )
))
(declare-fun lt!401800 () Unit!18489)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11368 BitStream!11368 (_ BitVec 64) (_ BitVec 64)) Unit!18489)

(assert (=> b!259787 (= lt!401800 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12073 lt!401802) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259788 () Bool)

(declare-fun array_inv!5964 (array!14214) Bool)

(assert (=> b!259788 (= e!180283 (array_inv!5964 (buf!6745 thiss!1754)))))

(declare-fun b!259789 () Bool)

(declare-fun res!217582 () Bool)

(assert (=> b!259789 (=> (not res!217582) (not e!180282))))

(assert (=> b!259789 (= res!217582 (not (= from!526 nBits!535)))))

(declare-fun b!259790 () Bool)

(declare-fun res!217585 () Bool)

(assert (=> b!259790 (=> (not res!217585) (not e!180282))))

(assert (=> b!259790 (= res!217585 (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))) ((_ sign_extend 32) (currentByte!12401 thiss!1754)) ((_ sign_extend 32) (currentBit!12396 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259791 () Bool)

(assert (=> b!259791 (= e!180284 (or (not (= (buf!6745 thiss!1754) (buf!6745 (_2!12073 lt!401804)))) (not (_1!12073 lt!401804)) (let ((bdg!16202 (bvand lt!401803 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!16202 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!16202 (bvand lt!401801 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!259792 () Bool)

(assert (=> b!259792 (= e!180282 e!180286)))

(declare-fun res!217583 () Bool)

(assert (=> b!259792 (=> (not res!217583) (not e!180286))))

(assert (=> b!259792 (= res!217583 (= (_1!12073 lt!401802) expected!109))))

(declare-fun readBit!0 (BitStream!11368) tuple2!22274)

(assert (=> b!259792 (= lt!401802 (readBit!0 thiss!1754))))

(assert (= (and start!55924 res!217584) b!259790))

(assert (= (and b!259790 res!217585) b!259789))

(assert (= (and b!259789 res!217582) b!259792))

(assert (= (and b!259792 res!217583) b!259787))

(assert (= (and b!259787 (not res!217581)) b!259791))

(assert (= start!55924 b!259788))

(declare-fun m!389063 () Bool)

(assert (=> b!259790 m!389063))

(declare-fun m!389065 () Bool)

(assert (=> start!55924 m!389065))

(declare-fun m!389067 () Bool)

(assert (=> b!259792 m!389067))

(declare-fun m!389069 () Bool)

(assert (=> b!259788 m!389069))

(declare-fun m!389071 () Bool)

(assert (=> b!259787 m!389071))

(declare-fun m!389073 () Bool)

(assert (=> b!259787 m!389073))

(declare-fun m!389075 () Bool)

(assert (=> b!259787 m!389075))

(declare-fun m!389077 () Bool)

(assert (=> b!259787 m!389077))

(declare-fun m!389079 () Bool)

(assert (=> b!259787 m!389079))

(push 1)

(assert (not start!55924))

(assert (not b!259788))

(assert (not b!259787))

(assert (not b!259792))

(assert (not b!259790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87150 () Bool)

(assert (=> d!87150 (= (array_inv!5964 (buf!6745 thiss!1754)) (bvsge (size!6223 (buf!6745 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259788 d!87150))

(declare-fun d!87152 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87152 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12396 thiss!1754) (currentByte!12401 thiss!1754) (size!6223 (buf!6745 thiss!1754))))))

(declare-fun bs!22079 () Bool)

(assert (= bs!22079 d!87152))

(declare-fun m!389131 () Bool)

(assert (=> bs!22079 m!389131))

(assert (=> start!55924 d!87152))

(declare-fun d!87154 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))) ((_ sign_extend 32) (currentByte!12401 thiss!1754)) ((_ sign_extend 32) (currentBit!12396 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))) ((_ sign_extend 32) (currentByte!12401 thiss!1754)) ((_ sign_extend 32) (currentBit!12396 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22080 () Bool)

(assert (= bs!22080 d!87154))

(declare-fun m!389133 () Bool)

(assert (=> bs!22080 m!389133))

(assert (=> b!259790 d!87154))

(declare-fun d!87156 () Bool)

(declare-fun e!180337 () Bool)

(assert (=> d!87156 e!180337))

(declare-fun res!217632 () Bool)

(assert (=> d!87156 (=> (not res!217632) (not e!180337))))

(declare-datatypes ((tuple2!22284 0))(
  ( (tuple2!22285 (_1!12078 Unit!18489) (_2!12078 BitStream!11368)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11368) tuple2!22284)

(assert (=> d!87156 (= res!217632 (= (buf!6745 (_2!12078 (increaseBitIndex!0 thiss!1754))) (buf!6745 thiss!1754)))))

(declare-fun lt!401897 () Bool)

(assert (=> d!87156 (= lt!401897 (not (= (bvand ((_ sign_extend 24) (select (arr!7210 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12396 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401903 () tuple2!22274)

(assert (=> d!87156 (= lt!401903 (tuple2!22275 (not (= (bvand ((_ sign_extend 24) (select (arr!7210 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12396 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12078 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87156 (validate_offset_bit!0 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))) ((_ sign_extend 32) (currentByte!12401 thiss!1754)) ((_ sign_extend 32) (currentBit!12396 thiss!1754)))))

(assert (=> d!87156 (= (readBit!0 thiss!1754) lt!401903)))

(declare-fun lt!401899 () (_ BitVec 64))

(declare-fun lt!401902 () (_ BitVec 64))

(declare-fun b!259845 () Bool)

(assert (=> b!259845 (= e!180337 (= (bitIndex!0 (size!6223 (buf!6745 (_2!12078 (increaseBitIndex!0 thiss!1754)))) (currentByte!12401 (_2!12078 (increaseBitIndex!0 thiss!1754))) (currentBit!12396 (_2!12078 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401899 lt!401902)))))

(assert (=> b!259845 (or (not (= (bvand lt!401899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401902 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401899 lt!401902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259845 (= lt!401902 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259845 (= lt!401899 (bitIndex!0 (size!6223 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754) (currentBit!12396 thiss!1754)))))

(declare-fun lt!401901 () Bool)

(assert (=> b!259845 (= lt!401901 (not (= (bvand ((_ sign_extend 24) (select (arr!7210 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12396 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401900 () Bool)

(assert (=> b!259845 (= lt!401900 (not (= (bvand ((_ sign_extend 24) (select (arr!7210 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12396 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401898 () Bool)

(assert (=> b!259845 (= lt!401898 (not (= (bvand ((_ sign_extend 24) (select (arr!7210 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12396 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87156 res!217632) b!259845))

(declare-fun m!389143 () Bool)

(assert (=> d!87156 m!389143))

(declare-fun m!389145 () Bool)

(assert (=> d!87156 m!389145))

(declare-fun m!389147 () Bool)

(assert (=> d!87156 m!389147))

(declare-fun m!389149 () Bool)

(assert (=> d!87156 m!389149))

(assert (=> b!259845 m!389143))

(declare-fun m!389151 () Bool)

(assert (=> b!259845 m!389151))

(assert (=> b!259845 m!389073))

(assert (=> b!259845 m!389145))

(assert (=> b!259845 m!389147))

(assert (=> b!259792 d!87156))

(declare-fun d!87166 () Bool)

(declare-fun e!180342 () Bool)

(assert (=> d!87166 e!180342))

(declare-fun res!217637 () Bool)

(assert (=> d!87166 (=> (not res!217637) (not e!180342))))

(declare-fun lt!401924 () (_ BitVec 64))

(declare-fun lt!401925 () (_ BitVec 64))

(declare-fun lt!401922 () (_ BitVec 64))

(assert (=> d!87166 (= res!217637 (= lt!401924 (bvsub lt!401925 lt!401922)))))

(assert (=> d!87166 (or (= (bvand lt!401925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401922 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401925 lt!401922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87166 (= lt!401922 (remainingBits!0 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))) ((_ sign_extend 32) (currentByte!12401 thiss!1754)) ((_ sign_extend 32) (currentBit!12396 thiss!1754))))))

(declare-fun lt!401921 () (_ BitVec 64))

(declare-fun lt!401923 () (_ BitVec 64))

(assert (=> d!87166 (= lt!401925 (bvmul lt!401921 lt!401923))))

(assert (=> d!87166 (or (= lt!401921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401923 (bvsdiv (bvmul lt!401921 lt!401923) lt!401921)))))

(assert (=> d!87166 (= lt!401923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87166 (= lt!401921 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))))))

(assert (=> d!87166 (= lt!401924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12401 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12396 thiss!1754))))))

(assert (=> d!87166 (invariant!0 (currentBit!12396 thiss!1754) (currentByte!12401 thiss!1754) (size!6223 (buf!6745 thiss!1754)))))

(assert (=> d!87166 (= (bitIndex!0 (size!6223 (buf!6745 thiss!1754)) (currentByte!12401 thiss!1754) (currentBit!12396 thiss!1754)) lt!401924)))

(declare-fun b!259854 () Bool)

(declare-fun res!217638 () Bool)

(assert (=> b!259854 (=> (not res!217638) (not e!180342))))

(assert (=> b!259854 (= res!217638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401924))))

(declare-fun b!259855 () Bool)

(declare-fun lt!401920 () (_ BitVec 64))

(assert (=> b!259855 (= e!180342 (bvsle lt!401924 (bvmul lt!401920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259855 (or (= lt!401920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401920)))))

(assert (=> b!259855 (= lt!401920 ((_ sign_extend 32) (size!6223 (buf!6745 thiss!1754))))))

(assert (= (and d!87166 res!217637) b!259854))

(assert (= (and b!259854 res!217638) b!259855))

(assert (=> d!87166 m!389133))

(assert (=> d!87166 m!389131))

(assert (=> b!259787 d!87166))

(declare-fun d!87168 () Bool)

(declare-fun e!180345 () Bool)

(assert (=> d!87168 e!180345))

(declare-fun res!217639 () Bool)

(assert (=> d!87168 (=> (not res!217639) (not e!180345))))

(declare-fun lt!401941 () (_ BitVec 64))

(declare-fun lt!401940 () (_ BitVec 64))

(declare-fun lt!401938 () (_ BitVec 64))

(assert (=> d!87168 (= res!217639 (= lt!401940 (bvsub lt!401941 lt!401938)))))

(assert (=> d!87168 (or (= (bvand lt!401941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401941 lt!401938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87168 (= lt!401938 (remainingBits!0 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401804)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401804))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401804)))))))

(declare-fun lt!401937 () (_ BitVec 64))

(declare-fun lt!401939 () (_ BitVec 64))

(assert (=> d!87168 (= lt!401941 (bvmul lt!401937 lt!401939))))

(assert (=> d!87168 (or (= lt!401937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401939 (bvsdiv (bvmul lt!401937 lt!401939) lt!401937)))))

(assert (=> d!87168 (= lt!401939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87168 (= lt!401937 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401804)))))))

(assert (=> d!87168 (= lt!401940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401804))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401804)))))))

(assert (=> d!87168 (invariant!0 (currentBit!12396 (_2!12073 lt!401804)) (currentByte!12401 (_2!12073 lt!401804)) (size!6223 (buf!6745 (_2!12073 lt!401804))))))

(assert (=> d!87168 (= (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!401804))) (currentByte!12401 (_2!12073 lt!401804)) (currentBit!12396 (_2!12073 lt!401804))) lt!401940)))

(declare-fun b!259860 () Bool)

(declare-fun res!217640 () Bool)

(assert (=> b!259860 (=> (not res!217640) (not e!180345))))

(assert (=> b!259860 (= res!217640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401940))))

(declare-fun b!259861 () Bool)

(declare-fun lt!401936 () (_ BitVec 64))

(assert (=> b!259861 (= e!180345 (bvsle lt!401940 (bvmul lt!401936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259861 (or (= lt!401936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401936)))))

(assert (=> b!259861 (= lt!401936 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401804)))))))

(assert (= (and d!87168 res!217639) b!259860))

(assert (= (and b!259860 res!217640) b!259861))

(declare-fun m!389153 () Bool)

(assert (=> d!87168 m!389153))

(declare-fun m!389155 () Bool)

(assert (=> d!87168 m!389155))

(assert (=> b!259787 d!87168))

(declare-fun d!87170 () Bool)

(assert (=> d!87170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401802)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401802))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401802))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401802)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401802))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401802)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22082 () Bool)

(assert (= bs!22082 d!87170))

(declare-fun m!389157 () Bool)

(assert (=> bs!22082 m!389157))

(assert (=> b!259787 d!87170))

(declare-fun d!87172 () Bool)

(declare-fun e!180354 () Bool)

(assert (=> d!87172 e!180354))

(declare-fun res!217653 () Bool)

(assert (=> d!87172 (=> (not res!217653) (not e!180354))))

(assert (=> d!87172 (= res!217653 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401952 () Unit!18489)

(declare-fun choose!27 (BitStream!11368 BitStream!11368 (_ BitVec 64) (_ BitVec 64)) Unit!18489)

(assert (=> d!87172 (= lt!401952 (choose!27 thiss!1754 (_2!12073 lt!401802) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87172 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87172 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12073 lt!401802) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401952)))

(declare-fun b!259874 () Bool)

(assert (=> b!259874 (= e!180354 (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!401802)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!401802))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!401802))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87172 res!217653) b!259874))

(declare-fun m!389159 () Bool)

(assert (=> d!87172 m!389159))

(assert (=> b!259874 m!389075))

(assert (=> b!259787 d!87172))

(declare-fun b!259943 () Bool)

(declare-fun res!217698 () Bool)

(declare-fun e!180402 () Bool)

(assert (=> b!259943 (=> (not res!217698) (not e!180402))))

(declare-fun lt!402070 () tuple2!22274)

(assert (=> b!259943 (= res!217698 (and (= (buf!6745 (_2!12073 lt!401802)) (buf!6745 (_2!12073 lt!402070))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12073 lt!402070))))))

(declare-fun b!259944 () Bool)

(declare-fun e!180401 () tuple2!22274)

(declare-fun lt!402067 () tuple2!22274)

(assert (=> b!259944 (= e!180401 (tuple2!22275 false (_2!12073 lt!402067)))))

(declare-fun b!259945 () Bool)

(declare-fun e!180400 () Bool)

(declare-datatypes ((tuple2!22286 0))(
  ( (tuple2!22287 (_1!12079 BitStream!11368) (_2!12079 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11368) tuple2!22286)

(assert (=> b!259945 (= e!180400 (= expected!109 (_2!12079 (readBitPure!0 (_2!12073 lt!401802)))))))

(declare-fun b!259946 () Bool)

(declare-fun lt!402075 () tuple2!22274)

(assert (=> b!259946 (= lt!402075 (checkBitsLoop!0 (_2!12073 lt!402067) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402068 () Unit!18489)

(declare-fun lt!402071 () Unit!18489)

(assert (=> b!259946 (= lt!402068 lt!402071)))

(declare-fun lt!402074 () (_ BitVec 64))

(declare-fun lt!402073 () (_ BitVec 64))

(assert (=> b!259946 (validate_offset_bits!1 ((_ sign_extend 32) (size!6223 (buf!6745 (_2!12073 lt!402067)))) ((_ sign_extend 32) (currentByte!12401 (_2!12073 lt!402067))) ((_ sign_extend 32) (currentBit!12396 (_2!12073 lt!402067))) (bvsub lt!402074 lt!402073))))

(assert (=> b!259946 (= lt!402071 (validateOffsetBitsIneqLemma!0 (_2!12073 lt!401802) (_2!12073 lt!402067) lt!402074 lt!402073))))

(assert (=> b!259946 (= lt!402073 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259946 (= lt!402074 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259946 (= e!180401 (tuple2!22275 (_1!12073 lt!402075) (_2!12073 lt!402075)))))

(declare-fun b!259947 () Bool)

(assert (=> b!259947 (= e!180402 e!180400)))

(declare-fun res!217701 () Bool)

(assert (=> b!259947 (=> res!217701 e!180400)))

(assert (=> b!259947 (= res!217701 (or (not (_1!12073 lt!402070)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259948 () Bool)

(declare-fun res!217702 () Bool)

(assert (=> b!259948 (=> (not res!217702) (not e!180402))))

(declare-fun e!180399 () Bool)

(assert (=> b!259948 (= res!217702 e!180399)))

(declare-fun res!217699 () Bool)

(assert (=> b!259948 (=> res!217699 e!180399)))

(assert (=> b!259948 (= res!217699 (not (_1!12073 lt!402070)))))

(declare-fun b!259949 () Bool)

(declare-fun lt!402072 () (_ BitVec 64))

(assert (=> b!259949 (= e!180399 (= (bvsub lt!402072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!402070))) (currentByte!12401 (_2!12073 lt!402070)) (currentBit!12396 (_2!12073 lt!402070)))))))

(assert (=> b!259949 (or (= (bvand lt!402072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402076 () (_ BitVec 64))

(assert (=> b!259949 (= lt!402072 (bvadd lt!402076 nBits!535))))

(assert (=> b!259949 (or (not (= (bvand lt!402076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402076 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259949 (= lt!402076 (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!401802))) (currentByte!12401 (_2!12073 lt!401802)) (currentBit!12396 (_2!12073 lt!401802))))))

(declare-fun b!259950 () Bool)

(declare-fun e!180403 () tuple2!22274)

(assert (=> b!259950 (= e!180403 (tuple2!22275 true (_2!12073 lt!401802)))))

(declare-fun b!259951 () Bool)

(assert (=> b!259951 (= e!180403 e!180401)))

(assert (=> b!259951 (= lt!402067 (readBit!0 (_2!12073 lt!401802)))))

(declare-fun c!11949 () Bool)

(assert (=> b!259951 (= c!11949 (not (= (_1!12073 lt!402067) expected!109)))))

(declare-fun d!87174 () Bool)

(assert (=> d!87174 e!180402))

(declare-fun res!217700 () Bool)

(assert (=> d!87174 (=> (not res!217700) (not e!180402))))

(declare-fun lt!402077 () (_ BitVec 64))

(assert (=> d!87174 (= res!217700 (bvsge (bvsub lt!402077 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!402070))) (currentByte!12401 (_2!12073 lt!402070)) (currentBit!12396 (_2!12073 lt!402070)))))))

(assert (=> d!87174 (or (= (bvand lt!402077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402077 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402069 () (_ BitVec 64))

(assert (=> d!87174 (= lt!402077 (bvadd lt!402069 nBits!535))))

(assert (=> d!87174 (or (not (= (bvand lt!402069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402069 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87174 (= lt!402069 (bitIndex!0 (size!6223 (buf!6745 (_2!12073 lt!401802))) (currentByte!12401 (_2!12073 lt!401802)) (currentBit!12396 (_2!12073 lt!401802))))))

(assert (=> d!87174 (= lt!402070 e!180403)))

(declare-fun c!11948 () Bool)

(assert (=> d!87174 (= c!11948 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87174 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87174 (= (checkBitsLoop!0 (_2!12073 lt!401802) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402070)))

(assert (= (and d!87174 c!11948) b!259950))

(assert (= (and d!87174 (not c!11948)) b!259951))

(assert (= (and b!259951 c!11949) b!259944))

(assert (= (and b!259951 (not c!11949)) b!259946))

(assert (= (and d!87174 res!217700) b!259943))

(assert (= (and b!259943 res!217698) b!259948))

(assert (= (and b!259948 (not res!217699)) b!259949))

(assert (= (and b!259948 res!217702) b!259947))

(assert (= (and b!259947 (not res!217701)) b!259945))

(declare-fun m!389211 () Bool)

(assert (=> b!259949 m!389211))

(declare-fun m!389213 () Bool)

(assert (=> b!259949 m!389213))

(declare-fun m!389215 () Bool)

(assert (=> b!259946 m!389215))

(declare-fun m!389217 () Bool)

(assert (=> b!259946 m!389217))

(declare-fun m!389219 () Bool)

(assert (=> b!259946 m!389219))

(declare-fun m!389221 () Bool)

(assert (=> b!259951 m!389221))

(assert (=> d!87174 m!389211))

(assert (=> d!87174 m!389213))

(declare-fun m!389223 () Bool)

(assert (=> b!259945 m!389223))

(assert (=> b!259787 d!87174))

(push 1)

(assert (not b!259946))

(assert (not b!259949))

(assert (not b!259951))

(assert (not d!87170))

(assert (not d!87154))

(assert (not b!259874))

(assert (not d!87166))

(assert (not d!87156))

(assert (not d!87172))

(assert (not d!87174))

(assert (not b!259945))

(assert (not d!87152))

(assert (not b!259845))

(assert (not d!87168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

