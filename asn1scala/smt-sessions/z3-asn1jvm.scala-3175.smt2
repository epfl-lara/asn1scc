; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72970 () Bool)

(assert start!72970)

(declare-fun b!324869 () Bool)

(declare-fun res!266614 () Bool)

(declare-fun e!234192 () Bool)

(assert (=> b!324869 (=> (not res!266614) (not e!234192))))

(declare-datatypes ((array!20926 0))(
  ( (array!20927 (arr!10184 (Array (_ BitVec 32) (_ BitVec 8))) (size!9092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14346 0))(
  ( (BitStream!14347 (buf!8234 array!20926) (currentByte!15245 (_ BitVec 32)) (currentBit!15240 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324869 (= res!266614 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9092 (buf!8234 thiss!877)) (currentByte!15245 thiss!877) (currentBit!15240 thiss!877))) (bitIndex!0 (size!9092 (buf!8234 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15245 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266613 () Bool)

(assert (=> start!72970 (=> (not res!266613) (not e!234192))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72970 (= res!266613 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) ((_ sign_extend 32) (currentByte!15245 thiss!877)) ((_ sign_extend 32) (currentBit!15240 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72970 e!234192))

(declare-fun e!234190 () Bool)

(declare-fun inv!12 (BitStream!14346) Bool)

(assert (=> start!72970 (and (inv!12 thiss!877) e!234190)))

(declare-fun b!324870 () Bool)

(assert (=> b!324870 (= e!234192 (and (bvsle ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15245 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15240 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15245 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15240 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!324868 () Bool)

(declare-fun res!266612 () Bool)

(assert (=> b!324868 (=> (not res!266612) (not e!234192))))

(assert (=> b!324868 (= res!266612 (bvsge (currentBit!15240 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324871 () Bool)

(declare-fun array_inv!8644 (array!20926) Bool)

(assert (=> b!324871 (= e!234190 (array_inv!8644 (buf!8234 thiss!877)))))

(assert (= (and start!72970 res!266613) b!324868))

(assert (= (and b!324868 res!266612) b!324869))

(assert (= (and b!324869 res!266614) b!324870))

(assert (= start!72970 b!324871))

(declare-fun m!462917 () Bool)

(assert (=> b!324869 m!462917))

(declare-fun m!462919 () Bool)

(assert (=> b!324869 m!462919))

(declare-fun m!462921 () Bool)

(assert (=> start!72970 m!462921))

(declare-fun m!462923 () Bool)

(assert (=> start!72970 m!462923))

(declare-fun m!462925 () Bool)

(assert (=> b!324871 m!462925))

(check-sat (not start!72970) (not b!324869) (not b!324871))
(check-sat)
(get-model)

(declare-fun d!106890 () Bool)

(assert (=> d!106890 (= (remainingBits!0 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) ((_ sign_extend 32) (currentByte!15245 thiss!877)) ((_ sign_extend 32) (currentBit!15240 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15245 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15240 thiss!877)))))))

(assert (=> start!72970 d!106890))

(declare-fun d!106892 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106892 (= (inv!12 thiss!877) (invariant!0 (currentBit!15240 thiss!877) (currentByte!15245 thiss!877) (size!9092 (buf!8234 thiss!877))))))

(declare-fun bs!28145 () Bool)

(assert (= bs!28145 d!106892))

(declare-fun m!462937 () Bool)

(assert (=> bs!28145 m!462937))

(assert (=> start!72970 d!106892))

(declare-fun d!106894 () Bool)

(declare-fun e!234204 () Bool)

(assert (=> d!106894 e!234204))

(declare-fun res!266628 () Bool)

(assert (=> d!106894 (=> (not res!266628) (not e!234204))))

(declare-fun lt!447288 () (_ BitVec 64))

(declare-fun lt!447289 () (_ BitVec 64))

(declare-fun lt!447287 () (_ BitVec 64))

(assert (=> d!106894 (= res!266628 (= lt!447288 (bvsub lt!447289 lt!447287)))))

(assert (=> d!106894 (or (= (bvand lt!447289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447289 lt!447287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106894 (= lt!447287 (remainingBits!0 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) ((_ sign_extend 32) (currentByte!15245 thiss!877)) ((_ sign_extend 32) (currentBit!15240 thiss!877))))))

(declare-fun lt!447285 () (_ BitVec 64))

(declare-fun lt!447290 () (_ BitVec 64))

(assert (=> d!106894 (= lt!447289 (bvmul lt!447285 lt!447290))))

(assert (=> d!106894 (or (= lt!447285 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447290 (bvsdiv (bvmul lt!447285 lt!447290) lt!447285)))))

(assert (=> d!106894 (= lt!447290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106894 (= lt!447285 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))))))

(assert (=> d!106894 (= lt!447288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15245 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15240 thiss!877))))))

(assert (=> d!106894 (invariant!0 (currentBit!15240 thiss!877) (currentByte!15245 thiss!877) (size!9092 (buf!8234 thiss!877)))))

(assert (=> d!106894 (= (bitIndex!0 (size!9092 (buf!8234 thiss!877)) (currentByte!15245 thiss!877) (currentBit!15240 thiss!877)) lt!447288)))

(declare-fun b!324888 () Bool)

(declare-fun res!266629 () Bool)

(assert (=> b!324888 (=> (not res!266629) (not e!234204))))

(assert (=> b!324888 (= res!266629 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447288))))

(declare-fun b!324889 () Bool)

(declare-fun lt!447286 () (_ BitVec 64))

(assert (=> b!324889 (= e!234204 (bvsle lt!447288 (bvmul lt!447286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324889 (or (= lt!447286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447286)))))

(assert (=> b!324889 (= lt!447286 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))))))

(assert (= (and d!106894 res!266628) b!324888))

(assert (= (and b!324888 res!266629) b!324889))

(assert (=> d!106894 m!462921))

(assert (=> d!106894 m!462937))

(assert (=> b!324869 d!106894))

(declare-fun d!106904 () Bool)

(declare-fun e!234205 () Bool)

(assert (=> d!106904 e!234205))

(declare-fun res!266630 () Bool)

(assert (=> d!106904 (=> (not res!266630) (not e!234205))))

(declare-fun lt!447295 () (_ BitVec 64))

(declare-fun lt!447294 () (_ BitVec 64))

(declare-fun lt!447293 () (_ BitVec 64))

(assert (=> d!106904 (= res!266630 (= lt!447294 (bvsub lt!447295 lt!447293)))))

(assert (=> d!106904 (or (= (bvand lt!447295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447295 lt!447293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106904 (= lt!447293 (remainingBits!0 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15245 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447291 () (_ BitVec 64))

(declare-fun lt!447296 () (_ BitVec 64))

(assert (=> d!106904 (= lt!447295 (bvmul lt!447291 lt!447296))))

(assert (=> d!106904 (or (= lt!447291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447296 (bvsdiv (bvmul lt!447291 lt!447296) lt!447291)))))

(assert (=> d!106904 (= lt!447296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106904 (= lt!447291 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))))))

(assert (=> d!106904 (= lt!447294 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15245 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106904 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15245 thiss!877)) (size!9092 (buf!8234 thiss!877)))))

(assert (=> d!106904 (= (bitIndex!0 (size!9092 (buf!8234 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15245 thiss!877)) #b00000000000000000000000000000000) lt!447294)))

(declare-fun b!324890 () Bool)

(declare-fun res!266631 () Bool)

(assert (=> b!324890 (=> (not res!266631) (not e!234205))))

(assert (=> b!324890 (= res!266631 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447294))))

(declare-fun b!324891 () Bool)

(declare-fun lt!447292 () (_ BitVec 64))

(assert (=> b!324891 (= e!234205 (bvsle lt!447294 (bvmul lt!447292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324891 (or (= lt!447292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447292)))))

(assert (=> b!324891 (= lt!447292 ((_ sign_extend 32) (size!9092 (buf!8234 thiss!877))))))

(assert (= (and d!106904 res!266630) b!324890))

(assert (= (and b!324890 res!266631) b!324891))

(declare-fun m!462941 () Bool)

(assert (=> d!106904 m!462941))

(declare-fun m!462943 () Bool)

(assert (=> d!106904 m!462943))

(assert (=> b!324869 d!106904))

(declare-fun d!106906 () Bool)

(assert (=> d!106906 (= (array_inv!8644 (buf!8234 thiss!877)) (bvsge (size!9092 (buf!8234 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324871 d!106906))

(check-sat (not d!106904) (not d!106892) (not d!106894))
