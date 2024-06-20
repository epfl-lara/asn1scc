; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52228 () Bool)

(assert start!52228)

(declare-fun res!200808 () Bool)

(declare-fun e!166724 () Bool)

(assert (=> start!52228 (=> (not res!200808) (not e!166724))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52228 (= res!200808 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52228 e!166724))

(assert (=> start!52228 true))

(declare-datatypes ((array!13159 0))(
  ( (array!13160 (arr!6751 (Array (_ BitVec 32) (_ BitVec 8))) (size!5764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10450 0))(
  ( (BitStream!10451 (buf!6224 array!13159) (currentByte!11578 (_ BitVec 32)) (currentBit!11573 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10450)

(declare-fun e!166723 () Bool)

(declare-fun inv!12 (BitStream!10450) Bool)

(assert (=> start!52228 (and (inv!12 thiss!982) e!166723)))

(declare-fun b!240540 () Bool)

(declare-fun e!166722 () Bool)

(declare-datatypes ((tuple2!20436 0))(
  ( (tuple2!20437 (_1!11140 BitStream!10450) (_2!11140 Bool)) )
))
(declare-fun lt!375684 () tuple2!20436)

(declare-datatypes ((tuple2!20438 0))(
  ( (tuple2!20439 (_1!11141 BitStream!10450) (_2!11141 BitStream!10450)) )
))
(declare-fun lt!375677 () tuple2!20438)

(assert (=> b!240540 (= e!166722 (not (or (not (_2!11140 lt!375684)) (not (= (_1!11140 lt!375684) (_2!11141 lt!375677))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10450 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20436)

(assert (=> b!240540 (= lt!375684 (checkBitsLoopPure!0 (_1!11141 lt!375677) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17629 0))(
  ( (Unit!17630) )
))
(declare-datatypes ((tuple2!20440 0))(
  ( (tuple2!20441 (_1!11142 Unit!17629) (_2!11142 BitStream!10450)) )
))
(declare-fun lt!375681 () tuple2!20440)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240540 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288)))

(declare-fun lt!375683 () Unit!17629)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10450 array!13159 (_ BitVec 64)) Unit!17629)

(assert (=> b!240540 (= lt!375683 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6224 (_2!11142 lt!375681)) nBits!288))))

(declare-fun reader!0 (BitStream!10450 BitStream!10450) tuple2!20438)

(assert (=> b!240540 (= lt!375677 (reader!0 thiss!982 (_2!11142 lt!375681)))))

(declare-fun b!240541 () Bool)

(declare-fun lt!375679 () tuple2!20438)

(assert (=> b!240541 (= e!166724 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_1!11141 lt!375679)))) ((_ sign_extend 32) (currentByte!11578 (_1!11141 lt!375679))) ((_ sign_extend 32) (currentBit!11573 (_1!11141 lt!375679))) nBits!288)))))

(assert (=> b!240541 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288)))

(declare-fun lt!375676 () Unit!17629)

(assert (=> b!240541 (= lt!375676 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6224 (_2!11142 lt!375681)) nBits!288))))

(assert (=> b!240541 (= lt!375679 (reader!0 thiss!982 (_2!11142 lt!375681)))))

(declare-fun lt!375678 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10450 BitStream!10450) Bool)

(assert (=> b!240541 (= lt!375678 (isPrefixOf!0 thiss!982 (_2!11142 lt!375681)))))

(declare-fun lt!375680 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240541 (= lt!375680 (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375681))) (currentByte!11578 (_2!11142 lt!375681)) (currentBit!11573 (_2!11142 lt!375681))))))

(declare-fun lt!375682 () (_ BitVec 64))

(assert (=> b!240541 (= lt!375682 (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)))))

(assert (=> b!240541 e!166722))

(declare-fun res!200806 () Bool)

(assert (=> b!240541 (=> (not res!200806) (not e!166722))))

(assert (=> b!240541 (= res!200806 (= (size!5764 (buf!6224 thiss!982)) (size!5764 (buf!6224 (_2!11142 lt!375681)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10450 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20440)

(assert (=> b!240541 (= lt!375681 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240542 () Bool)

(declare-fun res!200807 () Bool)

(assert (=> b!240542 (=> (not res!200807) (not e!166724))))

(assert (=> b!240542 (= res!200807 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288))))

(declare-fun b!240543 () Bool)

(declare-fun res!200804 () Bool)

(assert (=> b!240543 (=> (not res!200804) (not e!166722))))

(assert (=> b!240543 (= res!200804 (isPrefixOf!0 thiss!982 (_2!11142 lt!375681)))))

(declare-fun b!240544 () Bool)

(declare-fun res!200805 () Bool)

(assert (=> b!240544 (=> (not res!200805) (not e!166722))))

(assert (=> b!240544 (= res!200805 (= (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375681))) (currentByte!11578 (_2!11142 lt!375681)) (currentBit!11573 (_2!11142 lt!375681))) (bvadd (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)) nBits!288)))))

(declare-fun b!240545 () Bool)

(declare-fun array_inv!5505 (array!13159) Bool)

(assert (=> b!240545 (= e!166723 (array_inv!5505 (buf!6224 thiss!982)))))

(assert (= (and start!52228 res!200808) b!240542))

(assert (= (and b!240542 res!200807) b!240541))

(assert (= (and b!240541 res!200806) b!240544))

(assert (= (and b!240544 res!200805) b!240543))

(assert (= (and b!240543 res!200804) b!240540))

(assert (= start!52228 b!240545))

(declare-fun m!363057 () Bool)

(assert (=> b!240543 m!363057))

(declare-fun m!363059 () Bool)

(assert (=> b!240542 m!363059))

(declare-fun m!363061 () Bool)

(assert (=> b!240541 m!363061))

(declare-fun m!363063 () Bool)

(assert (=> b!240541 m!363063))

(declare-fun m!363065 () Bool)

(assert (=> b!240541 m!363065))

(declare-fun m!363067 () Bool)

(assert (=> b!240541 m!363067))

(declare-fun m!363069 () Bool)

(assert (=> b!240541 m!363069))

(declare-fun m!363071 () Bool)

(assert (=> b!240541 m!363071))

(assert (=> b!240541 m!363057))

(declare-fun m!363073 () Bool)

(assert (=> b!240541 m!363073))

(declare-fun m!363075 () Bool)

(assert (=> b!240540 m!363075))

(assert (=> b!240540 m!363067))

(assert (=> b!240540 m!363073))

(assert (=> b!240540 m!363061))

(assert (=> b!240544 m!363071))

(assert (=> b!240544 m!363063))

(declare-fun m!363077 () Bool)

(assert (=> b!240545 m!363077))

(declare-fun m!363079 () Bool)

(assert (=> start!52228 m!363079))

(push 1)

(assert (not b!240542))

(assert (not b!240544))

(assert (not b!240541))

(assert (not b!240543))

(assert (not b!240540))

(assert (not start!52228))

(assert (not b!240545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!240608 () Bool)

(declare-fun e!166763 () Unit!17629)

(declare-fun Unit!17635 () Unit!17629)

(assert (=> b!240608 (= e!166763 Unit!17635)))

(declare-fun b!240609 () Bool)

(declare-fun res!200861 () Bool)

(declare-fun e!166762 () Bool)

(assert (=> b!240609 (=> (not res!200861) (not e!166762))))

(declare-fun lt!375810 () tuple2!20438)

(assert (=> b!240609 (= res!200861 (isPrefixOf!0 (_1!11141 lt!375810) thiss!982))))

(declare-fun lt!375811 () (_ BitVec 64))

(declare-fun lt!375802 () (_ BitVec 64))

(declare-fun b!240610 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10450 (_ BitVec 64)) BitStream!10450)

(assert (=> b!240610 (= e!166762 (= (_1!11141 lt!375810) (withMovedBitIndex!0 (_2!11141 lt!375810) (bvsub lt!375811 lt!375802))))))

(assert (=> b!240610 (or (= (bvand lt!375811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375811 lt!375802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240610 (= lt!375802 (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375681))) (currentByte!11578 (_2!11142 lt!375681)) (currentBit!11573 (_2!11142 lt!375681))))))

(assert (=> b!240610 (= lt!375811 (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)))))

(declare-fun b!240611 () Bool)

(declare-fun res!200862 () Bool)

(assert (=> b!240611 (=> (not res!200862) (not e!166762))))

(assert (=> b!240611 (= res!200862 (isPrefixOf!0 (_2!11141 lt!375810) (_2!11142 lt!375681)))))

(declare-fun d!81314 () Bool)

(assert (=> d!81314 e!166762))

(declare-fun res!200860 () Bool)

(assert (=> d!81314 (=> (not res!200860) (not e!166762))))

(assert (=> d!81314 (= res!200860 (isPrefixOf!0 (_1!11141 lt!375810) (_2!11141 lt!375810)))))

(declare-fun lt!375809 () BitStream!10450)

(assert (=> d!81314 (= lt!375810 (tuple2!20439 lt!375809 (_2!11142 lt!375681)))))

(declare-fun lt!375818 () Unit!17629)

(declare-fun lt!375805 () Unit!17629)

(assert (=> d!81314 (= lt!375818 lt!375805)))

(assert (=> d!81314 (isPrefixOf!0 lt!375809 (_2!11142 lt!375681))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10450 BitStream!10450 BitStream!10450) Unit!17629)

(assert (=> d!81314 (= lt!375805 (lemmaIsPrefixTransitive!0 lt!375809 (_2!11142 lt!375681) (_2!11142 lt!375681)))))

(declare-fun lt!375807 () Unit!17629)

(declare-fun lt!375815 () Unit!17629)

(assert (=> d!81314 (= lt!375807 lt!375815)))

(assert (=> d!81314 (isPrefixOf!0 lt!375809 (_2!11142 lt!375681))))

(assert (=> d!81314 (= lt!375815 (lemmaIsPrefixTransitive!0 lt!375809 thiss!982 (_2!11142 lt!375681)))))

(declare-fun lt!375800 () Unit!17629)

(assert (=> d!81314 (= lt!375800 e!166763)))

(declare-fun c!11425 () Bool)

(assert (=> d!81314 (= c!11425 (not (= (size!5764 (buf!6224 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!375812 () Unit!17629)

(declare-fun lt!375816 () Unit!17629)

(assert (=> d!81314 (= lt!375812 lt!375816)))

(assert (=> d!81314 (isPrefixOf!0 (_2!11142 lt!375681) (_2!11142 lt!375681))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10450) Unit!17629)

(assert (=> d!81314 (= lt!375816 (lemmaIsPrefixRefl!0 (_2!11142 lt!375681)))))

(declare-fun lt!375804 () Unit!17629)

(declare-fun lt!375813 () Unit!17629)

(assert (=> d!81314 (= lt!375804 lt!375813)))

(assert (=> d!81314 (= lt!375813 (lemmaIsPrefixRefl!0 (_2!11142 lt!375681)))))

(declare-fun lt!375806 () Unit!17629)

(declare-fun lt!375801 () Unit!17629)

(assert (=> d!81314 (= lt!375806 lt!375801)))

(assert (=> d!81314 (isPrefixOf!0 lt!375809 lt!375809)))

(assert (=> d!81314 (= lt!375801 (lemmaIsPrefixRefl!0 lt!375809))))

(declare-fun lt!375803 () Unit!17629)

(declare-fun lt!375817 () Unit!17629)

(assert (=> d!81314 (= lt!375803 lt!375817)))

(assert (=> d!81314 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81314 (= lt!375817 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81314 (= lt!375809 (BitStream!10451 (buf!6224 (_2!11142 lt!375681)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)))))

(assert (=> d!81314 (isPrefixOf!0 thiss!982 (_2!11142 lt!375681))))

(assert (=> d!81314 (= (reader!0 thiss!982 (_2!11142 lt!375681)) lt!375810)))

(declare-fun b!240607 () Bool)

(declare-fun lt!375819 () Unit!17629)

(assert (=> b!240607 (= e!166763 lt!375819)))

(declare-fun lt!375814 () (_ BitVec 64))

(assert (=> b!240607 (= lt!375814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375808 () (_ BitVec 64))

(assert (=> b!240607 (= lt!375808 (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13159 array!13159 (_ BitVec 64) (_ BitVec 64)) Unit!17629)

(assert (=> b!240607 (= lt!375819 (arrayBitRangesEqSymmetric!0 (buf!6224 thiss!982) (buf!6224 (_2!11142 lt!375681)) lt!375814 lt!375808))))

(declare-fun arrayBitRangesEq!0 (array!13159 array!13159 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240607 (arrayBitRangesEq!0 (buf!6224 (_2!11142 lt!375681)) (buf!6224 thiss!982) lt!375814 lt!375808)))

(assert (= (and d!81314 c!11425) b!240607))

(assert (= (and d!81314 (not c!11425)) b!240608))

(assert (= (and d!81314 res!200860) b!240609))

(assert (= (and b!240609 res!200861) b!240611))

(assert (= (and b!240611 res!200862) b!240610))

(declare-fun m!363143 () Bool)

(assert (=> b!240610 m!363143))

(assert (=> b!240610 m!363071))

(assert (=> b!240610 m!363063))

(assert (=> b!240607 m!363063))

(declare-fun m!363145 () Bool)

(assert (=> b!240607 m!363145))

(declare-fun m!363147 () Bool)

(assert (=> b!240607 m!363147))

(declare-fun m!363149 () Bool)

(assert (=> b!240609 m!363149))

(declare-fun m!363151 () Bool)

(assert (=> d!81314 m!363151))

(declare-fun m!363153 () Bool)

(assert (=> d!81314 m!363153))

(declare-fun m!363155 () Bool)

(assert (=> d!81314 m!363155))

(assert (=> d!81314 m!363057))

(declare-fun m!363157 () Bool)

(assert (=> d!81314 m!363157))

(declare-fun m!363159 () Bool)

(assert (=> d!81314 m!363159))

(declare-fun m!363161 () Bool)

(assert (=> d!81314 m!363161))

(declare-fun m!363163 () Bool)

(assert (=> d!81314 m!363163))

(declare-fun m!363165 () Bool)

(assert (=> d!81314 m!363165))

(declare-fun m!363167 () Bool)

(assert (=> d!81314 m!363167))

(declare-fun m!363169 () Bool)

(assert (=> d!81314 m!363169))

(declare-fun m!363171 () Bool)

(assert (=> b!240611 m!363171))

(assert (=> b!240541 d!81314))

(declare-fun d!81332 () Bool)

(declare-fun e!166766 () Bool)

(assert (=> d!81332 e!166766))

(declare-fun res!200867 () Bool)

(assert (=> d!81332 (=> (not res!200867) (not e!166766))))

(declare-fun lt!375839 () (_ BitVec 64))

(declare-fun lt!375836 () (_ BitVec 64))

(declare-fun lt!375835 () (_ BitVec 64))

(assert (=> d!81332 (= res!200867 (= lt!375835 (bvsub lt!375836 lt!375839)))))

(assert (=> d!81332 (or (= (bvand lt!375836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375836 lt!375839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81332 (= lt!375839 (remainingBits!0 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 (_2!11142 lt!375681))) ((_ sign_extend 32) (currentBit!11573 (_2!11142 lt!375681)))))))

(declare-fun lt!375840 () (_ BitVec 64))

(declare-fun lt!375838 () (_ BitVec 64))

(assert (=> d!81332 (= lt!375836 (bvmul lt!375840 lt!375838))))

(assert (=> d!81332 (or (= lt!375840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375838 (bvsdiv (bvmul lt!375840 lt!375838) lt!375840)))))

(assert (=> d!81332 (= lt!375838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81332 (= lt!375840 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))))))

(assert (=> d!81332 (= lt!375835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11578 (_2!11142 lt!375681))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11573 (_2!11142 lt!375681)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81332 (invariant!0 (currentBit!11573 (_2!11142 lt!375681)) (currentByte!11578 (_2!11142 lt!375681)) (size!5764 (buf!6224 (_2!11142 lt!375681))))))

(assert (=> d!81332 (= (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375681))) (currentByte!11578 (_2!11142 lt!375681)) (currentBit!11573 (_2!11142 lt!375681))) lt!375835)))

(declare-fun b!240616 () Bool)

(declare-fun res!200868 () Bool)

(assert (=> b!240616 (=> (not res!200868) (not e!166766))))

(assert (=> b!240616 (= res!200868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375835))))

(declare-fun b!240617 () Bool)

(declare-fun lt!375837 () (_ BitVec 64))

(assert (=> b!240617 (= e!166766 (bvsle lt!375835 (bvmul lt!375837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240617 (or (= lt!375837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375837)))))

(assert (=> b!240617 (= lt!375837 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))))))

(assert (= (and d!81332 res!200867) b!240616))

(assert (= (and b!240616 res!200868) b!240617))

(declare-fun m!363175 () Bool)

(assert (=> d!81332 m!363175))

(declare-fun m!363177 () Bool)

(assert (=> d!81332 m!363177))

(assert (=> b!240541 d!81332))

(declare-fun d!81336 () Bool)

(declare-fun res!200875 () Bool)

(declare-fun e!166772 () Bool)

(assert (=> d!81336 (=> (not res!200875) (not e!166772))))

(assert (=> d!81336 (= res!200875 (= (size!5764 (buf!6224 thiss!982)) (size!5764 (buf!6224 (_2!11142 lt!375681)))))))

(assert (=> d!81336 (= (isPrefixOf!0 thiss!982 (_2!11142 lt!375681)) e!166772)))

(declare-fun b!240624 () Bool)

(declare-fun res!200876 () Bool)

(assert (=> b!240624 (=> (not res!200876) (not e!166772))))

(assert (=> b!240624 (= res!200876 (bvsle (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)) (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375681))) (currentByte!11578 (_2!11142 lt!375681)) (currentBit!11573 (_2!11142 lt!375681)))))))

(declare-fun b!240625 () Bool)

(declare-fun e!166771 () Bool)

(assert (=> b!240625 (= e!166772 e!166771)))

(declare-fun res!200877 () Bool)

(assert (=> b!240625 (=> res!200877 e!166771)))

(assert (=> b!240625 (= res!200877 (= (size!5764 (buf!6224 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240626 () Bool)

(assert (=> b!240626 (= e!166771 (arrayBitRangesEq!0 (buf!6224 thiss!982) (buf!6224 (_2!11142 lt!375681)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982))))))

(assert (= (and d!81336 res!200875) b!240624))

(assert (= (and b!240624 res!200876) b!240625))

(assert (= (and b!240625 (not res!200877)) b!240626))

(assert (=> b!240624 m!363063))

(assert (=> b!240624 m!363071))

(assert (=> b!240626 m!363063))

(assert (=> b!240626 m!363063))

(declare-fun m!363179 () Bool)

(assert (=> b!240626 m!363179))

(assert (=> b!240541 d!81336))

(declare-fun d!81338 () Bool)

(assert (=> d!81338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982))) nBits!288))))

(declare-fun bs!20518 () Bool)

(assert (= bs!20518 d!81338))

(declare-fun m!363181 () Bool)

(assert (=> bs!20518 m!363181))

(assert (=> b!240541 d!81338))

(declare-fun b!240683 () Bool)

(declare-fun e!166801 () Bool)

(declare-fun lt!375974 () tuple2!20436)

(declare-fun lt!375976 () tuple2!20438)

(assert (=> b!240683 (= e!166801 (and (_2!11140 lt!375974) (= (_1!11140 lt!375974) (_2!11141 lt!375976))))))

(assert (=> b!240683 (= lt!375974 (checkBitsLoopPure!0 (_1!11141 lt!375976) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!375979 () Unit!17629)

(declare-fun lt!375975 () Unit!17629)

(assert (=> b!240683 (= lt!375979 lt!375975)))

(declare-fun lt!375980 () tuple2!20440)

(declare-fun lt!375978 () (_ BitVec 64))

(assert (=> b!240683 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375980)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) lt!375978)))

(assert (=> b!240683 (= lt!375975 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6224 (_2!11142 lt!375980)) lt!375978))))

(declare-fun e!166800 () Bool)

(assert (=> b!240683 e!166800))

(declare-fun res!200927 () Bool)

(assert (=> b!240683 (=> (not res!200927) (not e!166800))))

(assert (=> b!240683 (= res!200927 (and (= (size!5764 (buf!6224 thiss!982)) (size!5764 (buf!6224 (_2!11142 lt!375980)))) (bvsge lt!375978 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240683 (= lt!375978 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240683 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240683 (= lt!375976 (reader!0 thiss!982 (_2!11142 lt!375980)))))

(declare-fun d!81340 () Bool)

(assert (=> d!81340 e!166801))

(declare-fun res!200926 () Bool)

(assert (=> d!81340 (=> (not res!200926) (not e!166801))))

(assert (=> d!81340 (= res!200926 (= (size!5764 (buf!6224 thiss!982)) (size!5764 (buf!6224 (_2!11142 lt!375980)))))))

(declare-fun choose!51 (BitStream!10450 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20440)

(assert (=> d!81340 (= lt!375980 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81340 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!375980)))

(declare-fun b!240681 () Bool)

(declare-fun res!200928 () Bool)

(assert (=> b!240681 (=> (not res!200928) (not e!166801))))

(declare-fun lt!375977 () (_ BitVec 64))

(declare-fun lt!375981 () (_ BitVec 64))

(assert (=> b!240681 (= res!200928 (= (bitIndex!0 (size!5764 (buf!6224 (_2!11142 lt!375980))) (currentByte!11578 (_2!11142 lt!375980)) (currentBit!11573 (_2!11142 lt!375980))) (bvadd lt!375977 lt!375981)))))

(assert (=> b!240681 (or (not (= (bvand lt!375977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375981 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!375977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!375977 lt!375981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240681 (= lt!375981 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240681 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240681 (= lt!375977 (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)))))

(declare-fun b!240682 () Bool)

(declare-fun res!200929 () Bool)

(assert (=> b!240682 (=> (not res!200929) (not e!166801))))

(assert (=> b!240682 (= res!200929 (isPrefixOf!0 thiss!982 (_2!11142 lt!375980)))))

(declare-fun b!240684 () Bool)

(assert (=> b!240684 (= e!166800 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) lt!375978))))

(assert (= (and d!81340 res!200926) b!240681))

(assert (= (and b!240681 res!200928) b!240682))

(assert (= (and b!240682 res!200929) b!240683))

(assert (= (and b!240683 res!200927) b!240684))

(declare-fun m!363245 () Bool)

(assert (=> b!240682 m!363245))

(declare-fun m!363247 () Bool)

(assert (=> b!240681 m!363247))

(assert (=> b!240681 m!363063))

(declare-fun m!363249 () Bool)

(assert (=> b!240684 m!363249))

(declare-fun m!363251 () Bool)

(assert (=> d!81340 m!363251))

(declare-fun m!363253 () Bool)

(assert (=> b!240683 m!363253))

(declare-fun m!363255 () Bool)

(assert (=> b!240683 m!363255))

(declare-fun m!363257 () Bool)

(assert (=> b!240683 m!363257))

(declare-fun m!363259 () Bool)

(assert (=> b!240683 m!363259))

(assert (=> b!240541 d!81340))

(declare-fun d!81358 () Bool)

(assert (=> d!81358 (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_2!11142 lt!375681)))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288)))

(declare-fun lt!376024 () Unit!17629)

(declare-fun choose!9 (BitStream!10450 array!13159 (_ BitVec 64) BitStream!10450) Unit!17629)

(assert (=> d!81358 (= lt!376024 (choose!9 thiss!982 (buf!6224 (_2!11142 lt!375681)) nBits!288 (BitStream!10451 (buf!6224 (_2!11142 lt!375681)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982))))))

(assert (=> d!81358 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6224 (_2!11142 lt!375681)) nBits!288) lt!376024)))

(declare-fun bs!20521 () Bool)

(assert (= bs!20521 d!81358))

(assert (=> bs!20521 m!363067))

(declare-fun m!363261 () Bool)

(assert (=> bs!20521 m!363261))

(assert (=> b!240541 d!81358))

(declare-fun d!81360 () Bool)

(declare-fun e!166806 () Bool)

(assert (=> d!81360 e!166806))

(declare-fun res!200936 () Bool)

(assert (=> d!81360 (=> (not res!200936) (not e!166806))))

(declare-fun lt!376029 () (_ BitVec 64))

(declare-fun lt!376025 () (_ BitVec 64))

(declare-fun lt!376026 () (_ BitVec 64))

(assert (=> d!81360 (= res!200936 (= lt!376025 (bvsub lt!376026 lt!376029)))))

(assert (=> d!81360 (or (= (bvand lt!376026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376029 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376026 lt!376029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81360 (= lt!376029 (remainingBits!0 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982))))))

(declare-fun lt!376030 () (_ BitVec 64))

(declare-fun lt!376028 () (_ BitVec 64))

(assert (=> d!81360 (= lt!376026 (bvmul lt!376030 lt!376028))))

(assert (=> d!81360 (or (= lt!376030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376028 (bvsdiv (bvmul lt!376030 lt!376028) lt!376030)))))

(assert (=> d!81360 (= lt!376028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81360 (= lt!376030 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))))))

(assert (=> d!81360 (= lt!376025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11578 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11573 thiss!982))))))

(assert (=> d!81360 (invariant!0 (currentBit!11573 thiss!982) (currentByte!11578 thiss!982) (size!5764 (buf!6224 thiss!982)))))

(assert (=> d!81360 (= (bitIndex!0 (size!5764 (buf!6224 thiss!982)) (currentByte!11578 thiss!982) (currentBit!11573 thiss!982)) lt!376025)))

(declare-fun b!240695 () Bool)

(declare-fun res!200937 () Bool)

(assert (=> b!240695 (=> (not res!200937) (not e!166806))))

(assert (=> b!240695 (= res!200937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376025))))

(declare-fun b!240696 () Bool)

(declare-fun lt!376027 () (_ BitVec 64))

(assert (=> b!240696 (= e!166806 (bvsle lt!376025 (bvmul lt!376027 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240696 (or (= lt!376027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376027)))))

(assert (=> b!240696 (= lt!376027 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))))))

(assert (= (and d!81360 res!200936) b!240695))

(assert (= (and b!240695 res!200937) b!240696))

(declare-fun m!363263 () Bool)

(assert (=> d!81360 m!363263))

(declare-fun m!363265 () Bool)

(assert (=> d!81360 m!363265))

(assert (=> b!240541 d!81360))

(declare-fun d!81362 () Bool)

(assert (=> d!81362 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 (_1!11141 lt!375679)))) ((_ sign_extend 32) (currentByte!11578 (_1!11141 lt!375679))) ((_ sign_extend 32) (currentBit!11573 (_1!11141 lt!375679))) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5764 (buf!6224 (_1!11141 lt!375679)))) ((_ sign_extend 32) (currentByte!11578 (_1!11141 lt!375679))) ((_ sign_extend 32) (currentBit!11573 (_1!11141 lt!375679)))) nBits!288))))

(declare-fun bs!20522 () Bool)

(assert (= bs!20522 d!81362))

(declare-fun m!363267 () Bool)

(assert (=> bs!20522 m!363267))

(assert (=> b!240541 d!81362))

(declare-fun d!81364 () Bool)

(assert (=> d!81364 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5764 (buf!6224 thiss!982))) ((_ sign_extend 32) (currentByte!11578 thiss!982)) ((_ sign_extend 32) (currentBit!11573 thiss!982))) nBits!288))))

(declare-fun bs!20523 () Bool)

(assert (= bs!20523 d!81364))

(assert (=> bs!20523 m!363263))

(assert (=> b!240542 d!81364))

(declare-fun d!81366 () Bool)

(assert (=> d!81366 (= (array_inv!5505 (buf!6224 thiss!982)) (bvsge (size!5764 (buf!6224 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240545 d!81366))

(declare-datatypes ((tuple2!20456 0))(
  ( (tuple2!20457 (_1!11150 Bool) (_2!11150 BitStream!10450)) )
))
(declare-fun lt!376053 () tuple2!20456)

(declare-fun d!81368 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10450 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20456)

(assert (=> d!81368 (= lt!376053 (checkBitsLoop!0 (_1!11141 lt!375677) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81368 (= (checkBitsLoopPure!0 (_1!11141 lt!375677) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20437 (_2!11150 lt!376053) (_1!11150 lt!376053)))))

(declare-fun bs!20524 () Bool)

(assert (= bs!20524 d!81368))

(declare-fun m!363299 () Bool)

(assert (=> bs!20524 m!363299))

(assert (=> b!240540 d!81368))

(assert (=> b!240540 d!81338))

(assert (=> b!240540 d!81358))

(assert (=> b!240540 d!81314))

(assert (=> b!240544 d!81332))

(assert (=> b!240544 d!81360))

(declare-fun d!81372 () Bool)

(assert (=> d!81372 (= (inv!12 thiss!982) (invariant!0 (currentBit!11573 thiss!982) (currentByte!11578 thiss!982) (size!5764 (buf!6224 thiss!982))))))

(declare-fun bs!20526 () Bool)

(assert (= bs!20526 d!81372))

(assert (=> bs!20526 m!363265))

(assert (=> start!52228 d!81372))

(assert (=> b!240543 d!81336))

(push 1)

(assert (not b!240609))

(assert (not b!240626))

(assert (not d!81340))

(assert (not b!240624))

(assert (not b!240682))

(assert (not d!81338))

(assert (not d!81372))

(assert (not d!81314))

(assert (not d!81358))

(assert (not b!240610))

(assert (not d!81362))

(assert (not b!240683))

(assert (not d!81368))

(assert (not d!81364))

(assert (not b!240607))

(assert (not b!240681))

(assert (not d!81360))

(assert (not b!240611))

(assert (not b!240684))

(assert (not d!81332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

