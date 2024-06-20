; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72972 () Bool)

(assert start!72972)

(declare-fun b!324881 () Bool)

(declare-fun res!266623 () Bool)

(declare-fun e!234199 () Bool)

(assert (=> b!324881 (=> (not res!266623) (not e!234199))))

(declare-datatypes ((array!20928 0))(
  ( (array!20929 (arr!10185 (Array (_ BitVec 32) (_ BitVec 8))) (size!9093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14348 0))(
  ( (BitStream!14349 (buf!8235 array!20928) (currentByte!15246 (_ BitVec 32)) (currentBit!15241 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14348)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324881 (= res!266623 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9093 (buf!8235 thiss!877)) (currentByte!15246 thiss!877) (currentBit!15241 thiss!877))) (bitIndex!0 (size!9093 (buf!8235 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15246 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266621 () Bool)

(assert (=> start!72972 (=> (not res!266621) (not e!234199))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72972 (= res!266621 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) ((_ sign_extend 32) (currentByte!15246 thiss!877)) ((_ sign_extend 32) (currentBit!15241 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72972 e!234199))

(declare-fun e!234201 () Bool)

(declare-fun inv!12 (BitStream!14348) Bool)

(assert (=> start!72972 (and (inv!12 thiss!877) e!234201)))

(declare-fun b!324883 () Bool)

(declare-fun array_inv!8645 (array!20928) Bool)

(assert (=> b!324883 (= e!234201 (array_inv!8645 (buf!8235 thiss!877)))))

(declare-fun b!324880 () Bool)

(declare-fun res!266622 () Bool)

(assert (=> b!324880 (=> (not res!266622) (not e!234199))))

(assert (=> b!324880 (= res!266622 (bvsge (currentBit!15241 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324882 () Bool)

(assert (=> b!324882 (= e!234199 (and (bvsle ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15246 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15241 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15246 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15241 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!72972 res!266621) b!324880))

(assert (= (and b!324880 res!266622) b!324881))

(assert (= (and b!324881 res!266623) b!324882))

(assert (= start!72972 b!324883))

(declare-fun m!462927 () Bool)

(assert (=> b!324881 m!462927))

(declare-fun m!462929 () Bool)

(assert (=> b!324881 m!462929))

(declare-fun m!462931 () Bool)

(assert (=> start!72972 m!462931))

(declare-fun m!462933 () Bool)

(assert (=> start!72972 m!462933))

(declare-fun m!462935 () Bool)

(assert (=> b!324883 m!462935))

(push 1)

(assert (not b!324881))

(assert (not b!324883))

(assert (not start!72972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106908 () Bool)

(declare-fun e!234212 () Bool)

(assert (=> d!106908 e!234212))

(declare-fun res!266645 () Bool)

(assert (=> d!106908 (=> (not res!266645) (not e!234212))))

(declare-fun lt!447333 () (_ BitVec 64))

(declare-fun lt!447338 () (_ BitVec 64))

(declare-fun lt!447336 () (_ BitVec 64))

(assert (=> d!106908 (= res!266645 (= lt!447338 (bvsub lt!447333 lt!447336)))))

(assert (=> d!106908 (or (= (bvand lt!447333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447333 lt!447336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106908 (= lt!447336 (remainingBits!0 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) ((_ sign_extend 32) (currentByte!15246 thiss!877)) ((_ sign_extend 32) (currentBit!15241 thiss!877))))))

(declare-fun lt!447334 () (_ BitVec 64))

(declare-fun lt!447337 () (_ BitVec 64))

(assert (=> d!106908 (= lt!447333 (bvmul lt!447334 lt!447337))))

(assert (=> d!106908 (or (= lt!447334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447337 (bvsdiv (bvmul lt!447334 lt!447337) lt!447334)))))

(assert (=> d!106908 (= lt!447337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106908 (= lt!447334 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))))))

(assert (=> d!106908 (= lt!447338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15246 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15241 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106908 (invariant!0 (currentBit!15241 thiss!877) (currentByte!15246 thiss!877) (size!9093 (buf!8235 thiss!877)))))

(assert (=> d!106908 (= (bitIndex!0 (size!9093 (buf!8235 thiss!877)) (currentByte!15246 thiss!877) (currentBit!15241 thiss!877)) lt!447338)))

(declare-fun b!324904 () Bool)

(declare-fun res!266644 () Bool)

(assert (=> b!324904 (=> (not res!266644) (not e!234212))))

(assert (=> b!324904 (= res!266644 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447338))))

(declare-fun b!324905 () Bool)

(declare-fun lt!447335 () (_ BitVec 64))

(assert (=> b!324905 (= e!234212 (bvsle lt!447338 (bvmul lt!447335 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324905 (or (= lt!447335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447335)))))

(assert (=> b!324905 (= lt!447335 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))))))

(assert (= (and d!106908 res!266645) b!324904))

(assert (= (and b!324904 res!266644) b!324905))

(assert (=> d!106908 m!462931))

(declare-fun m!462949 () Bool)

(assert (=> d!106908 m!462949))

(assert (=> b!324881 d!106908))

(declare-fun d!106912 () Bool)

(declare-fun e!234213 () Bool)

(assert (=> d!106912 e!234213))

(declare-fun res!266647 () Bool)

(assert (=> d!106912 (=> (not res!266647) (not e!234213))))

(declare-fun lt!447339 () (_ BitVec 64))

(declare-fun lt!447342 () (_ BitVec 64))

(declare-fun lt!447344 () (_ BitVec 64))

(assert (=> d!106912 (= res!266647 (= lt!447344 (bvsub lt!447339 lt!447342)))))

(assert (=> d!106912 (or (= (bvand lt!447339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447339 lt!447342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106912 (= lt!447342 (remainingBits!0 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15246 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447340 () (_ BitVec 64))

(declare-fun lt!447343 () (_ BitVec 64))

(assert (=> d!106912 (= lt!447339 (bvmul lt!447340 lt!447343))))

(assert (=> d!106912 (or (= lt!447340 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447343 (bvsdiv (bvmul lt!447340 lt!447343) lt!447340)))))

(assert (=> d!106912 (= lt!447343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106912 (= lt!447340 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))))))

(assert (=> d!106912 (= lt!447344 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15246 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106912 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15246 thiss!877)) (size!9093 (buf!8235 thiss!877)))))

(assert (=> d!106912 (= (bitIndex!0 (size!9093 (buf!8235 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15246 thiss!877)) #b00000000000000000000000000000000) lt!447344)))

(declare-fun b!324906 () Bool)

(declare-fun res!266646 () Bool)

(assert (=> b!324906 (=> (not res!266646) (not e!234213))))

(assert (=> b!324906 (= res!266646 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447344))))

(declare-fun b!324907 () Bool)

(declare-fun lt!447341 () (_ BitVec 64))

(assert (=> b!324907 (= e!234213 (bvsle lt!447344 (bvmul lt!447341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324907 (or (= lt!447341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447341)))))

(assert (=> b!324907 (= lt!447341 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))))))

(assert (= (and d!106912 res!266647) b!324906))

(assert (= (and b!324906 res!266646) b!324907))

(declare-fun m!462951 () Bool)

(assert (=> d!106912 m!462951))

(declare-fun m!462953 () Bool)

(assert (=> d!106912 m!462953))

(assert (=> b!324881 d!106912))

(declare-fun d!106914 () Bool)

(assert (=> d!106914 (= (array_inv!8645 (buf!8235 thiss!877)) (bvsge (size!9093 (buf!8235 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324883 d!106914))

(declare-fun d!106916 () Bool)

(assert (=> d!106916 (= (remainingBits!0 ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) ((_ sign_extend 32) (currentByte!15246 thiss!877)) ((_ sign_extend 32) (currentBit!15241 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9093 (buf!8235 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15246 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15241 thiss!877)))))))

(assert (=> start!72972 d!106916))

(declare-fun d!106918 () Bool)

(assert (=> d!106918 (= (inv!12 thiss!877) (invariant!0 (currentBit!15241 thiss!877) (currentByte!15246 thiss!877) (size!9093 (buf!8235 thiss!877))))))

(declare-fun bs!28147 () Bool)

(assert (= bs!28147 d!106918))

(assert (=> bs!28147 m!462949))

(assert (=> start!72972 d!106918))

(push 1)

(assert (not d!106912))

(assert (not d!106908))

(assert (not d!106918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

