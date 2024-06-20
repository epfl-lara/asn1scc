; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72614 () Bool)

(assert start!72614)

(declare-fun res!266157 () Bool)

(declare-fun e!233710 () Bool)

(assert (=> start!72614 (=> (not res!266157) (not e!233710))))

(declare-datatypes ((array!20803 0))(
  ( (array!20804 (arr!10138 (Array (_ BitVec 32) (_ BitVec 8))) (size!9046 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14254 0))(
  ( (BitStream!14255 (buf!8188 array!20803) (currentByte!15134 (_ BitVec 32)) (currentBit!15129 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14254)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72614 (= res!266157 (validate_offset_bit!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))))))

(assert (=> start!72614 e!233710))

(declare-fun e!233712 () Bool)

(declare-fun inv!12 (BitStream!14254) Bool)

(assert (=> start!72614 (and (inv!12 thiss!1702) e!233712)))

(declare-fun b!324275 () Bool)

(declare-fun e!233711 () Bool)

(assert (=> b!324275 (= e!233710 e!233711)))

(declare-fun res!266158 () Bool)

(assert (=> b!324275 (=> res!266158 e!233711)))

(declare-datatypes ((Unit!22092 0))(
  ( (Unit!22093) )
))
(declare-datatypes ((tuple2!23762 0))(
  ( (tuple2!23763 (_1!13510 Unit!22092) (_2!13510 BitStream!14254)) )
))
(declare-fun lt!446843 () tuple2!23762)

(assert (=> b!324275 (= res!266158 (not (= (buf!8188 (_2!13510 lt!446843)) (buf!8188 thiss!1702))))))

(declare-fun increaseBitIndex!0 (BitStream!14254) tuple2!23762)

(assert (=> b!324275 (= lt!446843 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324276 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324276 (= e!233711 (not (= (bitIndex!0 (size!9046 (buf!8188 (_2!13510 lt!446843))) (currentByte!15134 (_2!13510 lt!446843)) (currentBit!15129 (_2!13510 lt!446843))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9046 (buf!8188 thiss!1702)) (currentByte!15134 thiss!1702) (currentBit!15129 thiss!1702))))))))

(declare-fun b!324277 () Bool)

(declare-fun array_inv!8598 (array!20803) Bool)

(assert (=> b!324277 (= e!233712 (array_inv!8598 (buf!8188 thiss!1702)))))

(assert (= (and start!72614 res!266157) b!324275))

(assert (= (and b!324275 (not res!266158)) b!324276))

(assert (= start!72614 b!324277))

(declare-fun m!462383 () Bool)

(assert (=> start!72614 m!462383))

(declare-fun m!462385 () Bool)

(assert (=> start!72614 m!462385))

(declare-fun m!462387 () Bool)

(assert (=> b!324275 m!462387))

(declare-fun m!462389 () Bool)

(assert (=> b!324276 m!462389))

(declare-fun m!462391 () Bool)

(assert (=> b!324276 m!462391))

(declare-fun m!462393 () Bool)

(assert (=> b!324277 m!462393))

(push 1)

(assert (not b!324275))

(assert (not b!324276))

(assert (not b!324277))

(assert (not start!72614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106552 () Bool)

(declare-fun e!233741 () Bool)

(assert (=> d!106552 e!233741))

(declare-fun res!266179 () Bool)

(assert (=> d!106552 (=> (not res!266179) (not e!233741))))

(declare-fun lt!446872 () (_ BitVec 64))

(declare-fun lt!446871 () (_ BitVec 64))

(declare-fun lt!446873 () tuple2!23762)

(assert (=> d!106552 (= res!266179 (= (bvadd lt!446872 lt!446871) (bitIndex!0 (size!9046 (buf!8188 (_2!13510 lt!446873))) (currentByte!15134 (_2!13510 lt!446873)) (currentBit!15129 (_2!13510 lt!446873)))))))

(assert (=> d!106552 (or (not (= (bvand lt!446872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446871 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446872 lt!446871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106552 (= lt!446871 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106552 (= lt!446872 (bitIndex!0 (size!9046 (buf!8188 thiss!1702)) (currentByte!15134 thiss!1702) (currentBit!15129 thiss!1702)))))

(declare-fun Unit!22098 () Unit!22092)

(declare-fun Unit!22099 () Unit!22092)

(assert (=> d!106552 (= lt!446873 (ite (bvslt (currentBit!15129 thiss!1702) #b00000000000000000000000000000111) (tuple2!23763 Unit!22098 (BitStream!14255 (buf!8188 thiss!1702) (currentByte!15134 thiss!1702) (bvadd (currentBit!15129 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23763 Unit!22099 (BitStream!14255 (buf!8188 thiss!1702) (bvadd (currentByte!15134 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106552 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106552 (= (increaseBitIndex!0 thiss!1702) lt!446873)))

(declare-fun b!324304 () Bool)

(declare-fun res!266180 () Bool)

(assert (=> b!324304 (=> (not res!266180) (not e!233741))))

(declare-fun lt!446874 () (_ BitVec 64))

(declare-fun lt!446870 () (_ BitVec 64))

(assert (=> b!324304 (= res!266180 (= (bvsub lt!446874 lt!446870) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324304 (or (= (bvand lt!446874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446874 lt!446870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324304 (= lt!446870 (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 (_2!13510 lt!446873)))) ((_ sign_extend 32) (currentByte!15134 (_2!13510 lt!446873))) ((_ sign_extend 32) (currentBit!15129 (_2!13510 lt!446873)))))))

(assert (=> b!324304 (= lt!446874 (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))))))

(declare-fun b!324305 () Bool)

(assert (=> b!324305 (= e!233741 (= (size!9046 (buf!8188 thiss!1702)) (size!9046 (buf!8188 (_2!13510 lt!446873)))))))

(assert (= (and d!106552 res!266179) b!324304))

(assert (= (and b!324304 res!266180) b!324305))

(declare-fun m!462425 () Bool)

(assert (=> d!106552 m!462425))

(assert (=> d!106552 m!462391))

(declare-fun m!462427 () Bool)

(assert (=> d!106552 m!462427))

(declare-fun m!462429 () Bool)

(assert (=> b!324304 m!462429))

(assert (=> b!324304 m!462427))

(assert (=> b!324275 d!106552))

(declare-fun d!106560 () Bool)

(declare-fun e!233745 () Bool)

(assert (=> d!106560 e!233745))

(declare-fun res!266188 () Bool)

(assert (=> d!106560 (=> (not res!266188) (not e!233745))))

(declare-fun lt!446895 () (_ BitVec 64))

(declare-fun lt!446892 () (_ BitVec 64))

(declare-fun lt!446897 () (_ BitVec 64))

(assert (=> d!106560 (= res!266188 (= lt!446895 (bvsub lt!446897 lt!446892)))))

(assert (=> d!106560 (or (= (bvand lt!446897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446897 lt!446892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106560 (= lt!446892 (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 (_2!13510 lt!446843)))) ((_ sign_extend 32) (currentByte!15134 (_2!13510 lt!446843))) ((_ sign_extend 32) (currentBit!15129 (_2!13510 lt!446843)))))))

(declare-fun lt!446893 () (_ BitVec 64))

(declare-fun lt!446896 () (_ BitVec 64))

(assert (=> d!106560 (= lt!446897 (bvmul lt!446893 lt!446896))))

(assert (=> d!106560 (or (= lt!446893 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446896 (bvsdiv (bvmul lt!446893 lt!446896) lt!446893)))))

(assert (=> d!106560 (= lt!446896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106560 (= lt!446893 ((_ sign_extend 32) (size!9046 (buf!8188 (_2!13510 lt!446843)))))))

(assert (=> d!106560 (= lt!446895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15134 (_2!13510 lt!446843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15129 (_2!13510 lt!446843)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106560 (invariant!0 (currentBit!15129 (_2!13510 lt!446843)) (currentByte!15134 (_2!13510 lt!446843)) (size!9046 (buf!8188 (_2!13510 lt!446843))))))

(assert (=> d!106560 (= (bitIndex!0 (size!9046 (buf!8188 (_2!13510 lt!446843))) (currentByte!15134 (_2!13510 lt!446843)) (currentBit!15129 (_2!13510 lt!446843))) lt!446895)))

(declare-fun b!324312 () Bool)

(declare-fun res!266187 () Bool)

(assert (=> b!324312 (=> (not res!266187) (not e!233745))))

(assert (=> b!324312 (= res!266187 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446895))))

(declare-fun b!324313 () Bool)

(declare-fun lt!446894 () (_ BitVec 64))

(assert (=> b!324313 (= e!233745 (bvsle lt!446895 (bvmul lt!446894 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324313 (or (= lt!446894 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446894 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446894)))))

(assert (=> b!324313 (= lt!446894 ((_ sign_extend 32) (size!9046 (buf!8188 (_2!13510 lt!446843)))))))

(assert (= (and d!106560 res!266188) b!324312))

(assert (= (and b!324312 res!266187) b!324313))

(declare-fun m!462437 () Bool)

(assert (=> d!106560 m!462437))

(declare-fun m!462439 () Bool)

(assert (=> d!106560 m!462439))

(assert (=> b!324276 d!106560))

(declare-fun d!106566 () Bool)

(declare-fun e!233746 () Bool)

(assert (=> d!106566 e!233746))

(declare-fun res!266190 () Bool)

(assert (=> d!106566 (=> (not res!266190) (not e!233746))))

(declare-fun lt!446903 () (_ BitVec 64))

(declare-fun lt!446898 () (_ BitVec 64))

(declare-fun lt!446901 () (_ BitVec 64))

(assert (=> d!106566 (= res!266190 (= lt!446901 (bvsub lt!446903 lt!446898)))))

(assert (=> d!106566 (or (= (bvand lt!446903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446903 lt!446898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106566 (= lt!446898 (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))))))

(declare-fun lt!446899 () (_ BitVec 64))

(declare-fun lt!446902 () (_ BitVec 64))

(assert (=> d!106566 (= lt!446903 (bvmul lt!446899 lt!446902))))

(assert (=> d!106566 (or (= lt!446899 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446902 (bvsdiv (bvmul lt!446899 lt!446902) lt!446899)))))

(assert (=> d!106566 (= lt!446902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106566 (= lt!446899 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))))))

(assert (=> d!106566 (= lt!446901 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15134 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15129 thiss!1702))))))

(assert (=> d!106566 (invariant!0 (currentBit!15129 thiss!1702) (currentByte!15134 thiss!1702) (size!9046 (buf!8188 thiss!1702)))))

(assert (=> d!106566 (= (bitIndex!0 (size!9046 (buf!8188 thiss!1702)) (currentByte!15134 thiss!1702) (currentBit!15129 thiss!1702)) lt!446901)))

(declare-fun b!324314 () Bool)

(declare-fun res!266189 () Bool)

(assert (=> b!324314 (=> (not res!266189) (not e!233746))))

(assert (=> b!324314 (= res!266189 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446901))))

(declare-fun b!324315 () Bool)

(declare-fun lt!446900 () (_ BitVec 64))

(assert (=> b!324315 (= e!233746 (bvsle lt!446901 (bvmul lt!446900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324315 (or (= lt!446900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446900)))))

(assert (=> b!324315 (= lt!446900 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))))))

(assert (= (and d!106566 res!266190) b!324314))

(assert (= (and b!324314 res!266189) b!324315))

(assert (=> d!106566 m!462427))

(declare-fun m!462441 () Bool)

(assert (=> d!106566 m!462441))

(assert (=> b!324276 d!106566))

(declare-fun d!106568 () Bool)

(assert (=> d!106568 (= (array_inv!8598 (buf!8188 thiss!1702)) (bvsge (size!9046 (buf!8188 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324277 d!106568))

(declare-fun d!106570 () Bool)

(assert (=> d!106570 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9046 (buf!8188 thiss!1702))) ((_ sign_extend 32) (currentByte!15134 thiss!1702)) ((_ sign_extend 32) (currentBit!15129 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28070 () Bool)

(assert (= bs!28070 d!106570))

(assert (=> bs!28070 m!462427))

(assert (=> start!72614 d!106570))

(declare-fun d!106572 () Bool)

(assert (=> d!106572 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15129 thiss!1702) (currentByte!15134 thiss!1702) (size!9046 (buf!8188 thiss!1702))))))

(declare-fun bs!28071 () Bool)

(assert (= bs!28071 d!106572))

(assert (=> bs!28071 m!462441))

(assert (=> start!72614 d!106572))

(push 1)

(assert (not d!106560))

(assert (not d!106572))

(assert (not d!106552))

(assert (not b!324304))

(assert (not d!106566))

(assert (not d!106570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

