; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17750 () Bool)

(assert start!17750)

(declare-fun b!85787 () Bool)

(declare-fun res!70431 () Bool)

(declare-fun e!57115 () Bool)

(assert (=> b!85787 (=> (not res!70431) (not e!57115))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85787 (= res!70431 (bvslt i!576 nBits!336))))

(declare-fun b!85788 () Bool)

(declare-fun res!70422 () Bool)

(declare-fun e!57117 () Bool)

(assert (=> b!85788 (=> (not res!70422) (not e!57117))))

(declare-datatypes ((array!4075 0))(
  ( (array!4076 (arr!2477 (Array (_ BitVec 32) (_ BitVec 8))) (size!1840 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3242 0))(
  ( (BitStream!3243 (buf!2230 array!4075) (currentByte!4436 (_ BitVec 32)) (currentBit!4431 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3242)

(declare-fun thiss!1151 () BitStream!3242)

(assert (=> b!85788 (= res!70422 (and (bvsle i!576 nBits!336) (= (size!1840 (buf!2230 thiss!1152)) (size!1840 (buf!2230 thiss!1151)))))))

(declare-fun b!85789 () Bool)

(assert (=> b!85789 (= e!57115 (not true))))

(declare-fun e!57113 () Bool)

(assert (=> b!85789 e!57113))

(declare-fun res!70430 () Bool)

(assert (=> b!85789 (=> (not res!70430) (not e!57113))))

(declare-datatypes ((Unit!5696 0))(
  ( (Unit!5697) )
))
(declare-datatypes ((tuple2!7290 0))(
  ( (tuple2!7291 (_1!3860 Unit!5696) (_2!3860 BitStream!3242)) )
))
(declare-fun lt!134894 () tuple2!7290)

(assert (=> b!85789 (= res!70430 (= (size!1840 (buf!2230 thiss!1152)) (size!1840 (buf!2230 (_2!3860 lt!134894)))))))

(declare-fun lt!134897 () Bool)

(declare-fun appendBit!0 (BitStream!3242 Bool) tuple2!7290)

(assert (=> b!85789 (= lt!134894 (appendBit!0 thiss!1152 lt!134897))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85789 (= lt!134897 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85791 () Bool)

(declare-fun res!70420 () Bool)

(assert (=> b!85791 (=> (not res!70420) (not e!57117))))

(assert (=> b!85791 (= res!70420 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85792 () Bool)

(declare-fun e!57111 () Bool)

(declare-fun e!57116 () Bool)

(assert (=> b!85792 (= e!57111 e!57116)))

(declare-fun res!70423 () Bool)

(assert (=> b!85792 (=> (not res!70423) (not e!57116))))

(declare-datatypes ((tuple2!7292 0))(
  ( (tuple2!7293 (_1!3861 BitStream!3242) (_2!3861 Bool)) )
))
(declare-fun lt!134896 () tuple2!7292)

(assert (=> b!85792 (= res!70423 (and (= (_2!3861 lt!134896) lt!134897) (= (_1!3861 lt!134896) (_2!3860 lt!134894))))))

(declare-fun readBitPure!0 (BitStream!3242) tuple2!7292)

(declare-fun readerFrom!0 (BitStream!3242 (_ BitVec 32) (_ BitVec 32)) BitStream!3242)

(assert (=> b!85792 (= lt!134896 (readBitPure!0 (readerFrom!0 (_2!3860 lt!134894) (currentBit!4431 thiss!1152) (currentByte!4436 thiss!1152))))))

(declare-fun b!85793 () Bool)

(declare-fun res!70429 () Bool)

(assert (=> b!85793 (=> (not res!70429) (not e!57115))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85793 (= res!70429 (validate_offset_bits!1 ((_ sign_extend 32) (size!1840 (buf!2230 thiss!1152))) ((_ sign_extend 32) (currentByte!4436 thiss!1152)) ((_ sign_extend 32) (currentBit!4431 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85794 () Bool)

(declare-fun e!57109 () Bool)

(declare-fun array_inv!1686 (array!4075) Bool)

(assert (=> b!85794 (= e!57109 (array_inv!1686 (buf!2230 thiss!1152)))))

(declare-fun b!85795 () Bool)

(assert (=> b!85795 (= e!57113 e!57111)))

(declare-fun res!70424 () Bool)

(assert (=> b!85795 (=> (not res!70424) (not e!57111))))

(declare-fun lt!134895 () (_ BitVec 64))

(declare-fun lt!134893 () (_ BitVec 64))

(assert (=> b!85795 (= res!70424 (= lt!134895 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134893)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85795 (= lt!134895 (bitIndex!0 (size!1840 (buf!2230 (_2!3860 lt!134894))) (currentByte!4436 (_2!3860 lt!134894)) (currentBit!4431 (_2!3860 lt!134894))))))

(declare-fun b!85796 () Bool)

(assert (=> b!85796 (= e!57117 e!57115)))

(declare-fun res!70428 () Bool)

(assert (=> b!85796 (=> (not res!70428) (not e!57115))))

(declare-fun lt!134898 () (_ BitVec 64))

(assert (=> b!85796 (= res!70428 (= lt!134893 (bvadd lt!134898 ((_ sign_extend 32) i!576))))))

(assert (=> b!85796 (= lt!134893 (bitIndex!0 (size!1840 (buf!2230 thiss!1152)) (currentByte!4436 thiss!1152) (currentBit!4431 thiss!1152)))))

(assert (=> b!85796 (= lt!134898 (bitIndex!0 (size!1840 (buf!2230 thiss!1151)) (currentByte!4436 thiss!1151) (currentBit!4431 thiss!1151)))))

(declare-fun b!85797 () Bool)

(assert (=> b!85797 (= e!57116 (= (bitIndex!0 (size!1840 (buf!2230 (_1!3861 lt!134896))) (currentByte!4436 (_1!3861 lt!134896)) (currentBit!4431 (_1!3861 lt!134896))) lt!134895))))

(declare-fun b!85790 () Bool)

(declare-fun res!70427 () Bool)

(assert (=> b!85790 (=> (not res!70427) (not e!57117))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85790 (= res!70427 (invariant!0 (currentBit!4431 thiss!1152) (currentByte!4436 thiss!1152) (size!1840 (buf!2230 thiss!1152))))))

(declare-fun res!70426 () Bool)

(assert (=> start!17750 (=> (not res!70426) (not e!57117))))

(assert (=> start!17750 (= res!70426 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17750 e!57117))

(declare-fun inv!12 (BitStream!3242) Bool)

(assert (=> start!17750 (and (inv!12 thiss!1152) e!57109)))

(declare-fun e!57114 () Bool)

(assert (=> start!17750 (and (inv!12 thiss!1151) e!57114)))

(assert (=> start!17750 true))

(declare-fun b!85798 () Bool)

(declare-fun res!70421 () Bool)

(assert (=> b!85798 (=> (not res!70421) (not e!57117))))

(assert (=> b!85798 (= res!70421 (validate_offset_bits!1 ((_ sign_extend 32) (size!1840 (buf!2230 thiss!1151))) ((_ sign_extend 32) (currentByte!4436 thiss!1151)) ((_ sign_extend 32) (currentBit!4431 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85799 () Bool)

(assert (=> b!85799 (= e!57114 (array_inv!1686 (buf!2230 thiss!1151)))))

(declare-fun b!85800 () Bool)

(declare-fun res!70425 () Bool)

(assert (=> b!85800 (=> (not res!70425) (not e!57117))))

(assert (=> b!85800 (= res!70425 (invariant!0 (currentBit!4431 thiss!1151) (currentByte!4436 thiss!1151) (size!1840 (buf!2230 thiss!1151))))))

(declare-fun b!85801 () Bool)

(declare-fun res!70432 () Bool)

(assert (=> b!85801 (=> (not res!70432) (not e!57111))))

(declare-fun isPrefixOf!0 (BitStream!3242 BitStream!3242) Bool)

(assert (=> b!85801 (= res!70432 (isPrefixOf!0 thiss!1152 (_2!3860 lt!134894)))))

(assert (= (and start!17750 res!70426) b!85798))

(assert (= (and b!85798 res!70421) b!85800))

(assert (= (and b!85800 res!70425) b!85791))

(assert (= (and b!85791 res!70420) b!85790))

(assert (= (and b!85790 res!70427) b!85788))

(assert (= (and b!85788 res!70422) b!85796))

(assert (= (and b!85796 res!70428) b!85793))

(assert (= (and b!85793 res!70429) b!85787))

(assert (= (and b!85787 res!70431) b!85789))

(assert (= (and b!85789 res!70430) b!85795))

(assert (= (and b!85795 res!70424) b!85801))

(assert (= (and b!85801 res!70432) b!85792))

(assert (= (and b!85792 res!70423) b!85797))

(assert (= start!17750 b!85794))

(assert (= start!17750 b!85799))

(declare-fun m!131841 () Bool)

(assert (=> b!85793 m!131841))

(declare-fun m!131843 () Bool)

(assert (=> b!85792 m!131843))

(assert (=> b!85792 m!131843))

(declare-fun m!131845 () Bool)

(assert (=> b!85792 m!131845))

(declare-fun m!131847 () Bool)

(assert (=> start!17750 m!131847))

(declare-fun m!131849 () Bool)

(assert (=> start!17750 m!131849))

(declare-fun m!131851 () Bool)

(assert (=> b!85801 m!131851))

(declare-fun m!131853 () Bool)

(assert (=> b!85800 m!131853))

(declare-fun m!131855 () Bool)

(assert (=> b!85799 m!131855))

(declare-fun m!131857 () Bool)

(assert (=> b!85789 m!131857))

(declare-fun m!131859 () Bool)

(assert (=> b!85797 m!131859))

(declare-fun m!131861 () Bool)

(assert (=> b!85795 m!131861))

(declare-fun m!131863 () Bool)

(assert (=> b!85790 m!131863))

(declare-fun m!131865 () Bool)

(assert (=> b!85794 m!131865))

(declare-fun m!131867 () Bool)

(assert (=> b!85798 m!131867))

(declare-fun m!131869 () Bool)

(assert (=> b!85796 m!131869))

(declare-fun m!131871 () Bool)

(assert (=> b!85796 m!131871))

(push 1)

(assert (not b!85801))

(assert (not b!85799))

(assert (not b!85793))

(assert (not b!85795))

(assert (not b!85792))

(assert (not b!85798))

(assert (not b!85794))

(assert (not b!85796))

(assert (not b!85789))

(assert (not b!85800))

(assert (not b!85790))

(assert (not b!85797))

(assert (not start!17750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

