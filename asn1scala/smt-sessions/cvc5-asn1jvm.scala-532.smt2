; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15582 () Bool)

(assert start!15582)

(declare-fun b!78885 () Bool)

(declare-fun e!51759 () Bool)

(declare-datatypes ((array!3361 0))(
  ( (array!3362 (arr!2154 (Array (_ BitVec 32) (_ BitVec 8))) (size!1553 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2668 0))(
  ( (BitStream!2669 (buf!1943 array!3361) (currentByte!3805 (_ BitVec 32)) (currentBit!3800 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2668)

(declare-fun array_inv!1399 (array!3361) Bool)

(assert (=> b!78885 (= e!51759 (array_inv!1399 (buf!1943 thiss!1107)))))

(declare-fun b!78886 () Bool)

(declare-fun e!51754 () Bool)

(assert (=> b!78886 (= e!51754 true)))

(declare-datatypes ((tuple2!7028 0))(
  ( (tuple2!7029 (_1!3651 BitStream!2668) (_2!3651 Bool)) )
))
(declare-fun lt!125802 () tuple2!7028)

(declare-datatypes ((Unit!5191 0))(
  ( (Unit!5192) )
))
(declare-datatypes ((tuple2!7030 0))(
  ( (tuple2!7031 (_1!3652 Unit!5191) (_2!3652 BitStream!2668)) )
))
(declare-fun lt!125798 () tuple2!7030)

(declare-fun readBitPure!0 (BitStream!2668) tuple2!7028)

(declare-fun readerFrom!0 (BitStream!2668 (_ BitVec 32) (_ BitVec 32)) BitStream!2668)

(assert (=> b!78886 (= lt!125802 (readBitPure!0 (readerFrom!0 (_2!3652 lt!125798) (currentBit!3800 thiss!1107) (currentByte!3805 thiss!1107))))))

(declare-fun b!78887 () Bool)

(declare-fun e!51753 () Bool)

(assert (=> b!78887 (= e!51753 (not e!51754))))

(declare-fun res!65267 () Bool)

(assert (=> b!78887 (=> res!65267 e!51754)))

(assert (=> b!78887 (= res!65267 (not (= (size!1553 (buf!1943 (_2!3652 lt!125798))) (size!1553 (buf!1943 thiss!1107)))))))

(declare-fun e!51755 () Bool)

(assert (=> b!78887 e!51755))

(declare-fun res!65264 () Bool)

(assert (=> b!78887 (=> (not res!65264) (not e!51755))))

(assert (=> b!78887 (= res!65264 (= (size!1553 (buf!1943 thiss!1107)) (size!1553 (buf!1943 (_2!3652 lt!125798)))))))

(declare-fun lt!125800 () Bool)

(declare-fun appendBit!0 (BitStream!2668 Bool) tuple2!7030)

(assert (=> b!78887 (= lt!125798 (appendBit!0 thiss!1107 lt!125800))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78887 (= lt!125800 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78888 () Bool)

(declare-fun res!65272 () Bool)

(assert (=> b!78888 (=> res!65272 e!51754)))

(declare-fun isPrefixOf!0 (BitStream!2668 BitStream!2668) Bool)

(assert (=> b!78888 (= res!65272 (not (isPrefixOf!0 thiss!1107 (_2!3652 lt!125798))))))

(declare-fun b!78889 () Bool)

(declare-fun e!51758 () Bool)

(declare-fun e!51757 () Bool)

(assert (=> b!78889 (= e!51758 e!51757)))

(declare-fun res!65268 () Bool)

(assert (=> b!78889 (=> (not res!65268) (not e!51757))))

(declare-fun lt!125799 () tuple2!7028)

(assert (=> b!78889 (= res!65268 (and (= (_2!3651 lt!125799) lt!125800) (= (_1!3651 lt!125799) (_2!3652 lt!125798))))))

(assert (=> b!78889 (= lt!125799 (readBitPure!0 (readerFrom!0 (_2!3652 lt!125798) (currentBit!3800 thiss!1107) (currentByte!3805 thiss!1107))))))

(declare-fun b!78890 () Bool)

(declare-fun res!65265 () Bool)

(assert (=> b!78890 (=> (not res!65265) (not e!51758))))

(assert (=> b!78890 (= res!65265 (isPrefixOf!0 thiss!1107 (_2!3652 lt!125798)))))

(declare-fun b!78891 () Bool)

(declare-fun lt!125801 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78891 (= e!51757 (= (bitIndex!0 (size!1553 (buf!1943 (_1!3651 lt!125799))) (currentByte!3805 (_1!3651 lt!125799)) (currentBit!3800 (_1!3651 lt!125799))) lt!125801))))

(declare-fun res!65266 () Bool)

(assert (=> start!15582 (=> (not res!65266) (not e!51753))))

(assert (=> start!15582 (= res!65266 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15582 e!51753))

(assert (=> start!15582 true))

(declare-fun inv!12 (BitStream!2668) Bool)

(assert (=> start!15582 (and (inv!12 thiss!1107) e!51759)))

(declare-fun b!78892 () Bool)

(declare-fun res!65269 () Bool)

(assert (=> b!78892 (=> (not res!65269) (not e!51753))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78892 (= res!65269 (validate_offset_bit!0 ((_ sign_extend 32) (size!1553 (buf!1943 thiss!1107))) ((_ sign_extend 32) (currentByte!3805 thiss!1107)) ((_ sign_extend 32) (currentBit!3800 thiss!1107))))))

(declare-fun b!78893 () Bool)

(assert (=> b!78893 (= e!51755 e!51758)))

(declare-fun res!65270 () Bool)

(assert (=> b!78893 (=> (not res!65270) (not e!51758))))

(declare-fun lt!125797 () (_ BitVec 64))

(assert (=> b!78893 (= res!65270 (= lt!125801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125797)))))

(assert (=> b!78893 (= lt!125801 (bitIndex!0 (size!1553 (buf!1943 (_2!3652 lt!125798))) (currentByte!3805 (_2!3652 lt!125798)) (currentBit!3800 (_2!3652 lt!125798))))))

(assert (=> b!78893 (= lt!125797 (bitIndex!0 (size!1553 (buf!1943 thiss!1107)) (currentByte!3805 thiss!1107) (currentBit!3800 thiss!1107)))))

(declare-fun b!78894 () Bool)

(declare-fun res!65271 () Bool)

(assert (=> b!78894 (=> res!65271 e!51754)))

(assert (=> b!78894 (= res!65271 (not (= (bitIndex!0 (size!1553 (buf!1943 (_2!3652 lt!125798))) (currentByte!3805 (_2!3652 lt!125798)) (currentBit!3800 (_2!3652 lt!125798))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1553 (buf!1943 thiss!1107)) (currentByte!3805 thiss!1107) (currentBit!3800 thiss!1107))))))))

(assert (= (and start!15582 res!65266) b!78892))

(assert (= (and b!78892 res!65269) b!78887))

(assert (= (and b!78887 res!65264) b!78893))

(assert (= (and b!78893 res!65270) b!78890))

(assert (= (and b!78890 res!65265) b!78889))

(assert (= (and b!78889 res!65268) b!78891))

(assert (= (and b!78887 (not res!65267)) b!78894))

(assert (= (and b!78894 (not res!65271)) b!78888))

(assert (= (and b!78888 (not res!65272)) b!78886))

(assert (= start!15582 b!78885))

(declare-fun m!124347 () Bool)

(assert (=> start!15582 m!124347))

(declare-fun m!124349 () Bool)

(assert (=> b!78886 m!124349))

(assert (=> b!78886 m!124349))

(declare-fun m!124351 () Bool)

(assert (=> b!78886 m!124351))

(declare-fun m!124353 () Bool)

(assert (=> b!78891 m!124353))

(declare-fun m!124355 () Bool)

(assert (=> b!78893 m!124355))

(declare-fun m!124357 () Bool)

(assert (=> b!78893 m!124357))

(declare-fun m!124359 () Bool)

(assert (=> b!78885 m!124359))

(assert (=> b!78894 m!124355))

(assert (=> b!78894 m!124357))

(declare-fun m!124361 () Bool)

(assert (=> b!78890 m!124361))

(declare-fun m!124363 () Bool)

(assert (=> b!78887 m!124363))

(declare-fun m!124365 () Bool)

(assert (=> b!78887 m!124365))

(declare-fun m!124367 () Bool)

(assert (=> b!78892 m!124367))

(assert (=> b!78889 m!124349))

(assert (=> b!78889 m!124349))

(assert (=> b!78889 m!124351))

(assert (=> b!78888 m!124361))

(push 1)

(assert (not b!78893))

(assert (not b!78886))

(assert (not b!78887))

(assert (not b!78894))

(assert (not start!15582))

(assert (not b!78889))

(assert (not b!78892))

(assert (not b!78890))

(assert (not b!78885))

(assert (not b!78888))

(assert (not b!78891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

