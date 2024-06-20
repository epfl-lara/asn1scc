; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17754 () Bool)

(assert start!17754)

(declare-fun b!85887 () Bool)

(declare-fun res!70509 () Bool)

(declare-fun e!57172 () Bool)

(assert (=> b!85887 (=> (not res!70509) (not e!57172))))

(declare-datatypes ((array!4079 0))(
  ( (array!4080 (arr!2479 (Array (_ BitVec 32) (_ BitVec 8))) (size!1842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3246 0))(
  ( (BitStream!3247 (buf!2232 array!4079) (currentByte!4438 (_ BitVec 32)) (currentBit!4433 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3246)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85887 (= res!70509 (validate_offset_bits!1 ((_ sign_extend 32) (size!1842 (buf!2232 thiss!1151))) ((_ sign_extend 32) (currentByte!4438 thiss!1151)) ((_ sign_extend 32) (currentBit!4433 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85888 () Bool)

(declare-fun res!70515 () Bool)

(assert (=> b!85888 (=> (not res!70515) (not e!57172))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85888 (= res!70515 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85889 () Bool)

(declare-fun e!57175 () Bool)

(declare-fun e!57177 () Bool)

(assert (=> b!85889 (= e!57175 (not e!57177))))

(declare-fun res!70510 () Bool)

(assert (=> b!85889 (=> res!70510 e!57177)))

(declare-datatypes ((Unit!5700 0))(
  ( (Unit!5701) )
))
(declare-datatypes ((tuple2!7298 0))(
  ( (tuple2!7299 (_1!3865 Unit!5700) (_2!3865 BitStream!3246)) )
))
(declare-fun lt!134935 () tuple2!7298)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85889 (= res!70510 (not (invariant!0 (currentBit!4433 (_2!3865 lt!134935)) (currentByte!4438 (_2!3865 lt!134935)) (size!1842 (buf!2232 (_2!3865 lt!134935))))))))

(declare-fun e!57173 () Bool)

(assert (=> b!85889 e!57173))

(declare-fun res!70512 () Bool)

(assert (=> b!85889 (=> (not res!70512) (not e!57173))))

(declare-fun thiss!1152 () BitStream!3246)

(assert (=> b!85889 (= res!70512 (= (size!1842 (buf!2232 thiss!1152)) (size!1842 (buf!2232 (_2!3865 lt!134935)))))))

(declare-fun lt!134936 () Bool)

(declare-fun appendBit!0 (BitStream!3246 Bool) tuple2!7298)

(assert (=> b!85889 (= lt!134935 (appendBit!0 thiss!1152 lt!134936))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85889 (= lt!134936 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85890 () Bool)

(declare-fun res!70521 () Bool)

(assert (=> b!85890 (=> (not res!70521) (not e!57175))))

(assert (=> b!85890 (= res!70521 (bvslt i!576 nBits!336))))

(declare-fun b!85891 () Bool)

(declare-fun res!70511 () Bool)

(declare-fun e!57169 () Bool)

(assert (=> b!85891 (=> (not res!70511) (not e!57169))))

(declare-fun isPrefixOf!0 (BitStream!3246 BitStream!3246) Bool)

(assert (=> b!85891 (= res!70511 (isPrefixOf!0 thiss!1152 (_2!3865 lt!134935)))))

(declare-fun b!85892 () Bool)

(declare-fun e!57170 () Bool)

(declare-fun array_inv!1688 (array!4079) Bool)

(assert (=> b!85892 (= e!57170 (array_inv!1688 (buf!2232 thiss!1152)))))

(declare-fun b!85893 () Bool)

(declare-fun res!70516 () Bool)

(assert (=> b!85893 (=> (not res!70516) (not e!57172))))

(assert (=> b!85893 (= res!70516 (and (bvsle i!576 nBits!336) (= (size!1842 (buf!2232 thiss!1152)) (size!1842 (buf!2232 thiss!1151)))))))

(declare-fun b!85894 () Bool)

(declare-fun res!70514 () Bool)

(assert (=> b!85894 (=> (not res!70514) (not e!57172))))

(assert (=> b!85894 (= res!70514 (invariant!0 (currentBit!4433 thiss!1152) (currentByte!4438 thiss!1152) (size!1842 (buf!2232 thiss!1152))))))

(declare-fun b!85895 () Bool)

(declare-fun e!57171 () Bool)

(declare-datatypes ((tuple2!7300 0))(
  ( (tuple2!7301 (_1!3866 BitStream!3246) (_2!3866 Bool)) )
))
(declare-fun lt!134934 () tuple2!7300)

(declare-fun lt!134937 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85895 (= e!57171 (= (bitIndex!0 (size!1842 (buf!2232 (_1!3866 lt!134934))) (currentByte!4438 (_1!3866 lt!134934)) (currentBit!4433 (_1!3866 lt!134934))) lt!134937))))

(declare-fun b!85896 () Bool)

(declare-fun e!57168 () Bool)

(assert (=> b!85896 (= e!57168 (array_inv!1688 (buf!2232 thiss!1151)))))

(declare-fun res!70520 () Bool)

(assert (=> start!17754 (=> (not res!70520) (not e!57172))))

(assert (=> start!17754 (= res!70520 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17754 e!57172))

(declare-fun inv!12 (BitStream!3246) Bool)

(assert (=> start!17754 (and (inv!12 thiss!1152) e!57170)))

(assert (=> start!17754 (and (inv!12 thiss!1151) e!57168)))

(assert (=> start!17754 true))

(declare-fun b!85897 () Bool)

(assert (=> b!85897 (= e!57177 true)))

(declare-datatypes ((tuple3!384 0))(
  ( (tuple3!385 (_1!3867 Unit!5700) (_2!3867 BitStream!3246) (_3!216 (_ BitVec 32))) )
))
(declare-fun lt!134939 () tuple3!384)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3246 (_ BitVec 64) BitStream!3246 (_ BitVec 32)) tuple3!384)

(assert (=> b!85897 (= lt!134939 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3865 lt!134935) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!85898 () Bool)

(assert (=> b!85898 (= e!57173 e!57169)))

(declare-fun res!70519 () Bool)

(assert (=> b!85898 (=> (not res!70519) (not e!57169))))

(declare-fun lt!134940 () (_ BitVec 64))

(assert (=> b!85898 (= res!70519 (= lt!134937 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134940)))))

(assert (=> b!85898 (= lt!134937 (bitIndex!0 (size!1842 (buf!2232 (_2!3865 lt!134935))) (currentByte!4438 (_2!3865 lt!134935)) (currentBit!4433 (_2!3865 lt!134935))))))

(declare-fun b!85899 () Bool)

(declare-fun res!70508 () Bool)

(assert (=> b!85899 (=> (not res!70508) (not e!57172))))

(assert (=> b!85899 (= res!70508 (invariant!0 (currentBit!4433 thiss!1151) (currentByte!4438 thiss!1151) (size!1842 (buf!2232 thiss!1151))))))

(declare-fun b!85900 () Bool)

(assert (=> b!85900 (= e!57172 e!57175)))

(declare-fun res!70522 () Bool)

(assert (=> b!85900 (=> (not res!70522) (not e!57175))))

(declare-fun lt!134938 () (_ BitVec 64))

(assert (=> b!85900 (= res!70522 (= lt!134940 (bvadd lt!134938 ((_ sign_extend 32) i!576))))))

(assert (=> b!85900 (= lt!134940 (bitIndex!0 (size!1842 (buf!2232 thiss!1152)) (currentByte!4438 thiss!1152) (currentBit!4433 thiss!1152)))))

(assert (=> b!85900 (= lt!134938 (bitIndex!0 (size!1842 (buf!2232 thiss!1151)) (currentByte!4438 thiss!1151) (currentBit!4433 thiss!1151)))))

(declare-fun b!85901 () Bool)

(declare-fun res!70518 () Bool)

(assert (=> b!85901 (=> (not res!70518) (not e!57175))))

(assert (=> b!85901 (= res!70518 (validate_offset_bits!1 ((_ sign_extend 32) (size!1842 (buf!2232 thiss!1152))) ((_ sign_extend 32) (currentByte!4438 thiss!1152)) ((_ sign_extend 32) (currentBit!4433 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85902 () Bool)

(assert (=> b!85902 (= e!57169 e!57171)))

(declare-fun res!70513 () Bool)

(assert (=> b!85902 (=> (not res!70513) (not e!57171))))

(assert (=> b!85902 (= res!70513 (and (= (_2!3866 lt!134934) lt!134936) (= (_1!3866 lt!134934) (_2!3865 lt!134935))))))

(declare-fun readBitPure!0 (BitStream!3246) tuple2!7300)

(declare-fun readerFrom!0 (BitStream!3246 (_ BitVec 32) (_ BitVec 32)) BitStream!3246)

(assert (=> b!85902 (= lt!134934 (readBitPure!0 (readerFrom!0 (_2!3865 lt!134935) (currentBit!4433 thiss!1152) (currentByte!4438 thiss!1152))))))

(declare-fun b!85903 () Bool)

(declare-fun res!70517 () Bool)

(assert (=> b!85903 (=> res!70517 e!57177)))

(assert (=> b!85903 (= res!70517 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(assert (= (and start!17754 res!70520) b!85887))

(assert (= (and b!85887 res!70509) b!85899))

(assert (= (and b!85899 res!70508) b!85888))

(assert (= (and b!85888 res!70515) b!85894))

(assert (= (and b!85894 res!70514) b!85893))

(assert (= (and b!85893 res!70516) b!85900))

(assert (= (and b!85900 res!70522) b!85901))

(assert (= (and b!85901 res!70518) b!85890))

(assert (= (and b!85890 res!70521) b!85889))

(assert (= (and b!85889 res!70512) b!85898))

(assert (= (and b!85898 res!70519) b!85891))

(assert (= (and b!85891 res!70511) b!85902))

(assert (= (and b!85902 res!70513) b!85895))

(assert (= (and b!85889 (not res!70510)) b!85903))

(assert (= (and b!85903 (not res!70517)) b!85897))

(assert (= start!17754 b!85892))

(assert (= start!17754 b!85896))

(declare-fun m!131909 () Bool)

(assert (=> b!85899 m!131909))

(declare-fun m!131911 () Bool)

(assert (=> b!85898 m!131911))

(declare-fun m!131913 () Bool)

(assert (=> start!17754 m!131913))

(declare-fun m!131915 () Bool)

(assert (=> start!17754 m!131915))

(declare-fun m!131917 () Bool)

(assert (=> b!85887 m!131917))

(declare-fun m!131919 () Bool)

(assert (=> b!85896 m!131919))

(declare-fun m!131921 () Bool)

(assert (=> b!85892 m!131921))

(declare-fun m!131923 () Bool)

(assert (=> b!85901 m!131923))

(declare-fun m!131925 () Bool)

(assert (=> b!85895 m!131925))

(declare-fun m!131927 () Bool)

(assert (=> b!85889 m!131927))

(declare-fun m!131929 () Bool)

(assert (=> b!85889 m!131929))

(declare-fun m!131931 () Bool)

(assert (=> b!85891 m!131931))

(declare-fun m!131933 () Bool)

(assert (=> b!85897 m!131933))

(declare-fun m!131935 () Bool)

(assert (=> b!85900 m!131935))

(declare-fun m!131937 () Bool)

(assert (=> b!85900 m!131937))

(declare-fun m!131939 () Bool)

(assert (=> b!85902 m!131939))

(assert (=> b!85902 m!131939))

(declare-fun m!131941 () Bool)

(assert (=> b!85902 m!131941))

(declare-fun m!131943 () Bool)

(assert (=> b!85894 m!131943))

(check-sat (not b!85894) (not b!85902) (not b!85889) (not start!17754) (not b!85897) (not b!85899) (not b!85898) (not b!85896) (not b!85900) (not b!85901) (not b!85895) (not b!85887) (not b!85891) (not b!85892))
