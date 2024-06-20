; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55612 () Bool)

(assert start!55612)

(declare-fun b!258801 () Bool)

(declare-fun e!179506 () Bool)

(declare-datatypes ((array!14109 0))(
  ( (array!14110 (arr!7168 (Array (_ BitVec 32) (_ BitVec 8))) (size!6181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11284 0))(
  ( (BitStream!11285 (buf!6703 array!14109) (currentByte!12320 (_ BitVec 32)) (currentBit!12315 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11284)

(declare-fun array_inv!5922 (array!14109) Bool)

(assert (=> b!258801 (= e!179506 (array_inv!5922 (buf!6703 thiss!1754)))))

(declare-fun b!258802 () Bool)

(declare-fun res!216796 () Bool)

(declare-fun e!179505 () Bool)

(assert (=> b!258802 (=> (not res!216796) (not e!179505))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258802 (= res!216796 (not (= from!526 nBits!535)))))

(declare-fun b!258803 () Bool)

(declare-fun res!216793 () Bool)

(assert (=> b!258803 (=> (not res!216793) (not e!179505))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258803 (= res!216793 (validate_offset_bits!1 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))) ((_ sign_extend 32) (currentByte!12320 thiss!1754)) ((_ sign_extend 32) (currentBit!12315 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258804 () Bool)

(declare-fun res!216794 () Bool)

(assert (=> b!258804 (=> (not res!216794) (not e!179505))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22136 0))(
  ( (tuple2!22137 (_1!12004 Bool) (_2!12004 BitStream!11284)) )
))
(declare-fun readBit!0 (BitStream!11284) tuple2!22136)

(assert (=> b!258804 (= res!216794 (not (= (_1!12004 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun res!216795 () Bool)

(assert (=> start!55612 (=> (not res!216795) (not e!179505))))

(assert (=> start!55612 (= res!216795 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55612 e!179505))

(assert (=> start!55612 true))

(declare-fun inv!12 (BitStream!11284) Bool)

(assert (=> start!55612 (and (inv!12 thiss!1754) e!179506)))

(declare-fun b!258805 () Bool)

(declare-fun lt!400525 () (_ BitVec 64))

(declare-fun lt!400526 () (_ BitVec 64))

(assert (=> b!258805 (= e!179505 (and (= lt!400525 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400525 (bvand (bvadd lt!400526 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258805 (= lt!400525 (bvand lt!400526 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258805 (= lt!400526 (bitIndex!0 (size!6181 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754) (currentBit!12315 thiss!1754)))))

(assert (= (and start!55612 res!216795) b!258803))

(assert (= (and b!258803 res!216793) b!258802))

(assert (= (and b!258802 res!216796) b!258804))

(assert (= (and b!258804 res!216794) b!258805))

(assert (= start!55612 b!258801))

(declare-fun m!388163 () Bool)

(assert (=> b!258801 m!388163))

(declare-fun m!388165 () Bool)

(assert (=> b!258803 m!388165))

(declare-fun m!388167 () Bool)

(assert (=> b!258805 m!388167))

(declare-fun m!388169 () Bool)

(assert (=> start!55612 m!388169))

(declare-fun m!388171 () Bool)

(assert (=> b!258804 m!388171))

(push 1)

(assert (not b!258801))

(assert (not start!55612))

(assert (not b!258805))

(assert (not b!258803))

(assert (not b!258804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86862 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86862 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12315 thiss!1754) (currentByte!12320 thiss!1754) (size!6181 (buf!6703 thiss!1754))))))

(declare-fun bs!21987 () Bool)

(assert (= bs!21987 d!86862))

(declare-fun m!388193 () Bool)

(assert (=> bs!21987 m!388193))

(assert (=> start!55612 d!86862))

(declare-fun d!86864 () Bool)

(assert (=> d!86864 (= (array_inv!5922 (buf!6703 thiss!1754)) (bvsge (size!6181 (buf!6703 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258801 d!86864))

(declare-fun d!86866 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86866 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))) ((_ sign_extend 32) (currentByte!12320 thiss!1754)) ((_ sign_extend 32) (currentBit!12315 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))) ((_ sign_extend 32) (currentByte!12320 thiss!1754)) ((_ sign_extend 32) (currentBit!12315 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21988 () Bool)

(assert (= bs!21988 d!86866))

(declare-fun m!388195 () Bool)

(assert (=> bs!21988 m!388195))

(assert (=> b!258803 d!86866))

(declare-fun d!86868 () Bool)

(declare-fun e!179540 () Bool)

(assert (=> d!86868 e!179540))

(declare-fun res!216830 () Bool)

(assert (=> d!86868 (=> (not res!216830) (not e!179540))))

(declare-datatypes ((Unit!18437 0))(
  ( (Unit!18438) )
))
(declare-datatypes ((tuple2!22144 0))(
  ( (tuple2!22145 (_1!12008 Unit!18437) (_2!12008 BitStream!11284)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11284) tuple2!22144)

(assert (=> d!86868 (= res!216830 (= (buf!6703 (_2!12008 (increaseBitIndex!0 thiss!1754))) (buf!6703 thiss!1754)))))

(declare-fun lt!400586 () Bool)

(assert (=> d!86868 (= lt!400586 (not (= (bvand ((_ sign_extend 24) (select (arr!7168 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12315 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400591 () tuple2!22136)

(assert (=> d!86868 (= lt!400591 (tuple2!22137 (not (= (bvand ((_ sign_extend 24) (select (arr!7168 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12315 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12008 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86868 (validate_offset_bit!0 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))) ((_ sign_extend 32) (currentByte!12320 thiss!1754)) ((_ sign_extend 32) (currentBit!12315 thiss!1754)))))

(assert (=> d!86868 (= (readBit!0 thiss!1754) lt!400591)))

(declare-fun lt!400592 () (_ BitVec 64))

(declare-fun b!258845 () Bool)

(declare-fun lt!400587 () (_ BitVec 64))

(assert (=> b!258845 (= e!179540 (= (bitIndex!0 (size!6181 (buf!6703 (_2!12008 (increaseBitIndex!0 thiss!1754)))) (currentByte!12320 (_2!12008 (increaseBitIndex!0 thiss!1754))) (currentBit!12315 (_2!12008 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400592 lt!400587)))))

(assert (=> b!258845 (or (not (= (bvand lt!400592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400587 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400592 lt!400587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258845 (= lt!400587 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258845 (= lt!400592 (bitIndex!0 (size!6181 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754) (currentBit!12315 thiss!1754)))))

(declare-fun lt!400589 () Bool)

(assert (=> b!258845 (= lt!400589 (not (= (bvand ((_ sign_extend 24) (select (arr!7168 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12315 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400590 () Bool)

(assert (=> b!258845 (= lt!400590 (not (= (bvand ((_ sign_extend 24) (select (arr!7168 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12315 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400588 () Bool)

(assert (=> b!258845 (= lt!400588 (not (= (bvand ((_ sign_extend 24) (select (arr!7168 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12315 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86868 res!216830) b!258845))

(declare-fun m!388211 () Bool)

(assert (=> d!86868 m!388211))

(declare-fun m!388213 () Bool)

(assert (=> d!86868 m!388213))

(declare-fun m!388215 () Bool)

(assert (=> d!86868 m!388215))

(declare-fun m!388217 () Bool)

(assert (=> d!86868 m!388217))

(declare-fun m!388219 () Bool)

(assert (=> b!258845 m!388219))

(assert (=> b!258845 m!388213))

(assert (=> b!258845 m!388167))

(assert (=> b!258845 m!388215))

(assert (=> b!258845 m!388211))

(assert (=> b!258804 d!86868))

(declare-fun d!86878 () Bool)

(declare-fun e!179546 () Bool)

(assert (=> d!86878 e!179546))

(declare-fun res!216841 () Bool)

(assert (=> d!86878 (=> (not res!216841) (not e!179546))))

(declare-fun lt!400628 () (_ BitVec 64))

(declare-fun lt!400626 () (_ BitVec 64))

(declare-fun lt!400623 () (_ BitVec 64))

(assert (=> d!86878 (= res!216841 (= lt!400628 (bvsub lt!400623 lt!400626)))))

(assert (=> d!86878 (or (= (bvand lt!400623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400623 lt!400626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86878 (= lt!400626 (remainingBits!0 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))) ((_ sign_extend 32) (currentByte!12320 thiss!1754)) ((_ sign_extend 32) (currentBit!12315 thiss!1754))))))

(declare-fun lt!400625 () (_ BitVec 64))

(declare-fun lt!400627 () (_ BitVec 64))

(assert (=> d!86878 (= lt!400623 (bvmul lt!400625 lt!400627))))

(assert (=> d!86878 (or (= lt!400625 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400627 (bvsdiv (bvmul lt!400625 lt!400627) lt!400625)))))

(assert (=> d!86878 (= lt!400627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86878 (= lt!400625 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))))))

(assert (=> d!86878 (= lt!400628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12320 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12315 thiss!1754))))))

(assert (=> d!86878 (invariant!0 (currentBit!12315 thiss!1754) (currentByte!12320 thiss!1754) (size!6181 (buf!6703 thiss!1754)))))

(assert (=> d!86878 (= (bitIndex!0 (size!6181 (buf!6703 thiss!1754)) (currentByte!12320 thiss!1754) (currentBit!12315 thiss!1754)) lt!400628)))

(declare-fun b!258856 () Bool)

(declare-fun res!216842 () Bool)

(assert (=> b!258856 (=> (not res!216842) (not e!179546))))

(assert (=> b!258856 (= res!216842 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400628))))

(declare-fun b!258857 () Bool)

(declare-fun lt!400624 () (_ BitVec 64))

(assert (=> b!258857 (= e!179546 (bvsle lt!400628 (bvmul lt!400624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258857 (or (= lt!400624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400624)))))

(assert (=> b!258857 (= lt!400624 ((_ sign_extend 32) (size!6181 (buf!6703 thiss!1754))))))

(assert (= (and d!86878 res!216841) b!258856))

(assert (= (and b!258856 res!216842) b!258857))

(assert (=> d!86878 m!388195))

(assert (=> d!86878 m!388193))

(assert (=> b!258805 d!86878))

(push 1)

(assert (not d!86878))

(assert (not d!86862))

(assert (not d!86868))

(assert (not d!86866))

(assert (not b!258845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

