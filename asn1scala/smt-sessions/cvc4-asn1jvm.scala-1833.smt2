; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49234 () Bool)

(assert start!49234)

(declare-fun b!233904 () Bool)

(declare-fun e!161226 () Bool)

(declare-datatypes ((array!12095 0))(
  ( (array!12096 (arr!6294 (Array (_ BitVec 32) (_ BitVec 8))) (size!5307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9710 0))(
  ( (BitStream!9711 (buf!5848 array!12095) (currentByte!10891 (_ BitVec 32)) (currentBit!10886 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9710)

(declare-fun array_inv!5048 (array!12095) Bool)

(assert (=> b!233904 (= e!161226 (array_inv!5048 (buf!5848 b1!101)))))

(declare-fun b!233905 () Bool)

(declare-fun res!195678 () Bool)

(declare-fun e!161233 () Bool)

(assert (=> b!233905 (=> (not res!195678) (not e!161233))))

(declare-fun lt!369702 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9710)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233905 (= res!195678 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5307 (buf!5848 b2!99))) ((_ sign_extend 32) (currentByte!10891 b2!99)) ((_ sign_extend 32) (currentBit!10886 b2!99)) (bvsub bytes!19 lt!369702)))))

(declare-fun b!233906 () Bool)

(declare-fun e!161225 () Bool)

(assert (=> b!233906 (= e!161225 (array_inv!5048 (buf!5848 b2!99)))))

(declare-fun b!233908 () Bool)

(declare-fun e!161229 () Bool)

(declare-fun e!161227 () Bool)

(assert (=> b!233908 (= e!161229 e!161227)))

(declare-fun res!195679 () Bool)

(assert (=> b!233908 (=> (not res!195679) (not e!161227))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369703 () (_ BitVec 64))

(declare-fun lt!369701 () (_ BitVec 64))

(declare-fun lt!369705 () (_ BitVec 64))

(assert (=> b!233908 (= res!195679 (and (= lt!369703 lt!369701) (= (bvsub lt!369703 bits!86) lt!369705)))))

(assert (=> b!233908 (= lt!369701 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10891 b2!99))) ((_ sign_extend 32) (currentBit!10886 b2!99))))))

(declare-fun b!233909 () Bool)

(declare-fun res!195677 () Bool)

(declare-fun e!161234 () Bool)

(assert (=> b!233909 (=> (not res!195677) (not e!161234))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233909 (= res!195677 (= lt!369703 (bvadd (bitIndex!0 (size!5307 (buf!5848 b1!101)) (currentByte!10891 b1!101) (currentBit!10886 b1!101)) bits!86)))))

(declare-fun b!233910 () Bool)

(declare-fun res!195676 () Bool)

(assert (=> b!233910 (=> (not res!195676) (not e!161234))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233910 (= res!195676 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5307 (buf!5848 b1!101))) ((_ sign_extend 32) (currentByte!10891 b1!101)) ((_ sign_extend 32) (currentBit!10886 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233911 () Bool)

(assert (=> b!233911 (= e!161227 e!161233)))

(declare-fun res!195675 () Bool)

(assert (=> b!233911 (=> (not res!195675) (not e!161233))))

(declare-fun lt!369704 () (_ BitVec 64))

(declare-fun lt!369700 () (_ BitVec 64))

(assert (=> b!233911 (= res!195675 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369700 (bvsub lt!369701 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369700 lt!369701) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369704))))))

(assert (=> b!233911 (= lt!369700 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5307 (buf!5848 b2!99)))))))

(declare-fun b!233912 () Bool)

(assert (=> b!233912 (= e!161234 e!161229)))

(declare-fun res!195680 () Bool)

(assert (=> b!233912 (=> (not res!195680) (not e!161229))))

(assert (=> b!233912 (= res!195680 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5307 (buf!5848 b1!101)))) lt!369705) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233912 (= lt!369705 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10891 b1!101))) ((_ sign_extend 32) (currentBit!10886 b1!101))))))

(declare-fun b!233913 () Bool)

(declare-fun res!195672 () Bool)

(assert (=> b!233913 (=> (not res!195672) (not e!161234))))

(assert (=> b!233913 (= res!195672 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5307 (buf!5848 b1!101))) ((_ sign_extend 32) (currentByte!10891 b1!101)) ((_ sign_extend 32) (currentBit!10886 b1!101)) bytes!19))))

(declare-fun b!233914 () Bool)

(assert (=> b!233914 (= e!161233 (and (bvslt lt!369704 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369704 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!233915 () Bool)

(declare-fun e!161230 () Bool)

(assert (=> b!233915 (= e!161230 e!161234)))

(declare-fun res!195681 () Bool)

(assert (=> b!233915 (=> (not res!195681) (not e!161234))))

(assert (=> b!233915 (= res!195681 (bvsle lt!369702 bytes!19))))

(assert (=> b!233915 (= lt!369702 ((_ extract 31 0) lt!369704))))

(assert (=> b!233915 (= lt!369704 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!195674 () Bool)

(declare-fun e!161228 () Bool)

(assert (=> start!49234 (=> (not res!195674) (not e!161228))))

(assert (=> start!49234 (= res!195674 (and (= (size!5307 (buf!5848 b1!101)) (size!5307 (buf!5848 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49234 e!161228))

(declare-fun inv!12 (BitStream!9710) Bool)

(assert (=> start!49234 (and (inv!12 b1!101) e!161226)))

(assert (=> start!49234 (and (inv!12 b2!99) e!161225)))

(assert (=> start!49234 true))

(declare-fun b!233907 () Bool)

(assert (=> b!233907 (= e!161228 e!161230)))

(declare-fun res!195673 () Bool)

(assert (=> b!233907 (=> (not res!195673) (not e!161230))))

(assert (=> b!233907 (= res!195673 (bvsle bits!86 lt!369703))))

(assert (=> b!233907 (= lt!369703 (bitIndex!0 (size!5307 (buf!5848 b2!99)) (currentByte!10891 b2!99) (currentBit!10886 b2!99)))))

(assert (= (and start!49234 res!195674) b!233907))

(assert (= (and b!233907 res!195673) b!233915))

(assert (= (and b!233915 res!195681) b!233913))

(assert (= (and b!233913 res!195672) b!233909))

(assert (= (and b!233909 res!195677) b!233910))

(assert (= (and b!233910 res!195676) b!233912))

(assert (= (and b!233912 res!195680) b!233908))

(assert (= (and b!233908 res!195679) b!233911))

(assert (= (and b!233911 res!195675) b!233905))

(assert (= (and b!233905 res!195678) b!233914))

(assert (= start!49234 b!233904))

(assert (= start!49234 b!233906))

(declare-fun m!356309 () Bool)

(assert (=> start!49234 m!356309))

(declare-fun m!356311 () Bool)

(assert (=> start!49234 m!356311))

(declare-fun m!356313 () Bool)

(assert (=> b!233909 m!356313))

(declare-fun m!356315 () Bool)

(assert (=> b!233904 m!356315))

(declare-fun m!356317 () Bool)

(assert (=> b!233910 m!356317))

(declare-fun m!356319 () Bool)

(assert (=> b!233907 m!356319))

(declare-fun m!356321 () Bool)

(assert (=> b!233906 m!356321))

(declare-fun m!356323 () Bool)

(assert (=> b!233905 m!356323))

(declare-fun m!356325 () Bool)

(assert (=> b!233913 m!356325))

(push 1)

(assert (not start!49234))

(assert (not b!233913))

(assert (not b!233910))

(assert (not b!233907))

(assert (not b!233909))

(assert (not b!233905))

(assert (not b!233904))

(assert (not b!233906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

