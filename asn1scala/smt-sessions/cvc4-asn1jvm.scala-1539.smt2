; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42976 () Bool)

(assert start!42976)

(declare-fun b!202611 () Bool)

(declare-fun res!169711 () Bool)

(declare-fun e!138913 () Bool)

(assert (=> b!202611 (=> (not res!169711) (not e!138913))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202611 (= res!169711 (not (= i!590 nBits!348)))))

(declare-fun b!202612 () Bool)

(declare-fun e!138912 () Bool)

(assert (=> b!202612 (= e!138913 (not e!138912))))

(declare-fun res!169707 () Bool)

(assert (=> b!202612 (=> res!169707 e!138912)))

(declare-fun lt!315683 () (_ BitVec 64))

(declare-fun lt!315674 () (_ BitVec 64))

(assert (=> b!202612 (= res!169707 (not (= lt!315683 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315674))))))

(declare-datatypes ((array!10293 0))(
  ( (array!10294 (arr!5460 (Array (_ BitVec 32) (_ BitVec 8))) (size!4530 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8168 0))(
  ( (BitStream!8169 (buf!5035 array!10293) (currentByte!9475 (_ BitVec 32)) (currentBit!9470 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14386 0))(
  ( (Unit!14387) )
))
(declare-datatypes ((tuple2!17338 0))(
  ( (tuple2!17339 (_1!9321 Unit!14386) (_2!9321 BitStream!8168)) )
))
(declare-fun lt!315676 () tuple2!17338)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202612 (= lt!315683 (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))))))

(declare-fun thiss!1204 () BitStream!8168)

(assert (=> b!202612 (= lt!315674 (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)))))

(declare-fun e!138915 () Bool)

(assert (=> b!202612 e!138915))

(declare-fun res!169709 () Bool)

(assert (=> b!202612 (=> (not res!169709) (not e!138915))))

(assert (=> b!202612 (= res!169709 (= (size!4530 (buf!5035 thiss!1204)) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(declare-fun lt!315679 () Bool)

(declare-fun appendBit!0 (BitStream!8168 Bool) tuple2!17338)

(assert (=> b!202612 (= lt!315676 (appendBit!0 thiss!1204 lt!315679))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!202612 (= lt!315679 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!169708 () Bool)

(assert (=> start!42976 (=> (not res!169708) (not e!138913))))

(assert (=> start!42976 (= res!169708 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42976 e!138913))

(assert (=> start!42976 true))

(declare-fun e!138914 () Bool)

(declare-fun inv!12 (BitStream!8168) Bool)

(assert (=> start!42976 (and (inv!12 thiss!1204) e!138914)))

(declare-fun b!202613 () Bool)

(declare-fun e!138909 () Bool)

(declare-datatypes ((tuple2!17340 0))(
  ( (tuple2!17341 (_1!9322 BitStream!8168) (_2!9322 Bool)) )
))
(declare-fun lt!315682 () tuple2!17340)

(declare-fun lt!315677 () (_ BitVec 64))

(assert (=> b!202613 (= e!138909 (= (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!315682))) (currentByte!9475 (_1!9322 lt!315682)) (currentBit!9470 (_1!9322 lt!315682))) lt!315677))))

(declare-fun b!202614 () Bool)

(declare-fun array_inv!4271 (array!10293) Bool)

(assert (=> b!202614 (= e!138914 (array_inv!4271 (buf!5035 thiss!1204)))))

(declare-fun lt!315681 () (_ BitVec 64))

(declare-fun b!202615 () Bool)

(assert (=> b!202615 (= e!138912 (or (not (= lt!315681 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!315681 (bvand (bvadd lt!315683 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202615 (= lt!315681 (bvand lt!315683 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!315680 () tuple2!17338)

(declare-fun isPrefixOf!0 (BitStream!8168 BitStream!8168) Bool)

(assert (=> b!202615 (isPrefixOf!0 thiss!1204 (_2!9321 lt!315680))))

(declare-fun lt!315675 () Unit!14386)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8168 BitStream!8168 BitStream!8168) Unit!14386)

(assert (=> b!202615 (= lt!315675 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9321 lt!315676) (_2!9321 lt!315680)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17338)

(assert (=> b!202615 (= lt!315680 (appendBitsLSBFirstLoopTR!0 (_2!9321 lt!315676) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202616 () Bool)

(declare-fun res!169712 () Bool)

(declare-fun e!138910 () Bool)

(assert (=> b!202616 (=> (not res!169712) (not e!138910))))

(assert (=> b!202616 (= res!169712 (isPrefixOf!0 thiss!1204 (_2!9321 lt!315676)))))

(declare-fun b!202617 () Bool)

(declare-fun res!169713 () Bool)

(assert (=> b!202617 (=> (not res!169713) (not e!138913))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202617 (= res!169713 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))) ((_ sign_extend 32) (currentByte!9475 thiss!1204)) ((_ sign_extend 32) (currentBit!9470 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202618 () Bool)

(assert (=> b!202618 (= e!138910 e!138909)))

(declare-fun res!169715 () Bool)

(assert (=> b!202618 (=> (not res!169715) (not e!138909))))

(assert (=> b!202618 (= res!169715 (and (= (_2!9322 lt!315682) lt!315679) (= (_1!9322 lt!315682) (_2!9321 lt!315676))))))

(declare-fun readBitPure!0 (BitStream!8168) tuple2!17340)

(declare-fun readerFrom!0 (BitStream!8168 (_ BitVec 32) (_ BitVec 32)) BitStream!8168)

(assert (=> b!202618 (= lt!315682 (readBitPure!0 (readerFrom!0 (_2!9321 lt!315676) (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204))))))

(declare-fun b!202619 () Bool)

(declare-fun res!169710 () Bool)

(assert (=> b!202619 (=> (not res!169710) (not e!138913))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202619 (= res!169710 (invariant!0 (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204))))))

(declare-fun b!202620 () Bool)

(assert (=> b!202620 (= e!138915 e!138910)))

(declare-fun res!169714 () Bool)

(assert (=> b!202620 (=> (not res!169714) (not e!138910))))

(declare-fun lt!315678 () (_ BitVec 64))

(assert (=> b!202620 (= res!169714 (= lt!315677 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315678)))))

(assert (=> b!202620 (= lt!315677 (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))))))

(assert (=> b!202620 (= lt!315678 (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)))))

(assert (= (and start!42976 res!169708) b!202617))

(assert (= (and b!202617 res!169713) b!202619))

(assert (= (and b!202619 res!169710) b!202611))

(assert (= (and b!202611 res!169711) b!202612))

(assert (= (and b!202612 res!169709) b!202620))

(assert (= (and b!202620 res!169714) b!202616))

(assert (= (and b!202616 res!169712) b!202618))

(assert (= (and b!202618 res!169715) b!202613))

(assert (= (and b!202612 (not res!169707)) b!202615))

(assert (= start!42976 b!202614))

(declare-fun m!313157 () Bool)

(assert (=> b!202612 m!313157))

(declare-fun m!313159 () Bool)

(assert (=> b!202612 m!313159))

(declare-fun m!313161 () Bool)

(assert (=> b!202612 m!313161))

(declare-fun m!313163 () Bool)

(assert (=> b!202617 m!313163))

(declare-fun m!313165 () Bool)

(assert (=> b!202618 m!313165))

(assert (=> b!202618 m!313165))

(declare-fun m!313167 () Bool)

(assert (=> b!202618 m!313167))

(declare-fun m!313169 () Bool)

(assert (=> b!202619 m!313169))

(assert (=> b!202620 m!313157))

(assert (=> b!202620 m!313159))

(declare-fun m!313171 () Bool)

(assert (=> b!202615 m!313171))

(declare-fun m!313173 () Bool)

(assert (=> b!202615 m!313173))

(declare-fun m!313175 () Bool)

(assert (=> b!202615 m!313175))

(declare-fun m!313177 () Bool)

(assert (=> b!202613 m!313177))

(declare-fun m!313179 () Bool)

(assert (=> b!202616 m!313179))

(declare-fun m!313181 () Bool)

(assert (=> start!42976 m!313181))

(declare-fun m!313183 () Bool)

(assert (=> b!202614 m!313183))

(push 1)

(assert (not b!202616))

(assert (not b!202618))

(assert (not b!202613))

(assert (not b!202614))

(assert (not b!202612))

(assert (not b!202620))

(assert (not start!42976))

(assert (not b!202615))

(assert (not b!202619))

(assert (not b!202617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69311 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69311 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))) ((_ sign_extend 32) (currentByte!9475 thiss!1204)) ((_ sign_extend 32) (currentBit!9470 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))) ((_ sign_extend 32) (currentByte!9475 thiss!1204)) ((_ sign_extend 32) (currentBit!9470 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17097 () Bool)

(assert (= bs!17097 d!69311))

(declare-fun m!313201 () Bool)

(assert (=> bs!17097 m!313201))

(assert (=> b!202617 d!69311))

(declare-fun d!69313 () Bool)

(declare-fun e!138952 () Bool)

(assert (=> d!69313 e!138952))

(declare-fun res!169777 () Bool)

(assert (=> d!69313 (=> (not res!169777) (not e!138952))))

(declare-fun lt!315770 () (_ BitVec 64))

(declare-fun lt!315771 () (_ BitVec 64))

(declare-fun lt!315768 () (_ BitVec 64))

(assert (=> d!69313 (= res!169777 (= lt!315771 (bvsub lt!315770 lt!315768)))))

(assert (=> d!69313 (or (= (bvand lt!315770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315770 lt!315768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69313 (= lt!315768 (remainingBits!0 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!315676)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676)))))))

(declare-fun lt!315773 () (_ BitVec 64))

(declare-fun lt!315769 () (_ BitVec 64))

(assert (=> d!69313 (= lt!315770 (bvmul lt!315773 lt!315769))))

(assert (=> d!69313 (or (= lt!315773 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315769 (bvsdiv (bvmul lt!315773 lt!315769) lt!315773)))))

(assert (=> d!69313 (= lt!315769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69313 (= lt!315773 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(assert (=> d!69313 (= lt!315771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676)))))))

(assert (=> d!69313 (invariant!0 (currentBit!9470 (_2!9321 lt!315676)) (currentByte!9475 (_2!9321 lt!315676)) (size!4530 (buf!5035 (_2!9321 lt!315676))))))

(assert (=> d!69313 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))) lt!315771)))

(declare-fun b!202681 () Bool)

(declare-fun res!169778 () Bool)

(assert (=> b!202681 (=> (not res!169778) (not e!138952))))

(assert (=> b!202681 (= res!169778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315771))))

(declare-fun b!202682 () Bool)

(declare-fun lt!315772 () (_ BitVec 64))

(assert (=> b!202682 (= e!138952 (bvsle lt!315771 (bvmul lt!315772 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202682 (or (= lt!315772 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315772 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315772)))))

(assert (=> b!202682 (= lt!315772 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(assert (= (and d!69313 res!169777) b!202681))

(assert (= (and b!202681 res!169778) b!202682))

(declare-fun m!313239 () Bool)

(assert (=> d!69313 m!313239))

(declare-fun m!313241 () Bool)

(assert (=> d!69313 m!313241))

(assert (=> b!202612 d!69313))

(declare-fun d!69335 () Bool)

(declare-fun e!138953 () Bool)

(assert (=> d!69335 e!138953))

(declare-fun res!169779 () Bool)

(assert (=> d!69335 (=> (not res!169779) (not e!138953))))

(declare-fun lt!315777 () (_ BitVec 64))

(declare-fun lt!315776 () (_ BitVec 64))

(declare-fun lt!315774 () (_ BitVec 64))

(assert (=> d!69335 (= res!169779 (= lt!315777 (bvsub lt!315776 lt!315774)))))

(assert (=> d!69335 (or (= (bvand lt!315776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315774 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315776 lt!315774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69335 (= lt!315774 (remainingBits!0 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))) ((_ sign_extend 32) (currentByte!9475 thiss!1204)) ((_ sign_extend 32) (currentBit!9470 thiss!1204))))))

(declare-fun lt!315779 () (_ BitVec 64))

(declare-fun lt!315775 () (_ BitVec 64))

(assert (=> d!69335 (= lt!315776 (bvmul lt!315779 lt!315775))))

(assert (=> d!69335 (or (= lt!315779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315775 (bvsdiv (bvmul lt!315779 lt!315775) lt!315779)))))

(assert (=> d!69335 (= lt!315775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69335 (= lt!315779 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))))))

(assert (=> d!69335 (= lt!315777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9475 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9470 thiss!1204))))))

(assert (=> d!69335 (invariant!0 (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204)))))

(assert (=> d!69335 (= (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)) lt!315777)))

(declare-fun b!202683 () Bool)

(declare-fun res!169780 () Bool)

(assert (=> b!202683 (=> (not res!169780) (not e!138953))))

(assert (=> b!202683 (= res!169780 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315777))))

(declare-fun b!202684 () Bool)

(declare-fun lt!315778 () (_ BitVec 64))

(assert (=> b!202684 (= e!138953 (bvsle lt!315777 (bvmul lt!315778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202684 (or (= lt!315778 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315778 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315778)))))

(assert (=> b!202684 (= lt!315778 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))))))

(assert (= (and d!69335 res!169779) b!202683))

(assert (= (and b!202683 res!169780) b!202684))

(assert (=> d!69335 m!313201))

(assert (=> d!69335 m!313169))

(assert (=> b!202612 d!69335))

(declare-fun b!202697 () Bool)

(declare-fun e!138958 () Bool)

(declare-fun lt!315790 () tuple2!17340)

(declare-fun lt!315791 () tuple2!17338)

(assert (=> b!202697 (= e!138958 (= (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!315790))) (currentByte!9475 (_1!9322 lt!315790)) (currentBit!9470 (_1!9322 lt!315790))) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315791))) (currentByte!9475 (_2!9321 lt!315791)) (currentBit!9470 (_2!9321 lt!315791)))))))

(declare-fun d!69337 () Bool)

(declare-fun e!138959 () Bool)

(assert (=> d!69337 e!138959))

(declare-fun res!169789 () Bool)

(assert (=> d!69337 (=> (not res!169789) (not e!138959))))

(assert (=> d!69337 (= res!169789 (= (size!4530 (buf!5035 thiss!1204)) (size!4530 (buf!5035 (_2!9321 lt!315791)))))))

(declare-fun choose!16 (BitStream!8168 Bool) tuple2!17338)

(assert (=> d!69337 (= lt!315791 (choose!16 thiss!1204 lt!315679))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69337 (validate_offset_bit!0 ((_ sign_extend 32) (size!4530 (buf!5035 thiss!1204))) ((_ sign_extend 32) (currentByte!9475 thiss!1204)) ((_ sign_extend 32) (currentBit!9470 thiss!1204)))))

(assert (=> d!69337 (= (appendBit!0 thiss!1204 lt!315679) lt!315791)))

(declare-fun b!202696 () Bool)

(assert (=> b!202696 (= e!138959 e!138958)))

(declare-fun res!169790 () Bool)

(assert (=> b!202696 (=> (not res!169790) (not e!138958))))

(assert (=> b!202696 (= res!169790 (and (= (_2!9322 lt!315790) lt!315679) (= (_1!9322 lt!315790) (_2!9321 lt!315791))))))

(assert (=> b!202696 (= lt!315790 (readBitPure!0 (readerFrom!0 (_2!9321 lt!315791) (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204))))))

(declare-fun b!202694 () Bool)

(declare-fun res!169792 () Bool)

(assert (=> b!202694 (=> (not res!169792) (not e!138959))))

(declare-fun lt!315789 () (_ BitVec 64))

(declare-fun lt!315788 () (_ BitVec 64))

(assert (=> b!202694 (= res!169792 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315791))) (currentByte!9475 (_2!9321 lt!315791)) (currentBit!9470 (_2!9321 lt!315791))) (bvadd lt!315789 lt!315788)))))

(assert (=> b!202694 (or (not (= (bvand lt!315789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315788 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315789 lt!315788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202694 (= lt!315788 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202694 (= lt!315789 (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)))))

(declare-fun b!202695 () Bool)

(declare-fun res!169791 () Bool)

(assert (=> b!202695 (=> (not res!169791) (not e!138959))))

(assert (=> b!202695 (= res!169791 (isPrefixOf!0 thiss!1204 (_2!9321 lt!315791)))))

(assert (= (and d!69337 res!169789) b!202694))

(assert (= (and b!202694 res!169792) b!202695))

(assert (= (and b!202695 res!169791) b!202696))

(assert (= (and b!202696 res!169790) b!202697))

(declare-fun m!313243 () Bool)

(assert (=> b!202697 m!313243))

(declare-fun m!313245 () Bool)

(assert (=> b!202697 m!313245))

(assert (=> b!202694 m!313245))

(assert (=> b!202694 m!313159))

(declare-fun m!313247 () Bool)

(assert (=> b!202695 m!313247))

(declare-fun m!313249 () Bool)

(assert (=> d!69337 m!313249))

(declare-fun m!313251 () Bool)

(assert (=> d!69337 m!313251))

(declare-fun m!313253 () Bool)

(assert (=> b!202696 m!313253))

(assert (=> b!202696 m!313253))

(declare-fun m!313255 () Bool)

(assert (=> b!202696 m!313255))

(assert (=> b!202612 d!69337))

(declare-fun d!69339 () Bool)

(declare-datatypes ((tuple2!17354 0))(
  ( (tuple2!17355 (_1!9329 Bool) (_2!9329 BitStream!8168)) )
))
(declare-fun lt!315794 () tuple2!17354)

(declare-fun readBit!0 (BitStream!8168) tuple2!17354)

(assert (=> d!69339 (= lt!315794 (readBit!0 (readerFrom!0 (_2!9321 lt!315676) (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204))))))

(assert (=> d!69339 (= (readBitPure!0 (readerFrom!0 (_2!9321 lt!315676) (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204))) (tuple2!17341 (_2!9329 lt!315794) (_1!9329 lt!315794)))))

(declare-fun bs!17102 () Bool)

(assert (= bs!17102 d!69339))

(assert (=> bs!17102 m!313165))

(declare-fun m!313257 () Bool)

(assert (=> bs!17102 m!313257))

(assert (=> b!202618 d!69339))

(declare-fun d!69341 () Bool)

(declare-fun e!138962 () Bool)

(assert (=> d!69341 e!138962))

(declare-fun res!169796 () Bool)

(assert (=> d!69341 (=> (not res!169796) (not e!138962))))

(assert (=> d!69341 (= res!169796 (invariant!0 (currentBit!9470 (_2!9321 lt!315676)) (currentByte!9475 (_2!9321 lt!315676)) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(assert (=> d!69341 (= (readerFrom!0 (_2!9321 lt!315676) (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204)) (BitStream!8169 (buf!5035 (_2!9321 lt!315676)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)))))

(declare-fun b!202700 () Bool)

(assert (=> b!202700 (= e!138962 (invariant!0 (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(assert (= (and d!69341 res!169796) b!202700))

(assert (=> d!69341 m!313241))

(declare-fun m!313259 () Bool)

(assert (=> b!202700 m!313259))

(assert (=> b!202618 d!69341))

(declare-fun d!69343 () Bool)

(declare-fun e!138963 () Bool)

(assert (=> d!69343 e!138963))

(declare-fun res!169797 () Bool)

(assert (=> d!69343 (=> (not res!169797) (not e!138963))))

(declare-fun lt!315798 () (_ BitVec 64))

(declare-fun lt!315797 () (_ BitVec 64))

(declare-fun lt!315795 () (_ BitVec 64))

(assert (=> d!69343 (= res!169797 (= lt!315798 (bvsub lt!315797 lt!315795)))))

(assert (=> d!69343 (or (= (bvand lt!315797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315797 lt!315795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69343 (= lt!315795 (remainingBits!0 ((_ sign_extend 32) (size!4530 (buf!5035 (_1!9322 lt!315682)))) ((_ sign_extend 32) (currentByte!9475 (_1!9322 lt!315682))) ((_ sign_extend 32) (currentBit!9470 (_1!9322 lt!315682)))))))

(declare-fun lt!315800 () (_ BitVec 64))

(declare-fun lt!315796 () (_ BitVec 64))

(assert (=> d!69343 (= lt!315797 (bvmul lt!315800 lt!315796))))

(assert (=> d!69343 (or (= lt!315800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315796 (bvsdiv (bvmul lt!315800 lt!315796) lt!315800)))))

(assert (=> d!69343 (= lt!315796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69343 (= lt!315800 ((_ sign_extend 32) (size!4530 (buf!5035 (_1!9322 lt!315682)))))))

(assert (=> d!69343 (= lt!315798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9475 (_1!9322 lt!315682))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9470 (_1!9322 lt!315682)))))))

(assert (=> d!69343 (invariant!0 (currentBit!9470 (_1!9322 lt!315682)) (currentByte!9475 (_1!9322 lt!315682)) (size!4530 (buf!5035 (_1!9322 lt!315682))))))

(assert (=> d!69343 (= (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!315682))) (currentByte!9475 (_1!9322 lt!315682)) (currentBit!9470 (_1!9322 lt!315682))) lt!315798)))

(declare-fun b!202701 () Bool)

(declare-fun res!169798 () Bool)

(assert (=> b!202701 (=> (not res!169798) (not e!138963))))

(assert (=> b!202701 (= res!169798 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315798))))

(declare-fun b!202702 () Bool)

(declare-fun lt!315799 () (_ BitVec 64))

(assert (=> b!202702 (= e!138963 (bvsle lt!315798 (bvmul lt!315799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202702 (or (= lt!315799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315799)))))

(assert (=> b!202702 (= lt!315799 ((_ sign_extend 32) (size!4530 (buf!5035 (_1!9322 lt!315682)))))))

(assert (= (and d!69343 res!169797) b!202701))

(assert (= (and b!202701 res!169798) b!202702))

(declare-fun m!313261 () Bool)

(assert (=> d!69343 m!313261))

(declare-fun m!313263 () Bool)

(assert (=> d!69343 m!313263))

(assert (=> b!202613 d!69343))

(declare-fun d!69345 () Bool)

(assert (=> d!69345 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204))))))

(declare-fun bs!17103 () Bool)

(assert (= bs!17103 d!69345))

(assert (=> bs!17103 m!313169))

(assert (=> start!42976 d!69345))

(declare-fun d!69347 () Bool)

(assert (=> d!69347 (= (invariant!0 (currentBit!9470 thiss!1204) (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204))) (and (bvsge (currentBit!9470 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9470 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9475 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204))) (and (= (currentBit!9470 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9475 thiss!1204) (size!4530 (buf!5035 thiss!1204)))))))))

(assert (=> b!202619 d!69347))

(declare-fun d!69349 () Bool)

(assert (=> d!69349 (= (array_inv!4271 (buf!5035 thiss!1204)) (bvsge (size!4530 (buf!5035 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202614 d!69349))

(assert (=> b!202620 d!69313))

(assert (=> b!202620 d!69335))

(declare-fun d!69351 () Bool)

(declare-fun res!169806 () Bool)

(declare-fun e!138969 () Bool)

(assert (=> d!69351 (=> (not res!169806) (not e!138969))))

(assert (=> d!69351 (= res!169806 (= (size!4530 (buf!5035 thiss!1204)) (size!4530 (buf!5035 (_2!9321 lt!315680)))))))

(assert (=> d!69351 (= (isPrefixOf!0 thiss!1204 (_2!9321 lt!315680)) e!138969)))

(declare-fun b!202709 () Bool)

(declare-fun res!169807 () Bool)

(assert (=> b!202709 (=> (not res!169807) (not e!138969))))

(assert (=> b!202709 (= res!169807 (bvsle (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315680))) (currentByte!9475 (_2!9321 lt!315680)) (currentBit!9470 (_2!9321 lt!315680)))))))

(declare-fun b!202710 () Bool)

(declare-fun e!138968 () Bool)

(assert (=> b!202710 (= e!138969 e!138968)))

(declare-fun res!169805 () Bool)

(assert (=> b!202710 (=> res!169805 e!138968)))

(assert (=> b!202710 (= res!169805 (= (size!4530 (buf!5035 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202711 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10293 array!10293 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202711 (= e!138968 (arrayBitRangesEq!0 (buf!5035 thiss!1204) (buf!5035 (_2!9321 lt!315680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204))))))

(assert (= (and d!69351 res!169806) b!202709))

(assert (= (and b!202709 res!169807) b!202710))

(assert (= (and b!202710 (not res!169805)) b!202711))

(assert (=> b!202709 m!313159))

(declare-fun m!313265 () Bool)

(assert (=> b!202709 m!313265))

(assert (=> b!202711 m!313159))

(assert (=> b!202711 m!313159))

(declare-fun m!313267 () Bool)

(assert (=> b!202711 m!313267))

(assert (=> b!202615 d!69351))

(declare-fun d!69353 () Bool)

(assert (=> d!69353 (isPrefixOf!0 thiss!1204 (_2!9321 lt!315680))))

(declare-fun lt!315803 () Unit!14386)

(declare-fun choose!30 (BitStream!8168 BitStream!8168 BitStream!8168) Unit!14386)

(assert (=> d!69353 (= lt!315803 (choose!30 thiss!1204 (_2!9321 lt!315676) (_2!9321 lt!315680)))))

(assert (=> d!69353 (isPrefixOf!0 thiss!1204 (_2!9321 lt!315676))))

(assert (=> d!69353 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9321 lt!315676) (_2!9321 lt!315680)) lt!315803)))

(declare-fun bs!17104 () Bool)

(assert (= bs!17104 d!69353))

(assert (=> bs!17104 m!313171))

(declare-fun m!313269 () Bool)

(assert (=> bs!17104 m!313269))

(assert (=> bs!17104 m!313179))

(assert (=> b!202615 d!69353))

(declare-fun b!202860 () Bool)

(declare-fun e!139060 () Bool)

(declare-fun lt!316310 () (_ BitVec 64))

(assert (=> b!202860 (= e!139060 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!315676)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676))) lt!316310))))

(declare-fun c!10061 () Bool)

(declare-fun call!3198 () Bool)

(declare-fun bm!3195 () Bool)

(declare-fun lt!316304 () tuple2!17338)

(assert (=> bm!3195 (= call!3198 (isPrefixOf!0 (_2!9321 lt!315676) (ite c!10061 (_2!9321 lt!315676) (_2!9321 lt!316304))))))

(declare-fun b!202861 () Bool)

(declare-fun e!139052 () (_ BitVec 64))

(assert (=> b!202861 (= e!139052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!202862 () Bool)

(declare-fun e!139057 () Bool)

(declare-fun lt!316314 () tuple2!17340)

(declare-fun lt!316312 () tuple2!17338)

(assert (=> b!202862 (= e!139057 (= (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!316314))) (currentByte!9475 (_1!9322 lt!316314)) (currentBit!9470 (_1!9322 lt!316314))) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316312))) (currentByte!9475 (_2!9321 lt!316312)) (currentBit!9470 (_2!9321 lt!316312)))))))

(declare-fun b!202863 () Bool)

(declare-fun res!169928 () Bool)

(assert (=> b!202863 (= res!169928 (isPrefixOf!0 (_2!9321 lt!315676) (_2!9321 lt!316312)))))

(declare-fun e!139054 () Bool)

(assert (=> b!202863 (=> (not res!169928) (not e!139054))))

(declare-fun b!202864 () Bool)

(declare-fun res!169927 () Bool)

(declare-fun e!139056 () Bool)

(assert (=> b!202864 (=> (not res!169927) (not e!139056))))

(declare-fun lt!316300 () (_ BitVec 64))

(declare-fun lt!316319 () tuple2!17338)

(declare-fun lt!316317 () (_ BitVec 64))

(assert (=> b!202864 (= res!169927 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316319))) (currentByte!9475 (_2!9321 lt!316319)) (currentBit!9470 (_2!9321 lt!316319))) (bvsub lt!316300 lt!316317)))))

(assert (=> b!202864 (or (= (bvand lt!316300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316300 lt!316317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202864 (= lt!316317 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!316291 () (_ BitVec 64))

(declare-fun lt!316318 () (_ BitVec 64))

(assert (=> b!202864 (= lt!316300 (bvadd lt!316291 lt!316318))))

(assert (=> b!202864 (or (not (= (bvand lt!316291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316318 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316291 lt!316318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202864 (= lt!316318 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202864 (= lt!316291 (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))))))

(declare-fun b!202865 () Bool)

(declare-fun e!139058 () Bool)

(assert (=> b!202865 (= e!139056 e!139058)))

(declare-fun res!169924 () Bool)

(assert (=> b!202865 (=> (not res!169924) (not e!139058))))

(declare-datatypes ((tuple2!17356 0))(
  ( (tuple2!17357 (_1!9330 BitStream!8168) (_2!9330 (_ BitVec 64))) )
))
(declare-fun lt!316328 () tuple2!17356)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202865 (= res!169924 (= (_2!9330 lt!316328) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17358 0))(
  ( (tuple2!17359 (_1!9331 BitStream!8168) (_2!9331 BitStream!8168)) )
))
(declare-fun lt!316308 () tuple2!17358)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17356)

(assert (=> b!202865 (= lt!316328 (readNBitsLSBFirstsLoopPure!0 (_1!9331 lt!316308) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!316288 () Unit!14386)

(declare-fun lt!316323 () Unit!14386)

(assert (=> b!202865 (= lt!316288 lt!316323)))

(assert (=> b!202865 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!316319)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676))) lt!316310)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8168 array!10293 (_ BitVec 64)) Unit!14386)

(assert (=> b!202865 (= lt!316323 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9321 lt!315676) (buf!5035 (_2!9321 lt!316319)) lt!316310))))

(assert (=> b!202865 e!139060))

(declare-fun res!169926 () Bool)

(assert (=> b!202865 (=> (not res!169926) (not e!139060))))

(assert (=> b!202865 (= res!169926 (and (= (size!4530 (buf!5035 (_2!9321 lt!315676))) (size!4530 (buf!5035 (_2!9321 lt!316319)))) (bvsge lt!316310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202865 (= lt!316310 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202865 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8168 BitStream!8168) tuple2!17358)

(assert (=> b!202865 (= lt!316308 (reader!0 (_2!9321 lt!315676) (_2!9321 lt!316319)))))

(declare-fun d!69355 () Bool)

(assert (=> d!69355 e!139056))

(declare-fun res!169931 () Bool)

(assert (=> d!69355 (=> (not res!169931) (not e!139056))))

(assert (=> d!69355 (= res!169931 (invariant!0 (currentBit!9470 (_2!9321 lt!316319)) (currentByte!9475 (_2!9321 lt!316319)) (size!4530 (buf!5035 (_2!9321 lt!316319)))))))

(declare-fun e!139059 () tuple2!17338)

(assert (=> d!69355 (= lt!316319 e!139059)))

(assert (=> d!69355 (= c!10061 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69355 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69355 (= (appendBitsLSBFirstLoopTR!0 (_2!9321 lt!315676) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!316319)))

(declare-fun b!202866 () Bool)

(assert (=> b!202866 (= lt!316314 (readBitPure!0 (readerFrom!0 (_2!9321 lt!316312) (currentBit!9470 (_2!9321 lt!315676)) (currentByte!9475 (_2!9321 lt!315676)))))))

(declare-fun lt!316311 () Bool)

(declare-fun res!169932 () Bool)

(assert (=> b!202866 (= res!169932 (and (= (_2!9322 lt!316314) lt!316311) (= (_1!9322 lt!316314) (_2!9321 lt!316312))))))

(assert (=> b!202866 (=> (not res!169932) (not e!139057))))

(assert (=> b!202866 (= e!139054 e!139057)))

(declare-fun b!202867 () Bool)

(declare-fun res!169934 () Bool)

(assert (=> b!202867 (=> (not res!169934) (not e!139056))))

(assert (=> b!202867 (= res!169934 (isPrefixOf!0 (_2!9321 lt!315676) (_2!9321 lt!316319)))))

(declare-fun b!202868 () Bool)

(declare-fun res!169930 () Bool)

(assert (=> b!202868 (= res!169930 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316312))) (currentByte!9475 (_2!9321 lt!316312)) (currentBit!9470 (_2!9321 lt!316312))) (bvadd (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202868 (=> (not res!169930) (not e!139054))))

(declare-fun b!202869 () Bool)

(declare-fun e!139055 () Bool)

(declare-fun lt!316282 () tuple2!17340)

(declare-fun lt!316330 () tuple2!17340)

(assert (=> b!202869 (= e!139055 (= (_2!9322 lt!316282) (_2!9322 lt!316330)))))

(declare-fun b!202870 () Bool)

(assert (=> b!202870 (= e!139052 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202871 () Bool)

(declare-fun Unit!14410 () Unit!14386)

(assert (=> b!202871 (= e!139059 (tuple2!17339 Unit!14410 (_2!9321 lt!315676)))))

(declare-fun lt!316276 () Unit!14386)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8168) Unit!14386)

(assert (=> b!202871 (= lt!316276 (lemmaIsPrefixRefl!0 (_2!9321 lt!315676)))))

(assert (=> b!202871 call!3198))

(declare-fun lt!316329 () Unit!14386)

(assert (=> b!202871 (= lt!316329 lt!316276)))

(declare-fun b!202872 () Bool)

(assert (=> b!202872 (= e!139059 (tuple2!17339 (_1!9321 lt!316304) (_2!9321 lt!316304)))))

(assert (=> b!202872 (= lt!316311 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202872 (= lt!316312 (appendBit!0 (_2!9321 lt!315676) lt!316311))))

(declare-fun res!169933 () Bool)

(assert (=> b!202872 (= res!169933 (= (size!4530 (buf!5035 (_2!9321 lt!315676))) (size!4530 (buf!5035 (_2!9321 lt!316312)))))))

(assert (=> b!202872 (=> (not res!169933) (not e!139054))))

(assert (=> b!202872 e!139054))

(declare-fun lt!316327 () tuple2!17338)

(assert (=> b!202872 (= lt!316327 lt!316312)))

(assert (=> b!202872 (= lt!316304 (appendBitsLSBFirstLoopTR!0 (_2!9321 lt!316327) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!316284 () Unit!14386)

(assert (=> b!202872 (= lt!316284 (lemmaIsPrefixTransitive!0 (_2!9321 lt!315676) (_2!9321 lt!316327) (_2!9321 lt!316304)))))

(assert (=> b!202872 call!3198))

(declare-fun lt!316293 () Unit!14386)

(assert (=> b!202872 (= lt!316293 lt!316284)))

(assert (=> b!202872 (invariant!0 (currentBit!9470 (_2!9321 lt!315676)) (currentByte!9475 (_2!9321 lt!315676)) (size!4530 (buf!5035 (_2!9321 lt!316327))))))

(declare-fun lt!316279 () BitStream!8168)

(assert (=> b!202872 (= lt!316279 (BitStream!8169 (buf!5035 (_2!9321 lt!316327)) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))))))

(assert (=> b!202872 (invariant!0 (currentBit!9470 lt!316279) (currentByte!9475 lt!316279) (size!4530 (buf!5035 (_2!9321 lt!316304))))))

(declare-fun lt!316277 () BitStream!8168)

(assert (=> b!202872 (= lt!316277 (BitStream!8169 (buf!5035 (_2!9321 lt!316304)) (currentByte!9475 lt!316279) (currentBit!9470 lt!316279)))))

(assert (=> b!202872 (= lt!316282 (readBitPure!0 lt!316279))))

(assert (=> b!202872 (= lt!316330 (readBitPure!0 lt!316277))))

(declare-fun lt!316298 () Unit!14386)

(declare-fun readBitPrefixLemma!0 (BitStream!8168 BitStream!8168) Unit!14386)

(assert (=> b!202872 (= lt!316298 (readBitPrefixLemma!0 lt!316279 (_2!9321 lt!316304)))))

(declare-fun res!169925 () Bool)

(assert (=> b!202872 (= res!169925 (= (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!316282))) (currentByte!9475 (_1!9322 lt!316282)) (currentBit!9470 (_1!9322 lt!316282))) (bitIndex!0 (size!4530 (buf!5035 (_1!9322 lt!316330))) (currentByte!9475 (_1!9322 lt!316330)) (currentBit!9470 (_1!9322 lt!316330)))))))

(assert (=> b!202872 (=> (not res!169925) (not e!139055))))

(assert (=> b!202872 e!139055))

(declare-fun lt!316313 () Unit!14386)

(assert (=> b!202872 (= lt!316313 lt!316298)))

(declare-fun lt!316306 () tuple2!17358)

(assert (=> b!202872 (= lt!316306 (reader!0 (_2!9321 lt!315676) (_2!9321 lt!316304)))))

(declare-fun lt!316307 () tuple2!17358)

(assert (=> b!202872 (= lt!316307 (reader!0 (_2!9321 lt!316327) (_2!9321 lt!316304)))))

(declare-fun lt!316303 () tuple2!17340)

(assert (=> b!202872 (= lt!316303 (readBitPure!0 (_1!9331 lt!316306)))))

(assert (=> b!202872 (= (_2!9322 lt!316303) lt!316311)))

(declare-fun lt!316302 () Unit!14386)

(declare-fun Unit!14411 () Unit!14386)

(assert (=> b!202872 (= lt!316302 Unit!14411)))

(declare-fun lt!316287 () (_ BitVec 64))

(assert (=> b!202872 (= lt!316287 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316299 () (_ BitVec 64))

(assert (=> b!202872 (= lt!316299 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316278 () Unit!14386)

(assert (=> b!202872 (= lt!316278 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9321 lt!315676) (buf!5035 (_2!9321 lt!316304)) lt!316299))))

(assert (=> b!202872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!316304)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676))) lt!316299)))

(declare-fun lt!316296 () Unit!14386)

(assert (=> b!202872 (= lt!316296 lt!316278)))

(declare-fun lt!316280 () tuple2!17356)

(assert (=> b!202872 (= lt!316280 (readNBitsLSBFirstsLoopPure!0 (_1!9331 lt!316306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316287))))

(declare-fun lt!316322 () (_ BitVec 64))

(assert (=> b!202872 (= lt!316322 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!316326 () Unit!14386)

(assert (=> b!202872 (= lt!316326 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9321 lt!316327) (buf!5035 (_2!9321 lt!316304)) lt!316322))))

(assert (=> b!202872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!316304)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!316327))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!316327))) lt!316322)))

(declare-fun lt!316331 () Unit!14386)

(assert (=> b!202872 (= lt!316331 lt!316326)))

(declare-fun lt!316316 () tuple2!17356)

(assert (=> b!202872 (= lt!316316 (readNBitsLSBFirstsLoopPure!0 (_1!9331 lt!316307) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316287 (ite (_2!9322 lt!316303) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!316289 () tuple2!17356)

(assert (=> b!202872 (= lt!316289 (readNBitsLSBFirstsLoopPure!0 (_1!9331 lt!316306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316287))))

(declare-fun c!10060 () Bool)

(assert (=> b!202872 (= c!10060 (_2!9322 (readBitPure!0 (_1!9331 lt!316306))))))

(declare-fun lt!316324 () tuple2!17356)

(declare-fun withMovedBitIndex!0 (BitStream!8168 (_ BitVec 64)) BitStream!8168)

(assert (=> b!202872 (= lt!316324 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9331 lt!316306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316287 e!139052)))))

(declare-fun lt!316320 () Unit!14386)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14386)

(assert (=> b!202872 (= lt!316320 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9331 lt!316306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316287))))

(assert (=> b!202872 (and (= (_2!9330 lt!316289) (_2!9330 lt!316324)) (= (_1!9330 lt!316289) (_1!9330 lt!316324)))))

(declare-fun lt!316315 () Unit!14386)

(assert (=> b!202872 (= lt!316315 lt!316320)))

(assert (=> b!202872 (= (_1!9331 lt!316306) (withMovedBitIndex!0 (_2!9331 lt!316306) (bvsub (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316304))) (currentByte!9475 (_2!9321 lt!316304)) (currentBit!9470 (_2!9321 lt!316304))))))))

(declare-fun lt!316309 () Unit!14386)

(declare-fun Unit!14412 () Unit!14386)

(assert (=> b!202872 (= lt!316309 Unit!14412)))

(assert (=> b!202872 (= (_1!9331 lt!316307) (withMovedBitIndex!0 (_2!9331 lt!316307) (bvsub (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316327))) (currentByte!9475 (_2!9321 lt!316327)) (currentBit!9470 (_2!9321 lt!316327))) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316304))) (currentByte!9475 (_2!9321 lt!316304)) (currentBit!9470 (_2!9321 lt!316304))))))))

(declare-fun lt!316292 () Unit!14386)

(declare-fun Unit!14413 () Unit!14386)

(assert (=> b!202872 (= lt!316292 Unit!14413)))

(assert (=> b!202872 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))) (bvsub (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316327))) (currentByte!9475 (_2!9321 lt!316327)) (currentBit!9470 (_2!9321 lt!316327))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!316321 () Unit!14386)

(declare-fun Unit!14414 () Unit!14386)

(assert (=> b!202872 (= lt!316321 Unit!14414)))

(assert (=> b!202872 (= (_2!9330 lt!316280) (_2!9330 lt!316316))))

(declare-fun lt!316294 () Unit!14386)

(declare-fun Unit!14415 () Unit!14386)

(assert (=> b!202872 (= lt!316294 Unit!14415)))

(assert (=> b!202872 (invariant!0 (currentBit!9470 (_2!9321 lt!316304)) (currentByte!9475 (_2!9321 lt!316304)) (size!4530 (buf!5035 (_2!9321 lt!316304))))))

(declare-fun lt!316283 () Unit!14386)

(declare-fun Unit!14416 () Unit!14386)

(assert (=> b!202872 (= lt!316283 Unit!14416)))

(assert (=> b!202872 (= (size!4530 (buf!5035 (_2!9321 lt!315676))) (size!4530 (buf!5035 (_2!9321 lt!316304))))))

(declare-fun lt!316285 () Unit!14386)

(declare-fun Unit!14417 () Unit!14386)

(assert (=> b!202872 (= lt!316285 Unit!14417)))

(assert (=> b!202872 (= (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!316304))) (currentByte!9475 (_2!9321 lt!316304)) (currentBit!9470 (_2!9321 lt!316304))) (bvsub (bvadd (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316325 () Unit!14386)

(declare-fun Unit!14418 () Unit!14386)

(assert (=> b!202872 (= lt!316325 Unit!14418)))

(declare-fun lt!316281 () Unit!14386)

(declare-fun Unit!14419 () Unit!14386)

(assert (=> b!202872 (= lt!316281 Unit!14419)))

(declare-fun lt!316295 () tuple2!17358)

(assert (=> b!202872 (= lt!316295 (reader!0 (_2!9321 lt!315676) (_2!9321 lt!316304)))))

(declare-fun lt!316297 () (_ BitVec 64))

(assert (=> b!202872 (= lt!316297 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316286 () Unit!14386)

(assert (=> b!202872 (= lt!316286 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9321 lt!315676) (buf!5035 (_2!9321 lt!316304)) lt!316297))))

(assert (=> b!202872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4530 (buf!5035 (_2!9321 lt!316304)))) ((_ sign_extend 32) (currentByte!9475 (_2!9321 lt!315676))) ((_ sign_extend 32) (currentBit!9470 (_2!9321 lt!315676))) lt!316297)))

(declare-fun lt!316305 () Unit!14386)

(assert (=> b!202872 (= lt!316305 lt!316286)))

(declare-fun lt!316290 () tuple2!17356)

(assert (=> b!202872 (= lt!316290 (readNBitsLSBFirstsLoopPure!0 (_1!9331 lt!316295) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169923 () Bool)

(assert (=> b!202872 (= res!169923 (= (_2!9330 lt!316290) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139053 () Bool)

(assert (=> b!202872 (=> (not res!169923) (not e!139053))))

(assert (=> b!202872 e!139053))

(declare-fun lt!316301 () Unit!14386)

(declare-fun Unit!14420 () Unit!14386)

(assert (=> b!202872 (= lt!316301 Unit!14420)))

(declare-fun b!202873 () Bool)

(assert (=> b!202873 (= e!139058 (= (_1!9330 lt!316328) (_2!9331 lt!316308)))))

(declare-fun b!202874 () Bool)

(declare-fun res!169929 () Bool)

(assert (=> b!202874 (=> (not res!169929) (not e!139056))))

(assert (=> b!202874 (= res!169929 (= (size!4530 (buf!5035 (_2!9321 lt!315676))) (size!4530 (buf!5035 (_2!9321 lt!316319)))))))

(declare-fun b!202875 () Bool)

(assert (=> b!202875 (= e!139053 (= (_1!9330 lt!316290) (_2!9331 lt!316295)))))

(assert (= (and d!69355 c!10061) b!202871))

(assert (= (and d!69355 (not c!10061)) b!202872))

(assert (= (and b!202872 res!169933) b!202868))

(assert (= (and b!202868 res!169930) b!202863))

(assert (= (and b!202863 res!169928) b!202866))

(assert (= (and b!202866 res!169932) b!202862))

(assert (= (and b!202872 res!169925) b!202869))

(assert (= (and b!202872 c!10060) b!202870))

(assert (= (and b!202872 (not c!10060)) b!202861))

(assert (= (and b!202872 res!169923) b!202875))

(assert (= (or b!202871 b!202872) bm!3195))

(assert (= (and d!69355 res!169931) b!202874))

(assert (= (and b!202874 res!169929) b!202864))

(assert (= (and b!202864 res!169927) b!202867))

(assert (= (and b!202867 res!169934) b!202865))

(assert (= (and b!202865 res!169926) b!202860))

(assert (= (and b!202865 res!169924) b!202873))

(declare-fun m!313479 () Bool)

(assert (=> b!202865 m!313479))

(declare-fun m!313481 () Bool)

(assert (=> b!202865 m!313481))

(declare-fun m!313483 () Bool)

(assert (=> b!202865 m!313483))

(declare-fun m!313485 () Bool)

(assert (=> b!202865 m!313485))

(declare-fun m!313487 () Bool)

(assert (=> b!202865 m!313487))

(declare-fun m!313489 () Bool)

(assert (=> b!202865 m!313489))

(declare-fun m!313491 () Bool)

(assert (=> b!202863 m!313491))

(declare-fun m!313493 () Bool)

(assert (=> d!69355 m!313493))

(declare-fun m!313495 () Bool)

(assert (=> b!202860 m!313495))

(declare-fun m!313497 () Bool)

(assert (=> b!202864 m!313497))

(assert (=> b!202864 m!313157))

(declare-fun m!313499 () Bool)

(assert (=> b!202862 m!313499))

(declare-fun m!313501 () Bool)

(assert (=> b!202862 m!313501))

(declare-fun m!313503 () Bool)

(assert (=> b!202872 m!313503))

(declare-fun m!313505 () Bool)

(assert (=> b!202872 m!313505))

(declare-fun m!313507 () Bool)

(assert (=> b!202872 m!313507))

(declare-fun m!313509 () Bool)

(assert (=> b!202872 m!313509))

(assert (=> b!202872 m!313483))

(declare-fun m!313511 () Bool)

(assert (=> b!202872 m!313511))

(declare-fun m!313513 () Bool)

(assert (=> b!202872 m!313513))

(declare-fun m!313515 () Bool)

(assert (=> b!202872 m!313515))

(declare-fun m!313517 () Bool)

(assert (=> b!202872 m!313517))

(declare-fun m!313519 () Bool)

(assert (=> b!202872 m!313519))

(declare-fun m!313521 () Bool)

(assert (=> b!202872 m!313521))

(declare-fun m!313523 () Bool)

(assert (=> b!202872 m!313523))

(declare-fun m!313525 () Bool)

(assert (=> b!202872 m!313525))

(declare-fun m!313527 () Bool)

(assert (=> b!202872 m!313527))

(declare-fun m!313529 () Bool)

(assert (=> b!202872 m!313529))

(assert (=> b!202872 m!313157))

(declare-fun m!313531 () Bool)

(assert (=> b!202872 m!313531))

(declare-fun m!313533 () Bool)

(assert (=> b!202872 m!313533))

(assert (=> b!202872 m!313523))

(declare-fun m!313535 () Bool)

(assert (=> b!202872 m!313535))

(declare-fun m!313537 () Bool)

(assert (=> b!202872 m!313537))

(declare-fun m!313539 () Bool)

(assert (=> b!202872 m!313539))

(assert (=> b!202872 m!313487))

(declare-fun m!313541 () Bool)

(assert (=> b!202872 m!313541))

(declare-fun m!313543 () Bool)

(assert (=> b!202872 m!313543))

(declare-fun m!313545 () Bool)

(assert (=> b!202872 m!313545))

(declare-fun m!313547 () Bool)

(assert (=> b!202872 m!313547))

(declare-fun m!313549 () Bool)

(assert (=> b!202872 m!313549))

(declare-fun m!313551 () Bool)

(assert (=> b!202872 m!313551))

(declare-fun m!313553 () Bool)

(assert (=> b!202872 m!313553))

(declare-fun m!313555 () Bool)

(assert (=> b!202872 m!313555))

(declare-fun m!313557 () Bool)

(assert (=> b!202872 m!313557))

(declare-fun m!313559 () Bool)

(assert (=> b!202872 m!313559))

(declare-fun m!313561 () Bool)

(assert (=> b!202872 m!313561))

(declare-fun m!313563 () Bool)

(assert (=> bm!3195 m!313563))

(declare-fun m!313565 () Bool)

(assert (=> b!202866 m!313565))

(assert (=> b!202866 m!313565))

(declare-fun m!313567 () Bool)

(assert (=> b!202866 m!313567))

(declare-fun m!313569 () Bool)

(assert (=> b!202867 m!313569))

(declare-fun m!313571 () Bool)

(assert (=> b!202871 m!313571))

(assert (=> b!202868 m!313501))

(assert (=> b!202868 m!313157))

(assert (=> b!202615 d!69355))

(declare-fun d!69371 () Bool)

(declare-fun res!169936 () Bool)

(declare-fun e!139062 () Bool)

(assert (=> d!69371 (=> (not res!169936) (not e!139062))))

(assert (=> d!69371 (= res!169936 (= (size!4530 (buf!5035 thiss!1204)) (size!4530 (buf!5035 (_2!9321 lt!315676)))))))

(assert (=> d!69371 (= (isPrefixOf!0 thiss!1204 (_2!9321 lt!315676)) e!139062)))

(declare-fun b!202876 () Bool)

(declare-fun res!169937 () Bool)

(assert (=> b!202876 (=> (not res!169937) (not e!139062))))

(assert (=> b!202876 (= res!169937 (bvsle (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204)) (bitIndex!0 (size!4530 (buf!5035 (_2!9321 lt!315676))) (currentByte!9475 (_2!9321 lt!315676)) (currentBit!9470 (_2!9321 lt!315676)))))))

(declare-fun b!202877 () Bool)

(declare-fun e!139061 () Bool)

(assert (=> b!202877 (= e!139062 e!139061)))

(declare-fun res!169935 () Bool)

(assert (=> b!202877 (=> res!169935 e!139061)))

(assert (=> b!202877 (= res!169935 (= (size!4530 (buf!5035 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202878 () Bool)

(assert (=> b!202878 (= e!139061 (arrayBitRangesEq!0 (buf!5035 thiss!1204) (buf!5035 (_2!9321 lt!315676)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4530 (buf!5035 thiss!1204)) (currentByte!9475 thiss!1204) (currentBit!9470 thiss!1204))))))

(assert (= (and d!69371 res!169936) b!202876))

(assert (= (and b!202876 res!169937) b!202877))

(assert (= (and b!202877 (not res!169935)) b!202878))

(assert (=> b!202876 m!313159))

(assert (=> b!202876 m!313157))

(assert (=> b!202878 m!313159))

(assert (=> b!202878 m!313159))

(declare-fun m!313573 () Bool)

(assert (=> b!202878 m!313573))

(assert (=> b!202616 d!69371))

(push 1)

(assert (not b!202871))

(assert (not b!202694))

(assert (not d!69313))

(assert (not b!202711))

(assert (not b!202876))

(assert (not b!202862))

(assert (not b!202696))

(assert (not d!69341))

(assert (not b!202878))

(assert (not d!69345))

(assert (not b!202860))

(assert (not b!202700))

(assert (not d!69311))

(assert (not b!202709))

(assert (not b!202864))

(assert (not b!202872))

(assert (not b!202863))

(assert (not d!69355))

(assert (not d!69339))

(assert (not b!202867))

(assert (not b!202697))

(assert (not b!202695))

(assert (not d!69335))

(assert (not bm!3195))

(assert (not b!202866))

(assert (not d!69353))

(assert (not b!202868))

(assert (not d!69343))

(assert (not b!202865))

(assert (not d!69337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

