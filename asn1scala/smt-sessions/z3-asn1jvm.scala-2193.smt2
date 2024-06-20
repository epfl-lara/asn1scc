; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55650 () Bool)

(assert start!55650)

(declare-fun b!258888 () Bool)

(declare-fun res!216871 () Bool)

(declare-fun e!179570 () Bool)

(assert (=> b!258888 (=> (not res!216871) (not e!179570))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258888 (= res!216871 (not (= from!526 nBits!535)))))

(declare-fun b!258889 () Bool)

(declare-fun e!179571 () Bool)

(declare-datatypes ((array!14120 0))(
  ( (array!14121 (arr!7172 (Array (_ BitVec 32) (_ BitVec 8))) (size!6185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11292 0))(
  ( (BitStream!11293 (buf!6707 array!14120) (currentByte!12330 (_ BitVec 32)) (currentBit!12325 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11292)

(declare-fun array_inv!5926 (array!14120) Bool)

(assert (=> b!258889 (= e!179571 (array_inv!5926 (buf!6707 thiss!1754)))))

(declare-fun lt!400666 () (_ BitVec 64))

(declare-fun b!258890 () Bool)

(declare-fun lt!400667 () (_ BitVec 64))

(assert (=> b!258890 (= e!179570 (and (not (= lt!400667 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400667 (bvand (bvsub lt!400666 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258890 (= lt!400667 (bvand lt!400666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258890 (= lt!400666 (bvadd (bitIndex!0 (size!6185 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754) (currentBit!12325 thiss!1754)) nBits!535))))

(declare-fun b!258891 () Bool)

(declare-fun res!216869 () Bool)

(assert (=> b!258891 (=> (not res!216869) (not e!179570))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22150 0))(
  ( (tuple2!22151 (_1!12011 Bool) (_2!12011 BitStream!11292)) )
))
(declare-fun readBit!0 (BitStream!11292) tuple2!22150)

(assert (=> b!258891 (= res!216869 (not (= (_1!12011 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun res!216868 () Bool)

(assert (=> start!55650 (=> (not res!216868) (not e!179570))))

(assert (=> start!55650 (= res!216868 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55650 e!179570))

(assert (=> start!55650 true))

(declare-fun inv!12 (BitStream!11292) Bool)

(assert (=> start!55650 (and (inv!12 thiss!1754) e!179571)))

(declare-fun b!258892 () Bool)

(declare-fun res!216870 () Bool)

(assert (=> b!258892 (=> (not res!216870) (not e!179570))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258892 (= res!216870 (validate_offset_bits!1 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))) ((_ sign_extend 32) (currentByte!12330 thiss!1754)) ((_ sign_extend 32) (currentBit!12325 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55650 res!216868) b!258892))

(assert (= (and b!258892 res!216870) b!258888))

(assert (= (and b!258888 res!216871) b!258891))

(assert (= (and b!258891 res!216869) b!258890))

(assert (= start!55650 b!258889))

(declare-fun m!388245 () Bool)

(assert (=> start!55650 m!388245))

(declare-fun m!388247 () Bool)

(assert (=> b!258890 m!388247))

(declare-fun m!388249 () Bool)

(assert (=> b!258892 m!388249))

(declare-fun m!388251 () Bool)

(assert (=> b!258891 m!388251))

(declare-fun m!388253 () Bool)

(assert (=> b!258889 m!388253))

(check-sat (not b!258889) (not b!258892) (not b!258891) (not b!258890) (not start!55650))
(check-sat)
(get-model)

(declare-fun d!86890 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86890 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12325 thiss!1754) (currentByte!12330 thiss!1754) (size!6185 (buf!6707 thiss!1754))))))

(declare-fun bs!21996 () Bool)

(assert (= bs!21996 d!86890))

(declare-fun m!388265 () Bool)

(assert (=> bs!21996 m!388265))

(assert (=> start!55650 d!86890))

(declare-fun d!86892 () Bool)

(assert (=> d!86892 (= (array_inv!5926 (buf!6707 thiss!1754)) (bvsge (size!6185 (buf!6707 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258889 d!86892))

(declare-fun d!86894 () Bool)

(declare-fun e!179584 () Bool)

(assert (=> d!86894 e!179584))

(declare-fun res!216889 () Bool)

(assert (=> d!86894 (=> (not res!216889) (not e!179584))))

(declare-fun lt!400690 () (_ BitVec 64))

(declare-fun lt!400686 () (_ BitVec 64))

(declare-fun lt!400687 () (_ BitVec 64))

(assert (=> d!86894 (= res!216889 (= lt!400690 (bvsub lt!400687 lt!400686)))))

(assert (=> d!86894 (or (= (bvand lt!400687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400687 lt!400686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86894 (= lt!400686 (remainingBits!0 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))) ((_ sign_extend 32) (currentByte!12330 thiss!1754)) ((_ sign_extend 32) (currentBit!12325 thiss!1754))))))

(declare-fun lt!400691 () (_ BitVec 64))

(declare-fun lt!400688 () (_ BitVec 64))

(assert (=> d!86894 (= lt!400687 (bvmul lt!400691 lt!400688))))

(assert (=> d!86894 (or (= lt!400691 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400688 (bvsdiv (bvmul lt!400691 lt!400688) lt!400691)))))

(assert (=> d!86894 (= lt!400688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86894 (= lt!400691 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))))))

(assert (=> d!86894 (= lt!400690 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12330 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12325 thiss!1754))))))

(assert (=> d!86894 (invariant!0 (currentBit!12325 thiss!1754) (currentByte!12330 thiss!1754) (size!6185 (buf!6707 thiss!1754)))))

(assert (=> d!86894 (= (bitIndex!0 (size!6185 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754) (currentBit!12325 thiss!1754)) lt!400690)))

(declare-fun b!258912 () Bool)

(declare-fun res!216888 () Bool)

(assert (=> b!258912 (=> (not res!216888) (not e!179584))))

(assert (=> b!258912 (= res!216888 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400690))))

(declare-fun b!258913 () Bool)

(declare-fun lt!400689 () (_ BitVec 64))

(assert (=> b!258913 (= e!179584 (bvsle lt!400690 (bvmul lt!400689 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258913 (or (= lt!400689 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400689 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400689)))))

(assert (=> b!258913 (= lt!400689 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))))))

(assert (= (and d!86894 res!216889) b!258912))

(assert (= (and b!258912 res!216888) b!258913))

(declare-fun m!388267 () Bool)

(assert (=> d!86894 m!388267))

(assert (=> d!86894 m!388265))

(assert (=> b!258890 d!86894))

(declare-fun d!86898 () Bool)

(declare-fun e!179598 () Bool)

(assert (=> d!86898 e!179598))

(declare-fun res!216895 () Bool)

(assert (=> d!86898 (=> (not res!216895) (not e!179598))))

(declare-datatypes ((Unit!18443 0))(
  ( (Unit!18444) )
))
(declare-datatypes ((tuple2!22156 0))(
  ( (tuple2!22157 (_1!12014 Unit!18443) (_2!12014 BitStream!11292)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11292) tuple2!22156)

(assert (=> d!86898 (= res!216895 (= (buf!6707 (_2!12014 (increaseBitIndex!0 thiss!1754))) (buf!6707 thiss!1754)))))

(declare-fun lt!400731 () Bool)

(assert (=> d!86898 (= lt!400731 (not (= (bvand ((_ sign_extend 24) (select (arr!7172 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12325 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400727 () tuple2!22150)

(assert (=> d!86898 (= lt!400727 (tuple2!22151 (not (= (bvand ((_ sign_extend 24) (select (arr!7172 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12325 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12014 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86898 (validate_offset_bit!0 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))) ((_ sign_extend 32) (currentByte!12330 thiss!1754)) ((_ sign_extend 32) (currentBit!12325 thiss!1754)))))

(assert (=> d!86898 (= (readBit!0 thiss!1754) lt!400727)))

(declare-fun lt!400729 () (_ BitVec 64))

(declare-fun lt!400732 () (_ BitVec 64))

(declare-fun b!258919 () Bool)

(assert (=> b!258919 (= e!179598 (= (bitIndex!0 (size!6185 (buf!6707 (_2!12014 (increaseBitIndex!0 thiss!1754)))) (currentByte!12330 (_2!12014 (increaseBitIndex!0 thiss!1754))) (currentBit!12325 (_2!12014 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400732 lt!400729)))))

(assert (=> b!258919 (or (not (= (bvand lt!400732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400729 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400732 lt!400729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258919 (= lt!400729 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258919 (= lt!400732 (bitIndex!0 (size!6185 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754) (currentBit!12325 thiss!1754)))))

(declare-fun lt!400733 () Bool)

(assert (=> b!258919 (= lt!400733 (not (= (bvand ((_ sign_extend 24) (select (arr!7172 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12325 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400730 () Bool)

(assert (=> b!258919 (= lt!400730 (not (= (bvand ((_ sign_extend 24) (select (arr!7172 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12325 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400728 () Bool)

(assert (=> b!258919 (= lt!400728 (not (= (bvand ((_ sign_extend 24) (select (arr!7172 (buf!6707 thiss!1754)) (currentByte!12330 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12325 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86898 res!216895) b!258919))

(declare-fun m!388285 () Bool)

(assert (=> d!86898 m!388285))

(declare-fun m!388287 () Bool)

(assert (=> d!86898 m!388287))

(declare-fun m!388289 () Bool)

(assert (=> d!86898 m!388289))

(declare-fun m!388291 () Bool)

(assert (=> d!86898 m!388291))

(assert (=> b!258919 m!388289))

(assert (=> b!258919 m!388247))

(assert (=> b!258919 m!388285))

(declare-fun m!388293 () Bool)

(assert (=> b!258919 m!388293))

(assert (=> b!258919 m!388287))

(assert (=> b!258891 d!86898))

(declare-fun d!86914 () Bool)

(assert (=> d!86914 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))) ((_ sign_extend 32) (currentByte!12330 thiss!1754)) ((_ sign_extend 32) (currentBit!12325 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6185 (buf!6707 thiss!1754))) ((_ sign_extend 32) (currentByte!12330 thiss!1754)) ((_ sign_extend 32) (currentBit!12325 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22000 () Bool)

(assert (= bs!22000 d!86914))

(assert (=> bs!22000 m!388267))

(assert (=> b!258892 d!86914))

(check-sat (not d!86898) (not d!86914) (not d!86890) (not b!258919) (not d!86894))
