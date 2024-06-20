; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42904 () Bool)

(assert start!42904)

(declare-fun b!202164 () Bool)

(declare-fun res!169314 () Bool)

(declare-fun e!138630 () Bool)

(assert (=> b!202164 (=> (not res!169314) (not e!138630))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202164 (= res!169314 (not (= i!590 nBits!348)))))

(declare-fun b!202165 () Bool)

(declare-fun e!138631 () Bool)

(declare-fun e!138633 () Bool)

(assert (=> b!202165 (= e!138631 e!138633)))

(declare-fun res!169322 () Bool)

(assert (=> b!202165 (=> (not res!169322) (not e!138633))))

(declare-fun lt!314895 () Bool)

(declare-datatypes ((array!10278 0))(
  ( (array!10279 (arr!5454 (Array (_ BitVec 32) (_ BitVec 8))) (size!4524 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8156 0))(
  ( (BitStream!8157 (buf!5029 array!10278) (currentByte!9460 (_ BitVec 32)) (currentBit!9455 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14341 0))(
  ( (Unit!14342) )
))
(declare-datatypes ((tuple2!17296 0))(
  ( (tuple2!17297 (_1!9300 Unit!14341) (_2!9300 BitStream!8156)) )
))
(declare-fun lt!314897 () tuple2!17296)

(declare-datatypes ((tuple2!17298 0))(
  ( (tuple2!17299 (_1!9301 BitStream!8156) (_2!9301 Bool)) )
))
(declare-fun lt!314900 () tuple2!17298)

(assert (=> b!202165 (= res!169322 (and (= (_2!9301 lt!314900) lt!314895) (= (_1!9301 lt!314900) (_2!9300 lt!314897))))))

(declare-fun thiss!1204 () BitStream!8156)

(declare-fun readBitPure!0 (BitStream!8156) tuple2!17298)

(declare-fun readerFrom!0 (BitStream!8156 (_ BitVec 32) (_ BitVec 32)) BitStream!8156)

(assert (=> b!202165 (= lt!314900 (readBitPure!0 (readerFrom!0 (_2!9300 lt!314897) (currentBit!9455 thiss!1204) (currentByte!9460 thiss!1204))))))

(declare-fun b!202166 () Bool)

(declare-fun e!138629 () Bool)

(assert (=> b!202166 (= e!138629 e!138631)))

(declare-fun res!169316 () Bool)

(assert (=> b!202166 (=> (not res!169316) (not e!138631))))

(declare-fun lt!314899 () (_ BitVec 64))

(declare-fun lt!314896 () (_ BitVec 64))

(assert (=> b!202166 (= res!169316 (= lt!314899 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314896)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202166 (= lt!314899 (bitIndex!0 (size!4524 (buf!5029 (_2!9300 lt!314897))) (currentByte!9460 (_2!9300 lt!314897)) (currentBit!9455 (_2!9300 lt!314897))))))

(assert (=> b!202166 (= lt!314896 (bitIndex!0 (size!4524 (buf!5029 thiss!1204)) (currentByte!9460 thiss!1204) (currentBit!9455 thiss!1204)))))

(declare-fun res!169318 () Bool)

(assert (=> start!42904 (=> (not res!169318) (not e!138630))))

(assert (=> start!42904 (= res!169318 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42904 e!138630))

(assert (=> start!42904 true))

(declare-fun e!138632 () Bool)

(declare-fun inv!12 (BitStream!8156) Bool)

(assert (=> start!42904 (and (inv!12 thiss!1204) e!138632)))

(declare-fun b!202167 () Bool)

(declare-fun e!138627 () Bool)

(assert (=> b!202167 (= e!138630 (not e!138627))))

(declare-fun res!169321 () Bool)

(assert (=> b!202167 (=> res!169321 e!138627)))

(assert (=> b!202167 (= res!169321 (not (= (bitIndex!0 (size!4524 (buf!5029 (_2!9300 lt!314897))) (currentByte!9460 (_2!9300 lt!314897)) (currentBit!9455 (_2!9300 lt!314897))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4524 (buf!5029 thiss!1204)) (currentByte!9460 thiss!1204) (currentBit!9455 thiss!1204))))))))

(assert (=> b!202167 e!138629))

(declare-fun res!169315 () Bool)

(assert (=> b!202167 (=> (not res!169315) (not e!138629))))

(assert (=> b!202167 (= res!169315 (= (size!4524 (buf!5029 thiss!1204)) (size!4524 (buf!5029 (_2!9300 lt!314897)))))))

(declare-fun appendBit!0 (BitStream!8156 Bool) tuple2!17296)

(assert (=> b!202167 (= lt!314897 (appendBit!0 thiss!1204 lt!314895))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!202167 (= lt!314895 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202168 () Bool)

(declare-fun isPrefixOf!0 (BitStream!8156 BitStream!8156) Bool)

(assert (=> b!202168 (= e!138627 (isPrefixOf!0 thiss!1204 (_2!9300 lt!314897)))))

(declare-fun lt!314898 () tuple2!17296)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8156 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17296)

(assert (=> b!202168 (= lt!314898 (appendBitsLSBFirstLoopTR!0 (_2!9300 lt!314897) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202169 () Bool)

(declare-fun res!169317 () Bool)

(assert (=> b!202169 (=> (not res!169317) (not e!138630))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202169 (= res!169317 (validate_offset_bits!1 ((_ sign_extend 32) (size!4524 (buf!5029 thiss!1204))) ((_ sign_extend 32) (currentByte!9460 thiss!1204)) ((_ sign_extend 32) (currentBit!9455 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202170 () Bool)

(declare-fun res!169319 () Bool)

(assert (=> b!202170 (=> (not res!169319) (not e!138630))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202170 (= res!169319 (invariant!0 (currentBit!9455 thiss!1204) (currentByte!9460 thiss!1204) (size!4524 (buf!5029 thiss!1204))))))

(declare-fun b!202171 () Bool)

(declare-fun res!169320 () Bool)

(assert (=> b!202171 (=> (not res!169320) (not e!138631))))

(assert (=> b!202171 (= res!169320 (isPrefixOf!0 thiss!1204 (_2!9300 lt!314897)))))

(declare-fun b!202172 () Bool)

(declare-fun array_inv!4265 (array!10278) Bool)

(assert (=> b!202172 (= e!138632 (array_inv!4265 (buf!5029 thiss!1204)))))

(declare-fun b!202173 () Bool)

(assert (=> b!202173 (= e!138633 (= (bitIndex!0 (size!4524 (buf!5029 (_1!9301 lt!314900))) (currentByte!9460 (_1!9301 lt!314900)) (currentBit!9455 (_1!9301 lt!314900))) lt!314899))))

(assert (= (and start!42904 res!169318) b!202169))

(assert (= (and b!202169 res!169317) b!202170))

(assert (= (and b!202170 res!169319) b!202164))

(assert (= (and b!202164 res!169314) b!202167))

(assert (= (and b!202167 res!169315) b!202166))

(assert (= (and b!202166 res!169316) b!202171))

(assert (= (and b!202171 res!169320) b!202165))

(assert (= (and b!202165 res!169322) b!202173))

(assert (= (and b!202167 (not res!169321)) b!202168))

(assert (= start!42904 b!202172))

(declare-fun m!312615 () Bool)

(assert (=> b!202172 m!312615))

(declare-fun m!312617 () Bool)

(assert (=> b!202168 m!312617))

(declare-fun m!312619 () Bool)

(assert (=> b!202168 m!312619))

(declare-fun m!312621 () Bool)

(assert (=> b!202167 m!312621))

(declare-fun m!312623 () Bool)

(assert (=> b!202167 m!312623))

(declare-fun m!312625 () Bool)

(assert (=> b!202167 m!312625))

(assert (=> b!202166 m!312621))

(assert (=> b!202166 m!312623))

(declare-fun m!312627 () Bool)

(assert (=> b!202170 m!312627))

(declare-fun m!312629 () Bool)

(assert (=> b!202165 m!312629))

(assert (=> b!202165 m!312629))

(declare-fun m!312631 () Bool)

(assert (=> b!202165 m!312631))

(declare-fun m!312633 () Bool)

(assert (=> start!42904 m!312633))

(declare-fun m!312635 () Bool)

(assert (=> b!202173 m!312635))

(declare-fun m!312637 () Bool)

(assert (=> b!202169 m!312637))

(assert (=> b!202171 m!312617))

(push 1)

(assert (not b!202165))

(assert (not b!202168))

(assert (not b!202173))

